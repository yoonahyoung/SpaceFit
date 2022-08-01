package com.spacefit.qna.model.vo;

import java.sql.Date;

public class QnA {
	private int qnaNo;
	private String qnaCategory;
	private String qnaSpaceNo;	
	private String qnaTitle;
	private String qnaContent;
	private String qnaWriter;
	private int qnaGroup;
	private int qnaRefNo;	
	private int count;
	private Date qnaCreateDate;
	
	public QnA() {}

	
	
	public QnA(int qnaNo, String qnaCategory, String qnaSpaceNo, String qnaTitle, String qnaWriter, int count,
			Date qnaCreateDate) {
		super();
		this.qnaNo = qnaNo;
		this.qnaCategory = qnaCategory;
		this.qnaSpaceNo = qnaSpaceNo;
		this.qnaTitle = qnaTitle;
		this.qnaWriter = qnaWriter;
		this.count = count;
		this.qnaCreateDate = qnaCreateDate;
	}



	public QnA(int qnaNo, String qnaCategory, String qnaSpaceNo, String qnaTitle, String qnaContent, String qnaWriter,
			int qnaGroup, int qnaRefNo, int count, Date qnaCreateDate) {
		super();
		this.qnaNo = qnaNo;
		this.qnaCategory = qnaCategory;
		this.qnaSpaceNo = qnaSpaceNo;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.qnaWriter = qnaWriter;
		this.qnaGroup = qnaGroup;
		this.qnaRefNo = qnaRefNo;
		this.count = count;
		this.qnaCreateDate = qnaCreateDate;
	}



	public int getQnaNo() {
		return qnaNo;
	}


	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}


	public String getQnaCategory() {
		return qnaCategory;
	}


	public void setQnaCategory(String qnaCategory) {
		this.qnaCategory = qnaCategory;
	}


	public String getQnaSpaceNo() {
		return qnaSpaceNo;
	}


	public void setQnaSpaceNo(String qnaSpaceNo) {
		this.qnaSpaceNo = qnaSpaceNo;
	}


	public String getQnaTitle() {
		return qnaTitle;
	}


	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}


	public String getQnaContent() {
		return qnaContent;
	}


	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}


	public String getQnaWriter() {
		return qnaWriter;
	}


	public void setQnaWriter(String qnaWriter) {
		this.qnaWriter = qnaWriter;
	}


	public int getQnaGroup() {
		return qnaGroup;
	}


	public void setQnaGroup(int qnaGroup) {
		this.qnaGroup = qnaGroup;
	}


	public int getQnaRefNo() {
		return qnaRefNo;
	}


	public void setQnaRefNo(int qnaRefNo) {
		this.qnaRefNo = qnaRefNo;
	}


	public int getCount() {
		return count;
	}


	public void setCount(int count) {
		this.count = count;
	}


	public Date getQnaCreateDate() {
		return qnaCreateDate;
	}


	public void setQnaCreateDate(Date qnaCreateDate) {
		this.qnaCreateDate = qnaCreateDate;
	}


	@Override
	public String toString() {
		return "QnA [qnaNo=" + qnaNo + ", qnaCategory=" + qnaCategory + ", qnaSpaceNo=" + qnaSpaceNo + ", qnaTitle="
				+ qnaTitle + ", qnaContent=" + qnaContent + ", qnaWriter=" + qnaWriter + ", qnaGroup=" + qnaGroup
				+ ", qnaRefNo=" + qnaRefNo + ", count=" + count + ", qnaCreateDate=" + qnaCreateDate + "]";
	}
	
	
}

	
	
	