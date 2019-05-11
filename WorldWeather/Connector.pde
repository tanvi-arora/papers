/****************************************************
* The connector is a category that cotains the information
* of the API. For this work three different types
* of API formats were called. This category has three 
* objects reffering to the locations latitud, longitud
* and the timing of the weather that is being called.
****************************************************/
private static final String appid = "WEBAPPID";

class Connector
{
  private float lat;
  private float lon;
  private String time;
  
   public float getLat()
  {
    return lat;
  }
  
  public float getLon()
  {
    return lon;
  }
  
  public String getTime()
  {
    return time;
  }
  
/****************************************************
* The following API call was use for the current data
****************************************************/
  
  public JSONObject getData(float lat, float lon)
  {
    println("fetch Current API data");
  return loadJSONObject("https://api.darksky.net/forecast/"+appid+"/"+lat+","+lon+"?exclude=daily,flags,minutely,hourly"); 
  }
  
/*************************************************************
* The following API call was use when hourly data was required
**************************************************************/
  public JSONObject getData(float lat, float lon, String time)
  {
    println("fetch ForeCast API time data");    
  return loadJSONObject("https://api.darksky.net/forecast/"+appid+"/"+lat+","+lon+","+time+"?exclude=currently,flags,daily"); 
  }
  
/*************************************************************
* The following API call was use when daily data was required
**************************************************************/  
   public JSONObject getDailyData(float lat, float lon, String time)
  {
    println("fetch Daily API data");
    return loadJSONObject("https://api.darksky.net/forecast/"+appid+"/"+lat+","+lon+","+time+"?exclude=currently,flags,hourly"); 
    
  }
  
}
