package com.traveller.pojo;

public class Categories {
	private int cId;
	private String cName;
	private String cDesc;

	@Override
	public String toString() {
		return "Categories [cId=" + cId + ", cName=" + cName + ", cDesc=" + cDesc + "]";
	}

	public Categories(int cId, String cName, String cDesc) {
		super();
		this.cId = cId;
		this.cName = cName;
		this.cDesc = cDesc;
	}

	public int getcId() {
		return cId;
	}

	public void setcId(int cId) {
		this.cId = cId;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public String getcDesc() {
		return cDesc;
	}

	public void setcDesc(String cDesc) {
		this.cDesc = cDesc;
	}

}
