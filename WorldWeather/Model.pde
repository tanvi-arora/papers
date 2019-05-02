/****************************************************
* This Model class connects Controller to the data.
* It provides methods to fetch data from API
* and sends it back to controller for use in respective views
****************************************************/

class Model
{
  private Controller controller;
  private HashMap<String, City> cities;
  private Connector conn;
  private Current _current;
  private Forecast _forecast;
  private Sun_Moon _sunMoon;
  private JSONObject myObject;
  private JSONObject myDailyObject;
  private Daily _daily;
  private Daily _annual;
  private Daily[] annual;
 
  public Model(Controller _controller)
  {
    converter = new Converter(worldMap.width, worldMap.height);
    controller = _controller;
    
// Loads city.csv file .This is a supporting lookup data
    cities = new HashMap<String, City>();
   
    Table t = loadTable("worldcities.csv");
    for(int i = 1; i < t.getRowCount(); i++)
    {
      TableRow r = t.getRow(i);
      cities.put(r.getString(0), new City(r.getString(0), new PVector(r.getFloat(1), r.getFloat(2)) , r.getString(3) ) );
      
    }
    println(cities.size() + " cities loaded.");
  }
  
// loadYearlyData method is called to load Yearly data from data/annual.csv 
  public void loadYearlyData(){
    
    
     Table yearly = loadTable("data/annual.csv");
     annual = new Daily[yearly.getRowCount()];
     
     for(int i = 1; i < yearly.getRowCount(); i++) {
        annual[i] = new Daily();
        TableRow r = yearly.getRow(i);
        String _ctry = r.getString(0);
        String _cname = r.getString(1);
        float _lat = r.getFloat(2);
        float _lon = r.getFloat(3);
        PVector _pos = new PVector(_lat,_lon);
         City _c = new City(_cname, _pos, _ctry);
        //println("city details : " + _ctry +" " + _cname + " " + _lat + " " + _lon);
       
        annual[i].setCity(_c);
        annual[i].setSummary(r.getString(4));
        annual[i].setIcon(r.getString(5));
        annual[i].setSunriseTime(r.getString(6));
        annual[i].setSunsetTime(r.getString(7));
        annual[i].setMoonPhase(r.getFloat(8));
        annual[i].setPrecipIntensity(r.getFloat(9));
        annual[i].setPrecipType(r.getString(10));
        annual[i].setTemperatureMax(r.getFloat(11));
        annual[i].setTemperatureMin(r.getFloat(12));
        annual[i].setApparentTemperatureMax(r.getFloat(13));
        annual[i].setApparentTemperatureMin(r.getFloat(14));
        annual[i].setWindSpeed(r.getFloat(15));
        annual[i].setTimezone(r.getString(16));
   }
   
     println("Yearly data loaded from annual.csv");
      controller.updateTimeSeriesView(annual);
  }

// updateCurrentData method fetches Current data of position(lat,lon)
// by making an API call and returns an object of "Current" type 
// to controller

  public void updateCurrentData(PVector pos){
    _current = new Current();
    conn = new Connector();
     
     //Weather forecast data upload from API sourse in jSON format
      myObject = conn.getData(pos.x,pos.y);
     
    // set current conditions
      JSONObject currently = myObject.getJSONObject("currently");
      _current.setData(currently,getCityName(pos));
      controller.updateCurrentView(_current);
  }

// updateForecastData method fetches Weekly Forecast data of position(lat,lon)
// by making an API call and returns an object of "Current" type 
// to controller
  public void updateForecastData(PVector pos){
    _forecast = new Forecast();
    conn = new Connector();

    //Weather forecast data upload from API sourse in jSON format
     JSONObject[] hourlys = new JSONObject[8];
     for(int i=0 ; i<7; i++){
        String time = new java.text.SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss").format(now + (i*86400000L)); 
        myObject = conn.getData(pos.x,pos.y, time);
             
        // set forecast conditions
         hourlys[i]= myObject.getJSONObject("hourly");  
     }
     _forecast.setData(hourlys, getCityName(pos));
      controller.updateForecastView(_forecast);
  }
  
// updateSun_MoonData method fetches Monthly Forecast data of position(lat,lon)
// by making an API call and returns an object of "Sun_Moon" type 
// to controller  
  
 public void updateSun_MoonData(PVector pos){
    _sunMoon = new Sun_Moon();
    conn = new Connector();
    println("inside Model-updateSunMoonData "+ pos.x + " " + pos.y);
    
     println("city name is " + getCityName(pos));
     
    //SunMoon data upload from API sourse in jSON format
    
     JSONObject[] dailys = new JSONObject[31];
     for(int i=0 ; i<31; i++){
      String time = new java.text.SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss").format(now + (i*86400000L)); 
      println("time is : "+time);
      myObject = conn.getDailyData(pos.x,pos.y, time);
           
      // set _sunMoon conditions
       dailys[i]= myObject.getJSONObject("daily");  
     }
     _sunMoon.setDailyData(dailys, getCityName(pos));
      controller.updateSunMoonView(_sunMoon);
  }
  
  public City getCityName(PVector pos)
  {
     City _city = new City();
     for (HashMap.Entry<String, City> c : cities.entrySet()) { 
     City c_temp = c.getValue();
   
     if(round(c_temp.getPosition().x) == round(pos.x) && round(c_temp.getPosition().y) == round(pos.y) )
      {
         _city=c.getValue();
         break;
      }
    }
    return _city;
  }
  
 // Below methods make API call to fetch Daily Object data for upcoming month
 // It makes 30 API calls and so is intentionally used only to create
 // latest data/monthly.csv file
 
  public void getMonthlyForecastData(PVector pos){
   
     conn = new Connector();
     _daily = new Daily();
      println("inside saveMonthlyForecastData "+ pos.x + " " + pos.y);
        
     //DailySt[] dailys = new DailySt[30];
     JSONObject[] dailys = new JSONObject[30];
     
     City _c = new City();
     _c = getCityName(pos);
     
     for(int i=0 ; i<30; i++){
        String time = new java.text.SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss").format(now + (i*86400000L)); 
        println("time is : "+time);
        myDailyObject = conn.getDailyData(pos.x,pos.y, time);
           println("API object retrieved in Model");
         dailys[i] = myDailyObject.getJSONObject("daily"); 
       }
       println("API call finished");
     _daily.saveData(dailys,_c,"monthly");
      
  }
 // Below methods make API call to fetch Daily Object data for past year
 // It makes 450 API calls and so is intentionally used only to create
 // latest data/monthly.csv file
 
  public void getYearlyForecastData(PVector pos){
   
     conn = new Connector();
     _annual = new Daily();
      println("inside saveMonthlyForecastData "+ pos.x + " " + pos.y);

     JSONObject[] dailys = new JSONObject[450];
     
     City _c = new City();
     _c = getCityName(pos);
     if (_c !=null) {
     
     for(int i=0 ; i<450; i++){
        String time = new java.text.SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss").format(now - (i*86400000L)); 
        println("time is : "+time);
        myDailyObject = conn.getDailyData(pos.x,pos.y, time);
           println("API object retrieved in Model");
         dailys[i] = myDailyObject.getJSONObject("daily"); 
         
       }
       println("API call finished");
     _annual.saveData(dailys,_c,"annual");
    }
    else 
    {
      println(" City object is null");
    }
  
  }
  
  
}
