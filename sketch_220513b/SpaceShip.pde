public class SpaceShip {


  private float x = 0;
  private float y = 0;
  private float w = 0;

  public SpaceShip(int x, int y, int w) {

    this.x = x;
    this.y = y;
    this.w = w;
  }


  float getX() {
    return x;
  }

  float getY() {
    return y;
  }

  float getW() {
    return w;
  }
  
  void desenhaNave(float x, float y, float w) {
    fill(50);
    noStroke();
    ellipse(x, y, w, w/3);
    ellipse(x, y-w/8, w/3, w/3);

    float diam = w * 0.125;
    for (float windowX = x-diam*2; windowX <= x+diam*2; windowX += diam*2) {
      fill(255);
      ellipse(windowX, y, diam, diam);
    }
  }
}
