/****************************************************
* This View class extends PApplet and presents visualization 
* for the Forecast weather as a HEATMAP and cycles with three buttons
* to select either hourly temperature,
* precipitation probability or humidity percentage
* for the upcoming week. 
****************************************************/
class ForecastView extends PApplet {
  ControlP5 cp5;
  private static final int VIEW_WIDTH = 500;
  private static final int VIEW_HEIGHT = 400;
  private Forecast f;
  private boolean showData;
  private color[] legend;
  static final int TEMPERATURE = 1;
  static final int RAIN = 2;
  static final int HUMIDITY = 3;
  private int legendmarker;
  int viewId = TEMPERATURE; 
  private Controller _controller;
 
   
  public ForecastView(Controller _control)
  {
    _controller = _control;
    setShowData(false);  
    setLegend();
  }
  
  public void setLegend(){
    legend=new color[10];
    legend[0] =  color(10,50,255);  // <0 
    legend[1] =  color(19,24,155);  // 5 dark blue
    legend[2] =  color(167,15,170);   // 10 purple
    legend[3] =  color(198,32,85);   // 15 darkpink
    legend[4] =  color(216,13,17);  // 20  dark red
    legend[5] =  color(255,0,0);  // 25 bridght red
    legend[6] =  color(255,74,3);  // 30 dark orange
    legend[7] =  color(255,132,0);   // 35 orange 
    legend[8] =  color(255,188,0);   // 40 light orange
    legend[9] =  color(255,255,0);   // 45+ yellow

  }
  
  public Boolean getShowData(){
   return this.showData; 
  }
  
  public void setShowData(Boolean sd){
     this.showData=sd; 
     println("ForecastView showData set to "+sd);
  }
  
  public void setup(){
    cp5 = new ControlP5(this);
   
    cp5.addButton("Temperature")
       .setValue(10)
       .setPosition(VIEW_WIDTH*1/5,VIEW_HEIGHT*4/5)
       .setSize(75,30)
       .setId(1);
       
    cp5.addButton("Rain")
       .setValue(10)
       .setPosition(VIEW_WIDTH*2/5,VIEW_HEIGHT*4/5)
       .setSize(75,30)
       .setId(2);
       
    cp5.addButton("Humidity")
       .setValue(10)
       .setPosition(VIEW_WIDTH*3/5,VIEW_HEIGHT*4/5)
       .setSize(75,30)
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
    
    this.background(#F5C9FC);
    float mapSize = (width-75)/24;
    if ( getShowData() ){
    switch(viewId)
    {
     case TEMPERATURE:
        fill(0);
        displayLegend();  
        textSize(15);
        text(" °F",305,20);
        textSize(30);
        text("Temperature Forecast for",VIEW_WIDTH/10, VIEW_HEIGHT*2/7-40);
        text(f.getCity().getName()+", "+f.getCity().getCountry(),VIEW_WIDTH/10,VIEW_HEIGHT*2/7);  
        fill(255);
        textSize(15);
         
        for (int d=0; d<7; d++){
          for(int h=0; h < 23; h++){
           if (floor(f.getTemps(d,h)/10) > 9)
            {
              legendmarker=9;
            } else if(floor(f.getTemps(d,h)/10) < 0)
            {
              legendmarker=0;
            } else {
              legendmarker=floor(f.getTemps(d,h)/10);
            }
      
           fill(legend[legendmarker]); 
          
           rect(h*(mapSize)+50, (d*20)+150, mapSize, mapSize, 5);
           textSize(10);
           fill(0);
        
         }
           text(f.getDays(d,0), 20, 145+mapSize+(d*20));
           } 
           for(int h=0; h < 23; h++){
            text(f.getHours(0,h), h*(mapSize)+52, 145);
           }
        break;
         
      case RAIN:
        fill(0);    
        displayLegend();
        textSize(15);
        text(" %",305,20);
        textSize(30);
        text("Precipitation Forecast for",VIEW_WIDTH/10,VIEW_HEIGHT*2/7-40);
        text(f.getCity().getName()+", "+f.getCity().getCountry(),VIEW_WIDTH/10,VIEW_HEIGHT*2/7);  
        fill(255);
        textSize(15);
        for (int d=0; d<7; d++){
          for(int h=0; h < 23; h++){
           if (floor(f.getPrecips(d,h))/10 > 9)
            {
              legendmarker=9;
            } else if(floor(f.getPrecips(d,h))/10 < 0)
            {
              legendmarker=0;
            } else {
              legendmarker=floor(f.getPrecips(d,h)/10);
            }
      
           fill(legend[legendmarker]); 
           rect(h*(mapSize)+50, (d*20)+150, mapSize, mapSize, 5);
           textSize(10);
           fill(0);
          
          }
           text(f.getDays(d,0), 20, 145+mapSize+(d*20));
           }   
             
          for(int h=0; h < 23; h++){
            text(f.getHours(0,h), h*(mapSize)+52, 145);
          }
          break;
          
       case HUMIDITY:
          fill(0);    
          displayLegend();
          textSize(15);
          text(" %",305,20);
          textSize(30);
          text("Humidity Forecast for",VIEW_WIDTH/10,VIEW_HEIGHT*2/7-40);
          text(f.getCity().getName()+", "+f.getCity().getCountry(),VIEW_WIDTH/10,VIEW_HEIGHT*2/7);  
          fill(255);
          textSize(15);
          for (int d=0; d<7; d++){
            for(int h=0; h < 23; h++){
             if (floor(f.getHumiditys(d,h)*10) > 9)
              {
                legendmarker=9;
              } else if(floor(f.getHumiditys(d,h)*10) < 0)
              {
                legendmarker=0;
              } else {
                legendmarker=floor(f.getHumiditys(d,h)*10);
              }
      
             fill(legend[legendmarker]); 
             rect(h*(mapSize)+50, (d*20)+150, mapSize, mapSize, 5);
             textSize(10);
             fill(0);
           
           }
             text(f.getDays(d,0), 20, 145+mapSize+(d*20));
          }  
          for(int h=0; h < 23; h++){
            text(f.getHours(0,h), h*(mapSize)+52, 145);
        }
         break;  
        }
    }
  }  
 
  
  public void displayLegend(){
   
    int legendWidth=30;
    int legendHeight=30;
    
    textSize(15);
    for (int i=0;i<legend.length;i++)
    {
      fill(legend[i]);
      //stroke(legend[i]);
      rect(i*legendWidth,0,legendWidth,legendHeight);
      fill(0);
      text(i*10, (i*legendWidth)+5 ,20);
    }
    fill(0);
  }
  
  public void setForecastData(Forecast _f)
  {
    f = _f;
    println("calling from ForecastView setForecastData");
    //setShowData(false);
  }
  
  public void controlEvent(ControlEvent theEvent) {
  int id = theEvent.getController().getId();
  if(id > 0 && id < 4)
    viewId = id;
  }
}
