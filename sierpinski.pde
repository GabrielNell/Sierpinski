int sierpinskiBase;
int numIterations = 1;
public void setup() {
  size(1000, 800);
  frameRate(60);
  fill(255);
  noStroke();
  background(0);
  sierpinskiBase = 700;
  textSize(30);
}

public void draw() {
  background(0);
  for (int i = 0; i < 10; i++) {
    text(i + 1, width * i / 10 + width / 20 - 15, 50);
    text("press space and move mouse to control complexity", 20, height - 20);
    stroke(255);
    line(width * i / 10, 0, width * i / 10, 80);
    noStroke();
  }
  drawTriangle((int)((width - sierpinskiBase)/2 + sierpinskiBase/4), (int)(height / 2), numIterations, numIterations);
}

public void drawTriangle(int x, int y, int time, int iterations) {
  if (time > 0){
    int triDiameter = sierpinskiBase / (int)(Math.pow(2, (iterations - time + 1)));
    triangle(x, y, x + triDiameter, y, x + triDiameter / 2, y + triDiameter * sqrt(3) / 2);
    for (int i = 0; i < 3; i++) {
      drawTriangle(x + (2*i-1) * triDiameter/4, (int)(y + Math.pow(-1, i) * triDiameter * sqrt(3) / 4), time - 1, iterations);
      
    }
  }
}

public void keyPressed() {
  if (keyCode == 32) {
    numIterations = (int)(((float)mouseX / width) * 10) + 1;
  }
}
