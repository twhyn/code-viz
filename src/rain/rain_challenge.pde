Drop[] drops = new Drop[75]; //how many rain drops

void setup() {
  size(screen.width, screen.height);    //canvas-size (width, height)
  for (int i = 0; i < drops.length; i++) {
    drops[i] = new Drop();
  }
}

void draw() {
  background(201, 214, 234); // bg color
  for (int i = 0; i < drops.length; i++) {
    drops[i].fall();
    drops[i].show();
  }
}