/****************************************************
* Submitted by : 
*                Arora, Tanvi
*                Luzardo , Melissa
*  HW - 7 : OOPS-Game
*  As part of this assignment we created a small game
*  a rocket object destroys spaceship objects.
* 
*  Created date : 02/24/2019
****************************************************/

ArrayList<SpaceShip> SpaceShips;
Rocket rocket;
PImage space;
boolean clash=false;
PFont Font1;

void setup()
{
  size(1200, 1000);
  Font1 = createFont("Eras Bold ITC", 30);
  
  // create an array of spaceships
   SpaceShips = new ArrayList<SpaceShip>();
   
  // add spaceships objects, each object created based on the color of the spaceship 
   SpaceShip myFirstSpaceShip = new SpaceShip("red");
   SpaceShips.add(myFirstSpaceShip);
   
   SpaceShip mySecondSpaceShip = new SpaceShip("green");
   SpaceShips.add(mySecondSpaceShip);
   
   SpaceShip myThirdSpaceShip = new SpaceShip("blue");
   SpaceShips.add(myThirdSpaceShip);
   
    SpaceShip myFourthSpaceShip = new SpaceShip("green");
   SpaceShips.add(myFourthSpaceShip);
   
   SpaceShip myFifthSpaceShip = new SpaceShip("red");
   SpaceShips.add(myFifthSpaceShip);
   
  // each game has a rocket object
   rocket = new Rocket();
}

void draw() 
{
// create background 
  space= loadImage("space.jpg");
  image(space, 0, 0);
  
 // spaceships and rocket to be shown only if the rocket is not hit 
  if (!rocket.getHit()){
 
// till the game is on, draw rocket and all spaceships on its current position,
// spaceships move back to start position if reach the top border or get hit
    rocket.drawRocket();
    
    for(SpaceShip s : SpaceShips)
    {
      PVector currentPosition = s.getPosition();
      if(currentPosition.y < 0 ) 
      {
        s.resetShip(s.getType());
      }
      s.moveSpaceShip();
      s.drawSpaceShip();  
      
    }
  }
  
// check if any spaceship has hit the rocket. if yes, then game over  
// spaceship hits rocket if, distance between the 2 is less than sum of 1/4 of their image
   for(SpaceShip s : SpaceShips)
   {
       if ( (abs( s.getPosition().x - rocket.getPosition().x ) <=  (rocket.getRocketImage().width/4+s.getSpaceShipImage().width/4) ) &&  ( abs(s.getPosition().y - rocket.getPosition().y) <= (rocket.getRocketImage().height/4 +s.getSpaceShipImage().height/4) )  ) {
                rocket.setHit(true);
       }
   }
  
//Score board
  noFill();
  stroke(255);
  strokeWeight(8);
  textFont(Font1);
  text("Score", 9*width/10+5, height/20-10);
  text(rocket.score, 9*width/10+5, 2*height/20-10);
  rect(9*width/10, 0, width/10, height/10);
  rect(9*width/10, height/20, width/10, height/20);

// call rocket hit function to create the bang and show Game over
// will work only if the rockethit value is set to true
  rocket.hit();
}

void keyPressed()
{ 
  if(keyCode == UP)
  {
  rocket.moveUp();
  }
  else if(keyCode == DOWN)
  {
  rocket.moveDown();
  }
  else if(keyCode == LEFT)
  {
  rocket.moveLeft();
  }
  else if(keyCode == RIGHT)
  {
  rocket.moveRight();
  }
  else if(keyCode == ' ')
  {
 // rocket sends out a laser light to kill a ship
 // if laser hits spaceship, kill spaceship and add score per the color of the ship
    SpaceShip clashship = new SpaceShip();
   
   for(SpaceShip s : SpaceShips)
   {
// for each spaceship check the nearest spaceship, if none on the way, then light hits the left border
//  rocket shoots only in 1 direction
//  hit surface of the spaceship is 1/4 of its height above to below centre point
      if(  (rocket.getPosition().y > (s.getPosition().y -(s.getSpaceShipImage().height/4))) && (rocket.getPosition().y < (s.getPosition().y+(s.getSpaceShipImage().height/4)))  && (s.getPosition().x < rocket.getPosition().x) )
      {
         rocket.setClashPoint(s.getPosition());
         s.setClashed(true);
         rocket.setScore(s.getPoints(s.getType()));
         clashship = s;
         clash = true;
         break;
      }
   }
 // rocket fires light and then only nearest spaceship is hit. hence a new clashship object is created
   rocket.Fire();
   if(clash==true)
   {
     clashship.clash();
     clashship = new SpaceShip();
     clash=false;
   }    
      
}
}
