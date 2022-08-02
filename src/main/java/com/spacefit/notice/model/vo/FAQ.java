package com.spacefit.notice.model.vo;

public class FAQ {
	private int faqNo;
	private String faqTitle;
	private String faqContent;
	private int memNo;
	private String faqWriter;
	private String faqCreateDate;
	private String faqUpdateDate;
	private String faqStatus;
	
	public FAQ() {}

	public FAQ(int faqNo, String faqTitle, String faqContent, int memNo, String faqWriter, String faqCreateDate,
			String faqUpdateDate, String faqStatus) {
		super();
		this.faqNo = faqNo;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
		this.memNo = memNo;
		this.faqWriter = faqWriter;
		this.faqCreateDate = faqCreateDate;
		this.faqUpdateDate = faqUpdateDate;
		this.faqStatus = faqStatus;
	}

	public FAQ(int faqNo, String faqTitle, String faqContent, String faqWriter, String faqCreateDate,
			String faqUpdateDate, String faqStatus) {
		super();
		this.faqNo = faqNo;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
		this.faqWriter = faqWriter;
		this.faqCreateDate = faqCreateDate;
		this.faqUpdateDate = faqUpdateDate;
		this.faqStatus = faqStatus;
	}


	public int getFaqNo() {
		return faqNo;
	}

	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}

	public String getFaqTitle() {
		return faqTitle;
	}

	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}

	public String getFaqContent() {
		return faqContent;
	}

	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getFaqWriter() {
		return faqWriter;
	}

	public void setFaqWriter(String faqWriter) {
		this.faqWriter = faqWriter;
	}

	public String getFaqCreateDate() {
		return faqCreateDate;
	}

	public void setFaqCreateDate(String faqCreateDate) {
		this.faqCreateDate = faqCreateDate;
	}

	public String getFaqUpdateDate() {
		return faqUpdateDate;
	}

	public void setFaqUpdateDate(String faqUpdateDate) {
		this.faqUpdateDate = faqUpdateDate;
	}

	public String getFaqStatus() {
		return faqStatus;
	}

	public void setFaqStatus(String faqStatus) {
		this.faqStatus = faqStatus;
	}

	@Override
	public String toString() {
		return "FAQ [faqNo=" + faqNo + ", faqTitle=" + faqTitle + ", faqContent=" + faqContent + ", memNo=" + memNo
				+ ", faqWriter=" + faqWriter + ", faqCreateDate=" + faqCreateDate + ", faqUpdateDate=" + faqUpdateDate
				+ ", faqStatus=" + faqStatus + "]";
	}

	
}
