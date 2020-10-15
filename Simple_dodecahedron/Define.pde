Vertex[] defineVertices(){
  Vertex[] vertices = new Vertex[20];
  int startid = 0;
  float phi = (1 + sqrt(5))/2;
  float phid1 = (sqrt(5) - 1)/2;//1/phi
  startid = addPosiNega(vertices, startid, 1, true, 1, true, 1, true);
  startid = addPosiNega(vertices, startid, 0, false, phi, true, phid1, true);
  startid = addPosiNega(vertices, startid, phid1, true, 0, false, phi, true);
  startid = addPosiNega(vertices, startid, phi, true, phid1, true, 0, false);
  return vertices;
}

int addPosiNega(Vertex[] target, int startid, float a, boolean aPN, float b, boolean bPN, float c, boolean cPN){//add (+- a, +- b, +-c) to list. we can set which value is +-
  target[startid++] = new Vertex(a, b, c);
  if(cPN)target[startid++] = new Vertex(a, b, -c);
  if(bPN){
    target[startid++] = new Vertex(a, -b, c);
    if(cPN)target[startid++] = new Vertex(a, -b, -c);
  }
  if(aPN){
    target[startid++] = new Vertex(-a, b, c);
    if(cPN)target[startid++] = new Vertex(-a, b, -c);
    if(bPN){
      target[startid++] = new Vertex(-a, -b, c);
      if(cPN)target[startid++] = new Vertex(-a, -b, -c);
    }
  }
  return startid;
}
