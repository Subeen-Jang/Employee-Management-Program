package com.emp.model;

public class searchDTO {
 public String category;
 public String keyword;
 
	 
	public searchDTO() {
		super();
	}
	
	
	public searchDTO(String category, String keyword) {
		super();
		this.category = category;
		this.keyword = keyword;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}


	public String getKeyword() {
		return keyword;
	}


	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
 
	
 
}
