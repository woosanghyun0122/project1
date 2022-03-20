package com.project.multimarket.product;

public class ProductDto {
	
	private String num="";
	private String name="";
	private String brand="";
	private String sex="";
	private String price="";
	private String image="";
	private String sale="";
	private String in_date="";
	private int quantity=0;
	private String wdate="";
	
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getSale() {
		return sale;
	}
	public void setSale(String sale) {
		this.sale = sale;
	}
	public String getIn_date() {
		return in_date;
	}
	public void setIn_date(String in_date) {
		this.in_date = in_date;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	
	@Override
	public String toString() {
		return "ProductDto [num=" + num + ", name=" + name + ", brand=" + brand + ", sex=" + sex + ", price=" + price
				+ ", image=" + image + ", sale=" + sale + ", in_date=" + in_date + ", quantity=" + quantity + ", wdate="
				+ wdate + "]";
	}


}
