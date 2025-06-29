package com.nivesh.exception;

public class SigninException extends BaseException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public SigninException(String errCode,String message) {
		super(errCode,message);
	}
//	public SigninException(String errCode) {
//		super(errCode);
//	}
}
