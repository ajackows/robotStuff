
void drawAngle(float angle,int x, int y, int s, String title, color c){

  pushMatrix();
  noStroke();
  noFill();

  translate (x,y);

  fill(cNormalText);         //text colour
  textAlign(CENTER,CENTER);
  textFont(font18); 
  text(title, 0, s/5);
  text((int)angle, 0, s/5*2);

  rotateZ(radians(angle)); 
  noFill();
  stroke(c);
  strokeWeight(3);
  strokeCap(ROUND);
  line(-s/2,0,s/2, 0);

  noFill();
  noStroke();
  popMatrix();
}

void drawBar(float Value,int x, int y, int s,int maxVal, color c){

  pushMatrix();
  noStroke();
  noFill();
  
  fill(c);
  translate (x,y);
  rect(0,0,map(Value, -maxVal, maxVal, 0, s),s/10);
  
  noFill();
  noStroke();
  popMatrix();
}


void cylinder(float w, float h, int sides)
{
  float angle;
  float[] x = new float[sides+1];
  float[] z = new float[sides+1];

  //get the x and z position on a circle for all the sides
  for(int i=0; i < x.length; i++){
    angle = TWO_PI / (sides) * i;
    x[i] = sin(angle) * w;
    z[i] = cos(angle) * w;
  }

  //draw the center of the cylinder
  beginShape(QUAD_STRIP); 

  for(int i=0; i < x.length; i++){
    vertex(x[i], -h/2, z[i]);
    vertex(x[i], h/2, z[i]);
  }

  endShape();
  
  //draw the top of the cylinder
  beginShape(TRIANGLE_FAN);

  vertex(0,   -h/2,    0);

  for(int i=0; i < x.length; i++){
    vertex(x[i], -h/2, z[i]);
  }

  endShape();

  //draw the bottom of the cylinder
  beginShape(TRIANGLE_FAN); 

  vertex(0,   h/2,    0);

  for(int i=0; i < x.length; i++){
    vertex(x[i], h/2, z[i]);
  }

  endShape();
}

void cone(float w, float h, int sides) {
  float angle;
  float[] x = new float[sides+1];
  float[] z = new float[sides+1];
  
  //get the x and z position on a circle for all the sides
  for(int i=0; i < x.length; i++){
    angle = TWO_PI / (sides) * i;
    x[i] = sin(angle) * w;
    z[i] = cos(angle) * w;
  }
    //draw the top of the cylinder
  beginShape(TRIANGLE_FAN);

  vertex(0,   h,    0);

  for(int i=0; i < x.length; i++){
    vertex(x[i], 0, z[i]);
  }

  endShape();
}

void fin(float l, float w, float h) {
  
  beginShape();
  
  vertex(0,0,w/-2);
  vertex(0,l,w/-2);
  vertex(h/4,l,w/-2);
  vertex(h,0,w/-2);
  
  endShape();
  
  beginShape();
  
  vertex(0,0,w/2);
  vertex(0,l,w/2);
  vertex(h/4,l,w/2);
  vertex(h,0,w/2);
  
  endShape();
  
  beginShape(QUAD_STRIP);
  
  vertex(0,0,w/-2);
  vertex(0,l,w/-2);
  vertex(0,0,w/2);
  vertex(0,l,w/2);
  
  endShape();
  
  beginShape(QUADS);
  
  vertex(0,l,w/-2);
  vertex(0,l,w/2);
  vertex(h/4,l,w/2);
  vertex(h/4,l,w/-2);
  
  endShape();
  
  beginShape(QUAD_STRIP);
  
  vertex(h/4,l,w/-2);
  vertex(h/4,l,w/2);
  vertex(h,0,w/-2);
  vertex(h,0,w/2);
  
  endShape();
  
  beginShape(QUAD_STRIP);
  
  vertex(h,0,w/-2);
  vertex(h,0,w/2);
  vertex(0,0,w/-2);
  vertex(0,0,w/2);
  
  endShape();
}
  
void drawCraft(float q0,float q1,float q2, float q3,int x, int y, int s){

  pushMatrix();
  noStroke();
  noFill();

  camera(width/2.0, height/2.0 , (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, -1, 0);
  // translate and rotate view to match angles and offsets given
  translate (x,y);
  //if (IgnoreYAW==0) rotateY(radians(yangle));   
  //rotateZ(radians(zangle));   
  //rotateX(radians(xangle));
  float x1, y1, z1, theta;
  theta = 2*acos(q0);
  x1 = q1/-sin(theta/2);
  y1 = q2/-sin(theta/2);
  z1 = q3/-sin(theta/2);
  rotate(theta, x1, z1, y1);

  // Body
  fill(cBody);        
  pushMatrix(); 
  rotateZ(radians(90));  // rotate because cylinder routine wants to draw a vertical cylinder
  cylinder(s/15,s,50);
  popMatrix(); 
  
  // Cone
  fill(cBody);        
  pushMatrix(); 
  translate (s/2,0);
  rotateZ(radians(270));
  cone(s/15,s/5,50);
  popMatrix();

  // Set rendering for wireframe
  stroke(cLines);
  strokeWeight(1);
  strokeCap(ROUND); 
 
  fill(cBody);
  pushMatrix();
  rotateX(radians(90));
  translate(s/-2,0);
  rotateY(radians(90));
  ellipse(0,0,2*s/15,2*s/15);
  popMatrix(); 
  
  fill(cBody);
  pushMatrix();
  rotateX(radians(90));
  translate(s/2,0);
  rotateY(radians(90));
  ellipse(0,0,2*s/15,2*s/15);
  popMatrix();

  // Fins
  pushMatrix();
  translate (s/-2,0);
  translate (s/100,0);
  fill(cFin);
  fin(s/8,s/50,s/5);
  rotateX(radians(120));
  fin(s/8,s/50,s/5);
  rotateX(radians(120));
  fin(s/8,s/50,s/5);  
  popMatrix(); 
  
  

  camera();
  noFill();
  noStroke();
  popMatrix();
}










