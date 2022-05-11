void healthBar() {
  rectMode(CORNER);
  strokeWeight(20);
  stroke(255);
  fill(0);
  rect(1200, 930, 250, 40);
  fill(150, 0, 0);
  noStroke();
  rect(1200, 930, (250/maxLives)*lives, 40);

  //boss
  if (r.boss==true) {
    fill(255);
    textSize(30);
    text(bo.bossName, 100, 900);
    stroke(255);
    noFill();
    rect(100, 930, 600, 40);
    fill(150, 0, 0);
    noStroke();
    rect(100, 930, (600/bo.maxHealth)*bo.blife, 40);
  }
}


void score() {
  fill(255);
  textSize(30);
  text("Score:"+score, 25, 50);

  if (scoreHit>0 && combo >= 2) {
    fill(255, 1.1275*scoreHit);
    text("Combo:"+(combo-1)+"x", 25, height/2);
  } else {
    combo=1; 
    scoreHit=0;
  }
}


void weaponUI() {
}
