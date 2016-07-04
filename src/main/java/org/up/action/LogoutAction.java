package org.up.action;

import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import com.opensymphony.xwork2.ActionSupport;

@Results({ @Result(name = "success", type = "redirectAction", location = "login") })
public class LogoutAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

}
