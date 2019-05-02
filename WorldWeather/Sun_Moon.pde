/****************************************************
* This class contains features to collect upcoming month's 
* Sun-Moon details. This is a supporting class to hold
* data and will have objects created in Model and Views
* It features sunrise, sunset and moonphases.
* It takes the data from an array of API calls and 
* organizes and arrages data to be display by the
* Sun_Moon_View. 
****************************************************/
class Sun_Moon{
   private City city;
  private String[][] months;
  private String[][] days;
  private float[][] sunriseTimes;
  private String[][] sunriseHours;
  private float[][] sunsetTimes;
  private String[][] sunsetHours;
  private float[][] moonPhases;
  private Connector c;  
  private Controller _controller;
  
  public Sun_Moon(){
    println("Sun_Moon constructor");
    }
    
// Get day-wise _sunMoon data for the upcoming month divided in 4 weeks
    
    public void setDailyData(JSONObject[] dailys, City c){
      
      // set city
        city=c;
       
       months = new String[31][];
       days = new String[31][];
       sunriseTimes = new float[31][];
       sunriseHours = new String[31][];
       sunsetTimes = new float[31][];
       sunsetHours = new String[31][];
       moonPhases = new float[31][];
       
       
      // Get day-wise _sunMoon data for the upcoming month
       for (int i=0; i<31; i++){ 
       JSONArray data = dailys[i].getJSONArray("data"); 
       months[i] = new String[1];
       days[i] = new String[1];       
       sunriseTimes[i] = new float[1];
       sunriseHours[i] = new String[1];
       sunsetTimes[i] = new float[1];
       sunsetHours[i] = new String[1];
       moonPhases[i] = new float[1];
                                                
      JSONObject we = data.getJSONObject(0); 
          
    //Get month and day
      int time = we.getInt("time"); 
      months[i][0] = new java.text.SimpleDateFormat("MMM").format(time*1000L);       
      days[i][0] = new java.text.SimpleDateFormat("dd").format(time*1000L);
     
      
      //Get sunrise times
      int sRTime = we.getInt("sunriseTime");
      sunriseHours[i][0] = new java.text.SimpleDateFormat("hh:mm a").format(sRTime*1000L);
      String sR = new java.text.SimpleDateFormat("H").format(sRTime*1000L);
      sunriseTimes[i][0] = float(trim(sR));
      
      
      //Get sunset time
      int sSTime = we.getInt("sunsetTime"); 
      sunsetHours[i][0] = new java.text.SimpleDateFormat("hh:mm a").format(sSTime*1000L);
      String sS = new java.text.SimpleDateFormat("H").format(sSTime*1000L); 
      sunsetTimes[i][0] = float(trim(sS));
      
        
      //Get moon phase
      float moonPhase = we.getFloat("moonPhase");        
       moonPhases[i][0] = (moonPhase); 
       println(days[i][0] +" " + months[i][0] + " moonPhase "+ moonPhase);
   }
  }

// Getter methods to fetch feature values based on array position
   public City getCity()
    {
       return city; 
    }
    
     public String getMonths(int i)
  {
    return months[i][0];
  }
  
   public String getDays(int i)
  {
    return days[i][0];
  }
   
   public float getSunriseTimes(int i)
  {
    return sunriseTimes[i][0];
  }
  
  public String getSunriseHours(int i)
  {
    return sunriseHours[i][0];
  }
  
   public float getSunsetTimes(int i)
  {
    return sunsetTimes[i][0];
  }
 
  public String getSunsetHours(int i)
  {
    return sunsetHours[i][0];
  }

  public float getMoonPhases(int i)
  {
    return moonPhases[i][0];
  }
    
}
