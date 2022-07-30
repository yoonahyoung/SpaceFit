package com.spacefit.attachment.model.vo;

import java.sql.Date;

public class Attachment {
	
	private int fileNo;
	private int refBoardNo;  
	private int fileCategory;
	private String fileOriginName;
	private String fileChangeName;
	private String filePath;
	private Date fileUploadDate;
	private int fileLevel;
	private String fileStatus;
	
	public Attachment() {}

	public Attachment(int fileNo, int refBoardNo, int fileCategory, String fileOriginName, String fileChangeName,
			String filePath, Date fileUploadDate, int fileLevel, String fileStatus) {
		super();
		this.fileNo = fileNo;
		this.refBoardNo = refBoardNo;
		this.fileCategory = fileCategory;
		this.fileOriginName = fileOriginName;
		this.fileChangeName = fileChangeName;
		this.filePath = filePath;
		this.fileUploadDate = fileUploadDate;
		this.fileLevel = fileLevel;
		this.fileStatus = fileStatus;
	}


	
	public Attachment(int fileNo, String fileOriginName, String fileChangeName, String filePath, int fileLevel) {
		super();
		this.fileNo = fileNo;
		this.fileOriginName = fileOriginName;
		this.fileChangeName = fileChangeName;
		this.filePath = filePath;
		this.fileLevel = fileLevel;
	}

	public Attachment(int fileNo, int refBoardNo, String fileOriginName, String fileChangeName, String filePath) {
		super();
		this.fileNo = fileNo;
		this.refBoardNo = refBoardNo;
		this.fileOriginName = fileOriginName;
		this.fileChangeName = fileChangeName;
		this.filePath = filePath;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public int getRefBoardNo() {
		return refBoardNo;
	}

	public void setRefBoardNo(int refBoardNo) {
		this.refBoardNo = refBoardNo;
	}

	public int getFileCategory() {
		return fileCategory;
	}

	public void setFileCategory(int fileCategory) {
		this.fileCategory = fileCategory;
	}

	public String getFileOriginName() {
		return fileOriginName;
	}

	public void setFileOriginName(String fileOriginName) {
		this.fileOriginName = fileOriginName;
	}

	public String getFileChangeName() {
		return fileChangeName;
	}

	public void setFileChangeName(String fileChangeName) {
		this.fileChangeName = fileChangeName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Date getFileUploadDate() {
		return fileUploadDate;
	}

	public void setFileUploadDate(Date fileUploadDate) {
		this.fileUploadDate = fileUploadDate;
	}

	public int getFileLevel() {
		return fileLevel;
	}

	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}

	public String getFileStatus() {
		return fileStatus;
	}

	public void setFileStatus(String fileStatus) {
		this.fileStatus = fileStatus;
	}

	@Override
	public String toString() {
		return "Attachment [fileNo=" + fileNo + ", refBoardNo=" + refBoardNo + ", fileCategory=" + fileCategory
				+ ", fileOriginName=" + fileOriginName + ", fileChangeName=" + fileChangeName + ", filePath=" + filePath
				+ ", fileUploadDate=" + fileUploadDate + ", fileLevel=" + fileLevel + ", fileStatus=" + fileStatus
				+ "]";
	}
	
	
}
