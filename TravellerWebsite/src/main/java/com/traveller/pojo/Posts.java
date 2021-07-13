package com.traveller.pojo;

import java.sql.Timestamp;

public class Posts {
	private int pid;
	private String pTitle;
	private String pDesc;
	private String pPic;
	private Timestamp pDate;
	private int catId;
	private int uId;
	private String pLocation;

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getpTitle() {
		return pTitle;
	}

	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}

	public String getpDesc() {
		return pDesc;
	}

	public void setpDesc(String pDesc) {
		this.pDesc = pDesc;
	}

	public String getpPic() {
		return pPic;
	}

	public void setpPic(String pPic) {
		this.pPic = pPic;
	}

	public Timestamp getpDate() {
		return pDate;
	}

	public void setpDate(Timestamp pDate) {
		this.pDate = pDate;
	}

	public int getCatId() {
		return catId;
	}

	public void setCatId(int catId) {
		this.catId = catId;
	}

	public int getuId() {
		return uId;
	}

	public void setuId(int uId) {
		this.uId = uId;
	}

	public String getpLocation() {
		return pLocation;
	}

	public void setpLocation(String pLocation) {
		this.pLocation = pLocation;
	}

	public Posts(int pid, String pTitle, String pDesc, String pPic, Timestamp pDate, int catId, int uId,
			String pLocation) {
		super();
		this.pid = pid;
		this.pTitle = pTitle;
		this.pDesc = pDesc;
		this.pPic = pPic;
		this.pDate = pDate;
		this.catId = catId;
		this.uId = uId;
		this.pLocation = pLocation;
	}

	public Posts(String pTitle, String pDesc, String pPic, int catId, int uId, String pLocation) {
		super();
		this.pTitle = pTitle;
		this.pDesc = pDesc;
		this.pPic = pPic;
		this.catId = catId;
		this.uId = uId;
		this.pLocation = pLocation;
	}

	@Override
	public String toString() {
		return "Posts [pid=" + pid + ", pTitle=" + pTitle + ", pDesc=" + pDesc + ", pPic=" + pPic + ", pDate=" + pDate
				+ ", catId=" + catId + ", uId=" + uId + ", pLocation=" + pLocation + "]";
	}

}
