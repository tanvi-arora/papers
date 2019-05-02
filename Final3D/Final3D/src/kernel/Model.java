/**********************
 * This class is to load any and all data
 * Loading Happy.csv and lat-lon.csv
 */

package kernel;

import java.util.ArrayList;

import processing.core.*;
import processing.core.PApplet;
import processing.data.Table;
import processing.data.TableRow;



public class Model {
	
	private ArrayList<Happy> objhappy;
	private ArrayList<Country> objcountry;
	protected PApplet p;
	private PImage mp;
	
	public Model(PImage pi,PApplet _p){
		p = _p;
		mp = pi;
		// load Happy.csv into objhappy Arraylist
		objhappy = new ArrayList<Happy>();
		Table t = p.loadTable("data/Happy.csv");
	    for(int i = 1; i < t.getRowCount(); i++)
	    {
	      TableRow r = t.getRow(i);
	      Happy h = new Happy(r.getString(0), r.getFloat(1), r.getFloat(2),r.getFloat(3),r.getFloat(4),r.getFloat(5),r.getFloat(6),r.getFloat(7) ,r.getFloat(8),r.getFloat(9),r.getFloat(10))  ;
	      objhappy.add(h);	    
	    }
	   
	    // load lat-lon.csv into objcountry ArrayList
	    objcountry = new ArrayList<Country>();
		Table a = p.loadTable("data/lat_lon.csv");
	    for(int i = 1; i < a.getRowCount(); i++)
	    {
	      TableRow r = a.getRow(i);
	      Country c = new Country(r.getString(0), r.getFloat(1), r.getFloat(2),r.getString(3))  ;
	      objcountry.add(c);
	       }
	    		
	}
	
public PVector getCountryPos(String c){
	
	PVector cp = new PVector();
	for (Country _c : objcountry){
		if(c.equals(_c.getCountry())){
			cp= new PVector(_c.getLatitude(),_c.getLongitude());
			break;
		}
	}
	return cp;
}
/* This function retireves Happy Arraylist
 * and set up lat-lon of each country from 
 * the objcountry ArrayList
 */

public Object getHappy(){
	
	ArrayList<Happy> hpix = new ArrayList<Happy>();
	
	Converter con = new Converter(mp.width, mp.height);
	for(Happy h : objhappy){
		PVector h_pos = getCountryPos(h.getCountry());	
		PVector pix = con.convert2Pixels(h_pos.x, h_pos.y);
		h.setPosX(pix.x);
		h.setPosY(pix.y);
        hpix.add(h);	
	}
	
	return objhappy;
	
}

}
