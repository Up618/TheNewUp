package org.up.admin.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.up.model.Weibo;
import org.up.weibo.service.IWeiboService;
import com.opensymphony.xwork2.ActionSupport;

@Action(value = "deleteWeibo")
@Result(name = "success", location = "/admin/viewWeibo.ftl")
public class DeleteWeiboAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Long weibo_id; // 接收前段传来的weibo_id
	private List<Weibo> weibos;
	
	@Autowired
	private IWeiboService weiboService;	

	@Override
	public String execute() throws Exception {
		System.out.println("execute");
		System.out.println(weibo_id);
		weiboService.deleteWeiboById(weibo_id);
		
		weibos = weiboService.getAllWeibo(1, 10);
		return SUCCESS;
	}
	
	public List<Weibo> getWeibos() {
		return weibos;
	}

	public void setWeibos(List<Weibo> weibos) {
		this.weibos = weibos;
	}
	
	public Long getWeibo_id() {
		return weibo_id;
	}

	public void setWeibo_id(Long weibo_id) {
		this.weibo_id = weibo_id;
	}
}
