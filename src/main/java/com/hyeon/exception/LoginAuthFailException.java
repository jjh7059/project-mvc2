package com.hyeon.exception;

public class LoginAuthFailException extends Exception {
	private static final long serialVersionUID = 1L;
	
	private String email;
	
	public LoginAuthFailException() {
		// TODO Auto-generated constructor stub
	}
	
	public LoginAuthFailException(String message, String email) {
		super(message);
		this.email = email;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
}
