package com.spacefit.mem.model.vo;

import java.sql.Date;

public class Member {
	
	public int memNo;
	public int grNo;
	public String memId;
	public String memPwd;
	public String memName;
	public String memIdNo;
	public String memPhone;
	public String memMail;
	public String memProfile;
	public Date memEnrollDate;
	public Date memModifyDate;
	public String memStatus;
	public String memAdmFlag;
	
	private String memRealPwd;
	
	public String getMemRealPwd() {
		return memRealPwd;
	}


	public void setMemRealPwd(String memRealPwd) {
		this.memRealPwd = memRealPwd;
	}


	//------------------- 테이블에는 없지만 추가된 리스트
	private String randomNo; // 핸드폰 앤덤메시지 인증 위한 핸덤메시지 
	private String grName; // 관리자 회원조회를 위한 등급이름
	private int bookCountAll;
	private int bookCountMonth;
	private int bookAmountAll;
	private int bookAmountMonth;
	private int rptCount; // 관리자 회원조회를 위한 누적신고수
	private int likeCount; // 관리자 회원조회를 위한 누적신고수
	
	public Member() {
		
	}


	public Member(int memNo, int grNo, String memId, String memPwd, String memName, String memIdNo, String memPhone,
			String memMail, String memProfile, Date memEnrollDate, Date memModifyDate, String memStatus,
			String memAdmFlag) {
		super();
		this.memNo = memNo;
		this.grNo = grNo;
		this.memId = memId;
		this.memPwd = memPwd;
		this.memName = memName;
		this.memIdNo = memIdNo;
		this.memPhone = memPhone;
		this.memMail = memMail;
		this.memProfile = memProfile;
		this.memEnrollDate = memEnrollDate;
		this.memModifyDate = memModifyDate;
		this.memStatus = memStatus;
		this.memAdmFlag = memAdmFlag;
	}
	
	


	public Member(String memId, String memPwd, String memName, String memIdNo, String memPhone, String memMail) {
		super();
		this.memId = memId;
		this.memPwd = memPwd;
		this.memName = memName;
		this.memIdNo = memIdNo;
		this.memPhone = memPhone;
		this.memMail = memMail;
	}

	

	public Member(String memId, String memName, String memPhone, String memMail) {
		super();
		this.memId = memId;
		this.memName = memName;
		this.memPhone = memPhone;
		this.memMail = memMail;
	
	}
	



	public Member(int memNo, String memId, String memName, String memIdNo, String memPhone,
			String memMail, String grName, int bookCountAll, int bookCountMonth, int bookAmountAll, int bookAmountMonth,
			int rptCount, int likeCount, String memStatus, String memAdmFlag,  Date memEnrollDate, Date memModifyDate
			 ) {
		super();
		this.memNo = memNo;
		this.memId = memId;
		this.memName = memName;
		this.memIdNo = memIdNo;
		this.memPhone = memPhone;
		this.memMail = memMail;
		this.grName = grName;
		this.bookCountAll = bookCountAll;
		this.bookCountMonth = bookCountMonth;
		this.bookAmountAll = bookAmountAll;
		this.bookAmountMonth = bookAmountMonth;
		this.rptCount = rptCount;
		this.likeCount = likeCount;
		this.memStatus = memStatus;
		this.memAdmFlag = memAdmFlag;
		this.memEnrollDate = memEnrollDate;
		this.memModifyDate = memModifyDate;
	}


	public Member(String memId, String memPwd, String memName, String memIdNo, String memPhone, String memMail,
			String memRealPwd) {
		this.memId = memId;
		this.memPwd = memPwd;
		this.memName = memName;
		this.memIdNo = memIdNo;
		this.memPhone = memPhone;
		this.memMail = memMail;
		this.memRealPwd = memRealPwd;
	}


	public int getMemNo() {
		return memNo;
	}


	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}


	public int getGrNo() {
		return grNo;
	}


	public void setGrNo(int grNo) {
		this.grNo = grNo;
	}


	public String getMemId() {
		return memId;
	}


	public void setMemId(String memId) {
		this.memId = memId;
	}


	public String getMemPwd() {
		return memPwd;
	}


	public void setMemPwd(String memPwd) {
		this.memPwd = memPwd;
	}


	public String getMemName() {
		return memName;
	}


	public void setMemName(String memName) {
		this.memName = memName;
	}


	public String getMemIdNo() {
		return memIdNo;
	}


	public void setMemIdNo(String memIdNo) {
		this.memIdNo = memIdNo;
	}


	public String getMemPhone() {
		return memPhone;
	}


	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}


	public String getMemMail() {
		return memMail;
	}


	public void setMemMail(String memMail) {
		this.memMail = memMail;
	}


	public String getMemProfile() {
		return memProfile;
	}


	public void setMemProfile(String memProfile) {
		this.memProfile = memProfile;
	}


	public Date getMemEnrollDate() {
		return memEnrollDate;
	}


	public void setMemEnrollDate(Date memEnrollDate) {
		this.memEnrollDate = memEnrollDate;
	}


	public Date getMemModifyDate() {
		return memModifyDate;
	}


	public void setMemModifyDate(Date memModifyDate) {
		this.memModifyDate = memModifyDate;
	}


	public String getMemStatus() {
		return memStatus;
	}


	public void setMemStatus(String memStatus) {
		this.memStatus = memStatus;
	}


	public String getMemAdmFlag() {
		return memAdmFlag;
	}


	public void setMemAdmFlag(String memAdmFlag) {
		this.memAdmFlag = memAdmFlag;
	}
	
	
	

	public String getRandomNo() {
		return randomNo;
	}


	public void setRandomNo(String randomNo) {
		this.randomNo = randomNo;
	}
	
	
	
	

	public int getBookCountAll() {
		return bookCountAll;
	}


	public void setBookCountAll(int bookCountAll) {
		this.bookCountAll = bookCountAll;
	}


	public int getBookCountMonth() {
		return bookCountMonth;
	}


	public void setBookCountMonth(int bookCountMonth) {
		this.bookCountMonth = bookCountMonth;
	}


	public int getBookAmountAll() {
		return bookAmountAll;
	}


	public void setBookAmountAll(int bookAmountAll) {
		this.bookAmountAll = bookAmountAll;
	}


	public int getBookAmountMonth() {
		return bookAmountMonth;
	}


	public void setBookAmountMonth(int bookAmountMonth) {
		this.bookAmountMonth = bookAmountMonth;
	}


	public int getRptCount() {
		return rptCount;
	}


	public void setRptCount(int rptCount) {
		this.rptCount = rptCount;
	}


	public int getLikeCount() {
		return likeCount;
	}


	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	
	


	public String getGrName() {
		return grName;
	}


	public void setGrName(String grName) {
		this.grName = grName;
	}


	@Override
	public String toString() {
		return "Member [memNo=" + memNo + ", grNo=" + grNo + ", memId=" + memId + ", memPwd=" + memPwd + ", memName="
				+ memName + ", memIdNo=" + memIdNo + ", memPhone=" + memPhone + ", memMail=" + memMail + ", memProfile="
				+ memProfile + ", memEnrollDate=" + memEnrollDate + ", memModifyDate=" + memModifyDate + ", memStatus="
				+ memStatus + ", memAdmFlag=" + memAdmFlag + "]";
	}
	
	
	

}
