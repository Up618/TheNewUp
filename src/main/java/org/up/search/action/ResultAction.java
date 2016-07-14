package org.up.search.action;

import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import com.opensymphony.xwork2.ActionSupport;

@Results({ @Result(name = "success", location = "/search/result.ftl"),
		@Result(name = "input", type = "redirectAction", params = { "actionName", "index" }) })
public class ResultAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String keyword;

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public void validate() {
		if(keyword==null||keyword==""||keyword==" "||keyword.equals(""))addFieldError("Keyword","Keyword can not be empty!"); 
	}
	
}
