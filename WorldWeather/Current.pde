/****************************************************
* This class captures all the data and parameters
* for the current weather. Takes the data from the API 
* call and organizes and arrages the data to be display 
* by the currentView.This is a supporting class to hold
* data and will have objects created in Model and Views
****************************************************/

class Current{
  private JSONObject current;
  private City city;
  private String time;
  private float temp;
  private float feels;
  private float precip;
  private float humidity;
  private float pressure;
  private float dewPoint;
  private float uV;
  private float vis;
  private float ozone;
  private String icon;
  private String summary;
  
  
// constructor
    public Current(){
      println("Current constructor");
    }
  
// Below set method, sets Current object from JSONObject response from API
    public void setData(JSONObject currently,City c){
            
    // set city
      city=c;
      
    //set time
        int t = currently.getInt("time"); 
        time = new java.text.SimpleDateFormat("dd/MM/yyyy , EEE").format(t*1000L);     
          
    //set temperature
        float temperature = currently.getFloat("temperature");        
         temp = temperature;
         
    //set apparent temperature
        float feelsLike = currently.getFloat("apparentTemperature");        
         feels = feelsLike;
        
     //set precipitation probability
        float pP = currently.getFloat("precipProbability");        
         precip = pP*100;
         
      //set percentage humidity
         float h = currently.getFloat("humidity");        
         humidity = h*100;
         
      //set percentage pressure
         float p = currently.getFloat("pressure");        
         pressure = p;
      
      //set percentage dew point
         float dP = currently.getFloat("dewPoint");        
         dewPoint = dP;
         
      //set percentage uvIndex
         float uvIndex = currently.getFloat("uvIndex");        
         uV = uvIndex;
         
      //set percentage visibility
         float visibility = currently.getFloat("visibility");        
         vis = visibility;
         
          //set percentage ozone
         float oz = currently.getFloat("ozone");        
         ozone = oz;
                
      //set icon
        String i = currently.getString("icon");
        icon=i;     
        
      //set summary
        String sum = currently.getString("summary");
        summary=sum; 
          
     }
  
// Getter methods for individual attributes of class
    public City getCity()
    {
       return city; 
    }
    
    public String getTime()
    {
      return time;
    }
  
    public float getTemp()
    {
      return temp;
    }
     
     public float getFeels()
    {
      return feels;
    }
    
     public float getPrecip()
    {
      return precip;
    }
    
    public float getHumidity()
    {
      return humidity;
    }
    
    public float getDewPoint()
    {
      return dewPoint;
    }
    
    public float getPressure()
    {
      return pressure;
    }
    
    public float getUV()
    {
      return uV;
    }
    
    public float getVis()
    {
      return vis;
    }
    
    public float getOzone()
    {
      return ozone;
    }
    
    
    public String getIcon()
    {
      return icon;
     
    }
    
    public String getSummary()
    {
      return summary;
    }
  
}
