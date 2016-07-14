package org.up.api.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.up.weibo.service.IWeiboService;

import com.opensymphony.xwork2.ActionSupport;

@Action(value = "/weibo/delete", results = {
		@Result(name = "success", type = "json", params = { "encoding", "UTF-8" }) })
public class DeleteWeibo extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Long id;
	private Boolean delete;
	@Autowired
	private IWeiboService weiboService;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Boolean getDelete() {
		return delete;
	}

	public void setDelete(Boolean delete) {
		this.delete = delete;
	}

	@Override
	public String execute() throws Exception {
		try {
			weiboService.deleteWeiboById(id);
		} catch (Exception e) {
			delete = false;
		}
		delete = true;
		return SUCCESS;
	}

}
