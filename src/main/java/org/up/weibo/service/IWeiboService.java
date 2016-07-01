package org.up.weibo.service;

import java.util.List;

import org.up.model.Weibo;

public interface IWeiboService {
	public List<Weibo> getWeiboByUsername(String username);
	public List<Weibo> getWeiboByNickname(String nickname);
	public List<Weibo> getWeiboByUserId(Long userId);
	public Weibo loadWeiboById(Long id);
	public List<Weibo> getWeiboByCurrentUsername(String username);
	public List<Weibo> getWeiboByCurrentNickname(String nickname);
	public List<Weibo> getWeiboByCurrentUserId(Long userId);
	public Long addWeibo(Weibo weibo);
	public void deleteWeibo(Weibo weibo);
	public void deleteWeiboById(Long id);
}
