package entity;

import java.util.ArrayList;
import java.util.List;

public class toPay {
	ArrayList<shopCar>  list;
	List<shopCar> carList;
	double finalNowAmount;
	double finalAmount;
	
	
	public toPay() {
		super();
	}
	
	

	
	public toPay(ArrayList<shopCar> list, List<shopCar> carList, double finalNowAmount, double finalAmount) {
		super();
		this.list = list;
		this.carList = carList;
		this.finalNowAmount = finalNowAmount;
		this.finalAmount = finalAmount;
	}




	public List<shopCar> getCarList() {
		return carList;
	}

	public void setCarList(List<shopCar> carList) {
		this.carList = carList;
	}

	public ArrayList<shopCar> getList() {
		return list;
	}
	public void setList(ArrayList<shopCar> list) {
		this.list = list;
	}
	public double getFinalNowAmount() {
		return finalNowAmount;
	}
	public void setFinalNowAmount(double finalNowAmount) {
		this.finalNowAmount = finalNowAmount;
	}
	public double getFinalAmount() {
		return finalAmount;
	}
	public void setFinalAmount(double finalAmount) {
		this.finalAmount = finalAmount;
	}
	
	
}
