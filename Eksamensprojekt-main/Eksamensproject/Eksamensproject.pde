import de.bezier.data.sql.*;
import de.bezier.data.sql.mapper.*;
import ch.bildspur.postfx.builder.*;
import ch.bildspur.postfx.pass.*;
import ch.bildspur.postfx.*;
import interfascia.*;


int temp;
int dashTimer = 0;
int dashReset = 0;
int antal_p;
int shootTimer;
int hitTimer;
int hitTimer2;
int healTimer;
int resetTimer;
color c;
color c1;
color c2;
int amount;
String saveDirection;
boolean spawn = true;
int score;
int combo=1;
int scoreHit;
int j;
boolean bossKilled = false;
boolean bossUp = false;
boolean worldUp = false;
int bossCounter = 1;
int worldCounter = 1;
boolean starto = true;
boolean main  = true;
boolean back = false;


//Stats
float knockBack;
int maxLives = 5;
int lives = 5;
float shtSpeedScale;
float hitSpeedScale;
float damage = 1;
float mDamage;
int canHit;

PImage room1;
PImage room2;
PImage room3;
PImage gun1;
PImage gun2; 
PImage gun4;  
PImage gun3;
PImage gun5;
PImage melee1;
PImage melee2;
PImage arti1;
PImage arti2;
PImage healImg;
PImage background;

PVector retning = new PVector();

Player p = new Player();
Explosion ex = new Explosion(new PVector(1, 1));
Ball b = new Ball();
Sword s = new Sword(p.pos);
Enemy e = new Enemy(round(random(1, 3)), new PVector(0, 0));
Enemy_ball eb = new Enemy_ball(1, 1, 1, color(1, 1, 1), 2, 1);
Room r = new Room();
Door d = new Door();
SpawnAnimation sa = new SpawnAnimation(new PVector(1, 1), 1);
Coin C = new Coin(new PVector(0, 0));
Boss bo = new Boss(3, new PVector(500, 200));
Wares w = new Wares(1);
Artifact a = new Artifact(1);
SQLite db;


PostFX fx;
GUIController It;
IFButton b1, b2, b3;

ArrayList <Ball> balls;
ArrayList <Sword> swords;
ArrayList<ParticleSystem> systems;
ArrayList <Enemy_ball> eballs;
ArrayList <Enemy> enemies;
ArrayList <Explosion> explosions;
ArrayList <SpawnAnimation> animations;
ArrayList <Coin> coins;
ArrayList <Artifact> artis;
Door[] doors = new Door[2];

/////VÅBENTYPE///////////
int weaponType=1;////////
int meleeType=1;/////////
int artifactType = 0;///
/////////////////////////


void setup() {
  size(1500, 1000, P2D); 
  rectMode(CENTER);
  It = new GUIController(this);
  b1 = new IFButton ("Spil", 650, height/2, 200, 50 );
  b2 = new IFButton ("Controls", 650, height/2+100, 200, 50 );
  b3 = new IFButton ("Back", 650, 1000, 200, 50 );
  fx = new PostFX(this);
  balls = new ArrayList<Ball>();
  swords = new ArrayList<Sword>();
  systems = new ArrayList<ParticleSystem>();
  enemies = new ArrayList<Enemy>();
  eballs = new ArrayList<Enemy_ball>();
  explosions = new ArrayList<Explosion>();
  animations = new ArrayList<SpawnAnimation>();
  coins = new ArrayList<Coin>();
  artis = new ArrayList <Artifact>();
  GetData();
  r.roomType = 8;
  r.update();
  bo = new Boss(3, new PVector(500, 200));
  
  
  //billeder
  room1 = loadImage("room1.jpg");
  room2 = loadImage("room2.jpg");
  room3 = loadImage("room3.jpg");
  gun1 = loadImage("gun1.png");
  gun2 = loadImage("Shotgun_Sprite.png");
  gun3 = loadImage("Machine_Gun_Sprite.png");
  gun4 = loadImage("Flamethrower_Sprite.png");
  gun5 = loadImage("RPG_Sprite.png"); 
  melee1 = loadImage("melee1.png");
  melee2 = loadImage("melee2.png");
  arti1 = loadImage("Anch.png");
  arti2 = loadImage("Poseidon.png");
  healImg =loadImage("heal.png");
  background = loadImage("Background.png");
  terra = loadFont("CenturySchoolbook-48.vlw");
  
  //Knapper til interfascia
  It.add(b1);
  It.add(b2);
  It.add(b3);


  b1.addActionListener(this);
  b2.addActionListener(this);
  b3.addActionListener(this);
  
}



