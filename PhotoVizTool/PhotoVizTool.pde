import java.util.*;
import processing.pdf.*;

boolean savePDF = false;

ArrayList<Node> nodes;
ArrayList<String> imagenames;

int connectionAlpha = 0;
int movement = 0;

void setup() {
  size(1200,700);
  frameRate(30);
  imagenames = filesToArrayList();
  nodes = new ArrayList<Node>();
  nodes.clear();
  for(String s : imagenames) {
    nodes.add(new Node(s,random(width),random(height)));
  }
}

void draw() {
  if(savePDF) {
    beginRecord(PDF, "export.pdf"); 
  }
  background(240);
  
  for(int i=0; i<nodes.size(); i++) {
    nodes.get(i).draw();
  }

  if(savePDF) {
    endRecord();
    savePDF = false; 
  }
}

void keyPressed() {
  if(key == '1') {
    gridAlign();
  }
  if(key == '2') {
    brightnessAlign();
  }  
  
  if(key == 'e') {
    savePDF = true;
  }
}