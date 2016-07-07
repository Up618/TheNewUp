package org.up.api.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.up.model.Weibo;
import org.up.weibo.service.IWeiboService;

import com.opensymphony.xwork2.ActionSupport;

@Action(value = "/user/*/weibo", params = { "id", "{1}" }, results = {
		@Result(name = "success", type = "json", params = { "encoding", "UTF-8" }) })
public class UserWeiboAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Long id;
	private Integer page;
	private List<Weibo> weibos;
	@Autowired
	private IWeiboService weiboService;

	@Override
	public String execute() throws Exception {
		weibos = weiboService.getWeiboByUserId(id, page, 10);
		return SUCCESS;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public List<Weibo> getWeibos() {
		return weibos;
	}

	public void setWeibos(List<Weibo> weibos) {
		this.weibos = weibos;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

}
