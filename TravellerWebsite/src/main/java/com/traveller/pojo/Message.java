package com.traveller.pojo;

public class Message {
	private String msg;
	private String type;
	private String bootClass;

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getBootClass() {
		return bootClass;
	}

	public void setBootClass(String bootClass) {
		this.bootClass = bootClass;
	}

	@Override
	public String toString() {
		return "Message [msg=" + msg + ", type=" + type + ", bootClass=" + bootClass + "]";
	}

	public Message(String msg, String type, String bootClass) {
		super();
		this.msg = msg;
		this.type = type;
		this.bootClass = bootClass;
	}

}
