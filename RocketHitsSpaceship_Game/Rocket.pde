/********************************************************************************************
*  class : Rocket
*  attributes :
*               i) position - PVector holding current position of rocket.
*                            initialized to central height near the right border
*               ii) rocketImage - holds image of rocket. white background is made transparent
*               iii) score - score based on spaceships hit. initialized to 0
*               iv) clashPoint - position of the nearest spaceship
*               v) hit - boolean value holding if a spaceship collided with the rocket
                         initialized to false
*               vi) hitsecs - once the rocket is hit, raise to 5 before popping up GAME OVER
* methods :
*               i) getter-setter methods for all above attributes
*               ii) drawRocket - drawRocket at its current position
*               iii) Fire - throw a laserbeam to  nearest spaceship on same vertical axis/left border whichever is near
*               iv) moveUp, moveDown , moveLeft , moveRight - keyboard action methods
*               v) clearColor - image processing method, to clear white background of rocket
*               vi) hit - when spaceship collides into rocket
*********************************************************************************************/

class Rocket{
  private PVector position;
  private PImage rocketImage;
  private int score;
  private PVector clashPoint;
  private boolean hit;
  private int hitsecs;
  
  // constructor
  public Rocket()
  {
    position = new PVector(width*0.8, height/2);
    rocketImage= clearColor(loadImage("Rocket1.png"),#ffffff);
    setClashPoint(new PVector(0,getPosition().y)); 
    setScore(0);
    setHit(false);
  }
  
  // getter-setter methods
  public PImage getRocketImage(){
     return rocketImage; 
  }
  public PVector getPosition(){
     return this.position; 
  }
  
    public void setPosition(PVector pos){
    position = pos; 
  }
  
  public void setClashPoint(PVector pos){
    clashPoint = pos; 
  }
  
  public PVector getClashPoint(){
    return clashPoint;
  }
  
  public int getScore(){
    return score; 
  }
   
   public void setScore(int s){
     score = score+ s;
   }
   
  public boolean getHit(){
   return this.hit; 
  }
  
  public void setHit(boolean h){
    hit = h; 
  }
   
   public int getHitSecs(){
    return hitsecs; 
   }
   
   public void setHitSecs(){
    hitsecs++; 
   }
    
// draws rocket at its current position    
  public void drawRocket()
  {
    pushMatrix();
      translate(getPosition().x, getPosition().y);
      image(rocketImage, 0, -rocketImage.height/2);
    popMatrix();
  }

// throw a laserbeam to  nearest spaceship on same vertical axis or left border whichever is near
  public void Fire() {
      strokeWeight(5);
      stroke(255, 245, 216, random(100, 255));
        line(getPosition().x,getPosition().y, getClashPoint().x, getClashPoint().y);
     setClashPoint(new PVector(0,getPosition().y)); 
  }

// keyboard action methods
    public void moveUp()
    {
      position.y -= 10;
    }
    
    public void moveDown()
    {
      position.y += 10;
    }
    
    public void moveLeft()
    {
      position.x -= 10;
    }
    
    public void moveRight()
    {
      position.x += 10;
    } 
    

  
// remove whitebackground of the image
  PImage clearColor(PImage image, int maskColor) {
    PImage newImage = createImage(image.width, image.height, ARGB);
    image.loadPixels();
    newImage.loadPixels();
    for(int n = 0; n < newImage.pixels.length; n++)
        newImage.pixels[n] = image.pixels[n] == maskColor ? 0x00000000 : image.pixels[n] | 0xff000000;
    newImage.updatePixels();
    return newImage;
  }
  
// when spaceship collides into rocket
// create a bigbang
// display GAMEOVER screen with final score
    public void hit () {
      float diameter;
      float radius;
      float npoints;
      float angle;
      float halfAngle;
      float sx, sy;
      
      if( getHit()){
        image(space, 0, 0);
        strokeWeight(30);
        stroke(255, 133, 3);
        fill(255, 205, 3);
        
        diameter = random(250, 450);
        radius = random(50, 150);
        npoints = int(random(2,10));
        angle = TWO_PI / npoints;
        halfAngle = angle/2.0;
        beginShape();
          for (float a = 0; a < TWO_PI; a += angle)
          {
            sx = width/2 + cos(a) * radius;
            sy = height/2 + sin(a) * radius;
            vertex(sx, sy);
            sx = width/2 + cos(a+halfAngle) * diameter;
            sy = height/2 + sin(a+halfAngle) * diameter;
            vertex(sx, sy);
          }
        endShape(CLOSE);   
       setHitSecs();
       
        if (getHitSecs() > 5) {
          image(space, 0, 0);
          stroke(255);
          fill(255);
          textSize(120);
          text("GAME OVER", width/10, 2*height/10, width, height);
          textSize(100);
          text("Final Score: "+ score , width/10, 4*height/10, width, height);
        }
       }
    }

}
