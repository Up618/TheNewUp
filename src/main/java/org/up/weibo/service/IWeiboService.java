package org.up.weibo.service;

import java.util.List;

import org.up.model.Weibo;
import org.up.model.User;

public interface IWeiboService {
	public List<Weibo> getWeiboByUsername(String username);
	public List<Weibo> getWeiboByNickname(String nickname);
	public List<Weibo> getWeiboByUserId(Long userId);
	public Weibo loadWeiboById(Long id);
	public List<Weibo> getWeiboByCurrentUsername(String username);
	public List<Weibo> getWeiboByCurrentNickname(String nickname);
	public List<Weibo> getWeiboByCurrentUserId(Long userId);
	public List<Weibo> getWeiboByUser(User user);
	public Long addWeibo(Weibo weibo);
	public Long countWeiboByUsername(String username);
	public Long countWeiboByUser(User user);
	public Long countWeiboByUserId(Long userId);
	public Long countWeiboByNickname(String nickname);
	public void deleteWeibo(Weibo weibo);
	public void deleteWeiboById(Long id);
}
