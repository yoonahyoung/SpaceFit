package com.spacefit.event.model.vo;

import java.sql.Date;

public class Banner {

	private int banNo;
	private String banName;
	private String banStatus;
	private Date banEnrollDate;
	private Date banModifyDate;
	private String BanURL;
	private String banImg;
	
	public Banner() {}

	public Banner(int banNo, String banName, String banStatus, Date banEnrollDate, Date banModifyDate, String banURL,
			String banImg) {
		super();
		this.banNo = banNo;
		this.banName = banName;
		this.banStatus = banStatus;
		this.banEnrollDate = banEnrollDate;
		this.banModifyDate = banModifyDate;
		BanURL = banURL;
		this.banImg = banImg;
	}
	
	public Banner(String banName, String banStatus, String banURL, String banImg) {
		super();
		this.banName = banName;
		this.banStatus = banStatus;
		BanURL = banURL;
		this.banImg = banImg;
	}

	public int getBanNo() {
		return banNo;
	}

	public void setBanNo(int banNo) {
		this.banNo = banNo;
	}

	public String getBanName() {
		return banName;
	}

	public void setBanName(String banName) {
		this.banName = banName;
	}

	public String getBanStatus() {
		return banStatus;
	}

	public void setBanStatus(String banStatus) {
		this.banStatus = banStatus;
	}

	public Date getBanEnrollDate() {
		return banEnrollDate;
	}

	public void setBanEnrollDate(Date banEnrollDate) {
		this.banEnrollDate = banEnrollDate;
	}

	public Date getBanModifyDate() {
		return banModifyDate;
	}

	public void setBanModifyDate(Date banModifyDate) {
		this.banModifyDate = banModifyDate;
	}

	public String getBanURL() {
		return BanURL;
	}

	public void setBanURL(String banURL) {
		BanURL = banURL;
	}

	public String getBanImg() {
		return banImg;
	}

	public void setBanImg(String banImg) {
		this.banImg = banImg;
	}

	@Override
	public String toString() {
		return "Banner [banNo=" + banNo + ", banName=" + banName + ", banStatus=" + banStatus + ", banEnrollDate="
				+ banEnrollDate + ", banModifyDate=" + banModifyDate + ", BanURL=" + BanURL + ", banImg=" + banImg
				+ "]";
	}
	
	
	
	
}
