package com.spacefit.mem.model.vo;

public class Grade {

	private int grNo;
	private String grName;
	private int grCond;
	
	public Grade() {}

	public Grade(int grNo, String grName, int grCond) {
		super();
		this.grNo = grNo;
		this.grName = grName;
		this.grCond = grCond;
	}

	public Grade(String grName) {
		super();
		this.grName = grName;
	}

	public int getGrNo() {
		return grNo;
	}

	public void setGrNo(int grNo) {
		this.grNo = grNo;
	}

	public String getGrName() {
		return grName;
	}

	public void setGrName(String grName) {
		this.grName = grName;
	}

	public int getGrCond() {
		return grCond;
	}

	public void setGrCond(int grCond) {
		this.grCond = grCond;
	}

	@Override
	public String toString() {
		return "Grade [grNo=" + grNo + ", grName=" + grName + ", grCond=" + grCond + "]";
	}
	
	
}
