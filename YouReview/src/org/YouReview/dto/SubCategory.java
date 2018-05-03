package org.YouReview.dto;

public class SubCategory {
	
	
	public String SubCategoryName;
	public String CategoryName;
	public String Question1;
	public String Question2;
	public String Question3;
	public String Question4;
	public String Question5;

	
	public String getSubCategoryName() {
		return SubCategoryName;
	}

	
	public void setSubCategoryName(String subCategoryName) {
		this.SubCategoryName = subCategoryName;
	}



	public String getCategoryName() {
		return CategoryName;
	}



	public void setCategoryName(String categoryName) {
		this.CategoryName = categoryName;
	}



	public String getQuestion1() {
		return Question1;
	}



	public void setQuestion1(String question1) {
		this.Question1 = question1;
	}



	public String getQuestion2() {
		return Question2;
	}



	public void setQuestion2(String question2) {
		this.Question2 = question2;
	}



	public String getQuestion3() {
		return Question3;
	}



	public void setQuestion3(String question3) {
		this.Question3 = question3;
	}



	public String getQuestion4() {
		return Question4;
	}



	public void setQuestion4(String question4) {
		this.Question4 = question4;
	}



	public String getQuestion5() {
		return Question5;
	}



	public void setQuestion5(String question5) {
		this.Question5 = question5;
	}



	public String getSubCategoryName(String SubCategoryName) {
		return SubCategoryName;
	}
	
	@Override
	public String toString() {
		return "SubCategory [category_name=" + CategoryName +  "\nSubCategoryName" + SubCategoryName + "\nQuestion_1" + Question1 + "\nQuestion_2" + Question2 + "\nQuestion_3" + Question3 + "\nQuestion_4" + Question4 +"\nQuestion_5" + Question5 +  "]";
	}

	
}
