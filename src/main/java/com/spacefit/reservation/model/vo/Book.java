package com.spacefit.reservation.model.vo;

import java.sql.Date;

public class Book {
		
	private int bookNo;
	private String spaceNo; // 공간번호 | 공간이름
	private String memberNo;  // 회원번호 | 회원아이디
	private String payListId;
	private int bookCount; // 예약인원 | 예약건수
	private String bookDate; // 예약날짜 | 예약월 
	private String bookInTime;
	private String bookOutTime;
	private int bookPrice; // 총 결제금액
	private String bookName;
	private String bookPhone;
	private String bookEmail;
	private String bookPurpose;
	private String bookAddContent;
	private String bookCar;
	private String bookAnimal;
	private String bookChair;
	private String bookStand;
	private Date bookCreateDate;
	private Date bookModifyDate;
	private String bookStatus;
	private String bookCategory;
	private String bookCancleReason;
	private String bookCancelContent;
	private String payAmount; // 쿠폰사용전 금액 -- pay테이블에 varchar2로 되어있어서 string으로 했음
    private String spacePicture; // 공간대표이미지   
    private int bookDecimalDay; // 대여날짜까지 d-day
    private int spaceLimit;
   // private int bookMonth; // 관리자용 예약월
       
        
    public Book() {}
	
    
	public Book(int bookCount, String bookDate) {
	super();
	this.bookCount = bookCount;
	this.bookDate = bookDate;
	}


	public Book(int bookNo, String spaceNo, String memberNo, String payListId, int bookCount, String bookDate,
			String bookInTime, String bookOutTime, int bookPrice, String bookName, String bookPhone, String bookEmail,
			String bookPurpose, String bookAddContent, String bookCar, String bookAnimal, String bookChair,
			String bookStand, Date bookCreateDate, Date bookModifyDate, String bookStatus, String bookCategory,
			String bookCancleReason, String bookCancelContent, String payAmount, String spacePicture,
			int bookDecimalDay) {
		super();
		this.bookNo = bookNo;
		this.spaceNo = spaceNo;
		this.memberNo = memberNo;
		this.payListId = payListId;
		this.bookCount = bookCount;
		this.bookDate = bookDate;
		this.bookInTime = bookInTime;
		this.bookOutTime = bookOutTime;
		this.bookPrice = bookPrice;
		this.bookName = bookName;
		this.bookPhone = bookPhone;
		this.bookEmail = bookEmail;
		this.bookPurpose = bookPurpose;
		this.bookAddContent = bookAddContent;
		this.bookCar = bookCar;
		this.bookAnimal = bookAnimal;
		this.bookChair = bookChair;
		this.bookStand = bookStand;
		this.bookCreateDate = bookCreateDate;
		this.bookModifyDate = bookModifyDate;
		this.bookStatus = bookStatus;
		this.bookCategory = bookCategory;
		this.bookCancleReason = bookCancleReason;
		this.bookCancelContent = bookCancelContent;
		this.payAmount = payAmount;
		this.spacePicture = spacePicture;
		this.bookDecimalDay = bookDecimalDay;
	}




	public Book(int bookNo, String spaceNo, String bookDate, String bookInTime, String bookOutTime, int bookPrice,
			String bookCategory, String spacePicture) {
		super();
		this.bookNo = bookNo;
		this.spaceNo = spaceNo;
		this.bookDate = bookDate;
		this.bookInTime = bookInTime;
		this.bookOutTime = bookOutTime;
		this.bookPrice = bookPrice;
		this.bookCategory = bookCategory;
		this.spacePicture = spacePicture;
	}

