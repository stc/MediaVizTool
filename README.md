# MediaVizTool
Visualizing image sequences from different viewpoints. 
Compatibility: Processing 3+

## Dependencies
- OpenCV
- Video Library

## How to
Add dependencies: open the sketch. Click tools/add tool, go to libraries tab. Find Video (by the official Processing Foundation), select install. Find OpenCV for Processing, select install.

Run sketch: place a video in the data folder, rename the filename in MediaVizTool.pde, line 26

Keys:

- P: playback movie
- R: record dataset from your movie
- 1: time sequence visualization
- 2: brightness based visualization
- 3: movement intensity based visualization (based on optical flow)

## Examples

Visualization, based on brightness value of each image in the sequence:
![brightness based visualization](https://cloud.githubusercontent.com/assets/270431/20515184/ad0bef60-b090-11e6-89a1-1ea950fea809.jpg)

Visualization, based on movement value between each corresponding image in the sequence:
![movement based visualization](https://cloud.githubusercontent.com/assets/270431/20515185/af94f344-b090-11e6-9539-85d046081f90.jpg)

# DataVizTool
Visualizing point cloud based on color values of each point

## Examples

Visualization, based on hue (x axis) and brightness (y axis) values of each color
![brightness / hue based visualization](https://cloud.githubusercontent.com/assets/270431/22879436/453b8cc6-f1de-11e6-89fd-1a009e485025.png)

Visualization, based on red channel intensity (y axis) values of each color. (x axis: index position in array)
![red channel based visualization](https://cloud.githubusercontent.com/assets/270431/22879440/49123606-f1de-11e6-9433-66659107ce21.png)

## Pseudo code
Simple intro to represent data visually in a 2D space. Each data point has a color, its position 
is defined on its properties along the different axes. Pseudo code for this example is:

- create some data points, assign random colors to them (data generation / collection)
- store these colors in an array (data cleaning / preprocessing) 
- iterate through all elements in this array (mining) 
- get info (hue / brightness / channel) for each color (feature extraction)
- rescale extracted values to coordinate system (mapping) 
- display color in our 2D space (representing)


