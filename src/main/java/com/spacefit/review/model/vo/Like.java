package com.spacefit.review.model.vo;

import java.sql.Date;

public class Like {
	private int likeNo;
	private int memNo;
	private Date likeDate;
	private int rvNo;
	
	public Like() {
		
	}
	
	public Like(int likeNo, int memNo, Date likeDate, int rvNo) {
		super();
		this.likeNo = likeNo;
		this.memNo = memNo;
		this.likeDate = likeDate;
		this.rvNo = rvNo;
	}

	public int getLikeNo() {
		return likeNo;
	}

	public void setLikeNo(int likeNo) {
		this.likeNo = likeNo;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public Date getLikeDate() {
		return likeDate;
	}

	public void setLikeDate(Date likeDate) {
		this.likeDate = likeDate;
	}

	public int getRvNo() {
		return rvNo;
	}

	public void setRvNo(int rvNo) {
		this.rvNo = rvNo;
	}

	@Override
	public String toString() {
		return "Like [likeNo=" + likeNo + ", memNo=" + memNo + ", likeDate=" + likeDate + ", rvNo=" + rvNo + "]";
	}
	
	
	
	
}
