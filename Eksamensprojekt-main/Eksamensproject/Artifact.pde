class Artifact {

  PVector location;
  int itemType;

  Artifact(int type) {
    itemType = type;
    location = new PVector(0, 0);
  }

  void display() { 
    imageMode(CENTER);
    switch(itemType) {

    case 1:
      location = new PVector(550, 350);
      image(arti1, location.x, location.y, 100, 100);
      break;

    case 2:
      location = new PVector(750, 350);
      image(melee2, location.x, location.y, 100, 100);
      break;

    case 3:
      location = new PVector(950, 350);
      image(arti2, location.x, location.y, 100, 100);
      break;
    }
  }
}

void showArtifacts() {
  if (r.start == true) {
    if (artifact1 == 1) {
      artis.add(new Artifact(1));
    }

    if (artifact2 == 1) {
      artis.add(new Artifact(2));
    }

    if (artifact3 == 1) {
      artis.add(new Artifact(3));
    }
  }
}

void deleteArtifact() {
  for (int i=artis.size()-1; i >= 0; i--) {
    a = artis.get(i);
    artis.remove(a);
  }
}