	public Book(int bookNo, String spaceNo, String memberNo, int bookCount, String bookDate, String bookInTime,
			String bookOutTime, int bookPrice, String bookName, String bookPhone, String bookEmail, String bookPurpose,
			String bookAddContent, String bookCar, String bookAnimal, String bookChair, String bookStand,
			Date bookCreateDate, String bookCategory, String bookCancleReason,
			String bookCancelContent, String payAmount, int bookDecimalDay, int spaceLimit) {
		super();
		this.bookNo = bookNo;
		this.spaceNo = spaceNo;
		this.memberNo = memberNo;
		this.bookCount = bookCount;
		this.bookDate = bookDate;
		this.bookInTime = bookInTime;
		this.bookOutTime = bookOutTime;
		this.bookPrice = bookPrice;
		this.bookName = bookName;
		this.bookPhone = bookPhone;
		this.bookEmail = bookEmail;
		this.bookPurpose = bookPurpose;
		this.bookAddContent = bookAddContent;
		this.bookCar = bookCar;
		this.bookAnimal = bookAnimal;
		this.bookChair = bookChair;
		this.bookStand = bookStand;
		this.bookCreateDate = bookCreateDate;		
		this.bookCategory = bookCategory;
		this.bookCancleReason = bookCancleReason;
		this.bookCancelContent = bookCancelContent;
		this.payAmount = payAmount;
		this.bookDecimalDay = bookDecimalDay;
		this.spaceLimit = spaceLimit;
	}
	
	
	
	public Book(int bookNo, int bookCount, String bookName, String bookPhone, String bookEmail, String bookPurpose,
			String bookAddContent, String bookCar, String bookAnimal, String bookChair, String bookStand) {
		super();
		this.bookNo = bookNo;
		this.bookCount = bookCount;
		this.bookName = bookName;
		this.bookPhone = bookPhone;
		this.bookEmail = bookEmail;
		this.bookPurpose = bookPurpose;
		this.bookAddContent = bookAddContent;
		this.bookCar = bookCar;
		this.bookAnimal = bookAnimal;
		this.bookChair = bookChair;
		this.bookStand = bookStand;
	}
	
