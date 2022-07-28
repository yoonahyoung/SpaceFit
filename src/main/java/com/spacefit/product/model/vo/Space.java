package com.spacefit.product.model.vo;

import java.sql.Date;

public class Space {
	private int spaceNo;
	private String spaceName;
	private int spaceLimit;
	private String spaceInfo;
	private String spaceCategory;
	private String spacePic;
	private Date spaceEnDate;
	private int spacePrice;
	
	public Space() {}

	public Space(int spaceNo, String spaceName, int spaceLimit, String spaceInfo, String spaceCategory, String spacePic,
			Date spaceEnDate, int spacePrice) {
		super();
		this.spaceNo = spaceNo;
		this.spaceName = spaceName;
		this.spaceLimit = spaceLimit;
		this.spaceInfo = spaceInfo;
		this.spaceCategory = spaceCategory;
		this.spacePic = spacePic;
		this.spaceEnDate = spaceEnDate;
		this.spacePrice = spacePrice;
	}


	public Space(int spaceNo, String spaceName, int spaceLimit, String spaceCategory, String spacePic, int spacePrice) {
		super();
		this.spaceNo = spaceNo;
		this.spaceName = spaceName;
		this.spaceLimit = spaceLimit;
		this.spaceCategory = spaceCategory;
		this.spacePic = spacePic;
		this.spacePrice = spacePrice;
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

	public int getSpaceLimit() {
		return spaceLimit;
	}

	public void setSpaceLimit(int spaceLimit) {
		this.spaceLimit = spaceLimit;
	}

	public String getSpaceInfo() {
		return spaceInfo;
	}

	public void setSpaceInfo(String spaceInfo) {
		this.spaceInfo = spaceInfo;
	}

	public String getSpaceCategory() {
		return spaceCategory;
	}

	public void setSpaceCategory(String spaceCategory) {
		this.spaceCategory = spaceCategory;
	}

	public String getSpacePic() {
		return spacePic;
	}

	public void setSpacePic(String spacePic) {
		this.spacePic = spacePic;
	}

	public Date getSpaceEnDate() {
		return spaceEnDate;
	}

	public void setSpaceEnDate(Date spaceEnDate) {
		this.spaceEnDate = spaceEnDate;
	}

	public int getSpacePrice() {
		return spacePrice;
	}

	public void setSpacePrice(int spacePrice) {
		this.spacePrice = spacePrice;
	}

	@Override
	public String toString() {
		return "Space [spaceNo=" + spaceNo + ", spaceName=" + spaceName + ", spaceLimit=" + spaceLimit + ", spaceInfo="
				+ spaceInfo + ", spaceCategory=" + spaceCategory + ", spacePic=" + spacePic + ", spaceEnDate="
				+ spaceEnDate + ", spacePrice=" + spacePrice + "]";
	}
	
}
