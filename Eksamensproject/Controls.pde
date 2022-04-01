boolean downPressed;
boolean upPressed;
boolean rightPressed;
boolean leftPressed;
boolean[] pressed = new boolean[256];

void keyPressed()
{
  pressed[keyCode] = true;
}
void keyReleased()
{
  pressed[keyCode] = false;
  p.vel.set(0,0);

  downPressed = false;
  upPressed = false;
  rightPressed = false;
  leftPressed = false;
}


void controlsMove() {
  if (pressed[87]) {
    p.vel.y = -9;
  }

  if (pressed[65]) {
    p.vel.x = -9;
  }

  if (pressed[83]) {
    p.vel.y = 9;
  }

  if (pressed[68]) {
    p.vel.x = 9;
  }
  
   if (pressed[87] && pressed[68] || pressed[87] && pressed[65] || pressed[83] && pressed[68] || pressed[83] && pressed[65]) {
    p.vel.mult(0.6);
  }
  
  if(pressed[32] && dashTimer < 7){
    p.vel.mult(3);
    dashTimer++;
    dashReset = 0;
    antal_p=3;
    c=(255);
    systems.add(new ParticleSystem(p.pos.x, p.pos.y));
  }
}
