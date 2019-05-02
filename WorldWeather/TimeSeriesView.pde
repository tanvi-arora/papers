/****************************************************
* This View class extends PApplet and presents visualization 
* for the Historic weather data of a city in a Zoomable-Movable
* format. Clicking the viz zooms it , pressing "Backspace" key 
*  will reverse the zoom effect and by scrolling mouse ,viz
* moves left or right.
* For this assignment, a data for last 450 days was fetched and 
* saved in a file. Based on that data, a line of max to min temperature
* in Fahrenheit for each date and a blue dot for precipitation
* rate for that date is showm. Scales are shown on the borders
****************************************************/
class TimeSeriesView extends PApplet {
    
  private static final int VIEW_WIDTH = 800;
  private static final int VIEW_HEIGHT = 800;
  private static final int TEMP_RANGE = 100;
 
   private boolean showData;
   private Controller _controller;
   private Daily[] annual;
   
   private float ymultiplier;
   private float xmultiplier;
   private float xmagnifier;
   private float sw;
   private String textDisplay;
      
   public class Dates
   {
      String date;
      int daynum;
      String month;
      int year;
   }
   
   private Dates[] dates;
   
  public TimeSeriesView(Controller _control)
  {
    _controller = _control;
    setShowData(false);  
    
  }
  
  public void setShowData(Boolean show){
     showData=show; 
  }
  
    public Boolean getShowData(){
     return showData; 
  }
  
  public void setTimeSeriesData(Daily[] a)
  {
     annual = new Daily[a.length];
     //annual=a;
/* Data fetched is from current date to last 450 days 
*  and to show data in proper scale, it is stored in reverse 
*  order to represent from oldest date to newest( left to right)
*/
     for(int i=1; i< a.length ; i++ ){
        annual[a.length-i] = new Daily();
        annual[a.length-i]=a[i];
     }
     println("TimeSeriesData is setup");
   
// Date array is created to to show dates in horizontal scale  
    //Date newdt = new Date();
    dates = new Dates[a.length];
   
    for (int i=1;i<a.length;i++)
     {
      dates[i] = new Dates();
      dates[i].date=annual[i].getSunriseTime().split(" ")[0];
      String[] _d = dates[i].date.split("/");
      dates[i].daynum=Integer.parseInt(_d[0]);
      switch(Integer.parseInt(_d[1])) {
          case 1:
               dates[i].month="Jan";
               break;
             case 2:
               dates[i].month="feb";
               break;
             case 3:
               dates[i].month="Mar";
               break;
             case 4:
               dates[i].month="Apr";
               break;
             case 5:
               dates[i].month="May";
               break;
             case 6:
               dates[i].month="Jun";
               break;
             case 7:
               dates[i].month="Jul";
               break;
             case 8:
               dates[i].month="Aug";
               break;
             case 9:
               dates[i].month="Sep";
               break;
             case 10:
               dates[i].month="Oct";
               break;
             case 11:
               dates[i].month="Nov";
               break;
             case 12:
               dates[i].month="Dec";
               break;
            }
           
      dates[i].year=Integer.parseInt(_d[2]);
     }  
     println("dates data set up for TimeSeries");
     ymultiplier = (VIEW_HEIGHT*0.75)/TEMP_RANGE;
     xmagnifier = 0;
     xmultiplier=1;
     sw=1;
    // setShowData(false);
  }
  
  public void setup(){
     
     font = createFont("Tahoma Bold", 18);
     textFont(font);
  }
  
  public void settings()
  {
    this.size(VIEW_WIDTH, VIEW_HEIGHT);
  }
  
  public void draw()
  {
    this.background(#ABABAD);
    if(getShowData()){
      
      fill(0);
      // Header showing city and Country names
     // font(
      textSize(30);
        text("Historic weather for "+ annual[1].getCity().getName()+", "+annual[1].getCity().getCountry(), VIEW_WIDTH*.1,VIEW_HEIGHT*.05);
      textSize(20);
      fill(#8E0707);
        text("Min and Max daily Temperatures in °F", VIEW_WIDTH*.1,VIEW_HEIGHT*.05+30);
      fill(0,0,255);
        text("Daily Precipitation Rate in mm/hr", VIEW_WIDTH*.1,VIEW_HEIGHT*.05+60);
      fill(0);
        line(0, VIEW_HEIGHT*(0.8) ,VIEW_WIDTH, VIEW_HEIGHT*0.8);
 
      strokeWeight(sw);
       translate(0, VIEW_HEIGHT*(0.8));
      
       
       
       textSize(10);
       // display line for min to max temperature of the day
       // display horizontal range of dates
       // start of month and start of year will show corresponding month and year respectively
       for(int i=1;i<annual.length;i++){
          fill(#8E0707);
          stroke(#8E0707);
            line( (i*xmultiplier+xmagnifier),-1*ymultiplier*(annual[i].getTemperatureMax()),(i*xmultiplier+xmagnifier),-1*ymultiplier*(annual[i].getTemperatureMin()) );
          fill(0,0,255);
          stroke(0,0,255);
            ellipse( (i*xmultiplier+xmagnifier), -100*ymultiplier*annual[i].getPrecipIntensity()*25.4, sw,sw);
          fill(#8E0707);
          stroke(#8E0707);

         if(dates[i].daynum==1){
           if(dates[i].month.equals("Jan")){
             textSize(20); 
             textDisplay=str(dates[i].year);
             textSize(10);
           }
           else{
             textSize(20); 
             textDisplay=dates[i].month;
             textSize(10);
           }
           }    
          
          else
          {
            textDisplay=String.valueOf(dates[i].daynum);
          }
          pushMatrix();
            fill(0);
            stroke(0);
            // draw a vertical line for each point on horizontal scale
              line((i*xmultiplier+xmagnifier),-5,(i*xmultiplier+xmagnifier),5+(5*(2-(i%2))));
            // for better display print values in 2 rows alternately
            text(textDisplay,(i*xmultiplier+xmagnifier), VIEW_HEIGHT*(0.05*(2-(i%2)))  );
          popMatrix();
        }
       
        stroke(0,0,0);
        textSize(20);
       // draw Temperature scale on left border of screen
        fill(0,0,0);
           for( int m=0;m<10;m++){
             line(0,-10*m*ymultiplier,5,-10*m*ymultiplier);
             text(10*m , 5,-10*m*ymultiplier);
           }
       // draw Precipitation Intensity scale in millimeters on right border of screen
       fill(0,0,255);
           for( int p=0;p<10;p++){
             line(VIEW_WIDTH,-10*p*ymultiplier,VIEW_HEIGHT-5,-10*p*ymultiplier);
             text(0.1*p ,VIEW_WIDTH-40,-10*p*ymultiplier);
           }
       
       translate(0, -VIEW_HEIGHT*(0.8));
           
    }
  }
  
  
void mouseClicked()
{
  xmultiplier*=1.5;
  if (sw < 8) {
    sw*=1.25;
    println("sw : " + sw);
  }
  else
  {
     sw=8; 
  }
}

void keyPressed()
{
    if (keyCode == BACKSPACE){
        xmultiplier/=1.5;
        if (sw > 1.25){
           sw/=1.25; 
           println(" zooming out :"+ sw);
        }
        else
        {
            sw=1.25;
        }
      
     }
 
}


void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  xmagnifier+=(e*10);
}

 
}
