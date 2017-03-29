void drawHUD(float xangle,float yangle,float zangle,int x, int y, int s){

  float x1,x2,y1,y2;

  pushMatrix();
  noStroke();
  noFill();

  // translate and rotate view to match angles and offsets given
  translate (x,y);

  // Aircraft Icon
  stroke(cFin);        
  noFill();
  pushMatrix(); 
   strokeWeight(2);
  ellipse(0, 0, s*0.075, s*0.075);
        line(s*-0.0375,0,s*-0.08,0);
        line(s*0.0375,0,s*0.08,0);
       line(0,s*-0.0375,0,s*-0.08);

  popMatrix(); 

  // Compass
  stroke(cBody);        
  noFill();
  pushMatrix(); 
  rectMode(CENTER);
  rotateZ(radians(-90));
  if (IgnoreYAW==0) rotateZ(radians(yangle));  
  float r1=s*0.5;
  float r2=s*0.4;
  float r3=s*0.3;
  stroke(cErrorText);        

  for (int i = 0; i <= 330; i = i+30)
  {
    strokeWeight(4);
    for (int j = 0; j < 30; j = j+10)
    {
      r2=s*0.45;
      for (int k = 0; k < 10; k = k+5)
      {
        x1 = cos(radians(i+j+k))*r1;
        x2 = cos(radians(i+j+k))*r2;
        y1 = sin(radians(i+j+k))*r1;
        y2 = sin(radians(i+j+k))*r2;
        line(x1,y1,x2,y2);
        strokeWeight(1);
        r2=s*0.48;
        stroke(cBody);        
      }
    }
  }
  ellipse(0, 0, s, s);
  popMatrix(); 

  // Attitude
  stroke(cBody);        
  noFill();
  pushMatrix(); 
  rotateZ(radians(-1.0*xangle)); 
  for (int i = -20+(int)zangle; i <= 20+(int)zangle; i = i+10)
  {
if (i==(int)zangle)   stroke(cErrorText);        

    strokeWeight(4);
    r1=s*0.2;
    for (int j = 0; j < 10; j = j+5)
    {
      x1=-1*r1;
      x2=r1;
      y1=(i+j)*s*0.25/15;
      y2=y1;
      line(x1,y1,x2,y2);
 //     line(x1,-1.0*y1,x2,-1.0*y2);
      strokeWeight(1);
          stroke(cBody);        
    r1=s*0.1;

    }
  }
  popMatrix(); 

  /*
rotateZ(radians(zangle));  
   rotateX(radians(xangle));  
   
   // Body
   fill(cBody);        
   pushMatrix(); 
   rotateZ(radians(90));  // rotate because cylinder routine wants to draw a vertical cylinder
   cylinder(s/15,s,50);
   popMatrix(); 
   
   // Set rendering for wireframe
   stroke(cLines);
   strokeWeight(1);
   strokeCap(ROUND);
   
   // Wings
   pushMatrix(); 
   translate (s/10,0);
   fill(cWings);
   box(s/5, s/40, s);
   popMatrix();  
   
   // Vertical Tail
   pushMatrix();
   translate (s/-2,0);
   translate (s/20,s/-10);
   fill(cFin);
   box(s/10, s/4, s/50);
   popMatrix(); 
   
   // Horizontal Tail
   pushMatrix();
   translate (s/-2,0);
   fill(cTail);
   box(s/10, s/50, s/4);
   popMatrix(); 
   */
  camera();
  noFill();
  noStroke();
  popMatrix();
}














