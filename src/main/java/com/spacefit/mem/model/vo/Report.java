package com.spacefit.mem.model.vo;

import java.sql.Date;

public class Report {
	private int rptNo; // 신고고유번호
	private int memNo; // 신고한 회원번호
	private int rptMemNo; // 신고당한 회원번호
	private int rptReasonNo; // rptRsn 테이블 - 신고사유번호 123
	private String rptReason; // rptRsn 테이블 - 신고사유
	private int rptRefCat; // 글이면 1 | 댓글이면 2
	private int rptRefNo; // 글 혹은 댓글 고유번호
	private Date rptDate; // 신고당한날
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
	@Override
	public String toString() {
		return "Report [rptNo=" + rptNo + ", memNo=" + memNo + ", rptMemNo=" + rptMemNo + ", rptReasonNo=" + rptReasonNo
				+ ", rptReason=" + rptReason + ", rptRefCat=" + rptRefCat + ", rptRefNo=" + rptRefNo + ", rptDate="
				+ rptDate + "]";
	}
	
	
	
}
