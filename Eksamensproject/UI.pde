PImage shoot;
PImage melee;
boolean completeGame;

void healthBar() {

  tint(255, 1.4*healTimer);
  image(healImg, 1400, 850, 50, 50);


  //boss
  if (r.boss==true) {
    rectMode(CENTER);
    bo.update();
    bo.display();
    rectMode(CORNER);
    fill(255);
    textSize(45);
    text(bo.bossName, 600, 130);
    strokeWeight(20);
    stroke(255);
    noFill();
    rect(450, 30, 600, 40);
    fill(150, 0, 0);
    noStroke();
    rect(450, 30, (600/bo.maxHealth)*bo.blife, 40);
  }

  rectMode(CORNER);
  strokeWeight(20);
  stroke(255);
  fill(0);
  rect(1200, 930, 250, 40);
  fill(150, 0, 0);
  noStroke();
  rect(1200, 930, (250/maxLives)*lives, 40);
}


void score() {
  fill(255);
  textSize(30);
  text("Score:"+score, 25, 50);
  text("Highscore:"+highscore, 650, 50);
  text("Coins:"+Coinz, 1350, 50);


  if (scoreHit>0 && combo >= 2) {
    textSize(30);
    fill(255, 1.1275*scoreHit);
    text("Combo:"+(combo-1)+"x", 25, height/2);
  } else {
    combo=1; 
    scoreHit=0;
  }
}


void weaponUI() {

  switch(weaponType) {

  case 1:
    shoot = gun1;
    break;


  case 2:
    shoot = gun2;
    break;


  case 3:
    shoot = gun3;
    break;


  case 4:
    shoot = gun4;
    break;


  case 5:
    shoot = gun5;
    break;
  }

  if (meleeType == 1) {
    melee = melee1;
  }

  if (meleeType == 2) {
    melee = melee2;
  }



  rectMode(CORNER);
  fill(50);
  strokeWeight(3);
  stroke(255);
  rect(50, 875, 75, 75);
  image(shoot, 50, 875, 75, 75);
  rect(175, 875, 75, 75);
  image(melee, 175, 875, 75, 75);

  if (r.start == true) {
    fill(255);
    switch(artifactType) {

    case 0:

      break;

    case 1:
      textSize(35);
      text("Slash now shoots homing projectiles", 400, 700);
      ;
      break;

    case 2:
      textSize(35);
      text("Slash now dashes towards mouse. Cooldown resets after enemy kill", 200, 700);
      break;

    case 3:
      textSize(35);
      text("Dash now produces a shockwave of water", 375, 700);
      break;
    }
  }
}

void deathText() {
  if (lives<1) {
    fill(255);
    textSize(45);
    text("Game over", width/2-100, height/2);
    text("Press 'g' to retry", 575, height/2+50 ); 


    if (pressed[71]) {
      lives = 5;
      weaponType =1;
      starto = true;
      r.roomType = 8;
      r.update();
      r.start = true;
      Coinz = 0;
      if (score > highscore) {
        UpdateScore();
      }
      score = 0;
      artifactType = 0;
      worldCounter = 1;
      bossCounter = 1;
      enemies.clear();
      eballs.clear();
      animations.clear();
      coins.clear();
      GetData();
      r.boss=false;
    }
  }

  if (bossCounter == 0) {
    fill(255);
    textSize(50);
    text("You have unlocked a new artifact", 380, 500);

    switch(worldCounter) {

    case 1:
      artifact1 = 1;
      break;

    case 3:
      artifact2 = 1;
      break;

    case 2:
      artifact3 = 1;
      break;
    }
  }

  if (worldCounter == 4) {
    fill(255);
    textSize(45);
    text("You have completed a run", width/2-300, height/2);
    text("Press 'g' to try another time", 435, height/2+50 ); 
    completeGame=true;


    if (pressed[71]) {
      lives = 5;
      weaponType =1;
      starto = true;
      r.roomType = 8;
      r.update();
      r.start = true;
      Coinz = 0;
      if (score > highscore) {
        UpdateScore();
      }
      score = 0;
      artifactType = 0;
      worldCounter = 1;
      bossCounter = 1;
      enemies.clear();
      eballs.clear();
      animations.clear();
      coins.clear();
      r.boss=false;
      GetData();
      completeGame = false;
    }
  }
}
