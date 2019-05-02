/****************************************************
* This View class extends PApplet and presents visualization 
* for the Sun and the Moon data with a custom made visualization. cycles 
* with two buttons
* to select either sunrise-sunset time or moonphase
* time of upcoming month. It also presents
* a hovering funtion that either show the sunrise/sunset
* timing or an image of the moonphase
****************************************************/
class SunMoonView extends PApplet {
  ControlP5 cp5;
  private static final int VIEW_WIDTH = 500;
  private static final int VIEW_HEIGHT = 600;
  private Sun_Moon s;
  private Moon m;
  private boolean showData;  
  static final int SUN = 1;
  static final int MOON = 2;
  int viewId = SUN; 
  int day = 31;
  int size = VIEW_WIDTH*6/10; 
  Hover hs = new Hover();
  Hover hm = new Hover();
  boolean isHoveringSun;
  boolean isHoveringMoon;
  boolean isHover;
  public PVector[] hoverpoint;
  int hoverpos;
  
  
  public SunMoonView(Controller _control)
  {
    control = _control;
    setShowData(false);  
    
  }
  
  public Boolean getShowData(){
   return this.showData; 
  }
  
   public void setShowData(Boolean sd){
     this.showData=sd; 
     println("ForecastView showData set to "+sd);
  }
  
  public class Hover
  {
    String text1;
    String text2;
    int x;
    int y;
  }


  
  public void setup(){
    cp5 = new ControlP5(this);
   
    cp5.addButton("Sun")
       .setValue(10)
       .setPosition(VIEW_WIDTH*1/5,VIEW_HEIGHT*9/10)
       .setSize(75,30)
       .setId(1);
       
    cp5.addButton("Moon")
       .setValue(10)
       .setPosition(VIEW_WIDTH*3/5,VIEW_HEIGHT*9/10)
       .setSize(75,30)
       .setId(2);
        
       font = createFont("Tahoma Bold", 18);
       textFont(font);
       m = new Moon();
  }
  
