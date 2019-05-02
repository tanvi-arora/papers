/****************************************************
* This class maintains images of the Moon 
* visualization and are automatically called when
* hovering over moon display. 
****************************************************/
public class Moon{

   PImage moonImage;
  private String name;
  
  
  public Moon(){
  }
  
      
  public void setMoonImage(String n){
    switch(n){
      case "0":
        moonImage = clearColor(loadImage("0.png"),#000000);
      break;
      case "1":
        moonImage = clearColor(loadImage("1.png"),#000000);
      break;
       case "2":
        moonImage = clearColor(loadImage("2.png"),#000000);
      break;
       case "3":
        moonImage = clearColor(loadImage("3.png"),#000000);
      break;
       case "4":
        moonImage = clearColor(loadImage("4.png"),#000000);
      break;
       case "5":
        moonImage = clearColor(loadImage("5.png"),#000000);
      break;
       case "6":
        moonImage = clearColor(loadImage("6.png"),#000000);
      break;
       case "7":
        moonImage = clearColor(loadImage("7.png"),#000000);
      break;
       case "8":
        moonImage = clearColor(loadImage("8.png"),#000000);
      break;
       case "9":
        moonImage = clearColor(loadImage("9.png"),#000000);
      break;
        case "10":
        moonImage = clearColor(loadImage("9.png"),#000000);
      break;
       }
  }
  
  public String getName(){
     return this.name; 
  }
  
  public PImage getMoon(String n){
    setMoonImage(n);
     return this.moonImage; 
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
