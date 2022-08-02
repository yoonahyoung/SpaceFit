package com.spacefit.notice.model.vo;

import java.sql.Date;

public class Terms {

	private int termsNo;
	private String termsTitle;
	private String termsContent;
	private String termsStatus;
	private String termsPage;
	private String termsNote;
	private Date termsEnrollDate;
	private Date termsModifyDate;
	
	public Terms() {}

	public Terms(int termsNo, String termsTitle, String termsContent, String termsStatus, String termsPage,
			String termsNote, Date termsEnrollDate, Date termsModifyDate) {
		super();
		this.termsNo = termsNo;
		this.termsTitle = termsTitle;
		this.termsContent = termsContent;
		this.termsStatus = termsStatus;
		this.termsPage = termsPage;
		this.termsNote = termsNote;
		this.termsEnrollDate = termsEnrollDate;
		this.termsModifyDate = termsModifyDate;
	}
	

	public Terms(String termsTitle, String termsContent, String termsStatus, String termsPage, String termsNote) {
		super();
		this.termsTitle = termsTitle;
		this.termsContent = termsContent;
		this.termsStatus = termsStatus;
		this.termsPage = termsPage;
		this.termsNote = termsNote;
	}

	public int getTermsNo() {
		return termsNo;
	}

	public void setTermsNo(int termsNo) {
		this.termsNo = termsNo;
	}

	public String getTermsTitle() {
		return termsTitle;
	}

	public void setTermsTitle(String termsTitle) {
		this.termsTitle = termsTitle;
	}

	public String getTermsContent() {
		return termsContent;
	}

	public void setTermsContent(String termsContent) {
		this.termsContent = termsContent;
	}

	public String getTermsStatus() {
		return termsStatus;
	}

	public void setTermsStatus(String termsStatus) {
		this.termsStatus = termsStatus;
	}

	public String getTermsPage() {
		return termsPage;
	}

	public void setTermsPage(String termsPage) {
		this.termsPage = termsPage;
	}

	public String getTermsNote() {
		return termsNote;
	}

	public void setTermsNote(String termsNote) {
		this.termsNote = termsNote;
	}

	public Date getTermsEnrollDate() {
		return termsEnrollDate;
	}

	public void setTermsEnrollDate(Date termsEnrollDate) {
		this.termsEnrollDate = termsEnrollDate;
	}

	public Date getTermsModifyDate() {
		return termsModifyDate;
	}

	public void setTermsModifyDate(Date termsModifyDate) {
		this.termsModifyDate = termsModifyDate;
	}

	@Override
	public String toString() {
		return "Terms [termsNo=" + termsNo + ", termsTitle=" + termsTitle + ", termsContent=" + termsContent
				+ ", termsStatus=" + termsStatus + ", termsPage=" + termsPage + ", termsNote=" + termsNote
				+ ", termsEnrollDate=" + termsEnrollDate + ", termsModifyDate=" + termsModifyDate + "]";
	}
	
	
	
	
	
	
	
	 
}