	public Book(int bookNo, String spaceNo, String memberNo, int bookCount, String bookDate, String bookInTime,
			String bookOutTime, int bookPrice, String bookName, String bookPhone, String bookEmail, String bookCar,
			String bookAnimal, String bookChair, String bookStand) {
		super();
		this.bookNo = bookNo;
		this.spaceNo = spaceNo;
		this.memberNo = memberNo;
		this.bookCount = bookCount;
		this.bookDate = bookDate;
		this.bookInTime = bookInTime;
		this.bookOutTime = bookOutTime;
		this.bookPrice = bookPrice;
		this.bookName = bookName;
		this.bookPhone = bookPhone;
		this.bookEmail = bookEmail;
		this.bookCar = bookCar;
		this.bookAnimal = bookAnimal;
		this.bookChair = bookChair;
		this.bookStand = bookStand;
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

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public String getPayListId() {
		return payListId;
	}

	public void setPayListId(String payListId) {
		this.payListId = payListId;
	}

	public int getBookCount() {
		return bookCount;
	}

	public void setBookCount(int bookCount) {
		this.bookCount = bookCount;
	}

	public String getBookDate() {
		return bookDate;
	}

	public void setBookDate(String bookDate) {
		this.bookDate = bookDate;
	}

	public String getBookInTime() {
		return bookInTime;
	}

	public void setBookInTime(String bookInTime) {
		this.bookInTime = bookInTime;
	}

	public String getBookOutTime() {
		return bookOutTime;
	}

	public void setBookOutTime(String bookOutTime) {
		this.bookOutTime = bookOutTime;
	}

	public int getBookPrice() {
		return bookPrice;
	}

	public void setBookPrice(int bookPrice) {
		this.bookPrice = bookPrice;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getBookPhone() {
		return bookPhone;
	}

	public void setBookPhone(String bookPhone) {
		this.bookPhone = bookPhone;
	}

	public String getBookEmail() {
		return bookEmail;
	}

	public void setBookEmail(String bookEmail) {
		this.bookEmail = bookEmail;
	}

	public String getBookPurpose() {
		return bookPurpose;
	}

	public void setBookPurpose(String bookPurpose) {
		this.bookPurpose = bookPurpose;
	}

	public String getBookAddContent() {
		return bookAddContent;
	}

	public void setBookAddContent(String bookAddContent) {
		this.bookAddContent = bookAddContent;
	}

	public String getBookCar() {
		return bookCar;
	}

	public void setBookCar(String bookCar) {
		this.bookCar = bookCar;
	}

	public String getBookAnimal() {
		return bookAnimal;
	}

	public void setBookAnimal(String bookAnimal) {
		this.bookAnimal = bookAnimal;
	}

	public String getBookChair() {
		return bookChair;
	}

	public void setBookChair(String bookChair) {
		this.bookChair = bookChair;
	}

	public String getBookStand() {
		return bookStand;
	}

	public void setBookStand(String bookStand) {
		this.bookStand = bookStand;
	}

	public Date getBookCreateDate() {
		return bookCreateDate;
	}

	public void setBookCreateDate(Date bookCreateDate) {
		this.bookCreateDate = bookCreateDate;
	}

	public Date getBookModifyDate() {
		return bookModifyDate;
	}

	public void setBookModifyDate(Date bookModifyDate) {
		this.bookModifyDate = bookModifyDate;
	}

	public String getBookStatus() {
		return bookStatus;
	}

	public void setBookStatus(String bookStatus) {
		this.bookStatus = bookStatus;
	}

	public String getBookCategory() {
		return bookCategory;
	}

	public void setBookCategory(String bookCategory) {
		this.bookCategory = bookCategory;
	}

	public String getBookCancleReason() {
		return bookCancleReason;
	}

	public void setBookCancleReason(String bookCancleReason) {
		this.bookCancleReason = bookCancleReason;
	}

	public String getBookCancelContent() {
		return bookCancelContent;
	}

	public void setBookCancelContent(String bookCancelContent) {
		this.bookCancelContent = bookCancelContent;
	}

	public String getPayAmount() {
		return payAmount;
	}

	public void setPayAmount(String payAmount) {
		this.payAmount = payAmount;
	}

	public String getSpacePicture() {
		return spacePicture;
	}

	public void setSpacePicture(String spacePicture) {
		this.spacePicture = spacePicture;
	}
	 
	public int getBookDecimalDay() {
		return bookDecimalDay;
	}


	public void setBookDecimalDay(int bookDecimalDay) {
		this.bookDecimalDay = bookDecimalDay;
	}

	
	public int getSpaceLimit() {
		return spaceLimit;
	}


	public void setSpaceLimit(int spaceLimit) {
		this.spaceLimit = spaceLimit;
	}
		
	


	@Override
	public String toString() {
		return "Book [bookNo=" + bookNo + ", spaceNo=" + spaceNo + ", memberNo=" + memberNo + ", payListId=" + payListId
				+ ", bookCount=" + bookCount + ", bookDate=" + bookDate + ", bookInTime=" + bookInTime
				+ ", bookOutTime=" + bookOutTime + ", bookPrice=" + bookPrice + ", bookName=" + bookName
				+ ", bookPhone=" + bookPhone + ", bookEmail=" + bookEmail + ", bookPurpose=" + bookPurpose
				+ ", bookAddContent=" + bookAddContent + ", bookCar=" + bookCar + ", bookAnimal=" + bookAnimal
				+ ", bookChair=" + bookChair + ", bookStand=" + bookStand + ", bookCreateDate=" + bookCreateDate
				+ ", bookModifyDate=" + bookModifyDate + ", bookStatus=" + bookStatus + ", bookCategory=" + bookCategory
				+ ", bookCancleReason=" + bookCancleReason + ", bookCancelContent=" + bookCancelContent + ", payAmount="
				+ payAmount + ", spacePicture=" + spacePicture + ", bookDecimalDay=" + bookDecimalDay + ", spaceLimit="
				+ spaceLimit + "]";
	}




	
	
	
	

    
	
}
