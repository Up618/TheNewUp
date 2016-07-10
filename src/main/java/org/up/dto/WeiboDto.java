package org.up.dto;

import org.up.model.Weibo;

public class WeiboDto {

	private Weibo weibo;
	private Boolean iLike;

	public WeiboDto(Weibo weibo, Boolean iLike) {
		super();
		this.weibo = weibo;
		this.iLike = iLike;
	}
	
	public WeiboDto(Weibo weibo, String iLike) {
		super();
		this.weibo = weibo;
		this.iLike = new Boolean(iLike);
	}

	public Weibo getWeibo() {
		return weibo;
	}

	public void setWeibo(Weibo weibo) {
		this.weibo = weibo;
	}

	public Boolean getiLike() {
		return iLike;
	}

	public void setiLike(Boolean iLike) {
		this.iLike = iLike;
	}
}
