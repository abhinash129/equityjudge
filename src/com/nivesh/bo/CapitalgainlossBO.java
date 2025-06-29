package com.nivesh.bo;

public class CapitalgainlossBO {
	private Float capitalshortterm_gain;
	private Float capitalshortterm_loss;
	private Float capitallongterm_gain;
	private Float capitallongterm_loss;
	@Override
	public String toString() {
		return "CapitalgainlossBO [capitalshortterm_gain=" + capitalshortterm_gain + ", capitalshortterm_loss="
				+ capitalshortterm_loss + ", capitallongterm_gain=" + capitallongterm_gain + ", capitallongterm_loss="
				+ capitallongterm_loss + "]";
	}
	public Float getCapitalshortterm_gain() {
		return capitalshortterm_gain;
	}
	public void setCapitalshortterm_gain(Float capitalshortterm_gain) {
		this.capitalshortterm_gain = capitalshortterm_gain;
	}
	public Float getCapitalshortterm_loss() {
		return capitalshortterm_loss;
	}
	public void setCapitalshortterm_loss(Float capitalshortterm_loss) {
		this.capitalshortterm_loss = capitalshortterm_loss;
	}
	public Float getCapitallongterm_gain() {
		return capitallongterm_gain;
	}
	public void setCapitallongterm_gain(Float capitallongterm_gain) {
		this.capitallongterm_gain = capitallongterm_gain;
	}
	public Float getCapitallongterm_loss() {
		return capitallongterm_loss;
	}
	public void setCapitallongterm_loss(Float capitallongterm_loss) {
		this.capitallongterm_loss = capitallongterm_loss;
	}
	
	

}
