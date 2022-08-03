package com.spacefit.mem.model.vo;

public class Love {
	
	private int spaceNo;
	private int memNo;
	private String loveDate;
	private String spaceName;
	private int spaceLimit;
	private String spacePic;
	
	public Love() {}
	
	public Love(int spaceNo, int memNo, String loveDate, String spaceName, int spaceLimit, String spacePic) {
		super();
		this.spaceNo = spaceNo;
		this.memNo = memNo;
		this.loveDate = loveDate;
		this.spaceName = spaceName;
		this.spaceLimit = spaceLimit;
		this.spacePic = spacePic;
	}

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

	public String getSpaceName() {
		return spaceName;
	}

	public void setSpaceName(String spaceName) {
		this.spaceName = spaceName;
	}

	public int getSpaceLimit() {
		return spaceLimit;
	}

	public void setSpaceLimit(int spaceLimit) {
		this.spaceLimit = spaceLimit;
	}

	public String getSpacePic() {
		return spacePic;
	}

	public void setSpacePic(String spacePic) {
		this.spacePic = spacePic;
	}

	@Override
	public String toString() {
		return "Love [spaceNo=" + spaceNo + ", memNo=" + memNo + ", loveDate=" + loveDate + "]";
	}
	
	

}
