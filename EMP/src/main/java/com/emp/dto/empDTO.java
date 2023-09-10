package com.emp.dto;

public class empDTO {
	private int idx;
	private String rank;
	private String name;
	private String tel;
	private String email;
	
	public empDTO() {
		super();
	}

	public empDTO(int idx, String rank, String name, String tel, String email) {
		super();
		this.idx = idx;
		this.rank = rank;
		this.name = name;
		this.tel = tel;
		this.email = email;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}
