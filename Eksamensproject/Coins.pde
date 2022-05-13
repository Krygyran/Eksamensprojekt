int Coinz = 0;
int CoinzIncrease = 1;  

class Coin {
  PVector pos;
  float scale;
  boolean grow = true;

  Coin(PVector pos_) {  
    pos = pos_;
    scale = 0;
  }

  void Goldencoin() {

    noStroke();
    fill(255, 215, 0);
    ellipse(pos.x, pos.y, 10+scale, 10+scale);

    if (grow == true) {
      scale=scale+0.2;
    } else {
      scale=scale-0.2;
    }

    if (scale > 10) {
      grow=false;
    }

    if (scale < 0) {
      grow=true;
    }
  }
}


void coinDetect() {
  for (int i=coins.size()-1; i >= 0; i--) {
    C = coins.get(i);
    float l = dist(p.pos.x, p.pos.y, C.pos.x, C.pos.y);
    if (l < 50) {
      Coinz= Coinz+CoinzIncrease; 
      coins.remove(C);
      antal_p=10;
      c = color(255, 215, 0);
      systems.add(new ParticleSystem(p.pos.x, p.pos.y));
      println(Coinz);
    }
  }
}

void deleteCoins(){
  
 for (int i=coins.size()-1; i >= 0; i--) {
    C = coins.get(i);
    coins.remove(C);
 }
}
