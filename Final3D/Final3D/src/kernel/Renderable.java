package kernel;
// import required packages
import processing.core.*;

/* This is abstract class to create objects on the 3D view
*/
abstract class Renderable
{
  private PVector pos;
  private float angle;
  protected PApplet p;
 
  
  public Renderable()
  {
    pos = new PVector(0, 0, 0);
    angle = 0;
  }
  
  public Renderable(PApplet _p)
  {
    p = _p;
    pos = new PVector(0, 0, 0);
    angle = 0;
 
  }
  
  
  public void updateAngle(float newAngle)
  {
    angle = newAngle;
  }
  
  public void updatePosition(PVector newPosition)
  {
    pos = newPosition;
  }
  public PVector getPosition()
  {
    return pos;
  }
  
  public void draw(float x, float y , float z, float h)
  {
	 
    p.pushMatrix();

      p.translate(x , -y , z);
      p.rotateY(angle);
      render(h);
    p.popMatrix();
  
  }
	  
  abstract void render(float h);
  
}
