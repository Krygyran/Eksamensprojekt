PFont terra;  

void menu(){
  rectMode(CORNER);
stroke(255);
  strokeWeight(5);
  text("Terra incognita", width/2-170, 190); 
  image(background,0,0);   
  textFont(terra);
  fill(0);
  rect(width/2-200, 100, 400, 150);
  fill(255);
  text("Terra incognita", width/2-170, 190);


  if (back == true) {
    fill(0);
    rect(300, 100, 900, 700);
    fill(255);
    text("Controls", width/2-100, 190);
    textSize(25);
    text("WASD - To move", width/2-105, 250);
    text("Left mouse button - Shoot", width/2-150, 300);
    text("Right mouse Button - Slash", width/2-150, 350);
    text("Space - Dash", width/2-85, 400);
    text("When enemies are red, use melee weapon to kill them", 450, 500);
    text("Enemies can also be killed with guns, but give less points", 425, 550);
    text("Also use melee weapon to heal yourself", 525, 600);
  }
}
