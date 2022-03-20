package com.project.multimarket.cart;

public class CartDto {
	
	private String cart_id="";
	private String userid="";
	private String product_num="";
	private String product_name="";
	private String product_image="";
	private int product_quantity=0;
	private String amount="";
	private String size="";
	private String price="";
	
	
	public String getCart_id() {
		return cart_id;
	}
	public void setCart_id(String cart_id) {
		this.cart_id = cart_id;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getProduct_num() {
		return product_num;
	}
	public void setProduct_num(String product_num) {
		this.product_num = product_num;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_image() {
		return product_image;
	}
	public void setProduct_image(String product_image) {
		this.product_image = product_image;
	}
	public int getProduct_quantity() {
		return product_quantity;
	}
	public void setProduct_quantity(int product_quantity) {
		this.product_quantity = product_quantity;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	@Override
	public String toString() {
		return "CartDto [cart_id=" + cart_id + ", userid=" + userid + ", product_num=" + product_num + ", product_name="
				+ product_name + ", product_image=" + product_image + ", product_quantity=" + product_quantity
				+ ", amount=" + amount + ", size=" + size + ", price=" + price + "]";
	}
	
	
	

}
