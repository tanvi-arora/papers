/*********************************************
 * This class represents record from Happy.csv
 * and contains method to load Happy object and
 *  getters and setters for each attribute
 */
package kernel;

public class Happy {

	private String Country	;
	private float Happiness_score;
	private float Whisker_high;
	private float Whisker_low;
	private float Dystopia_residual;
	private float Exp_GDP_per_capita;
	private float Exp_Social_support;	
	private float Exp_Healthy_life_expectancy;	
	private float Exp_Freedom_life_choices;	
	private float Exp_Generosity	;
	private float Exp_Perceptions_of_corruption;
	private float posX;
	private float posY;
	
	public Happy(String c, float hs, float wh, float wl , float dr, float egdp , float ess, float ehle, float eflc , float eg, float epc){
		
		setCountry(c);
		setHappiness_score(hs);
		setWhisker_high(wh);
		setWhisker_low(wl);
		setDystopia_residual(dr);
		setExp_GDP_per_capita(egdp);
		setExp_Social_support(ess);
		setExp_Healthy_life_expectancy(ehle);
		setExp_Freedom_life_choices(eflc);
		setExp_Generosity(eg);
		setExp_Perceptions_of_corruption(epc);
		
	}
	
	
	public String getCountry() {
		return Country;
	}
	public void setCountry(String country) {
		Country = country;
	}
	public float getHappiness_score() {
		return Happiness_score;
	}
	public void setHappiness_score(float happiness_score) {
		Happiness_score = happiness_score;
	}
	public float getWhisker_high() {
		return Whisker_high;
	}
	public void setWhisker_high(float whisker_high) {
		Whisker_high = whisker_high;
	}
	public float getWhisker_low() {
		return Whisker_low;
	}
	public void setWhisker_low(float whisker_low) {
		Whisker_low = whisker_low;
	}
	public float getDystopia_residual() {
		return Dystopia_residual;
	}
	public void setDystopia_residual(float dystopia_residual) {
		Dystopia_residual = dystopia_residual;
	}
	public float getExp_GDP_per_capita() {
		return Exp_GDP_per_capita;
	}
	public void setExp_GDP_per_capita(float exp_GDP_per_capita) {
		Exp_GDP_per_capita = exp_GDP_per_capita;
	}
	public float getExp_Social_support() {
		return Exp_Social_support;
	}
	public void setExp_Social_support(float exp_Social_support) {
		Exp_Social_support = exp_Social_support;
	}
	public float getExp_Healthy_life_expectancy() {
		return Exp_Healthy_life_expectancy;
	}
	public void setExp_Healthy_life_expectancy(float exp_Healthy_life_expectancy) {
		Exp_Healthy_life_expectancy = exp_Healthy_life_expectancy;
	}
	public float getExp_Freedom_life_choices() {
		return Exp_Freedom_life_choices;
	}
	public void setExp_Freedom_life_choices(float exp_Freedom_life_choices) {
		Exp_Freedom_life_choices = exp_Freedom_life_choices;
	}
	public float getExp_Generosity() {
		return Exp_Generosity;
	}
	public void setExp_Generosity(float exp_Generosity) {
		Exp_Generosity = exp_Generosity;
	}
	public float getExp_Perceptions_of_corruption() {
		return Exp_Perceptions_of_corruption;
	}
	public void setExp_Perceptions_of_corruption(float exp_Perceptions_of_corruption) {
		Exp_Perceptions_of_corruption = exp_Perceptions_of_corruption;
	}

	public float getPosX() {
		return posX;
	}

	public void setPosX(float posX) {
		this.posX = posX;
	}

	public float getPosY() {
		return posY;
	}

	public void setPosY(float posY) {
		this.posY = posY;
	}

	
}
