class Vertex{
  float x; float y; float z; float w;
  ArrayList<Vertex> adjs = new ArrayList<Vertex>();//adjacent id
  
  Vertex(float x, float y, float z, float w){
    this.x = x;
    this.y = y;
    this.z = z;
    this.w = w;
  }
  
  Vertex sub(Vertex t){//it doesn't change internal data
    return new Vertex(x - t.x, y - t.y, z - t.z, w - t.w);
  }
}
