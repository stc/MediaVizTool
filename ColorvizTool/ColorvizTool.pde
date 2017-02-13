/*

Simple intro to represent data visually in a 2D space. Each data point has a color, its position 
is defined on its properties along the different axes. Pseudo code for this example is:

- create some data points, assign random colors to them       |  data generation / collection
- store these colors in an array                              |  data cleaning / preprocessing 
- iterate through all elements in this array                  |  mining 
- get info (hue / brightness / channel) for each color        |  feature extraction
- rescale extracted values to coordinate system               |  mapping 
- display color in our 2D space                               |  representing

*/

// number of datapoints
int NUM = 5000;

// an arraylist in which we store (& access) our datapoints
ArrayList< DataPoint > dataset = new ArrayList< DataPoint >();

void setup() {
  size(800,800);
  
  // create new datapoint objects, assign random colors to them
  for(int i=0; i< NUM; i++) {
    color c = color( random(255), random(255), random(255) );
    dataset.add( new DataPoint(c) );
  }
}

void draw() {
  background(130);
  
  //  comment / uncomment to try different representations
  drawRed();
  // drawHue();
  // drawBrightness();
  // drawCombined();
}

//  functions to represent data on axes based on their colors

void drawRed() {
  // x axis: index in the array, y axis: red component of each color
  for(int i=0; i<dataset.size(); i++) {
    dataset.get(i).display( i / (float)NUM * width, map( red( dataset.get(i).myColor ), 0, 255, 0, height / 2 ) );    
  }
}

void drawHue() {
  // x axis: index in the array, y axis: hue value of each color
  for(int i=0; i<dataset.size(); i++) {
    float hue = hue( dataset.get(i).myColor );
    dataset.get(i).display( map( i, 0, NUM, 0, width ), map( hue, 0, 255, 0, height/2 ) );    
  }
}

void drawBrightness() {
  // x axis: index in the array, y axis: brightness value of each color
  for(int i=0; i<dataset.size(); i++) {
    float brightness = brightness( dataset.get(i).myColor );
    dataset.get(i).display( map( i, 0, NUM, 0, width ), map( brightness, 0, 255, 0, height/2 ) );    
  }
}

void drawCombined() {
  // x axis: hue value of each color, y axis: brightness value of each color
  for(int i=0; i<dataset.size(); i++) {
    float hue = hue( dataset.get(i).myColor );
    float brightness = brightness( dataset.get(i).myColor );
    dataset.get(i).display( map( hue, 0, 255, 0, width ), map( brightness, 0, 255, 0, height/2 ) );    
  }
}