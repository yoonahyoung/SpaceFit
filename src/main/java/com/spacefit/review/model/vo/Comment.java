package com.spacefit.review.model.vo;

import java.sql.Date;

public class Comment {
	
	private int comNo;
	private int rvNo;
	private int memNo;
	private String memId;
	private String comContent;
	private Date comEnrollDate;
	private Date comModifyDate;
	private int parentNo;
	private String comStatus;
	
	public Comment() {
		
	}

	public Comment(int comNo, int rvNo, int memNo, String memId, String comContent, Date comEnrollDate,
			Date comModifyDate, int parentNo, String comStatus) {
		super();
		this.comNo = comNo;
		this.rvNo = rvNo;
		this.memNo = memNo;
		this.memId = memId;
		this.comContent = comContent;
		this.comEnrollDate = comEnrollDate;
		this.comModifyDate = comModifyDate;
		this.parentNo = parentNo;
		this.comStatus = comStatus;
	}

	public int getComNo() {
		return comNo;
	}

	public void setComNo(int comNo) {
		this.comNo = comNo;
	}

	public int getRvNo() {
		return rvNo;
	}

	public void setRvNo(int rvNo) {
		this.rvNo = rvNo;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getComContent() {
		return comContent;
	}

	public void setComContent(String comContent) {
		this.comContent = comContent;
	}

	public Date getComEnrollDate() {
		return comEnrollDate;
	}

	public void setComEnrollDate(Date comEnrollDate) {
		this.comEnrollDate = comEnrollDate;
	}

	public Date getComModifyDate() {
		return comModifyDate;
	}

	public void setComModifyDate(Date comModifyDate) {
		this.comModifyDate = comModifyDate;
	}

	public int getParentNo() {
		return parentNo;
	}

	public void setParentNo(int parentNo) {
		this.parentNo = parentNo;
	}

	public String getComStatus() {
		return comStatus;
	}

	public void setComStatus(String comStatus) {
		this.comStatus = comStatus;
	}

	@Override
	public String toString() {
		return "Comment [comNo=" + comNo + ", rvNo=" + rvNo + ", memNo=" + memNo + ", memId=" + memId + ", comContent="
				+ comContent + ", comEnrollDate=" + comEnrollDate + ", comModifyDate=" + comModifyDate + ", parentNo="
				+ parentNo + ", comStatus=" + comStatus + "]";
	}
	
	

}
