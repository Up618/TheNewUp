package org.up.api.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.up.model.Picture;
import org.up.picture.service.IPictureService;

import com.opensymphony.xwork2.ActionSupport;

@Action(value = "/weibo/*/picture", params = { "id", "{1}" }, results = {
		@Result(name = "success", type = "json", params = { "excludeProperties", "pictures.*\\.weibo", "encoding", "UTF-8" }) })
public class WeiboPictureAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Autowired
	private IPictureService pictureService;
	private Long id;
	private List<Picture> pictures;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public List<Picture> getPictures() {
		return pictures;
	}

	public void setPictures(List<Picture> pictures) {
		this.pictures = pictures;
	}

	@Override
	public String execute() throws Exception {
		pictures = pictureService.getPicturesByWeiboId(id);
		return SUCCESS;
	}
	
	
}
