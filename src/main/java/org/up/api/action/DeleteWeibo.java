package org.up.api.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ActionSupport;

@Action(value = "/weibo/*/delete", params = { "id", "{1}" }, results = {
		@Result(name = "success", type = "json", params = { "excludeProperties", "pictures.*\\.weibo", "encoding", "UTF-8" }) })
public class DeleteWeibo extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

}
