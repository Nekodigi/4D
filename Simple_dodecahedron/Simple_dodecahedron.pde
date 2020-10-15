//based on this site https://en.wikipedia.org/wiki/Regular_dodecahedron

float scale = 100;
Vertex[] vertices;

float phi = (1 + sqrt(5))/2;
float phid1 = (sqrt(5) - 1)/2;//1/phi
float edgeL = phid1*2;

void setup(){
  size(500, 500, P3D);
  //ortho();
  strokeWeight(10);
  translate(width/2, height/2);
  vertices = defineVertices();
  for(Vertex v : vertices){
    println(v.pos);
    point(v.pos.x*scale, v.pos.y*scale, v.pos.z*scale);
    for(int i=0; i<vertices.length; i++){
      Vertex vt = vertices[i];
      PVector diff = PVector.sub(vt.pos, v.pos);//for calculating square distance
      if(diff.x*diff.x + diff.y*diff.y + diff.z*diff.z <= edgeL*edgeL){
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
    for(Vertex vt : v.adjs){
      line(v.pos.x*scale, v.pos.y*scale, v.pos.z*scale, vt.pos.x*scale, vt.pos.y*scale, vt.pos.z*scale);
    }
  }
}
