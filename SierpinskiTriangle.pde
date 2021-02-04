private int brightness = 50;
private float base = 25;
public void setup()
{
  size(600, 600);
  noFill();
}
public void draw()
{
  //580
  background(brightness, brightness, brightness, 80);
  sierpinski(10, 550, 580);
}
public void mouseMoved()//optional
{
  if(mouseY > 0 && mouseY < 600) {
    base = (mouseY / 2) + 15;
  }
}
public void keyPressed() {
  if(keyCode == DOWN) {
    brightness -= 5;
  }
  if(keyCode == UP && brightness <= 100) {
    brightness += 5;  
  }
}
public void sierpinski(float x, float y, float len) 
{
  stroke((int)((Math.random() * 126) + 100), (int)((Math.random() * 126) + 100), (int)((Math.random() * 126) + 100));
  if(len <= base) {
    triangle((float)x, (float)y, (float)(x + len), (float)y, (float)(x + len/2), (float)(y) - (float)(Math.sqrt(0.75) * len));
  } else {
    sierpinski(x, y, len/2);
    sierpinski(x + len/2, y, len/2);
    sierpinski(x + len/4, y - (float)(Math.sqrt(0.75) * (len/2)), len/2);
  }
}
