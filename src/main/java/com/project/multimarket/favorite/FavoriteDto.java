package com.project.multimarket.favorite;

public class FavoriteDto {
	
	private String favorite_id="";
	private String userid="";
	private String product_num="";
	private String product_name="";
	private String product_image="";
	private String product_brand="";
	private String price = "";
	
	public String getFavorite_id() {
		return favorite_id;
	}
	public void setFavorite_id(String favorite_id) {
		this.favorite_id = favorite_id;
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
	public String getProduct_brand() {
		return product_brand;
	}
	public void setProduct_brand(String product_brand) {
		this.product_brand = product_brand;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "FavoriteDto [favorite_id=" + favorite_id + ", userid=" + userid + ", product_num=" + product_num
				+ ", product_name=" + product_name + ", product_image=" + product_image + ", product_brand="
				+ product_brand + ", price=" + price + "]";
	}
	
	
}
