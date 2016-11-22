import java.util.*;
import processing.video.*;
import gab.opencv.*;
import processing.pdf.*;

OpenCV opencv;
Movie movie;
int index;
String title = "r: record data, p: play movie, 1: time based viz 2: brightness based viz, 3: movement based viz";

boolean playMovie = false;
boolean recMovie = false;
boolean vizMovie = false;
boolean canSave = true;
boolean savePDF = false;

ArrayList<Node> nodes;
ArrayList<String> imagenames;

int connectionAlpha = 0;
int movement = 0;

void setup() {
  size(1200,700);
  frameRate(30);
  movie = new Movie(this, "bunny.m4v");
  opencv = new OpenCV(this, 480, 320);
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
  if(playMovie) {
    image(movie,0,0);
  }
  
  if(recMovie) {
    image(movie,0,0,movie.width/6,movie.height/6);
    opencv.loadImage(movie);
    opencv.calculateOpticalFlow();
    
    if (movie.time() == movie.duration()) {
      println("finished extracting data");
      imagenames.clear();
      imagenames = filesToArrayList();
      nodes.clear();
      for(String s : imagenames) {
        nodes.add(new Node(s,random(width),random(height)));
      }
      canSave = false;
    }else {
      if(frameCount%2==0) {
        PImage tmp = get(0,0,movie.width/6,movie.height/6);
        tmp.save(savePath("data/images/" + nf(index,4) + "_" + movement + ".jpg"));
        index++;
      }
    }
    PVector aveFlow = opencv.getAverageFlow();
    movement = (int)(aveFlow.mag() * 100);
    int flowScale = 50;
    stroke(60);
    strokeWeight(2);
    line(movie.width/2/6, movie.height/2/6, movie.width/2/6 + aveFlow.x*flowScale/6, movie.height/2/6 + aveFlow.y*flowScale/6);
  }
  
  if(vizMovie) {
    for(int i=0; i<nodes.size(); i++) {
      if(i<nodes.size()-1) {
        stroke(60,connectionAlpha);
        line(nodes.get(i).x,nodes.get(i).y,nodes.get(i+1).x,nodes.get(i+1).y);
      }
      nodes.get(i).draw();
    }
  }

  if(savePDF) {
    endRecord();
    savePDF = false; 
  }
  fill(60);
  text(title,20,height-20);
}

void movieEvent(Movie m) {
  m.read();
}

void keyPressed() {
  if(key == 'p') {
    playMovie = true;
    recMovie = false;
    vizMovie = false;
    movie.play();
    title = "playback";
  }
  if(key == '1') {
    gridAlign();
    playMovie = false;
    recMovie = false;
    vizMovie = true;
    title = "time based viz";
  }
  if(key == '2') {
    brightnessAlign();
    playMovie = false;
    recMovie = false;
    vizMovie = true;
    title = "brightness based viz";
  }
  if(key == '3') {
    movementAlign();
    playMovie = false;
    recMovie = false;
    vizMovie = true;
    title = "movement based viz";
  }
  
  if(key == 'r') {
    playMovie = false;
    recMovie = true;
    vizMovie = false;
    canSave = true;
    index = 0;
    movie.speed(2);
    movie.play();
    title = "record data...";
  }
  
  if(key == 'e') {
    savePDF = true;
  }
}