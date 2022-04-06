void healthBar(){
  rectMode(CORNER);
  strokeWeight(20);
  stroke(255);
  fill(0);
  rect(1200,930,250,40);
  fill(150,0,0);
  noStroke();
  rect(1200,930,25*lives,40);
}
