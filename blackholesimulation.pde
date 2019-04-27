int c = 30;  // Speed of light = 299792458 m/s
float G = 2;  // Universal gravitational constant = 6.67 * Math.pow(10, -11)
float dt = 0.1;  // Time increment

BlackHole blackhole;
ArrayList<Photon> photons;
int photon_dist = 20;


void setup() {
  fullScreen();
  ellipseMode(RADIUS);

  blackhole=  new BlackHole(width/3, height/2, 3000);

  photons = new ArrayList<Photon>();
  for (int i=0; i<height/2; i+=photon_dist) {
    photons.add(new Photon(width - 20, i));
  }
}

void draw() {
  background(50);
  fill(0);
  textSize(40);
  text("Black hole Simulation\nProcessing", width*.66, height*.8);
  blackhole.show();
  for (Photon p : photons) {
    blackhole.pull(p);
    p.update();
    p.show();
  }
}
