package com.spacefit.mem.model.vo;

import java.sql.Date;

public class Mcp {

	private int cpNo;
	private String cpName;
	private int cpDiscount;
	private Date cpEnrollDate;
	private int mcpNo;
	private int memNo;
	private String mcpStatus;
	private String mcpUse;
	private Date mcpStartDate;
	private Date mcpEndDate;
	
	public Mcp() {}

	public Mcp(int cpNo, String cpName, int cpDiscount, Date cpEnrollDate, int mcpNo, int memNo, String mcpStatus,
			String mcpUse, Date mcpStartDate, Date mcpEndDate) {
		super();
		this.cpNo = cpNo;
		this.cpName = cpName;
		this.cpDiscount = cpDiscount;
		this.cpEnrollDate = cpEnrollDate;
		this.mcpNo = mcpNo;
		this.memNo = memNo;
		this.mcpStatus = mcpStatus;
		this.mcpUse = mcpUse;
		this.mcpStartDate = mcpStartDate;
		this.mcpEndDate = mcpEndDate;
	}
	
	

	public Mcp(String cpName, int cpDiscount, String mcpUse, Date mcpEndDate) {
		super();
		this.cpName = cpName;
		this.cpDiscount = cpDiscount;
		this.mcpUse = mcpUse;
		this.mcpEndDate = mcpEndDate;
	}
	
	

	public Mcp(int cpNo, String cpName, int cpDiscount, Date cpEnrollDate) {
		super();
		this.cpNo = cpNo;
		this.cpName = cpName;
		this.cpDiscount = cpDiscount;
		this.cpEnrollDate = cpEnrollDate;
	}

	public int getCpNo() {
		return cpNo;
	}

	public void setCpNo(int cpNo) {
		this.cpNo = cpNo;
	}

	public String getCpName() {
		return cpName;
	}

	public void setCpName(String cpName) {
		this.cpName = cpName;
	}

	public int getCpDiscount() {
		return cpDiscount;
	}

	public void setCpDiscount(int cpDiscount) {
		this.cpDiscount = cpDiscount;
	}

	public Date getCpEnrollDate() {
		return cpEnrollDate;
	}

	public void setCpEnrollDate(Date cpEnrollDate) {
		this.cpEnrollDate = cpEnrollDate;
	}

	public int getMcpNo() {
		return mcpNo;
	}

	public void setMcpNo(int mcpNo) {
		this.mcpNo = mcpNo;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getMcpStatus() {
		return mcpStatus;
	}

	public void setMcpStatus(String mcpStatus) {
		this.mcpStatus = mcpStatus;
	}

	public String getMcpUse() {
		return mcpUse;
	}

	public void setMcpUse(String mcpUse) {
		this.mcpUse = mcpUse;
	}

	public Date getMcpStartDate() {
		return mcpStartDate;
	}

	public void setMcpStartDate(Date mcpStartDate) {
		this.mcpStartDate = mcpStartDate;
	}

	public Date getMcpEndDate() {
		return mcpEndDate;
	}

	public void setMcpEndDate(Date mcpEndDate) {
		this.mcpEndDate = mcpEndDate;
	}

	@Override
	public String toString() {
		return "Mcp [cpNo=" + cpNo + ", cpName=" + cpName + ", cpDiscount=" + cpDiscount + ", cpEnrollDate="
				+ cpEnrollDate + ", mcpNo=" + mcpNo + ", memNo=" + memNo + ", mcpStatus=" + mcpStatus + ", mcpUse="
				+ mcpUse + ", mcpStartDate=" + mcpStartDate + ", mcpEndDate=" + mcpEndDate + "]";
	}
	
	
}