package com.emp.dto;

public class mailDTO {
	private String address;
	private String  title;
	private String content;
	
	
	public mailDTO() {
		super();
	}


	public mailDTO(String address, String title, String content) {
		super();
		this.address = address;
		this.title = title;
		this.content = content;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}
	
	
	
}
