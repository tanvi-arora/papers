/****************************************************
* This class contains features to collect daily weather 
*  details. This is a supporting class to hold
* data and will have objects created in Model and Views
****************************************************/

public class Daily{
  
    
    private String summary;
    private String icon ;
    private String sunriseTime ;
    private String sunsetTime ;
    private float moonPhase ;
    private float precipIntensity ;
    private String precipType ;
    private float temperatureMax ;
    private float temperatureMin ;
    private float apparentTemperatureMax ;
    private float apparentTemperatureMin ;
    private float windSpeed ;
    private City city;
    private String timezone ;
   
    public Daily(){
      
    }
    
    /*public void setDailyData(JSONObject[] dailys, City c){
      
    }
    */
    
/*  Below method is called to save daily object array returned from API call
    to a csv file. csv file will be stored in data folder with the name
    <filename>.csv
*/
    public void saveData(JSONObject[] dailys, City c, String filename){
      println("inside Daily saveData"); 
    
       Table table = new Table();
       table.addColumn("country");
       table.addColumn("city");
       table.addColumn("latitude");
       table.addColumn("longitude");
       table.addColumn("summary");
       table.addColumn("icon");
       table.addColumn("sunriseTime");
       table.addColumn("sunsetTime");
       table.addColumn("moonPhase");
       table.addColumn("precipIntensity");
       table.addColumn("precipType");
       table.addColumn("temperatureMax");
       table.addColumn("temperatureMin");
       table.addColumn("apparentTemperatureMax");
       table.addColumn("apparentTemperatureMin");
       table.addColumn("windSpeed");
       table.addColumn("timezone");
      
     
       for (int j=0; j< dailys.length; j++){
         
         JSONArray data = dailys[j].getJSONArray("data"); 
         JSONObject d = data.getJSONObject(0); 
      
           TableRow newRow = table.addRow();
           newRow.setString("country",c.getCountry());
           newRow.setString("city",c.getName());
           newRow.setFloat("latitude",c.getPosition().x);
           newRow.setFloat("longitude",c.getPosition().y);
           newRow.setString("summary",d.getString("summary"));
           newRow.setString("icon",d.getString("icon"));
           newRow.setString("sunriseTime",new java.text.SimpleDateFormat("dd/MM/yyyy hh:mm a").format(d.getInt("sunriseTime")*1000L));
           newRow.setString("sunsetTime",new java.text.SimpleDateFormat("dd/MM/yyyy hh:mm a").format(d.getInt("sunsetTime")*1000L)    );
           newRow.setFloat("moonPhase",d.getFloat("moonPhase"));
           newRow.setFloat("precipIntensity",d.getFloat("precipIntensity"));
           newRow.setString("precipType",d.getString("precipType"));
           newRow.setFloat("temperatureMax",d.getFloat("temperatureMax"));
           newRow.setFloat("temperatureMin",d.getFloat("temperatureMin"));
           newRow.setFloat("apparentTemperatureMax",d.getFloat("apparentTemperatureMax"));
           newRow.setFloat("apparentTemperatureMin",d.getFloat("apparentTemperatureMin"));
           newRow.setFloat("windSpeed",d.getFloat("windSpeed"));
           newRow.setString("timezone",dailys[j].getString("timezone"));
           
         
       }
       println(filename + "table captured");
       saveTable(table,"data/"+filename+".csv");
       println(filename +"table saved to csv");
    }

// Getter-Setter methods to fetch different attributes of Daily object
      public City getCity()
    {
       return city; 
    }
    
    public String getSummary(){
       return summary; 
    }
    
    public String getIcon(){
       return icon; 
    }
    
    public String getSunriseTime(){
       return sunriseTime; 
    }
    
    public String getSunsetTime(){
       return sunsetTime; 
    }
    
    public float getMoonPhase(){
       return moonPhase ; 
    }
    
    public float getPrecipIntensity(){
       return precipIntensity; 
    }
    
    public String getPrecipType(){
       return precipType; 
    }
    
    public float getTemperatureMax(){
       return temperatureMax; 
    }
    
    public float getTemperatureMin(){
       return temperatureMin; 
    }
    
    public float getApparentTemperatureMax(){
       return apparentTemperatureMax; 
    }
    
    public float getApparentTemperatureMin(){
       return apparentTemperatureMin; 
    }
    
    public float getWindSpeed(){
       return windSpeed; 
    }
    
    public String getTimezone(){
       return timezone; 
    }
    
    // setter methods
    
   public void setSummary(String s){
        summary=s; 
    }
    
    public void setIcon(String i){
        icon=i; 
    }
    
    public void setSunriseTime(String srt){
        sunriseTime=srt; 
    }
    
    public void setSunsetTime(String sst){
        sunsetTime=sst; 
    }
    
    public void setMoonPhase(float m){
        moonPhase=m ; 
    }
    
    public void setPrecipIntensity(float pi){
        precipIntensity=pi; 
    }
    
    public void setPrecipType(String pt){
        precipType=pt; 
    }
    
    public void setTemperatureMax(float tmax){
        temperatureMax=tmax; 
    }
    
    public void setTemperatureMin(float tmin){
        temperatureMin=tmin; 
    }
    
    public void setApparentTemperatureMax(float atmax){
        apparentTemperatureMax=atmax; 
    }
    
    public void setApparentTemperatureMin(float atmin){
        apparentTemperatureMin=atmin; 
    }
    
    public void setWindSpeed(float ws){
        windSpeed=ws; 
    }
    
    public void setTimezone(String t){
        timezone=t; 
    }
    
    public void setCity(City c){
     city=c; 
    }
    
    public void setCountry(City c){
     city=c; 
    }
    
}
