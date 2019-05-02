/********************************************************************
 * This is final assignment of 3D visualization
 * Happiness Score 2018 is accessed from 
 * https://worldhappiness.report/ed/2018/
 * It has data for happiness score of 2018 along with 
 * 7 dimensions that make up the score. 3D bars are created 
 * for each country based on the value of these 7 dimensions
 * Worldmap is displayed in 2D and a 3D view is created .
 * lat-lon file is referred for each country with its center
 * Use space bar ' ' to rotate the view. Press again to stop rotating
 * Use Up key to get the view closer.Keeps coming closer until pressed again
 * Use Down key to draw the view away .Keeps going away until pressed again
 * further away
 * Submitted by : 
 * 				Arora Tanvi
 * 				Luzardo Melissa
 *************************************************************************/

package kernel;
// import required packages
import processing.core.*; 

import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap;
import java.awt.Color;
import java.util.ArrayList; 
import java.applet.Applet;
import java.awt.Graphics;


import java.awt.Graphics2D;
import java.awt.Rectangle;
import java.awt.geom.Line2D;
import javax.swing.JComponent;

public class Final extends PApplet {

PImage worldMap;
ArrayList<Renderable> renderables;
ArrayList<Happy> _happy;
boolean lightsOn;
Converter converter;
Model m;
Color[] legend;
boolean doRotate = false;
boolean zoomIn = false;
boolean zoomOut = false;
float cameraangleZ = 0;
float rotation=0;
float orbitRadius;
float ypos,xpos,zpos;
float angle;

/* Initial set up
 * Load Happy.csv file to load Happiness score 2018
 * define initial 3D angle of view
 */
public void settings()
{
  size(1300, 700, P3D);
  renderables = new ArrayList<Renderable>();
  renderables.add(new Bar(this));
  lightsOn = true;
  worldMap = loadImage("data/world-map.jpg");
  converter = new Converter(worldMap.width, worldMap.height, this);
  m = new Model(worldMap,this);
  _happy = new ArrayList<Happy>();
  _happy = (ArrayList<Happy>)m.getHappy();
 
  for(Happy h : _happy){
  	println(h.getCountry()+ " " + h.getPosX() + " " + h.getPosY());
  
  }
	angle = 90;
  	ypos = -3*height ;
	zpos= width ;
	xpos = (width) * (cos(angle * PI /180 )); 
	 angle=0;
	
}

public void draw()
{
	background(0);
	//drawAxes(100);
	  rotateX(PI/2);
	  rotateZ(angle);
	  // set world map bakground
	  image(worldMap, -worldMap.width/2, -worldMap.height/2);
	  textSize(200);
	  // set title
	  text("2018 Happiness Index around the world",-worldMap.width/2-50,-worldMap.height/2-50);
	  textSize(40);
	  // display legend
	  text("Happiness - GDP per Capita", -worldMap.width/4+20, worldMap.height/2+50);
	  text("Happiness - Social Support", -worldMap.width/4+20, worldMap.height/2+50*2);
	  text("Happiness - Healthy Life Expectancy",-worldMap.width/4+20, worldMap.height/2+50*3);
	  text("Happiness - Freedom to Make Life Choices",-worldMap.width/4+20, worldMap.height/2+50*4);
	  text("Happiness - Generosity", +20, worldMap.height/2+50);
	  text("Happiness - Perceptions of Corruption", +20, worldMap.height/2+50*2);
	  text("Happiness - Dystopia", 20, worldMap.height/2+50*3);
	  setLegend();
 for (int i=0;i<4;i++)
	    {
	      noStroke();
	      fill(legend[i].getRGB());
	 	  rect(-worldMap.width/4-25, worldMap.height/2+20+50*i, 30, 30);
	    }
 for (int i=4;i<7;i++)
 {
   noStroke();
   fill(legend[i].getRGB());
	  rect(-25, worldMap.height/2+20+50*(i-4), 30, 30);
	  fill(legend[i].getRGB());
 }
 // set up camera position
	  beginCamera();
		   camera(xpos, ypos, zpos,  0, 0, 0, 0, 1, 0);
	 endCamera();
		   
		    if(lightsOn)
		    {
		     lights();   
		    }
	// Renderable object has data for all countries happiness score	   		     
		    for(Renderable r : renderables) // the draw functions needs lat, cumulative value, lon, value) we need to add loop for
		  	  							 // all countries to draw. There are 7 draws with 7 colors for all the variables					
		    {   	
		  	  pushMatrix();	  
		    	rotateY(-angle);
		        translate( -worldMap.width/2, 0,-worldMap.height/2);
		    
		  	  for (Happy h : _happy)
		  	  {
		  		noStroke();
		  		 fill(255,128,0); //orange
		  		r.draw(h.getPosX()-10,40*(h.getExp_GDP_per_capita())/2, h.getPosY()-10, 40*(h.getExp_GDP_per_capita())); 
		  		 fill(255,128,0); //orange
		  		fill(0,255,0); //green
	            r.draw(h.getPosX()-10,40*(h.getExp_GDP_per_capita()+ h.getExp_Social_support()/2), h.getPosY()-10, 40*(h.getExp_Social_support())); 
	            fill(0,255,0); //green
	            fill(255,0,255); //pink
		        r.draw(h.getPosX()-10,40*(h.getExp_GDP_per_capita()+ h.getExp_Social_support() +h.getExp_Healthy_life_expectancy() /2), h.getPosY()-10, 40* (h.getExp_Healthy_life_expectancy())); 
		        fill(255,0,255); //pink
		        fill(0,0,255); //blue
			    r.draw(h.getPosX()-10,40*(h.getExp_GDP_per_capita()+ h.getExp_Social_support() +h.getExp_Healthy_life_expectancy() + h.getExp_Freedom_life_choices()/2), h.getPosY()-10, 40* (h.getExp_Freedom_life_choices()));
			    fill(0,0,255); //blue
			    fill(255,0,0);	//red	
			    r.draw(h.getPosX()-10,40*(h.getExp_GDP_per_capita()+ h.getExp_Social_support() +h.getExp_Healthy_life_expectancy() + h.getExp_Freedom_life_choices()+ h.getExp_Generosity() /2), h.getPosY()-10, 40* (h.getExp_Generosity()));
			    fill(255,0,0);	//red	
			    fill(255,255,0); //yellow
			    r.draw(h.getPosX()-10,40*(h.getExp_GDP_per_capita()+ h.getExp_Social_support() +h.getExp_Healthy_life_expectancy() + h.getExp_Freedom_life_choices()+ h.getExp_Generosity() + h.getExp_Perceptions_of_corruption()/2), h.getPosY()-10, 40* (h.getExp_Perceptions_of_corruption()));
			    fill(255,255,0); //yellow
			    fill(0,255,255); //teal
		        r.draw(h.getPosX()-10,40*(h.getExp_GDP_per_capita()+ h.getExp_Social_support() +h.getExp_Healthy_life_expectancy() + h.getExp_Freedom_life_choices()+ h.getExp_Generosity() + h.getExp_Perceptions_of_corruption() +h.getDystopia_residual()/2), h.getPosY()-10, 40* (h.getDystopia_residual()));
		        fill(0,255,255); //teal		
		        fill(255,128,0); //orange
		  	  }
		  		 popMatrix();
		      }
// If option to rotate then change angle of camera 	using SPACE BAR key	    
			 if(doRotate)
			 {
				   	angle += PI/360;				
			 }

// set ypos when selected to zoom in and zoom out using UP and DOWN keys
			 if(zoomIn)					 
			 {
				  if (ypos<-width/2) {
					  ypos+=10;					 
				  }
				  if(ypos== -width/2) {
					  zoomIn=false;
				  }
			 }	
			 if(zoomOut)					 
			 {
				  if (ypos>-3*height) {
					  ypos-=10;
									  }	  
				  if(ypos== -3*height) {
					  zoomOut=false;
				  }
			 }	
		  }

public void keyPressed()
{
	if(keyCode == ' ') {
	doRotate = !doRotate;
	}
	if(keyCode == UP) {
		zoomIn = !zoomIn;
	}
	if(keyCode == DOWN) {
		zoomOut = !zoomOut;
	}
}



  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "kernel.Final" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
  
 /* void drawAxes(float size){
	  //X  - red
	  stroke(192,0,0);
	  line(0,0,0,size,0,0);
	  //Y - green
	  stroke(0,192,0);
	  line(0,0,0,0,size,0);
	  //Z - blue 
	  stroke(0,0,192);
	  line(0,0,0,0,0,size);
	}
  */
  // set legend colors
  public void setLegend(){
  legend= new Color[7];
  legend[0] = new Color(255,128,0);  //orange
  legend[1] =  new Color(0,255,0);  //green
  legend[2] =  new Color(255,0,255);  //pink
  legend[3] =  new Color(0,0,255);   //blue
  legend[4] =  new Color(255,0,0);  //red
  legend[5] =  new  Color(255,255,0); //yellow
  legend[6] =  new Color(0,255,255);  //teal
  }
}
