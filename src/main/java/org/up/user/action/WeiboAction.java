package org.up.user.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.up.dto.WeiboDto;
import org.up.weibo.service.IWeiboDtoService;

import com.opensymphony.xwork2.ActionSupport;

@Action(value = "*/weibo", params = { "id", "{1}" })
@Results({ @Result(name = "success", location = "/user/weibo.ftl") })
public class WeiboAction extends ActionSupport {

	/**
	 * 
	 */
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
		weibos = weiboDtoService.getWeiboDtoByUserId(id, page, 10);
		return SUCCESS;
	}
}
