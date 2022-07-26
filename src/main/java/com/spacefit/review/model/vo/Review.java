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
		this.ReviewEnrollDdate = reviewEnrollDdate;
		this.ReviewModifyDate = reviewModifyDate;
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
	
	public Review(int reviewNo, int bookNo, String spaceNo, String memNo, String reviewContent, int reviewStar) {
		super();
		this.reviewNo = reviewNo;
		this.bookNo = bookNo;
		this.spaceNo = spaceNo;
		this.memNo = memNo;
		this.reviewContent = reviewContent;
		this.reviewStar = reviewStar;
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
	
	
	// 이 부분부터 Admin 후기리스트 관련 vo
	private int allRptCount;
	private int grNo;
	

	public int getAllRptCount() {
		return allRptCount;
	}


	public void setAllRptCount(int allRptCount) {
		this.allRptCount = allRptCount;
	}

	

	public int getGrNo() {
		return grNo;
	}


	public void setGrNo(int grNo) {
		this.grNo = grNo;
	}


	public Review(int reviewNo,  String memId, String spaceName, int reviewStar, String bookDate, 
			 int allLikeCount, int allRptCount  ,String reviewStatus, Date reviewEnrollDate) {
		super();
		this.reviewNo = reviewNo;
		this.memId = memId;
		this.spaceName = spaceName;
		this.reviewStar = reviewStar;
		this.bookDate = bookDate;
		this.allLikeCount = allLikeCount;
		this.allRptCount = allRptCount;
		this.reviewStatus = reviewStatus;
		this.ReviewEnrollDdate = reviewEnrollDate;
	}
	
	

	public Review(int reviewNo, int bookNo, String spaceName, String memId, int reviewStar, String reviewContent,
			Date reviewEnrollDate, Date reviewModifyDate, String bookDate, int grNo, int allLikeCount, int allRptCount,
			String reviewStatus /*,String spaceNo*/) {
		super();
		this.reviewNo = reviewNo;
		this.bookNo = bookNo;
		this.spaceName = spaceName;
		this.memId = memId;
		this.reviewStar = reviewStar;
		this.reviewContent = reviewContent;
		ReviewEnrollDdate = reviewEnrollDate;
		ReviewModifyDate = reviewModifyDate;
		this.bookDate = bookDate;
		this.grNo = grNo;
		this.allLikeCount = allLikeCount;
		this.allRptCount = allRptCount;
		this.reviewStatus = reviewStatus;
		//this.spaceNo = spaceNo;
	}


	// 이 부분부터 공간별 후기리스트 관련 vo
	private String memId;
	private String gradeName;
	private String spaceName;
	private int allLikeCount;
	private String filePath;
	private String fileChangeName;
	
	
	
	

	public String getFilePath() {
		return filePath;
	}


	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	
	

	public Review(String filePath, String fileChangeName) {
		super();
		this.filePath = filePath;
		this.fileChangeName = fileChangeName;
	}


	public String getFileChangeName() {
		return fileChangeName;
	}


	public void setFileChangeName(String fileChangeName) {
		this.fileChangeName = fileChangeName;
	}


	public Review(int reviewNo, int bookNo, String spaceName, String memId, String reviewContent, Date reviewEnrollDdate,
			Date reviewModifyDate, int reviewStar, String reviewStatus, String gradeName, int allLikeCount, String memNo) {
		super();
		this.reviewNo = reviewNo;
		this.bookNo = bookNo;
		this.spaceName = spaceName;
		this.memId = memId;
		this.reviewContent = reviewContent;
		ReviewEnrollDdate = reviewEnrollDdate;
		ReviewModifyDate = reviewModifyDate;
		this.reviewStar = reviewStar;
		this.reviewStatus = reviewStatus;
		this.gradeName = gradeName;
		this.allLikeCount = allLikeCount;
		this.memNo = memNo;
	}
	
	public Review(int reviewNo, int bookNo, String spaceName, String memId, String reviewContent, Date reviewEnrollDdate,
			Date reviewModifyDate, int reviewStar, String reviewStatus, String gradeName, int allLikeCount, String memNo, String filePath, String fileChangeName) {
		super();
		this.reviewNo = reviewNo;
		this.bookNo = bookNo;
		this.spaceName = spaceName;
		this.memId = memId;
		this.reviewContent = reviewContent;
		ReviewEnrollDdate = reviewEnrollDdate;
		ReviewModifyDate = reviewModifyDate;
		this.reviewStar = reviewStar;
		this.reviewStatus = reviewStatus;
		this.gradeName = gradeName;
		this.allLikeCount = allLikeCount;
		this.memNo = memNo;
		this.filePath = filePath;
		this.fileChangeName = fileChangeName;
	}



	public String getMemId() {
		return memId;
	}


	public void setMemId(String memId) {
		this.memId = memId;
	}


	public String getGradeName() {
		return gradeName;
	}


	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}


	public String getSpaceName() {
		return spaceName;
	}


	public void setSpaceName(String spaceName) {
		this.spaceName = spaceName;
	}


	public int getAllLikeCount() {
		return allLikeCount;
	}


	public void setAllLikeCount(int allLikeCount) {
		this.allLikeCount = allLikeCount;
	}
	
	
	
	
	
	
	
	
	
}
