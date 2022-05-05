import ch.bildspur.postfx.builder.*;
import ch.bildspur.postfx.pass.*;
import ch.bildspur.postfx.*;


int temp;
int dashTimer = 0;
int dashReset = 0;
int antal_p;
int shootTimer;
int hitTimer;
int healTimer;
color c;
color c1;
color c2;
int amount;
String saveDirection;

//Stats
float knockBack;
int maxLives = 10;
int lives = 10;
float shtSpeedScale;
float hitSpeedScale;
float damage = 1;
float mDamage;
int canHit;


PVector retning = new PVector();

Player p = new Player();
Explosion ex = new Explosion(new PVector(1, 1));
Ball b = new Ball();
Sword s = new Sword(p.pos);
Enemy e = new Enemy(round(random(1, 3)),new PVector(0,0));
Enemy_ball eb = new Enemy_ball(1, 1, 1);
Room r = new Room();
Door d = new Door();
SpawnAnimation sa = new SpawnAnimation(new PVector(1,1));

PostFX fx;

ArrayList <Ball> balls;
ArrayList <Sword> swords;
ArrayList<ParticleSystem> systems;
ArrayList <Enemy_ball> eballs;
ArrayList <Enemy> enemies;
ArrayList <Explosion> explosions;
ArrayList <SpawnAnimation> animations;
Door[] doors = new Door[2];

/////VÅBENTYPE//////
int weaponType=2;///
int meleeType=2;////
////////////////////


void setup() {
  size(1500, 1000, P2D); 
  rectMode(CENTER);
  fx = new PostFX(this);
  balls = new ArrayList<Ball>();
  swords = new ArrayList<Sword>();
  systems = new ArrayList<ParticleSystem>();
  enemies = new ArrayList<Enemy>();
  eballs = new ArrayList<Enemy_ball>();
  explosions = new ArrayList<Explosion>();
  animations = new ArrayList<SpawnAnimation>();
  r.update();
}

boolean spawn = true;

void draw() {
  background(0);
  r.display();
  
  if(spawn == true){
   defineDoors();
   spawn = false;
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
  delete();
  deleteE();
  
  for(Door d : doors){
    d.update();
    d.display();
  }
  
  for(Ball b : balls) {
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
  
  for (SpawnAnimation sa : animations){
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
    healTimer = 0;
    heal = false;
  }

  if (healTimer < 180) {
    heal = false;
  }

  if (lives > maxLives) {
    lives = maxLives;
  }
  
  if(animations.size() == 0 && enemies.size() == 0){
    enter = true;
  }


  healthBar();


  healTimer++;
  shootTimer++;
  hitTimer++;
  temp++;
  canHit++;

  //fx.render()
  //.bloom(0.0001, 20, 40)
  //.pixelate(300)
  //.compose();
}