  public void settings()
  {
      this.size(VIEW_WIDTH, VIEW_HEIGHT);
      setShowData(false);
      
      }
  
  
  public void draw()
  {
    this.background(#D9F9FC);
    if ( getShowData() ){
    
    translate(VIEW_WIDTH/2, VIEW_HEIGHT/2);
    fill(#2B2889);
    stroke(0);
    strokeWeight(2);
    ellipse(0,0,size,size);
    translate(-VIEW_WIDTH/2, -VIEW_HEIGHT/2);
       
    switch(viewId)
    {
     case SUN:
       textSize(30);
       text("Sunrise and Sunset in",VIEW_WIDTH/10, VIEW_HEIGHT/5-40);
       text(s.getCity().getName()+", "+s.getCity().getCountry(),VIEW_WIDTH/10,VIEW_HEIGHT/5);
       textSize(20);
       text(s.getMonths(0)+"/"+s.getMonths(day-1),VIEW_WIDTH/10,VIEW_HEIGHT/5+40); 
       textSize(25);
       translate(VIEW_WIDTH/2, VIEW_HEIGHT/2);
           
       for(int i=0;i<day;i++){
       beginShape();
       fill(#FFD500);
       noStroke();
       curveVertex((map(s.getSunriseTimes(i),0,23,0,size/2)*cos(i*TWO_PI/float(day))),(map(s.getSunriseTimes(i),0,23,0,size/2)*sin(i*TWO_PI/float(day))));
       curveVertex((map(s.getSunriseTimes(i),0,23,0,size/2)*cos(i*TWO_PI/float(day))),(map(s.getSunriseTimes(i),0,23,0,size/2)*sin(i*TWO_PI/float(day))));
       curveVertex((map(s.getSunsetTimes(i),0,23,0,size/2)*cos(i*TWO_PI/float(day))),(map(s.getSunsetTimes(i),0,23,0,size/2)*sin(i*TWO_PI/float(day))));
       curveVertex((map(s.getSunsetTimes(i),0,23,0,size/2)*cos((i+1)*TWO_PI/float(day))),(map(s.getSunsetTimes(i),0,23,0,size/2)*sin((i+1)*TWO_PI/float(day))));
       curveVertex((map(s.getSunriseTimes(i),0,23,0,size/2)*cos((i+1)*TWO_PI/float(day))),(map(s.getSunriseTimes(i),0,23,0,size/2)*sin((i+1)*TWO_PI/float(day))));
       curveVertex((map(s.getSunriseTimes(i),0,23,0,size/2)*cos((i+1)*TWO_PI/float(day))),(map(s.getSunriseTimes(i),0,23,0,size/2)*sin((i+1)*TWO_PI/float(day))));
       endShape();
       stroke(0);
       strokeWeight(2);
      line(size/2*cos(i*TWO_PI/float(day)),size/2*sin(i*TWO_PI/float(day)),0,0);
      noStroke();
      fill(#D9F9FC);
      ellipse(size/2*cos((i+0.5)*TWO_PI/float(day)),size/2*sin((i+0.5)*TWO_PI/float(day)),20,20);
      stroke(0);
      fill(0);
      textSize(10);
      text(s.getDays(i),size/2*cos((i+.5)*TWO_PI/float(day))-5,size/2*sin((i+0.5)*TWO_PI/float(day)));
       }
       translate(-VIEW_WIDTH/2, -VIEW_HEIGHT/2);
       if(isHoveringSun)
        {
           hoverSunDisplay();
        }
        
        
       break;
     
     case MOON:
       textSize(30);
       float mp;
       text("Moonphases viewed from",VIEW_WIDTH/10, VIEW_HEIGHT/5-40);
       text(s.getCity().getName()+", "+s.getCity().getCountry(),VIEW_WIDTH/10,VIEW_HEIGHT/5);
       textSize(20);
       text(s.getMonths(0)+"/"+s.getMonths(day-1),VIEW_WIDTH/10,VIEW_HEIGHT/5+40); 
       textSize(25);
       translate(VIEW_WIDTH/2, VIEW_HEIGHT/2);
         
       for(int i=0;i<day;i++){
           beginShape();
           fill(#FFFEE5);
           noStroke();
           curveVertex(0,0);
           curveVertex(0,0);
           if(s.getMoonPhases(i) <= 0.5)
             {
               mp = s.getMoonPhases(i);
             }
             else
             {
               mp = (1-s.getMoonPhases(i));
             }
         
           curveVertex((map(mp,0,0.5,0,size/2)*cos(i*TWO_PI/float(day))),(map(mp,0,0.5,0,size/2)*sin(i*TWO_PI/float(day))));
           curveVertex((map(mp,0,0.5,0,size/2)*cos((i+1)*TWO_PI/float(day))),(map(mp,0,0.5,0,size/2)*sin((i+1)*TWO_PI/float(day))));
           curveVertex(0,0);
           curveVertex(0,0);
           endShape();
           stroke(0);
           strokeWeight(2);
            line(size/2*cos(i*TWO_PI/float(day)),size/2*sin(i*TWO_PI/float(day)),0,0);
            noStroke();
            fill(#D9F9FC);
            ellipse(size/2*cos((i+0.5)*TWO_PI/float(day)),size/2*sin((i+0.5)*TWO_PI/float(day)),20,20);
            stroke(0);
            fill(0);
            textSize(10);
            text(s.getDays(i),size/2*cos((i+.5)*TWO_PI/float(day))-5,size/2*sin((i+0.5)*TWO_PI/float(day)));
        }
       translate(-VIEW_WIDTH/2, -VIEW_HEIGHT/2);
       if(isHoveringMoon)
        {
           hoverMoonDisplay();
        }
        break;
    }
    hoverpoint = new PVector[day];
    translate(VIEW_WIDTH/2, VIEW_HEIGHT/2);
    for(int i=0;i<day;i++){
     hoverpoint[i] = new PVector(size/2*cos((i+0.5)*TWO_PI/float(day)), size/2*sin((i+0.5)*TWO_PI/float(day)));
    }
    translate(-VIEW_WIDTH/2, -VIEW_HEIGHT/2);
    
    int i;
     for (i=0;i<day;i++)
     {
       
       if(dist(mouseX-(VIEW_WIDTH/2),mouseY-(VIEW_HEIGHT/2),hoverpoint[i].x , hoverpoint[i].y) <= 20 ){
             isHover = true;
             hoverpos=i;
            break;
        }
        if(isHover){
           switch(viewId){
            case SUN:
            {
              isHoveringSun=isHover;
              break;
            }
            case MOON:
            {
             isHoveringMoon=isHover; 
             break;
            }
            default:
              isHover=false;
              break;
           }
         }
     }
     if(i==day){
       isHoveringSun=false;
       isHoveringMoon=false;
       isHover=false;
       
     }
   
   }
   
   
   
  }
   public void setSunMoonData(Sun_Moon _sM)
  {
    s = _sM;
    println("calling from SunMoonView setSunMoonData");
    //setShowData(false);
    isHoveringSun = false;
     isHoveringMoon = false;
     hoverpos=-1;
  }
  
  public void controlEvent(ControlEvent theEvent) {
  int id = theEvent.getController().getId();
  if(id > 0 && id < 3)
    viewId = id;
  }
  
 
  boolean hoverSun()
{
  boolean collision = false;
  
  int radius = round(size/2);
  translate(VIEW_WIDTH/2, VIEW_HEIGHT/2);
  for(int j = 0; j < 360; j++)
  {
    if  (mouseX < (radius*cos(j*TWO_PI/360)) && mouseY < (radius*sin(j*TWO_PI/360)))
    {
    for(int i = 0; i < day; i++)
    {
        
        hs.text1 = ("Sunrise: "+s.getSunriseHours(i));
        hs.text2=("and Sunset: "+s.getSunsetHours(i));
        hs.x = round(size/4*cos((i+.5)*TWO_PI/float(day))-5);
        hs.y = round(size/4*sin((i+.5)*TWO_PI/float(day))-5);
        collision = true;
       
        break;
     }
    }
  }
   translate(-VIEW_WIDTH/2, -VIEW_HEIGHT/2);
  return collision;
}
  
  void hoverSunDisplay(){
    int posMultiplierX;
    int posMultiplierY;
    textSize(15);
    fill(0);
    //println("inside hoverSunDisplay");
    pushMatrix();
      translate(VIEW_WIDTH/2, VIEW_HEIGHT/2);   
      if (hoverpoint[hoverpos].x < VIEW_WIDTH/2)
      {
          posMultiplierX=-1;
      }
      else
      {
         posMultiplierX=1; 
      }
      
      if (hoverpoint[hoverpos].y < VIEW_HEIGHT/2)
      {
          posMultiplierY=-1;
      }
      else
      {
         posMultiplierY=1; 
      }
      noStroke();
      fill(255);
      rect(hoverpoint[hoverpos].x+(10*posMultiplierX), hoverpoint[hoverpos].y+(10*posMultiplierY)-20, 150, 50,7);
      fill(0);
      text("Sunrise: "+s.getSunriseHours(hoverpos),hoverpoint[hoverpos].x+(10*posMultiplierX), hoverpoint[hoverpos].y+(10*posMultiplierY)); 
      text("Sunset: "+s.getSunsetHours(hoverpos),hoverpoint[hoverpos].x+(10*posMultiplierX), hoverpoint[hoverpos].y+(10*posMultiplierY)+20);
      popMatrix();
    
}

 boolean hoverMoon()
{
  boolean collision = false;
  
  int radius = round(size/2);
  translate(VIEW_WIDTH/2, VIEW_HEIGHT/2);
  for(int j = 0; j < 360; j++)
  {
    if  (mouseX < (radius*cos(j*TWO_PI/360)) && mouseY < (radius*sin(j*TWO_PI/360)))
    {
    for(int i = 0; i < day; i++)
    {
        String moon = str(round(s.getMoonPhases(hoverpos)));
        hm.text1 = moon ;
        hm.x = round(size/4*cos((i+.5)*TWO_PI/float(day))-5);
        hm.y = round(size/4*sin((i+.5)*TWO_PI/float(day))-5);
        collision = true;
        
        break;
     }
    }
  }
  translate(-VIEW_WIDTH/2, -VIEW_HEIGHT/2);
  return collision;
}

void hoverMoonDisplay(){
   int posMultiplierX;
    int posMultiplierY;
    float mp;
    textSize(15);
    fill(0);
    //println("inside hoverSunDisplay");
    pushMatrix();
      translate(VIEW_WIDTH/2, VIEW_HEIGHT/2);   
      if (hoverpoint[hoverpos].x < VIEW_WIDTH/2)
      {
          posMultiplierX=-1;
      }
      else
      {
         posMultiplierX=1; 
      }
      
      if (hoverpoint[hoverpos].y < VIEW_HEIGHT/2)
      {
          posMultiplierY=-1;
      }
      else
      {
         posMultiplierY=1; 
      }
      
      if(s.getMoonPhases(hoverpos) <= 0.5)
     {
       mp = s.getMoonPhases(hoverpos)*20;
     }
     else
     {
       mp = (1-s.getMoonPhases(hoverpos))*20;
     }
      
      //String moons = str(round(10*s.getMoonPhases(hoverpos)));
      String moons = str(round(mp));
     // println("moon phase : " +s.getMoonPhases(hoverpos));
     this.image(m.getMoon(moons),hoverpoint[hoverpos].x+(10*posMultiplierX), hoverpoint[hoverpos].y+(10*posMultiplierY));
    popMatrix();
}


}
