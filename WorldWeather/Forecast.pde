/****************************************************
* This class contains features to collect upcoming week's 
* hourly weather details. This is a supporting class to hold
* data and will have objects created in Model and Views 
* Similarly, it takes the data from an array 
* of API calls and organizes and arrages data to be 
* display by the ForecastView. The controller make the 
* comunication between all the parties posible and the 
* model provides the funtionality as well as the API 
* call instructions. 
****************************************************/
class Forecast{
 
  private City city;
  private String[][] hours;
  private String[][] days;
  private float[][] temps;
  private float[][] precips;
  private float[][] humiditys;
 
  // constructor
  public Forecast(){
    println("Foreasct constructor");
    }
      
 
  
// Set hour-wise forecast data for the upcoming week 
    public void setData(JSONObject[] hourlys, City c){
      
      // set city
      city=c;
        
      // JSONArray[] data = new JSONArray[7];
      temps = new float[7][];
      hours = new String[7][];
      days = new String[7][];
      precips = new float[7][];
      humiditys = new float[7][];
  
     for (int j=0; j<7; j++){ 
       JSONArray data = hourlys[j].getJSONArray("data"); 

      temps[j] = new float[data.size()];
      hours[j] = new String[data.size()];
      days[j] = new String[data.size()];
      precips[j] = new float[data.size()];
      humiditys[j] = new float[data.size()];
      
        for(int i = 0; i < data.size() ; i++)  {
          //println("i : " + i);
          JSONObject we = data.getJSONObject(i); 
          
          //Get temperature
          float temp = we.getFloat("temperature");        
           temps[j][i] = temp;
                  
          //Get icon
          float humidity = we.getFloat("humidity");
          humiditys[j][i]=humidity;
          
          //Get time
          int time = we.getInt("time"); 
          hours[j][i] = new java.text.SimpleDateFormat("hh").format(time*1000L); 
          days[j][i] = new java.text.SimpleDateFormat("EEE").format(time*1000L);
               
           //Get percentage precipitation
           float precip = we.getFloat("precipProbability");        
           precips[j][i] = precip*100;
                    
         }
       }
     }
  
 // Getter methods to fetch attribute data based on array position 
     public City getCity()
     {
         return city; 
     }
      
     public String getHours(int j, int i)
    {
      return hours[j][i];
    }
    
     public String getDays(int j, int i)
    {
      return days[j][i];
    }
    
    public float getTemps(int j, int i)
    {
      return temps[j][i];
    }
     
      
     public float getPrecips(int j, int i)
    {
      return precips[j][i];
    }
     
    
    public float getHumiditys(int j, int i)
    {
      return humiditys[j][i];
    }
    
   

}
