// Makes line to guess about
float f(float x){
  // y = mx + b
  return 0.69 * x + 0.2;
}

class Point{
  // Fields
  float x;
  float y;
  float bias = 1;
  int label;
  
  // Constructor
  Point(float tx, float ty){
    x = tx;
    y = ty;
  }
  
  // Default constructor
  Point() {
    // Pick a random point
    x = random(-1, 1);
    y = random(-1, 1);
    
    // Find were point is based off line
    float lineY = f(x);
    
    // Label based off where line is
    // Above line
    if(y > lineY){
      label = 1;
    }
    // Below line
    else{
      label = -1;
    }
  }
  
  float PixelX(){
    return map(x, -1, 1, 0, width);
  }
  
  float PixelY(){
    return map(y, -1, 1, height, 0);
  }
  
  void show(){
    stroke(0);
    if(label ==1){
      fill(255);
    }
    else{
      fill(0);
    }
    ellipse(PixelX(), PixelY(), 32, 32);
  }
}
