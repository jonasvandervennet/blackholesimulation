class BlackHole{
  PVector pos;
  float mass, rs;
 BlackHole(int x, int y, float m){
   this.pos = new PVector(x, y);
   mass = m;
   rs = 2 * G * mass / (c * c);
   println("Rs:: " + rs);
 }
 BlackHole(int x, int y, float m, int r){
   this(x, y, m);
   rs = r;
 }
 
 void pull(Photon p){
   // force: G*m1*m2/d²
   // acc: G * m / d²
   PVector force = PVector.sub(pos, p.pos);
   float d = force.mag();
   force.setMag(G * mass / (d*d));
   p.vel.add(force);
   p.vel.limit(c);
 }
 
 void show(){
   // Black Hole itself
   fill(0);
   noStroke();
   circle(this.pos.x, this.pos.y, this.rs);
   
   // Accretion Disk
   noFill();
   stroke(155);
   strokeWeight(20);
   circle(this.pos.x, this.pos.y, this.rs * 3 + 10);
   
   // Unstable Photon Radius
   noFill();
   stroke(255, 150, 0);
   strokeWeight(10);
   circle(this.pos.x, this.pos.y, this.rs * 1.5 + 5);
   
 }
}
