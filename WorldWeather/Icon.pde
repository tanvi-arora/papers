/****************************************************
* This class capture images/icons of the current weather
* visualization and are automatically called as required
* This class  supports visualizations
****************************************************/

public class Icon{

  PImage iconImage;
  private String name;
  
// constructor  
  public Icon(){
  }
  
   // getter-setter methods   
  public void setIconImage(String n){
    switch(n){
     case "clear-day":
        iconImage = clearColor(loadImage("clear-day.png"),#ffffff);
      break;
     case "clear-night":
        iconImage = clearColor(loadImage("clear-night.png"),#ffffff);
        break;
       case "rain":
        iconImage = clearColor(loadImage("rain.png"),#ffffff);
        break;
       case "snow":
        iconImage = clearColor(loadImage("snow.png"),#ffffff);
        break;
       case "sleet":
        iconImage = clearColor(loadImage("sleet.png"),#ffffff);
        break;
       case "wind":
        iconImage = clearColor(loadImage("wind.png"),#ffffff);
        break;
       case "fog":
        iconImage = clearColor(loadImage("fog.png"),#ffffff);
        break;
      case "cloudy":
        iconImage = clearColor(loadImage("cloudy.png"),#ffffff);
        break;
      case "partly-cloudy-day":
        iconImage = clearColor(loadImage("partly-cloudy-day.png"),#ffffff);
        break;
      case "partly-cloudy-night":
        iconImage = clearColor(loadImage("partly-cloudy-night.png"),#ffffff);
        break;
      case "hail":
        iconImage = clearColor(loadImage("hail.png"),#ffffff);
        break;
      case "thunderstorm":
        iconImage = clearColor(loadImage("thunderstorm.png"),#ffffff);
        }  
      }
  
    
  public String getName(){
     return this.name; 
  }
  
  public PImage getIcon(String n){
    setIconImage(n);
     return this.iconImage; 
  }
  
  public void  setName(String n){
     name = n; 
     }
     
 PImage clearColor(PImage image, int maskColor) {
    PImage newImage = createImage(image.width, image.height, ARGB);
    image.loadPixels();
    newImage.loadPixels();
    for(int n = 0; n < newImage.pixels.length; n++)
        newImage.pixels[n] = image.pixels[n] == maskColor ? 0x00000000 : image.pixels[n] | 0xff000000;
    newImage.updatePixels();
    return newImage;
  }

  
}
