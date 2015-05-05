import ddf.minim.*;

Minim minim;
AudioPlayer player;

public float hueDelta = 0;
public boolean Play = false;

void setup() {
  size(1152, 864, P3D);
  frameRate(30);  
  minim = new Minim(this);
  player = minim.loadFile("youth.mp3");
  if (Play) {
    player.play();
  }  
}

void draw() {
  colorMode(HSB, 360, 100, 100);
  background(color(0, 10, 10));
  
  if (Play) {
    player.play();
    hueDelta += 0.8;
    if(hueDelta >= 360) {
      hueDelta = 0;
    }
    
    float r = 200;
    float rMax = 0;
    for(int i = 0; i < player.bufferSize() - 1; i++) {   
      noFill();
      strokeWeight(0.5);
      stroke(color(abs(hueDelta + 360*player.right.get(i) - 360), 90, 90));
      ellipse(width/2, height/2, r + player.right.get(i)*i*r*2/player.bufferSize(), r + player.right.get(i)*i*r*2/player.bufferSize());
      if (rMax < r + player.right.get(i)*i*r*2/player.bufferSize()) {
        rMax = r + player.right.get(i)*i*r*2/player.bufferSize();
      }
    }
    
    translate(width/2, height/2); 
    for(int i = 0; i < player.bufferSize() - 1; i += 3) {
      float x1 = (rMax/2  + player.left.get(i)*100)*cos(i*2*PI/player.bufferSize());
      float y1 = (rMax/2  + player.left.get(i)*100)*sin(i*2*PI/player.bufferSize());
      float x2 = (rMax/2 + player.left.get(i)*200)*cos(i*2*PI/player.bufferSize());
      float y2 = (rMax/2 + player.left.get(i)*200)*sin(i*2*PI/player.bufferSize());
      strokeWeight(2);
      stroke(color(abs(hueDelta + 360*player.right.get(i) - 360), 90, 90));
      line(x1, y1, x2, y2);
      float x0 = (rMax/2 + player.left.get(i)*180)*cos(i*2*PI/player.bufferSize());
      float y0 = (rMax/2 + player.left.get(i)*180)*sin(i*2*PI/player.bufferSize());
      strokeWeight(4);
      point(x0, y0);
    }
  }
}

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
