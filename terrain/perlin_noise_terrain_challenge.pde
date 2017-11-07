// test: create grids with multi-dimension arrays contain rect()
// now use vertex. you will have a mesh with tris vertex
// rotate that mesh on x axis
// randomize the z (depth) and you will have shaking mesh.
// put frameRate(1) in setup() for the slowmo
// store z value for each element in multi-dimension array
// apply perlin noise theory for more organic feeling

int cols, rows;
int scale = 20;
int w = 800;
int h = 500;
float move = 0;
float[][] terrain;

void setup() {
  size(screen.width, screen.height,P3D); //as usual, canvas size + p3d to enable 3d
  //frameRate(5);

  cols = w / scale;
  rows = h / scale;
  terrain = new float[cols][rows];

}

void draw() {
  background(230, 235, 224);
  move -= 0.1;

  float yoff = move;
  for(int y=0; y < rows; y++) {
    float xoff = 0;
    for(int x=0; x < cols; x++) {
      terrain[x][y] = map(noise(xoff, yoff),0,1,-75,75); //noise sets z-value
      xoff += 0.2;
    }
    yoff += 0.2;
  }

  stroke(237, 106, 90);
  noFill();

  pushMatrix(); // keep all the translate,rotate within push pop
  translate(width/2, height/2+50);

  // based on X axis rotation. so it will rotate farther or toward you
  // X -> imagine pushing your laptop screen
  // Y -> imagine opening the door
  // Z -> imagine spinning disc
  rotateX(PI/3);
  translate(-w/2, -h/2);
  for(int y=0; y < rows-1; y++) {
    beginShape(TRIANGLE_STRIP); //begin record tris vertex
    for(int x=0; x < cols; x++) {
      // y and y + 1 because if not you will get horizontal grid.
      // 0,0 ; 0,1; 1,0; 1,1 --> |/|
      vertex(x*scale, y*scale, terrain[x][y]);
      vertex(x*scale, (y+1)*scale, terrain[x][y+1]);
    }
    endShape();

  }

  popMatrix();

}