/****************************************************
* Submitted by : 
*                Arora, Tanvi
*                Luzardo , Melissa
*  Midterm : Weather visualizations
*  As part of this assignment we created different interactive
*  weather visualization after fetching data from API's
*  available from https://darksky.net
*
*  Created date : 03/11/2019
*  WorldWeather --> Controller --> Model
*  CurrentView --> Forecast --> ( Temp , Rain , Humidity )
*  CurrentView --> Sun and Moon --> ( Sun , Moon )
*  CurrentView --> Time Series  ( click , mousescroll , backspace )
****************************************************/


/****************************************************
* Loading required java utilities
****************************************************/
import java.util.Map;
import java.util.Date;
import controlP5.*;
import java.time.ZonedDateTime;
import java.util.Calendar;
import java.util.List;
import java.util.GregorianCalendar;
import java.text.SimpleDateFormat;


/****************************************************
* Setting up main view with world map and public 
* variables. From main view all the visualization will
* be called. User can select a place in the map and the
* weather with related information will be visualy available
****************************************************/


 public class DailySt
  {
     JSONObject daily;
     City city;
     String timezone;
     int offset;
  }

Controller control;
PImage worldMap;
Converter converter;
int[] minMaxOrigins;
Date d = new Date();
long now = d.getTime();
PFont font;


/****************************************************
* Setting and setup contain map image, display size and
* calls to categories to convert from pixels to map
* latitud and longitud to help with other calculations
* and programing functions. Also calls to the main program
* controller and font selection and loading
****************************************************/

void settings()
{
  worldMap = loadImage("world_map.jpg");
  size(worldMap.width, worldMap.height);
  converter = new Converter(worldMap.width, worldMap.height);
}

void setup()
{
  surface.setTitle("WorldWeather");
  control = new Controller(this);
  font = createFont("Tahoma Bold", 18);
}

/****************************************************
* Actual view drawing instruction. The world map and 
* an instruction legend is drawn.
****************************************************/

void draw()
{
  image(worldMap, 0, 0);
  noStroke();
  fill(#D1FFDF);
  rect(width/10,height*4/5, width*7/10,50,7);
  textSize(30);
  fill(0);
  text("Please click on map for weather and related information",width/10+10,height*4/5+40);
}


/****************************************************
* Mouse click action is program to obtain the latitud
* longitud information from the map and perform programing
* calculations to obtain weather and weather related information
* from that location. This information is taken to the 
* controller and to the covnvert funtions.
****************************************************/

void mouseClicked()
{
  PVector latlon = new PVector();

  latlon = converter.convert2latlon(mouseX,mouseY);
  control.updateData(latlon);
}
