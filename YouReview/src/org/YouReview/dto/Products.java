package org.YouReview.dto;

import java.util.ArrayList;

import com.mysql.jdbc.Blob;

public class Products {
	private String Product_Name;
	private String Sub_Category_Name;
	private String User_Name;
	private String Brand;
	private String Model;
	private String Description;
	private String Category_name;
	private Blob Image;
	private String ImagePath;
	private ArrayList<Reviews> Reviews;
	private int Answer1Avg;
	private int Answer2Avg;
	private int Answer3Avg;
	private int Answer4Avg;
	private int Answer5Avg;
	private SubCategory subCategory;
	
	public String getImagePath() {
		return ImagePath;
	}
	public void setImagePath(String imagePath) {
		ImagePath = imagePath;
	}
	public String getProduct_Name() {
		return Product_Name;
	}
	public void setProduct_Name(String product_Name) {
		Product_Name = product_Name;
	}
	public String getSub_Category_Name() {
		return Sub_Category_Name;
	}
	public void setSub_Category_Name(String sub_Category_Name) {
		Sub_Category_Name = sub_Category_Name;
	}
	public String getUser_Name() {
		return User_Name;
	}
	public void setUser_Name(String user_Name) {
		User_Name = user_Name;
	}
	public String getBrand() {
		return Brand;
	}
	public void setBrand(String brand) {
		Brand = brand;
	}
	public String getModel() {
		return Model;
	}
	public void setModel(String model) {
		Model = model;
	}
	public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		Description = description;
	}
	public String getCategory_name() {
		return Category_name;
	}
	public void setCategory_name(String category_name) {
		Category_name = category_name;
	}
	public Blob getImage() {
		return Image;
	}
	public void setImage(Blob image) {
		Image = image;
	}
	public ArrayList<Reviews> getReviews() {
		return Reviews;
	}
	public void setReviews(ArrayList<Reviews> reviews) {
		Reviews = reviews;
	}
	public int getAnswer1Avg() {
		return Answer1Avg;
	}
	public void setAnswer1Avg(int answer1Avg) {
		Answer1Avg = answer1Avg;
	}
	public int getAnswer2Avg() {
		return Answer2Avg;
	}
	public void setAnswer2Avg(int answer2Avg) {
		Answer2Avg = answer2Avg;
	}
	public int getAnswer3Avg() {
		return Answer3Avg;
	}
	public void setAnswer3Avg(int answer3Avg) {
		Answer3Avg = answer3Avg;
	}
	public int getAnswer4Avg() {
		return Answer4Avg;
	}
	public void setAnswer4Avg(int answer4Avg) {
		Answer4Avg = answer4Avg;
	}
	public int getAnswer5Avg() {
		return Answer5Avg;
	}
	public void setAnswer5Avg(int answer5Avg) {
		Answer5Avg = answer5Avg;
	}
	public SubCategory getSubCategory() {
		return subCategory;
	}
	public void setSubCategory(SubCategory subCategory) {
		this.subCategory = subCategory;
	}
	
	
}