void draw() {
  imageMode(CORNER);
  background(0);
  
  if(main == true){
   menu(); 
  }
  
  if (lives >= 1 && completeGame == false && main == false) {
    r.display();

    if (spawn == true) {
      defineDoors();
      spawn = false;
    }

    if (starto == true) {
      showArtifacts();
      starto = false;
    }

    if (r.start == false) {
      deleteArtifact();
    }

    detect();
    wallCollision();
    clearEX();
    clearAnimation();
    detect2();
    detect3();
    detect4();
    detect5();
    detect6();

    if (r.boss==true) {
      detect7();
      detect8();
      detect9();
    }


    delete();
    deleteE();
    coinDetect();
    detectArtifact();


    for (Coin C : coins) {
      C.Goldencoin();
    }

    for (Door d : doors) {
      d.update();
      d.display();
    }

    for (Ball b : balls) {
      b.update();
      b.display();
      b.decay--;
    }

    for (Explosion ex : explosions) {
      ex.display();
      ex.decay--;
    }

    for (Enemy e : enemies) {
      e.update();
      e.display();
    }

    for (SpawnAnimation sa : animations) {
      sa.display();
      sa.decay--;
    }

    for (Enemy_ball eb : eballs) {
      eb.display();
      eb.update();
      eb.decay--;
    }

    for (Sword s : swords) {
      s.update();
      s.display();
      s.decay--;
    }

    for (ParticleSystem ps : systems) {
      ps.update();
      ps.display();
    }

    p.update();
    p.display();
    p.weaponDetect();
    enterDoor();




    controlsMove();
    controlsShoot();


    if (dashReset == 60) {
      dashTimer = 0;
    }

    if (dashReset != 60) {
      dashReset++;
    }

    if (healTimer > 180 && heal == true) {
      lives++;
      antal_p=30;
      c=color(0, 200, 0);
      systems.add(new ParticleSystem(p.pos.x, p.pos.y));
      healTimer = 0;
      heal = false;
    }

    if (healTimer < 180) {
      heal = false;
    }

    if (lives > maxLives) {
      lives = maxLives;
    }

    if (animations.size() == 0 && enemies.size() == 0 && r.boss == false) {
      enter = true;
      bossUp = true;

      if (bossCounter == 8) {
        fill(255);
        textSize(50);
        text("You get an unsettling feeling from the next room", 180, 500);
      }
    }

    if (reset==true) {
      resetTimer++;
    }

    if (artifactType == 2) {
      meleeType = 2;
    } else {
      meleeType = 1;
    }

    if (bossKilled == true) {
      score=score+2000;
      bossKilled = false;
      worldUp = true;
      bossCounter = 0;

      switch(worldCounter) {

      case 1:
        artifact1 = 1;
        break;


      case 2:
        artifact2 = 1;
        break;

      case 3:
        artifact3 = 1;
        break;
      }
      UpdateData();
    }

    if (bossUp == true) {
      bossUp = false;
    }


    healthBar();


    healTimer++;
    shootTimer++;
    hitTimer++;
    hitTimer2++;
    temp++;
    canHit++;
    scoreHit--;

    tint(255);
    fx.render()
      .bloom(0.0001, 20, 40)
      .pixelate(300)
      .compose();

    for (Artifact a : artis) {
      a.display();
    }

    imageMode(CORNER);

    if (r.shop == true) {
      w.display();
      w.update();
    }
    if (w.ware1 == 2) {
      w2 = true;
    }
    if (w.ware1 == 3) {
      w3 = true;
    }
    if (w.ware2 == 4) {
      w4 = true;
    }
    if (w.ware2 == 5) {
      w5 = true;
    }


    score();
    weaponUI();
  }
  deathText();
}


void actionPerformed(GUIEvent e) {
  if (e.getSource() == b2) {
    b2.setY(1000);
    b1.setX(1500);
    b3.setY(850);
    back = true;
  }

  if (e.getSource() == b3) {
    b3.setY(1000);
    b2.setLabel("Controls");
    b2.setY(600);
    b1.setX(650);
    back = false;
  }

  if (e.getSource() == b1) {
    b1.setY(1000);
    b2.setY(1000);
    b3.setY(1000);
    main = false;
  }
}
