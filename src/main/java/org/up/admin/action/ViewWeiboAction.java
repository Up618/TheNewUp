package org.up.admin.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.up.model.Weibo;
import org.up.weibo.service.IWeiboService;
import com.opensymphony.xwork2.ActionSupport;

/*
 * 管理员查看微博的Action。管理员端因为不需要判断是否点赞，用的微博实体是Weibo。
 */

//@Action(value = "*/weibo", params = { "id", "{1}" })
//@Result(name = "success", location = "/admin/weibo.ftl")
public class ViewWeiboAction extends ActionSupport {
	
	/**
	 * 
	 */
	
	private static final long serialVersionUID = 1L;
	private Long id;
	private Integer page = 1;
	private List<Weibo> weibos;
	@Autowired
	private IWeiboService weiboService;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public List<Weibo> getWeibos() {
		return weibos;
	}

	public void setWeibos(List<Weibo> weibos) {
		this.weibos = weibos;
	}

	public String execute() throws Exception {
		weibos = weiboService.getAllWeibo(page, 10);
		return SUCCESS;
	}

}
