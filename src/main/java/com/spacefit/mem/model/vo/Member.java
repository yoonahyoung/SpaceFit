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
	
	
	public Member() {
		
	}
	public Member(int memNo, int grNo, String memId, String memPwd, String memName, String memIdNo, String memPhone,
			String memMail, String memProfile, Date memEnrollDate, Date memModifyDate, String memStatus) {
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
	
	@Override
	public String toString() {
		return "Member [memNo=" + memNo + ", grNo=" + grNo + ", memId=" + memId + ", memPwd=" + memPwd + ", memName="
				+ memName + ", memIdNo=" + memIdNo + ", memPhone=" + memPhone + ", memMail=" + memMail + ", memProfile="
				+ memProfile + ", memEnrollDate=" + memEnrollDate + ", memModifyDate=" + memModifyDate + ", memStatus="
				+ memStatus + "]";
	}
	
	

}
