
import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer player;

public float hueDelta = 0;
public boolean Play = true;

void setup() {
  size(1200, 800, P3D);
  println(hueDelta);
  /*
  minim = new Minim(this);
  player = minim.loadFile("yyy.mp3");
  if (Play) {
    player.play();
  }  
  println(player.bufferSize());*/
}

void draw() {
  colorMode(HSB, 360, 100, 100);
  background(color(0, 10, 10));

  /*
  if (Play) {
  player.play();
  hueDelta += 0.8;
  if(hueDelta >= 360) {
    hueDelta = 0;
  }
  
  float r = 300;
  float rMax = 0;
  for(int i = 0; i < player.bufferSize() - 1; i++) {   
    noFill();
    strokeWeight(2);
    stroke(color(abs(hueDelta + 360*player.right.get(i) - 360), 90, 90));
    //stroke(color(3600*player.right.get(i) - abs(ceil(3600*player.right.get(i))/360)*360, 90, 90));
    ellipse(width/2, height/2, r + player.right.get(i)*i*r*3/player.bufferSize(), r + player.right.get(i)*i*r*3/player.bufferSize());
    if (rMax < r + player.right.get(i)*i*r*3/player.bufferSize()) {
      rMax = r + player.right.get(i)*i*r*3/player.bufferSize();
    }
  }
  
  translate(width/2, height/2);  
  for(int i = 0; i < player.bufferSize() - 1; i += 3) {
    float x1 = (rMax/2  + player.left.get(i)*100)*cos(i*2*PI/player.bufferSize());
    float y1 = (rMax/2  + player.left.get(i)*100)*sin(i*2*PI/player.bufferSize());
    float x2 = (rMax/2 + player.left.get(i)*400)*cos(i*2*PI/player.bufferSize());
    float y2 = (rMax/2 + player.left.get(i)*400)*sin(i*2*PI/player.bufferSize());
    strokeWeight(2);
    stroke(color(abs(hueDelta + 360*player.right.get(i) - 360), 90, 90));
    line(x1, y1, x2, y2);
    float x0 = (rMax/2 + player.left.get(i)*350)*cos(i*2*PI/player.bufferSize());
    float y0 = (rMax/2 + player.left.get(i)*350)*sin(i*2*PI/player.bufferSize());
    strokeWeight(4);
    point(x0, y0);
  }
  }*/
}

/*
void draw()
{
  background(0);
  stroke(255);
  
  // perform a forward FFT on the samples in jingle's mix buffer,
  // which contains the mix of both the left and right channels of the file
  fft.forward( player.mix );
  rotateY(PI/9.0);
  for(int i = 0; i < fft.specSize(); i++)
  {
    // draw the line for frequency band i, scaling it up a bit so we can see it
    line( i, height, i, height - fft.getBand(i)*8 );
  }
}
*/
/*
void draw()
{ 
  float t = map(mouseX, 0, width, 0, 1);
  beat.detect(player.mix);
  fill(#1A1F18, 20);
  noStroke();
  rect(0, 0, width, height);
  translate(width/2, height/2);
  noFill();
  fill(-1, 10);
  if (beat.isOnset()) rad = rad*0.9;
  else rad = 70;
  ellipse(0, 0, 2*rad, 2*rad);
  stroke(-1, 50);
  int bsize = player.bufferSize();
  for (int i = 0; i < bsize - 1; i+=5)
  {
    float x = (r)*cos(i*2*PI/bsize);
    float y = (r)*sin(i*2*PI/bsize);
    float x2 = (r + player.left.get(i)*100)*cos(i*2*PI/bsize);
    float y2 = (r + player.left.get(i)*100)*sin(i*2*PI/bsize);
    line(x, y, x2, y2);
  }
  beginShape();
  noFill();
  stroke(-1, 50);
  for (int i = 0; i < bsize; i+=30)
  {
    float x2 = (r + player.left.get(i)*100)*cos(i*2*PI/bsize);
    float y2 = (r + player.left.get(i)*100)*sin(i*2*PI/bsize);
    vertex(x2, y2);
    pushStyle();
    stroke(-1);
    strokeWeight(2);
    point(x2, y2);
    popStyle();
  }
  endShape();
}

void stop() {
  player.close();
  minim.stop();
  super.stop();
}
*/

void keyPressed() {
  if (key == ' ') {
    if (Play == true) {
      Play = false;
      player.pause();
    } else {
      Play = true;
    }    
  }
}

