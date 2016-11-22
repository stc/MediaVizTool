# MediaVizTool
Visualizing image sequences from different viewpoints
Compatibility: Processing 3+

## Dependencies
OpenCV
Video Library

## How to
Add dependencies: open the sketch. Click tools/add tool, go to libraries tab. Find Video (by the official Processing Foundation), select install. Find OpenCV for Processing, select install.

Run sketch: place a video in the data folder, rename the filename in MediaVizTool.pde, line 26

Keys:

P: playback movie
R: record dataset from your movie
1: time sequence visualization
2: brightness based visualization
3: movement intensity based visualization (based on optical flow)

## Examples

Visualization, based on brightness value of each image in the sequence:
![brightness based visualization](https://cloud.githubusercontent.com/assets/270431/20515184/ad0bef60-b090-11e6-89a1-1ea950fea809.jpg)

Visualization, based on movement value between each corresponding image in the sequence:
![movement based visualization](https://cloud.githubusercontent.com/assets/270431/20515185/af94f344-b090-11e6-9539-85d046081f90.jpg)
