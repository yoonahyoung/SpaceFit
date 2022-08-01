package com.spacefit.qna.model.vo;

public class Category {
	
	private int spaceNo;
	private String spaceName;
	
	public Category() {}

	
	public Category(int spaceNo, String spaceName) {
		super();
		this.spaceNo = spaceNo;
		this.spaceName = spaceName;
	}

	
	public int getSpaceNo() {
		return spaceNo;
	}


	public void setSpaceNo(int spaceNo) {
		this.spaceNo = spaceNo;
	}


	public String getSpaceName() {
		return spaceName;
	}


	public void setSpaceName(String spaceName) {
		this.spaceName = spaceName;
	}


	@Override
	public String toString() {
		return "Category [spaceNo=" + spaceNo + ", spaceName=" + spaceName + "]";
	}
	
}
