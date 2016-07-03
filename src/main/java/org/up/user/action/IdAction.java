package org.up.user.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Actions;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.up.model.User;
import org.up.model.Weibo;
import org.up.user.service.IUserService;
import org.up.weibo.service.IWeiboService;

import com.opensymphony.xwork2.ActionSupport;

@Actions({ @Action(value = "*", params = { "id", "{1}" }),
	@Action(value = "*/weibo", params = { "id", "{1}" }) })
@Results({ @Result(name = "success", location = "/user/id.ftl") })
public class IdAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Long id;
	private User user;
	private List<Weibo> weibos;
	@Autowired
	private IUserService userService;
	@Autowired
	private IWeiboService weiboService;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<Weibo> getWeibos() {
		return weibos;
	}

	public void setWeibos(List<Weibo> weibos) {
		this.weibos = weibos;
	}

	@Override
	public String execute() throws Exception {
		user = userService.loadUserById(id);
		weibos = weiboService.getWeiboByUser(user);
		return SUCCESS;
	}
}
