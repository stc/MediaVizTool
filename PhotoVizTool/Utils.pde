void gridAlign() {
  if(nodes.size()>0) {
    int index = 0;
    int colNum = int(width/(nodes.get(0).w * nodes.get(0).scale));
    int rowNum = 100;
    int cellWidth = int(nodes.get(0).w * nodes.get(0).scale);
    println(nodes.get(0).w);
    int cellHeight = int(nodes.get(0).h * nodes.get(0).scale);
    for (int r=0; r<rowNum; r++ ) {
      for ( int c = 0; c < colNum; c++ ) {
        if(index<nodes.size()) {
          nodes.get(index).x = c * cellWidth;
          nodes.get(index).y = r * cellHeight;
          nodes.get(index).scale = 0.5;
        }
        index++;
      }
    }
  }
  connectionAlpha = 0;
}

void brightnessAlign() {
  for(int i=0; i< nodes.size(); i++) {
    nodes.get(i).x = i * width / nodes.size();
    nodes.get(i).y = height/2-nodes.get(i).brightness;
    nodes.get(i).scale = 0.3;
  }
  connectionAlpha = 200;
}

void movementAlign() {
  for(int i=0; i< nodes.size(); i++) {
    nodes.get(i).x = i * width / nodes.size();
    nodes.get(i).y = height/2-nodes.get(i).movement/4;
    nodes.get(i).scale = 0.3;
  }
  connectionAlpha = 200;
}

ArrayList<String> filesToArrayList() {
  ArrayList<File> filesList = new ArrayList<File>();
  ArrayList<String> namesList = new ArrayList<String>();
  String folderPath = sketchPath() + "/data/images";
  println(folderPath);
  File file = new File(folderPath);
  File[] files = file.listFiles();
  if(files!=null) {
    for (int i = 0; i < files.length; i++) {
      String tmp = split(files[i].getAbsolutePath(),".")[1]; 
      if(!tmp.equals("DS_Store")) {
        filesList.add(files[i]);
        namesList.add(files[i].getAbsolutePath());
      }
    }
  }
  Collections.sort(namesList);
  return(namesList);
}