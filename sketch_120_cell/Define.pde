Vertex[] defineVertices(){
  Vertex[] vertices = new Vertex[600];
  int startid = 0;
  float phi = (1 + sqrt(5))/2;
  float phid1 = (sqrt(5) - 1)/2;//1/phi
  startid = permutation20(vertices, startid, 2);
  startid = permutation31(vertices, startid, 1, sqrt(5));
  startid = permutation31(vertices, startid, phi, phid2);
  startid = permutation31(vertices, startid, phid1, phi2);
  startid = evenPermutation(vertices, startid, 0, false, phid2, true, 1, true, phi2, true);
  startid = evenPermutation(vertices, startid, 0, false, phid1, true, phi, true, sqrt(5), true);
  startid = evenPermutation(vertices, startid, phid1, true, 1, true, phi, true, 2, true);println(startid);
  return vertices;
}

int permutation31(Vertex[] target, int startid, float a, float b){//permutation of (+-a, +-a, +-a, +-b)
  startid = addPosiNega(target, startid, b, true, a, true, a, true, a, true);
  startid = addPosiNega(target, startid, a, true, b, true, a, true, a, true);
  startid = addPosiNega(target, startid, a, true, a, true, b, true, a, true);
  startid = addPosiNega(target, startid, a, true, a, true, a, true, b, true);
  return startid;
}

int permutation20(Vertex[] target, int startid, float a){//permutation of (+-a, +-a, 0, 0)
  startid = addPosiNega(target, startid, a, true, a, true, 0, false, 0, false);
  startid = addPosiNega(target, startid, a, true, 0, false, a, true, 0, false);
  startid = addPosiNega(target, startid, a, true, 0, false, 0, false, a, true);
  startid = addPosiNega(target, startid, 0, false, a, true, a, true, 0, false);
  startid = addPosiNega(target, startid, 0, false, a, true, 0, false, a, true);
  startid = addPosiNega(target, startid, 0, false, 0, false, a, true, a, true);
  return startid;
}

int evenPermutation(Vertex[] target, int startid, float a, boolean aPN, float b, boolean bPN, float c, boolean cPN, float d, boolean dPN){//only for this code.
  startid = addPosiNega(target, startid, a, aPN, b, bPN, c, cPN, d, dPN);
  startid = addPosiNega(target, startid, a, aPN, c, cPN, d, dPN, b, bPN);
  startid = addPosiNega(target, startid, a, aPN, d, dPN, b, bPN, c, cPN);
  startid = addPosiNega(target, startid, b, bPN, a, aPN, d, dPN, c, cPN);
  startid = addPosiNega(target, startid, b, bPN, c, cPN, a, aPN, d, dPN);
  startid = addPosiNega(target, startid, b, bPN, d, dPN, c, cPN, a, aPN);
  startid = addPosiNega(target, startid, c, cPN, a, aPN, b, bPN, d, dPN);
  startid = addPosiNega(target, startid, c, cPN, b, bPN, d, dPN, a, aPN);
  startid = addPosiNega(target, startid, c, cPN, d, dPN, a, aPN, b, bPN);
  startid = addPosiNega(target, startid, d, dPN, a, aPN, c, cPN, b, bPN);
  startid = addPosiNega(target, startid, d, dPN, b, bPN, a, aPN, c, cPN);
  startid = addPosiNega(target, startid, d, dPN, c, cPN, b, bPN, a, aPN);
  return startid;
}

int addPosiNega(Vertex[] target, int startid, float a, boolean aPN, float b, boolean bPN, float c, boolean cPN, float d, boolean dPN){//add (+- a, +- b, +-c) to list. we can set which value is +-
  target[startid++] = new Vertex(a, b, c, d);
  if(cPN)target[startid++] = new Vertex(a, b, -c, d);
  if(bPN){
    target[startid++] = new Vertex(a, -b, c, d);
    if(cPN)target[startid++] = new Vertex(a, -b, -c, d);
  }
  if(aPN){
    target[startid++] = new Vertex(-a, b, c, d);
    if(cPN)target[startid++] = new Vertex(-a, b, -c, d);
    if(bPN){
      target[startid++] = new Vertex(-a, -b, c, d);
      if(cPN)target[startid++] = new Vertex(-a, -b, -c, d);
    }
  }
  if(dPN){
    target[startid++] = new Vertex(a, b, c, -d);
    if(cPN)target[startid++] = new Vertex(a, b, -c, -d);
    if(bPN){
      target[startid++] = new Vertex(a, -b, c, -d);
      if(cPN)target[startid++] = new Vertex(a, -b, -c, -d);
    }
    if(aPN){
      target[startid++] = new Vertex(-a, b, c, -d);
      if(cPN)target[startid++] = new Vertex(-a, b, -c, -d);
      if(bPN){
        target[startid++] = new Vertex(-a, -b, c, -d);
        if(cPN)target[startid++] = new Vertex(-a, -b, -c, -d);
      }
    }
  }
  return startid;
}
