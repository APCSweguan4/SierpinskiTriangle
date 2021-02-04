private float triBase = 25;
private float sqrBase = 25;
private boolean tri = true;
private boolean sqr = false;
private int counter = 1;
public void setup()
{
  size(600, 600);
  noFill();
}
public void draw()
{
  background(0);
  if(counter == 1) {
    tri = true;
    sqr = false;
  } else if (counter == 2) {
    tri = false;
    sqr = true;
  }
  if(tri) {
    sierpinski(10, 550, 580);
  } 
  if(sqr) {
    carpet(100, 100, 400);
  }
}
public void mouseMoved()//optional
{
  if(mouseY > 0 && mouseY < 600) {
    triBase = (mouseY / 2) + 15;
    sqrBase = (mouseY / 2) + 15;
  }
}
public void keyPressed() {
  if(keyCode == RIGHT) {
    if(counter < 2) {
      counter++;
    } else {
      counter = 1;  
    }
  }
  if(keyCode == LEFT) {
    if(counter > 1) {
      counter--;
    } else {
      counter = 2;
    }
  }
}
public void sierpinski(float x, float y, float len) 
{
  stroke((int)((Math.random() * 126) + 100), (int)((Math.random() * 126) + 100), (int)((Math.random() * 126) + 100));
  if(len <= triBase) {
    triangle((float)x, (float)y, (float)(x + len), (float)y, (float)(x + len/2), (float)(y) - (float)(Math.sqrt(0.75) * len));
  } else {
    sierpinski(x, y, len/2);
    sierpinski(x + len/2, y, len/2);
    sierpinski(x + len/4, y - (float)(Math.sqrt(0.75) * (len/2)), len/2);
  }
}
public void carpet(float x, float y, float len) {
  stroke((int)((Math.random() * 126) + 100), (int)((Math.random() * 126) + 100), (int)((Math.random() * 126) + 100));
  if (len <= sqrBase) {
    square(x, y, len);
    square(x + len/3, y + len/3, len/3);
  } else {
    carpet(x, y, len/3);
    carpet(x + len/3, y, len/3);
    carpet(x + (len/3) * 2, y, len/3);
    carpet(x, y + len/3, len/3);
    carpet(x, y + (len/3) * 2, len/3);
    carpet(x + (len/3) * 2, y + len/3, len/3);
    carpet(x + (len/3) * 2, y + (len/3) * 2, len/3);
    carpet(x + (len/3), y + (len/3) * 2, len/3);
  }
}
