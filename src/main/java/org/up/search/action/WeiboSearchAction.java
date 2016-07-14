package org.up.search.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.up.dto.WeiboDto;
import org.up.weibo.service.IWeiboDtoService;

import com.opensymphony.xwork2.ActionSupport;

@Results({ @Result(name = "success", location = "/search/weiboresult.ftl")})
public class WeiboSearchAction extends ActionSupport{
	private Integer page = 1;
	private String keyword;
	private List<WeiboDto> weibos;
	@Autowired
	private IWeiboDtoService weiboDtoService;
	
	public void setPage(Integer page){
		this.page = page;
	}
	public Integer getPage(){
		return this.page;
	}
	public void setKeyword(String keyword){
		this.keyword = keyword;
	}
	public String getKeyword(){
		return this.keyword;
	}
	public void setWeibos(List<WeiboDto> weibos){
		this.weibos = weibos;
	}
	public List<WeiboDto> getWeibos(){
		return this.weibos;
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
		weibos = weiboDtoService.getWeiboDtoByKeyword(keyword, currentUsername, page, 10);
		return SUCCESS;
	}
}
