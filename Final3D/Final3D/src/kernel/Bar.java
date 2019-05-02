/*********************************8
 * Bar.java extends abstract class
 * and contains method to create
 * bar (box) 
 */

package kernel;

import processing.core.*;

class Bar extends Renderable
{   
  public Bar(PApplet _p)
  {
    super(_p);
  }
  
  public void render(float h)
  {    
    p.box(20, h, 20);
  }
}
