/*********************************************************************************************************
*  class : SpaceShip
*  attributes :
*               i) spaceShipImage : image of spaceship, based on type
*               ii) type : 3 types - red(slow), green(average) , blue (fast)
*               iii) position :  current position of spaceship, 
                                 randomly placed on horizontal axis leaving a border of 1/10th on both sides
                                 starts at bottom of screen and moves up
*               iv) velocity : velocity based on type
*               v) clashed : if spaceship is hit by rocket beam
*
*  methods :
*               i) getter-setter methods
*               ii) resetShip - reset ship to bottom of screen
*               iii) drawSpaceShip - draw spaceship at its current position
*               iv) clash - if spaceship is hit by rocket beam
*               v) clearColor - remove white background of image
************************************************************************************************************/
  class SpaceShip
{
  private PImage spaceShipImage;
  private String type;
  private PVector position;
  private float velocity;
  private boolean clashed;
 
  
// constructor 1 , randomly create any of the 3 type of spaceship.
// can be used if game is improvised to add more spaceships
  public SpaceShip()
  {
    setPosition(new PVector(random(.1*width,.9*width), .9*height));
    int typev=(int)random(0,2);
    switch(typev) {
      case 0:
        setType("red");
        setVelocity(getVelocity("red"));
        break;
       case 1:
         setType("green");
         setVelocity(getVelocity("green"));
         break;
       case 2:
         setType("blue");
         setVelocity(getVelocity("blue"));
         break;
    }
    setSpaceShipImage(getType());
    setClashed(false);
    
  }
 
 // constructor 2 , based on user's choice of spaceship type 
  public SpaceShip(String t){
    setPosition(new PVector(random(width*0.1,width*0.9), height));
    setType(t);
    setVelocity(getVelocity(getType()));
    setSpaceShipImage(getType());
    setClashed(false);
    
  }

  // getter-setter methods

// set image based on type of spaceship
  void setSpaceShipImage(String t){
    int s=0;
    switch(t){
     case "red":
       spaceShipImage=clearColor(loadImage("red.png"),#ffffff);
       break;
     case "green":
       spaceShipImage=clearColor(loadImage("green.png"),#ffffff);
       break;
     case "blue":
      spaceShipImage=clearColor(loadImage("blue.png"),#ffffff);
       break;
    }
 }
 
 public PImage getSpaceShipImage(){
    return  spaceShipImage;
 }
   
  public String getType(){
     return this.type; 
  }
  
  public void  setType(String t){
     type = t; 
  }
  
// default points awarded if hit based on type of spaceship  
  public int getPoints(String t){
    int s=0;
    switch(t){
     case "red":
       s= 10;
       break;
     case "green":
       s= 50;
       break;
     case "blue":
       s= 100;
       break;
    }
    return s;
  } 
 
 // set velocity of spaceship based on type 
  public float getVelocity(String t){
    float v = 0.0;
    switch(t){
     case "red":
       v= -5.0;
       break;
     case "green":
       v= -10.0;
       break;
     case "blue":
       v= -15.0;
       break;
    }
    return v;
  }
  

  public float getVelocity()
  {
    return velocity ;
  }

// set velocity of spaceship based on user choice
// to be used in more advanced version of game
   public void setVelocity(float newVel)
  {
    velocity = newVel;
  }
   
   public void setPosition(PVector newPosition)
  {
    position = newPosition;
  }
  
  public PVector getPosition()
  {
    return this.position;
  }
  
  public boolean getClashed(){
   return this.clashed; 
  }
  
  public void setClashed(boolean c){
    clashed = c; 
  }
  

// other methods
  
// reset spaceship if either hit or reaches top of screen without being hit    
  void resetShip(String t){
    setPosition(new PVector(random(width*0.1,width*0.9), height+spaceShipImage.height/2));
    setVelocity(getVelocity(t));
    setClashed(false);
  }

// draw spaceship at its current position
    public void drawSpaceShip()
  {
    pushMatrix();
      translate(position.x, position.y);
      image(spaceShipImage, -spaceShipImage.width/2, -spaceShipImage.height/2);
    popMatrix();
  }
  
   public void moveSpaceShip()
  {
    PVector p = getPosition();
    setPosition(new PVector(p.x , p.y+getVelocity()));
  }

// when rocket beam hits spaceship, create a star bang and then reset spaceship to new starting point
  public void clash () {
   float radius;
   float diameter;
   int npoints;
   
     if( getClashed()==true)
     {
        setVelocity(0);
        strokeWeight(2);
        stroke(255, 245, 216);
        fill(255, 245, 216);
        diameter = random(2, 10);
        radius = random(0, 50);
        npoints = int(diameter);
        float angle = TWO_PI / npoints;
        float halfAngle = angle/2.0;
        beginShape();
          for (float a = 0; a < TWO_PI; a += angle)
          {
            float sx = position.x + cos(a) * radius;
            float sy = position.y + sin(a) * radius;
            vertex(sx, sy);
            sx = position.x + cos(a+halfAngle) * diameter;
            sy = position.y + sin(a+halfAngle) * diameter;
            vertex(sx, sy);
          }
        endShape(CLOSE);
        
        resetShip(getType());
     }
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



}
