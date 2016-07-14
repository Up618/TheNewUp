package org.up.admin.action;

import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.up.weibo.service.IWeiboService;
import com.opensymphony.xwork2.ActionSupport;

//@Results({@Result(name="success",type="redirectAction",params={"namespace","/","actionName","index"})})
public class DeleteWeiboAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Long weibo_id; // 接收前段传来的weibo_id
	
	@Autowired
	private IWeiboService weiboService;

	@Override
	public String execute() throws Exception {
		weibo_id = getWeibo_id();
		System.out.println(weibo_id);
		weiboService.deleteWeiboById(weibo_id);
		return SUCCESS;
	}
	
	public Long getWeibo_id() {
		return weibo_id;
	}

	public void setWeibo_id(Long weibo_id) {
		this.weibo_id = weibo_id;
	}
}
