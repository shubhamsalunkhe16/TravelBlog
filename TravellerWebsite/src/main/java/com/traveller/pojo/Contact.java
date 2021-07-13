package com.traveller.pojo;

public class Contact {
	private int contId;
	private String contName;
	private String contEmail;
	private String contSubject;
	private String contMessage;

	public int getContId() {
		return contId;
	}

	public void setContId(int contId) {
		this.contId = contId;
	}

	public String getContName() {
		return contName;
	}

	public void setContName(String contName) {
		this.contName = contName;
	}

	public String getContEmail() {
		return contEmail;
	}

	public void setContEmail(String contEmail) {
		this.contEmail = contEmail;
	}

	public String getContSubject() {
		return contSubject;
	}

	public void setContSubject(String contSubject) {
		this.contSubject = contSubject;
	}

	public String getContMessage() {
		return contMessage;
	}

	public void setContMessage(String contMessage) {
		this.contMessage = contMessage;
	}

	@Override
	public String toString() {
		return "Contact [contId=" + contId + ", contName=" + contName + ", contEmail=" + contEmail + ", contSubject="
				+ contSubject + ", contMessage=" + contMessage + "]";
	}

	public Contact(int contId, String contName, String contEmail, String contSubject, String contMessage) {
		super();
		this.contId = contId;
		this.contName = contName;
		this.contEmail = contEmail;
		this.contSubject = contSubject;
		this.contMessage = contMessage;
	}

	public Contact(String contName, String contEmail, String contSubject, String contMessage) {
		super();

		this.contName = contName;
		this.contEmail = contEmail;
		this.contSubject = contSubject;
		this.contMessage = contMessage;
	}
}
