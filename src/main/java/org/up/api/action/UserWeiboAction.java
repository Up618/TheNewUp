package org.up.api.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.up.dto.WeiboDto;
import org.up.model.Weibo;
import org.up.weibo.service.IWeiboDtoService;
import org.up.weibo.service.IWeiboService;

import com.opensymphony.xwork2.ActionSupport;

@Action(value = "/user/*/weibo", params = { "id", "{1}" }, results = {
		@Result(name = "success", type = "json", params = { "excludeProperties","weibos.*.user","encoding", "UTF-8" }) })
public class UserWeiboAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Long id;
	private Integer page;
	private List<WeiboDto> weibos;
	@Autowired
	private IWeiboDtoService weiboDtoService;

	@Override
	public String execute() throws Exception {
		weibos = weiboDtoService.getWeiboDtoByUserId(id, page, 10);
		return SUCCESS;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public List<WeiboDto> getWeibos() {
		return weibos;
	}

	public void setWeibos(List<WeiboDto> weibos) {
		this.weibos = weibos;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

}
