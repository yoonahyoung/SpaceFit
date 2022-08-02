package com.spacefit.mem.model.vo;

public class Cart {
	private int memNo;
	private int spaceNo;
	private int cartLimit;
	private String cartDate;
	private String	cartIn;
	private String cartOut;
	private String cartParking;
	private String cartAnimal;
	private String cartStand;
	private String cartChair;
	private int cartPrice;
	
	// -------- 보관함 조회를 위해 필요한 것들
	private String spaceName;
	private int spaceLimit;
	private String spacePic;
	
	public Cart() {}

	public Cart(int memNo, int spaceNo, int cartLimit, String cartDate, String cartIn, String cartOut,
			String cartParking, String cartAnimal, String cartStand, String cartChair, int cartPrice) {
		super();
		this.memNo = memNo;
		this.spaceNo = spaceNo;
		this.cartLimit = cartLimit;
		this.cartDate = cartDate;
		this.cartIn = cartIn;
		this.cartOut = cartOut;
		this.cartParking = cartParking;
		this.cartAnimal = cartAnimal;
		this.cartStand = cartStand;
		this.cartChair = cartChair;
		this.cartPrice = cartPrice;
	}
	
	public Cart(int memNo, int spaceNo, int cartLimit, String cartDate, String cartIn, String cartOut,
			String cartParking, String cartAnimal, String cartStand, String cartChair, int cartPrice, String spaceName,
			int spaceLimit) {
		super();
		this.memNo = memNo;
		this.spaceNo = spaceNo;
		this.cartLimit = cartLimit;
		this.cartDate = cartDate;
		this.cartIn = cartIn;
		this.cartOut = cartOut;
		this.cartParking = cartParking;
		this.cartAnimal = cartAnimal;
		this.cartStand = cartStand;
		this.cartChair = cartChair;
		this.cartPrice = cartPrice;
		this.spaceName = spaceName;
		this.spaceLimit = spaceLimit;
	}
	
	public Cart(int memNo, int spaceNo, int cartLimit, String cartDate, String cartIn, String cartOut,
			String cartParking, String cartAnimal, String cartStand, String cartChair, int cartPrice, String spaceName,
			int spaceLimit, String spacePic) {
		super();
		this.memNo = memNo;
		this.spaceNo = spaceNo;
		this.cartLimit = cartLimit;
		this.cartDate = cartDate;
		this.cartIn = cartIn;
		this.cartOut = cartOut;
		this.cartParking = cartParking;
		this.cartAnimal = cartAnimal;
		this.cartStand = cartStand;
		this.cartChair = cartChair;
		this.cartPrice = cartPrice;
		this.spaceName = spaceName;
		this.spaceLimit = spaceLimit;
		this.spacePic = spacePic;
	}

	public String getSpacePic() {
		return spacePic;
	}

	public void setSpacePic(String spacePic) {
		this.spacePic = spacePic;
	}

	public String getSpaceName() {
		return spaceName;
	}

	public void setSpaceName(String spaceName) {
		this.spaceName = spaceName;
	}

	public int getSpaceLimit() {
		return spaceLimit;
	}

	public void setSpaceLimit(int spaceLimit) {
		this.spaceLimit = spaceLimit;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public int getSpaceNo() {
		return spaceNo;
	}

	public void setSpaceNo(int spaceNo) {
		this.spaceNo = spaceNo;
	}

	public int getCartLimit() {
		return cartLimit;
	}

	public void setCartLimit(int cartLimit) {
		this.cartLimit = cartLimit;
	}

	public String getCartDate() {
		return cartDate;
	}

	public void setCartDate(String cartDate) {
		this.cartDate = cartDate;
	}

	public String getCartIn() {
		return cartIn;
	}

	public void setCartIn(String cartIn) {
		this.cartIn = cartIn;
	}

	public String getCartOut() {
		return cartOut;
	}

	public void setCartOut(String cartOut) {
		this.cartOut = cartOut;
	}

	public String getCartParking() {
		return cartParking;
	}

	public void setCartParking(String cartParking) {
		this.cartParking = cartParking;
	}

	public String getCartAnimal() {
		return cartAnimal;
	}

	public void setCartAnimal(String cartAnimal) {
		this.cartAnimal = cartAnimal;
	}

	public String getCartStand() {
		return cartStand;
	}

	public void setCartStand(String cartStand) {
		this.cartStand = cartStand;
	}

	public String getCartChair() {
		return cartChair;
	}

	public void setCartChair(String cartChair) {
		this.cartChair = cartChair;
	}

	public int getCartPrice() {
		return cartPrice;
	}

	public void setCartPrice(int cartPrice) {
		this.cartPrice = cartPrice;
	}

	@Override
	public String toString() {
		return "Cart [memNo=" + memNo + ", spaceNo=" + spaceNo + ", cartLimit=" + cartLimit + ", cartDate=" + cartDate
				+ ", cartIn=" + cartIn + ", cartOut=" + cartOut + ", cartParking=" + cartParking + ", cartAnimal="
				+ cartAnimal + ", cartStand=" + cartStand + ", cartChair=" + cartChair + ", cartPrice=" + cartPrice
				+ "]";
	}

	
}
