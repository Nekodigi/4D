//based on this site https://en.wikipedia.org/wiki/120-cell
float scale = 100;
float dst = 3.1;
float sw = 5;//stroke weight
float vmult = 2;//vertex size multiple.
Vertex[] vertices;

float phi = (1 + sqrt(5))/2;
float phi2 = phi*phi;//phi*phi
float phid1 = (sqrt(5) - 1)/2;// 1/phi
float phid2 = phid1*phid1;// 1/(phi*phi)
float edgeL = phid2*2;

void setup(){
  size(500, 500, P3D);
  //ortho();
  //strokeCap(ROUND);//doesn't work in 3d.//vertex marker instead
  hint(DISABLE_DEPTH_TEST);stroke(0, 50);//skelton mode
  translate(width/2, height/2);
  vertices = defineVertices();
  for(Vertex v : vertices){
    println(v.x, v.y, v.z, v.w);
    //point(v.x*scale, v.y*scale, v.z*scale);
    for(int i=0; i<vertices.length; i++){
      Vertex vt = vertices[i];
      Vertex diff = vt.sub(v);//for calculating square distance
      if(diff.x*diff.x + diff.y*diff.y + diff.z*diff.z + diff.w*diff.w <= edgeL*edgeL+EPSILON){
        v.adjs.add(vt);
      }
    }
  }
}

void draw(){
  background(255);
  translate(width/2, height/2);
  rotateX(float(frameCount)/100);
  rotateY(float(frameCount)/200);
  rotateZ(float(frameCount)/400);
  
  for(Vertex v : vertices){
    float vx = v.x/(v.w+dst)*scale;
    float vy = v.y/(v.w+dst)*scale;
    float vz = v.z/(v.w+dst)*scale;
    
    float swv = sw/(v.w+dst);
    strokeWeight(swv*vmult);
    point(vx, vy, vz);
    for(Vertex vt : v.adjs){ 
      float vtx = vt.x/(vt.w+dst)*scale;
      float vty = vt.y/(vt.w+dst)*scale;
      float vtz = vt.z/(vt.w+dst)*scale;
      float swt = (swv + sw/(vt.w+dst))/2;//average width
      strokeWeight(swt);
      line(vx, vy, vz, vtx, vty, vtz);
    }
  }
}
