/****************************
 * This class represents 
 * record from lat-lon.csv 
 * for each country and lat-lon
 * of its center location
 */
package kernel;

public class Country {

	private String Code	;
	private float latitude;
	private float longitude;
	private String Country;
		
	public Country(String _c, float lat, float lon, String c){
		
		setCode(_c);
		setLatitude(lat);
		setLongitude(lon);
		setCountry(c);
		
	}
	
	
	public float getLongitude() {
		return longitude;
	}


	public void setLongitude(float longitude) {
		this.longitude = longitude;
	}


	public String getCountry() {
		return Country;
	}

	public void setCountry(String country) {
		Country = country;
	}

	public float getLatitude() {
		return latitude;
	}

	public void setLatitude(float latitude) {
		this.latitude = latitude;
	}

	public String getCode() {
		return Code;
	}

	public void setCode(String code) {
		Code = code;
	}

		
}
