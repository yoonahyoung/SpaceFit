package com.spacefit.review.model.vo;

import java.sql.Date;

public class Review {
	private int reviewNo;
	private int bookNo; // 예약번호
	private String spaceNo; // 공간번호 | 공간이름
	private String memNo; // 회원번호 | 회원 아이디
	private String reviewContent;
	private Date ReviewEnrollDdate;
	private Date ReviewModifyDate;
	private int reviewStar;
	private String reviewStatus;
	private String bookDate;
	private String mainImgUrl;
	
	public Review() {}

	
	public Review(int reviewNo, int bookNo, String spaceNo, String memNo, String reviewContent, Date reviewEnrollDdate,
			Date reviewModifyDate, int reviewStar, String reviewStatus, String bookDate, String mainImgUrl) {
		super();
		this.reviewNo = reviewNo;
		this.bookNo = bookNo;
		this.spaceNo = spaceNo;
		this.memNo = memNo;
		this.reviewContent = reviewContent;
		ReviewEnrollDdate = reviewEnrollDdate;
		ReviewModifyDate = reviewModifyDate;
		this.reviewStar = reviewStar;
		this.reviewStatus = reviewStatus;
		this.bookDate = bookDate;
		this.mainImgUrl = mainImgUrl;
	}




	public Review(int bookNo, String spaceNo, String memNo, String reviewContent, int reviewStar) {
		super();
		this.bookNo = bookNo;
		this.spaceNo = spaceNo;
		this.memNo = memNo;
		this.reviewContent = reviewContent;
		this.reviewStar = reviewStar;
	}
	
	
	public Review(int reviewNo, String spaceNo, String reviewContent, int reviewStar, String bookDate,
			String mainImgUrl) {
		super();
		this.reviewNo = reviewNo;
		this.spaceNo = spaceNo;
		this.reviewContent = reviewContent;
		this.reviewStar = reviewStar;
		this.bookDate = bookDate;
		this.mainImgUrl = mainImgUrl;
	}


	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public int getBookNo() {
		return bookNo;
	}

	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}

	public String getSpaceNo() {
		return spaceNo;
	}

	public void setSpaceNo(String spaceNo) {
		this.spaceNo = spaceNo;
	}

	public String getMemNo() {
		return memNo;
	}

	public void setMemNo(String memNo) {
		this.memNo = memNo;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public Date getReviewEnrollDdate() {
		return ReviewEnrollDdate;
	}

	public void setReviewEnrollDdate(Date reviewEnrollDdate) {
		ReviewEnrollDdate = reviewEnrollDdate;
	}

	public Date getReviewModifyDate() {
		return ReviewModifyDate;
	}

	public void setReviewModifyDate(Date reviewModifyDate) {
		ReviewModifyDate = reviewModifyDate;
	}

	public int getReviewStar() {
		return reviewStar;
	}

	public void setReviewStar(int reviewStar) {
		this.reviewStar = reviewStar;
	}

	public String getReviewStatus() {
		return reviewStatus;
	}

	public void setReviewStatus(String reviewStatus) {
		this.reviewStatus = reviewStatus;
	}
		

	public String getBookDate() {
		return bookDate;
	}


	public void setBookDate(String bookDate) {
		this.bookDate = bookDate;
	}


	public String getMainImgUrl() {
		return mainImgUrl;
	}


	public void setMainImgUrl(String mainImgUrl) {
		this.mainImgUrl = mainImgUrl;
	}


	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", bookNo=" + bookNo + ", spaceNo=" + spaceNo + ", memNo=" + memNo
				+ ", reviewContent=" + reviewContent + ", ReviewEnrollDdate=" + ReviewEnrollDdate
				+ ", ReviewModifyDate=" + ReviewModifyDate + ", reviewStar=" + reviewStar + ", reviewStatus="
				+ reviewStatus + ", bookDate=" + bookDate + ", mainImgUrl=" + mainImgUrl + "]";
	}


	
	
	
}
