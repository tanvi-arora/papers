/****************************************************
* The controller class is the main engine or brain of 
* this program. It is in charge of connecting and 
* calling all the classes, functions, dataset, 
* views(displays) and the main model in the proper 
* order and in a coordinate manner.
*
****************************************************/

class Controller
{
    private Model model;
    private CurrentView currentView;
    private ForecastView forecastView;
    private SunMoonView sunMoonView;
    private TimeSeriesView timeSeriesView;
    
  
 
  public Controller(PApplet _mainView)
  {
// Create model and view objects
    currentView = new CurrentView(this);
    forecastView = new ForecastView(this);
    sunMoonView = new SunMoonView(this);
    timeSeriesView = new TimeSeriesView(this);
    model = new Model(this);
    
// Create Applets    
     PApplet.runSketch(new String[]{"Zoom View 4"}, timeSeriesView); 
     PApplet.runSketch(new String[]{"Zoom View 3"}, sunMoonView);
     PApplet.runSketch(new String[]{"Zoom View 2"}, forecastView);  
     PApplet.runSketch(new String[]{"Zoom View 1"}, currentView);
  }
   
 // below show methods, set showData flag of each view, passed from either buttons or model 
     public void showForecastVw(Boolean fcFlag){
        //if(fcFlag){
          //println("forecast view flag in controller is "+fcFlag);
          forecastView.setShowData(fcFlag);
       // }
     }
   
     public void showTimeSeries(Boolean tsFlag){
       println("inside controller showTimeSeries "+tsFlag);
       timeSeriesView.setShowData(tsFlag);
     }
   
    public void showForeCast(Boolean fsFlag){
     println("inside controller showForeCast "+fsFlag);
     forecastView.setShowData(fsFlag);
     }
   
    public void showSunMoon(Boolean smFlag){
     println("inside controller showSunMoon "+smFlag);
     sunMoonView.setShowData(smFlag);
     }
 
 
 /* updateData method loads or initialized data once a position is
    selected on the main map view based on the latitude and longitude
    of the point.
    To avoid maxout errors for free API calls permitted,
    annual and monthly data is loaded once into files.
    For a fresh update, commented out methods can be
    un-commented and it will overwrite the monthly.csv and annual.csv
    files in data.
*/
   public void updateData( PVector p)
   {
// to be un-commented if need to fetch new data for last 450 days  
     // model.getMonthlyForecastData(p); 
// to be un-commented if need to fetch next 1 month's data 
       //model.getYearlyForecastData(p);
      
// fetches latest data for position "p" through API call
       showTimeSeries(false);
       showForeCast(false);
       showSunMoon(false);
       model.updateCurrentData(p);
       model.updateForecastData(p);
       model.updateSun_MoonData(p);
// loads yearly data from the file data/annual.csv
        model.loadYearlyData();
   }
 
/*Below methods called from Model to update 
respective views with latest available data
*/
   public void updateCurrentView(Current _c) 
   {
     
     currentView.setCurrentData(_c);
   }
   
   
   public void updateForecastView(Forecast _f) 
   {
    
     forecastView.setForecastData(_f);
   }
   
   public void updateSunMoonView(Sun_Moon _sM) 
   {
     sunMoonView.setSunMoonData(_sM);
   }
   
   public void updateTimeSeriesView(Daily[] d)
    {
        timeSeriesView.setTimeSeriesData(d);
    }
   
   public City getCityName(PVector pos)
   {
      return model.getCityName(pos);
   }
  
 
}
