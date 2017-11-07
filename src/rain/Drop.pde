class Drop {
  float x; //width coordinate
  float y; //length coordinate
  float z; //depth coordinate
  float len; //how long is the raindrop line
  float yspeed; //how fast the rain drop moving per pixel
  float opacity; //how transparent 0 is invisible 255 is 100% opacity

  // create raindrop
  Drop() {
    x = random(width);
    y = random(-500,50);
    z = random(0,20); // 0 far , 20 close
    //map depth from range 0, 20 to range 10,50 e.g. (z,0,20,10,50)
    // this means its longer if it's closer 20 -> 50, shorter if further 0 -> 10
    len = map(z,0,20,10,50);
    yspeed = map(z,0,20,4,18);
    opacity = map(z,0,20,150,220);
  }

  // make the raindrop fall
  void fall() {
    y = y + yspeed;
    float grav = map(z, 0, 20, 0, 0.2);
    yspeed = yspeed + grav;

    if (y > height) {
      y = random(-200, -100);
      yspeed = map(z, 0, 20, 4, 10);
    }
  }

  // render the raindrop
  void show() {
    float thick = map(z, 0, 20, 0.8, 2.2);
    strokeWeight(thick);
    stroke(240,248,255,opacity); //line color
    line(x,y,x,y+len); //line coordinate (x1,y1,x2,y2)
  }
}

