package org.up.agree.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.up.dto.WeiboDto;
import org.up.weibo.service.IWeiboDtoService;

import com.opensymphony.xwork2.ActionSupport;

/*
 * 复用 ./user/action/WeiboAction.java
 * 我赞过的微博Action，列出当前登录用户的点赞微博，而非任意用户的点赞微博。
 * 本Action作用在于获得用户点赞过的微博列表，获得用户见IdLikedWeiboAction.java
 */

@Action(value = "*-liked-weibo/liked-weibo", params = { "id", "{1}" })
@Results({ @Result(name = "success", location = "/user/weibo.ftl") })
public class LikedWeiboAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	private Long id;
	private Integer page = 1;
	private List<WeiboDto> weibos;
	@Autowired
	private IWeiboDtoService weiboDtoService;

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

	public List<WeiboDto> getWeibos() {
		return weibos;
	}

	public void setWeibos(List<WeiboDto> weibos) {
		this.weibos = weibos;
	}

	@Override
	public String execute() throws Exception {
		weibos = weiboDtoService.getWeiboDtoByUserLiked(id, page, 10);
		return SUCCESS;
	}
}