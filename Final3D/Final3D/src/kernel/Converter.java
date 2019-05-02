/*******************************
 * This converter class converts
 * lat-lon to pixels and vice-versa
 */

package kernel;

import processing.core.*;

class Converter
{
  protected PApplet p;
  private int imageWidth;
  private int imageHeight;
  
  public Converter(int _imageWidth, int _imageHeight)
  {
    imageWidth = _imageWidth;
    imageHeight = _imageHeight;
  }
  
  public Converter(int _imageWidth, int _imageHeight,PApplet _p)
  {
    p = _p;
    imageWidth = _imageWidth;
    imageHeight = _imageHeight;
  }
  public PVector convert2latlon(float x, float y)
  {
    float lat = p.map(y, imageHeight, 0, -70, 100); 
    float lon = p.map(x, 0, imageWidth, -185, 185);
    return new PVector(lat, lon);
   
  }
  
  public PVector convert2Pixels(float lat, float lon)
  {
    float x = p.map(lon, -185, 185, 0, imageWidth);
    float y = p.map(lat, -65, 100, imageHeight, 0);
    return new PVector(x, y);
  }
}
