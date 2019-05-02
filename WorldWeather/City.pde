/****************************************************
* This class stores information about a city
* city name , position as latitide and longitude , countryname.
* Constructor is used to load cities.csv file into City object
* Provides getter methods to fetch different attributes of a city
* category converts locations into cities. Data can be set only via constructor
* which is called for cities.csv file
****************************************************/


class City
{
  private String name;
  private PVector position;
  private String countryname;
  
  
  public City()
  {
    
  }
  
  public City(String _name, PVector _position, String _country)
  {
    name = _name;
    position = _position;
    countryname = _country;
  }
  
  public PVector getPosition()
  {
    return position;
  }
  
  public void getCity(PVector latlon)
  {
    
  }

  
  public String getName()
  {
    return name;
  }
  
  public String getCountry()
  {
     return countryname; 
  }
  
 
  
}
