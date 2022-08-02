package com.spacefit.mem.model.vo;

public class Love {
	
	private int spaceNo;
	private int memNo;
	private String loveDate;
	
	public Love() {}

	public Love(int spaceNo, int memNo, String loveDate) {
		super();
		this.spaceNo = spaceNo;
		this.memNo = memNo;
		this.loveDate = loveDate;
	}

	public int getSpaceNo() {
		return spaceNo;
	}

	public void setSpaceNo(int spaceNo) {
		this.spaceNo = spaceNo;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getLoveDate() {
		return loveDate;
	}

	public void setLoveDate(String loveDate) {
		this.loveDate = loveDate;
	}

	@Override
	public String toString() {
		return "Love [spaceNo=" + spaceNo + ", memNo=" + memNo + ", loveDate=" + loveDate + "]";
	}
	
	

}
