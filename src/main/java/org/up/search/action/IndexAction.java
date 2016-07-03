package org.up.search.action;

import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import com.opensymphony.xwork2.ActionSupport;


@Results({ @Result(name = "success", location = "/search/result.ftl"),
	@Result(name = "input", location = "/search/index,ftl") })
public class IndexAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

}
