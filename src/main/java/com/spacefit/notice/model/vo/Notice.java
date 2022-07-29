package com.spacefit.notice.model.vo;

import java.sql.Date;

public class Notice {
	private int noticeNo;
	private String noticeCategory;
	private String noticeTitle;
	private String noticeContent;
	private String noticeWriter;
	private int count;
	private Date createDate;
	private String status;
	
	public Notice() {}

	
	public Notice(int noticeNo, String noticeCategory, String noticeTitle, String noticeWriter, int count,
			Date createDate) {
		super();
		this.noticeNo = noticeNo;
		this.noticeCategory = noticeCategory;
		this.noticeTitle = noticeTitle;
		this.noticeWriter = noticeWriter;
		this.count = count;
		this.createDate = createDate;
	}


	public Notice(int noticeNo, String noticeCategory, String noticeTitle, String noticeContent, String noticeWriter,
			int count, Date createDate, String status) {
		super();
		this.noticeNo = noticeNo;
		this.noticeCategory = noticeCategory;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeWriter = noticeWriter;
		this.count = count;
		this.createDate = createDate;
		this.status = status;
	}


	public int getNoticeNo() {
		return noticeNo;
	}


	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}


	public String getNoticeCategory() {
		return noticeCategory;
	}


	public void setNoticeCategory(String noticeCategory) {
		this.noticeCategory = noticeCategory;
	}


	public String getNoticeTitle() {
		return noticeTitle;
	}


	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}


	public String getNoticeContent() {
		return noticeContent;
	}


	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}


	public String getNoticeWriter() {
		return noticeWriter;
	}


	public void setNoticeWriter(String noticeWriter) {
		this.noticeWriter = noticeWriter;
	}


	public int getCount() {
		return count;
	}


	public void setCount(int count) {
		this.count = count;
	}


	public Date getCreateDate() {
		return createDate;
	}


	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeCategory=" + noticeCategory + ", noticeTitle=" + noticeTitle
				+ ", noticeContent=" + noticeContent + ", noticeWriter=" + noticeWriter + ", count=" + count
				+ ", createDate=" + createDate + ", status=" + status + "]";
	}
	
	
}
