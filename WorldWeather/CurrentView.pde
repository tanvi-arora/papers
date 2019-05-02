/****************************************************
* This View class extends PApplet and presents the 
* visualization for the current weather. 
****************************************************/

class CurrentView extends PApplet {
  ControlP5 cp5;
  private static final int VIEW_WIDTH = 700;
  private static final int VIEW_HEIGHT = 500;
  static final int FORECAST = 1;
  static final int SUN_MOON = 2;
  static final int TIME_SERIES = 3;
  
  private Current u;
  private Controller _controller;
  private boolean showData;
  private Icon i;
  private Boolean forecastFlag;
  
   
  public CurrentView(Controller _control)
  {
      _controller = _control;
      setShowData(false);
      setForecastFlag(false);
  }
  
    public Boolean getShowData(){
     return this.showData; 
    }
    
    public void setShowData(Boolean sd){
       this.showData=sd; 
       println("CurrentView showData set to "+sd);
    }
    
    public void setForecastFlag(Boolean f){
     forecastFlag=f; 
    }
    
      public Boolean getForecastFlag(){
       return forecastFlag; 
    }
// sets up initial view with Buttons to access other views  
    public void setup(){
       cp5 = new ControlP5(this);
       i = new Icon();
  
     cp5.addButton("Forecast")
       .setValue(10)
       .setPosition(VIEW_WIDTH/2,VIEW_HEIGHT/5+140)
       .setSize(100,40)
       .setId(1);
       
      cp5.addButton("Sun and Moon")
       .setValue(10)
       .setPosition(VIEW_WIDTH/2,VIEW_HEIGHT/5+230)
       .setSize(100,40)
       .setId(2);
       
      cp5.addButton("Time Series")
       .setValue(10)
       .setPosition(VIEW_WIDTH/2,VIEW_HEIGHT/5+320)
       .setSize(100,40)
       .setId(3);
       
       font = createFont("Tahoma Bold", 18);
       textFont(font);
    }
  
    public void settings()
    {
        this.size(VIEW_WIDTH, VIEW_HEIGHT);
        setShowData(false);
    }
  
  public void draw()
  {
    
    this.background(#EAFCC9);
    if ( getShowData() ){
      fill(0);
      textSize(30);              
      text("Currently at",VIEW_WIDTH/10,VIEW_HEIGHT/5-40);
      text(u.getCity().getName()+", "+u.getCity().getCountry(),VIEW_WIDTH/10,VIEW_HEIGHT/5);
      textSize(50);
      text(round(u.getTemp())+" °F",VIEW_WIDTH/10,VIEW_HEIGHT/5+50);
      textSize(40);
      text(u.getSummary(),VIEW_WIDTH/10,VIEW_HEIGHT/5+100);
      textSize(20);
      text("Probability of rain:  "+round(u.getPrecip())+"%",VIEW_WIDTH/10,VIEW_HEIGHT/5+140);
      text("Feels like:  "+u.getFeels()+" °F",VIEW_WIDTH/10,VIEW_HEIGHT/5+170);
      text("Humidity:  "+round(u.getHumidity())+"%",VIEW_WIDTH/10,VIEW_HEIGHT/5+200);
      text("Pressure:  "+u.getPressure(),VIEW_WIDTH/10,VIEW_HEIGHT/5+230);
      text("Dew Point:  "+u.getDewPoint(),VIEW_WIDTH/10,VIEW_HEIGHT/5+260);
      text("UVIndex:  "+u.getUV(),VIEW_WIDTH/10,VIEW_HEIGHT/5+290);
      text("Visibility:  "+u.getVis(),VIEW_WIDTH/10,VIEW_HEIGHT/5+320);
      text("Ozone:  "+u.getOzone(),VIEW_WIDTH/10,VIEW_HEIGHT/5+350);
      this.image(i.getIcon(u.getIcon()), VIEW_WIDTH/3,VIEW_HEIGHT/5);
    }
  //  _controller.showForecastVw(getForecastFlag());
    
 }
    
  public void setCurrentData(Current _c)
  {
    u=_c;
    println("calling from CurrentView setCurrentData");
    setShowData(true);
   }
  
  void controlEvent(ControlEvent theEvent) {
       println("got a control event from controller with id "+theEvent.getController().getId());
    
      if (theEvent.isFrom(cp5.getController("Forecast"))) {
        println("this event was triggered by Controller Forecast");
      }
    
      switch(theEvent.getController().getId()){
        case 1:
         _controller.showForeCast(true);
         break;
        case 2:
          _controller.showSunMoon(true);
          break;
        case 3:
          _controller.showTimeSeries(true);
          break;
        }
    
    
  }
  

}
