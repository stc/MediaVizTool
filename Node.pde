class Node {
  float x, y;
  int w, h;
  PImage img;
  float scale = 1;
  
  float easing = 0.05;
  float easx, easy;
  float easScale;
  
  float hue;
  float brightness;
  float saturation;
  int movement;

  static final int hueRange = 360; 

  Node(String imagename, float x, float y) {
    this.img = loadImage(imagename);
    this.x = x;
    this.y = y;
    this.w = img.width;
    this.h = img.height;
    extractDominantColorFromImage();

    //dirty hack for extract value from filename
    String[] s1 = imagename.split("_");
    String s2 = s1[1];
    String s3 = s2.substring(0, s2.length()-4);
    movement = Integer.parseInt(s3);
  }

  void draw() {
    if (img!=null) {
      float dx = x - easx;
      easx += dx * easing;
  
      float dy = y - easy;
      easy += dy * easing;
      
      float dscale = scale - easScale;
      easScale += dscale * easing;
      
      image(img, easx, easy, img.width * easScale, img.height * easScale);
    }
  }

  void extractDominantColorFromImage() {
    img.loadPixels();
    int numberOfPixels = img.pixels.length;
    int[] hues = new int[hueRange];
    float[] saturations = new float[hueRange];
    float[] brightnesses = new float[hueRange];

    for (int i = 0; i < numberOfPixels; i++) {
      int pixel = img.pixels[i];
      int hue = Math.round(hue(pixel));
      float saturation = saturation(pixel);
      float brightness = brightness(pixel);
      hues[hue]++;
      saturations[hue] += saturation;
      brightnesses[hue] += brightness;
    }

    // Find the most common hue.
    int hueCount = hues[0];
    int hue = 0;
    for (int i = 1; i < hues.length; i++) {
      if (hues[i] > hueCount) {
        hueCount = hues[i];
        hue = i;
      }
    }

    // Set the vars for displaying the color.
    this.hue = hue;
    saturation = saturations[hue] / hueCount;
    brightness = brightnesses[hue] / hueCount;
  }
}