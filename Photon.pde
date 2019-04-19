class Photon {
  PVector pos;
  PVector vel;
  float r, step;
  
  ArrayList<PVector> history;
  Photon(float x, float y){
    this.pos = new PVector(x, y);
    this.vel = new PVector(-c, 0);
    this.r = photon_dist / 2;
    step = dt;
    
    history = new ArrayList<PVector>();
  }
  
  void update(){
    if (frameCount % 3 == 0)
      history.add(pos.copy());
    if (history.size() > 200)
      history.remove(0);
    PVector vel_step = vel.copy();
    vel_step.mult(step);
    pos.add(vel_step);
  }
  void show(){
    // Trail
    stroke(200, 10, 10);
    strokeWeight(1);
    noFill();
    beginShape();
    for(PVector point: history)
      vertex(point.x, point.y);
    endShape();
    // Particle
    fill(255, 0, 0);
    strokeWeight(4);
    point(pos.x, pos.y);
  }
}
