// simple class for storing colors

class DataPoint {
  // this object's own color type variable
  color myColor;
  
  // constructor: this is called when creating this object
  DataPoint(color c) {
    myColor = c;
  }
  
  // call this in every frame ( draw() ) to display the object on the screen
  void display(float x, float y) {
    noStroke();
    fill(myColor);
    ellipse(x,y,5,5);
  }
}