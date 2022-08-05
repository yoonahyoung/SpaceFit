package com.spacefit.mem.model.vo;

import java.sql.Date;

public class Report {
	private int rptNo; // 신고고유번호
	
	private int memNo; // 신고한 회원
	private String memId; //신고한 회원아이디
	
	private int rptMemNo; // 글 작성자
	private String rptMemId; // 작성자 아이디
	
	private int rptReasonNo; // rptRsn 테이블 - 신고사유번호 123
	private String rptReason; // rptRsn 테이블 - 신고사유
	
	private int rptRefCat; // 글이면 1 | 댓글이면 2
	private String category;
	
	private int rptRefNo; // 글 혹은 댓글 고유번호
	private Date rptDate; // 신고당한날
	
	private int count; // 신고누적수
	
	private String reviewStatus;
	private String commentStatus;
		
	
	public int getRptNo() {
		return rptNo;
	}
	public void setRptNo(int rptNo) {
		this.rptNo = rptNo;
	}
	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	public int getRptMemNo() {
		return rptMemNo;
	}
	public void setRptMemNo(int rptMemNo) {
		this.rptMemNo = rptMemNo;
	}
	public int getRptReasonNo() {
		return rptReasonNo;
	}
	public void setRptReasonNo(int rptReasonNo) {
		this.rptReasonNo = rptReasonNo;
	}
	public String getRptReason() {
		return rptReason;
	}
	public void setRptReason(String rptReason) {
		this.rptReason = rptReason;
	}
	public int getRptRefCat() {
		return rptRefCat;
	}
	public void setRptRefCat(int rptRefCat) {
		this.rptRefCat = rptRefCat;
	}
	public int getRptRefNo() {
		return rptRefNo;
	}
	public void setRptRefNo(int rptRefNo) {
		this.rptRefNo = rptRefNo;
	}
	public Date getRptDate() {
		return rptDate;
	}
	public void setRptDate(Date rptDate) {
		this.rptDate = rptDate;
	}
	
	
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getRptMemId() {
		return rptMemId;
	}
	public void setRptMemId(String rptMemId) {
		this.rptMemId = rptMemId;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
		
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
			
	public String getReviewStatus() {
		return reviewStatus;
	}
	public void setReviewStatus(String reviewStatus) {
		this.reviewStatus = reviewStatus;
	}
	public String getCommentStatus() {
		return commentStatus;
	}
	public void setCommentStatus(String commentStatus) {
		this.commentStatus = commentStatus;
	}
	
	public Report(int rptNo, int memNo, int rptMemNo, int rptReasonNo, String rptReason, int rptRefCat, int rptRefNo,
			Date rptDate) {
		super();
		this.rptNo = rptNo;
		this.memNo = memNo;
		this.rptMemNo = rptMemNo;
		this.rptReasonNo = rptReasonNo;
		this.rptReason = rptReason;
		this.rptRefCat = rptRefCat;
		this.rptRefNo = rptRefNo;
		this.rptDate = rptDate;
	}
	
	
	
	public Report(int memNo, int rptMemNo, int rptReasonNo, int rptRefNo) {
		super();
		this.memNo = memNo;
		this.rptMemNo = rptMemNo;
		this.rptReasonNo = rptReasonNo;
		this.rptRefNo = rptRefNo;
	}
	
		
	
	public Report(String rptMemId, String category, int rptRefNo, int count, String reviewStatus, String commentStatus) {
		super();
		this.rptMemId = rptMemId;
		this.category = category;
		this.rptRefNo = rptRefNo;
		this.count = count;
		this.reviewStatus = reviewStatus;
		this.commentStatus = commentStatus;
	}
	@Override
	public String toString() {
		return "Report [rptNo=" + rptNo + ", memNo=" + memNo + ", memId=" + memId + ", rptMemNo=" + rptMemNo
				+ ", rptMemId=" + rptMemId + ", rptReasonNo=" + rptReasonNo + ", rptReason=" + rptReason
				+ ", rptRefCat=" + rptRefCat + ", category=" + category + ", rptRefNo=" + rptRefNo + ", rptDate="
				+ rptDate + ", count=" + count + ", reviewStatus=" + reviewStatus + ", commentStatus=" + commentStatus
				+ "]";
	}
	
	
	
	
	
}
