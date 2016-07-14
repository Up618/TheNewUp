package org.up.weibo.service;

import java.util.List;

import org.up.model.Weibo;
import org.up.model.User;

public interface IWeiboService {
	public List<Weibo> getAllWeibo(Integer page, Integer rows);
	public List<Weibo> getWeiboByUsername(String username);
	public List<Weibo> getWeiboByNickname(String nickname);
	public List<Weibo> getWeiboByUserId(Long userId);
	public List<Weibo> getWeiboByUsername(String username, Integer page, Integer rows);
	public List<Weibo> getWeiboByNickname(String nickname, Integer page, Integer rows);
	public List<Weibo> getWeiboByUserId(Long userId, Integer page, Integer rows);
	public Weibo loadWeiboById(Long id);
	public List<Weibo> getWeiboByCurrentUsername(String username);
	public List<Weibo> getWeiboByCurrentNickname(String nickname);
	public List<Weibo> getWeiboByCurrentUserId(Long userId);
	public List<Weibo> getWeiboByUser(User user);
	public List<Weibo> getWeiboByCurrentUsername(String username, Integer page, Integer rows);
	public List<Weibo> getWeiboByCurrentNickname(String nickname, Integer page, Integer rows);
	public List<Weibo> getWeiboByCurrentUserId(Long userId, Integer page, Integer rows);
	public List<Weibo> getWeiboByUser(User user, Integer page, Integer rows);
	public Long addWeibo(Weibo weibo);
	public Long countWeiboByUsername(String username);
	public Long countWeiboByUser(User user);
	public Long countWeiboByUserId(Long userId);
	public Long countWeiboByNickname(String nickname);
	public void deleteWeibo(Weibo weibo);
	public void deleteWeiboById(Long id);
}
