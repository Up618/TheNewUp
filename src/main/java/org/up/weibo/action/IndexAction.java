package org.up.weibo.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.up.dto.WeiboDto;
import org.up.weibo.service.IWeiboDtoService;

import com.opensymphony.xwork2.ActionSupport;

@Results({@Result(name="success",location="/user/weibo.ftl")})
public class IndexAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Autowired
	private IWeiboDtoService weiboDtoService;
	private List<WeiboDto> weibos;
	private Integer page;
	public List<WeiboDto> getWeibos() {
		return weibos;
	}
	public void setWeibos(List<WeiboDto> weibos) {
		this.weibos = weibos;
	}
	@Override
	public String execute() throws Exception {
		String currentUsername;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			currentUsername = ((UserDetails) principal).getUsername();
		} else {
			currentUsername = principal.toString();
		}
		weibos = weiboDtoService.getWeiboDtoByCurrentUsername(currentUsername, page, 10);
		return SUCCESS;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	
}
