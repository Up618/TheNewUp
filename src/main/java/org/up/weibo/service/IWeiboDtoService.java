package org.up.weibo.service;

import java.util.List;

import org.up.dto.WeiboDto;
import org.up.model.User;

public interface IWeiboDtoService {
	public List<WeiboDto> getWeiboDtoByUsername(String username, Integer page, Integer rows);
	public List<WeiboDto> getWeiboDtoByNickname(String nickname, Integer page, Integer rows);
	public List<WeiboDto> getWeiboDtoByUserId(Long userId, Integer page, Integer rows);
	public List<WeiboDto> getWeiboDtoByCurrentUsername(String username, Integer page, Integer rows);
	public List<WeiboDto> getWeiboDtoByCurrentNickname(String nickname, Integer page, Integer rows);
	public List<WeiboDto> getWeiboDtoByCurrentUserId(Long userId, Integer page, Integer rows);
	public List<WeiboDto> getWeiboDtoByUser(User user, Integer page, Integer rows);
	public List<WeiboDto> getWeiboDtoByUserLiked(Long userId, Integer page, Integer rows);
	public List<WeiboDto> getWeiboDtoByUsername(String username, String myUsername, Integer page, Integer rows);
	public List<WeiboDto> getWeiboDtoByNickname(String nickname, String myUsername, Integer page, Integer rows);
	public List<WeiboDto> getWeiboDtoByUserId(Long userId, String myUsername, Integer page, Integer rows);
	public List<WeiboDto> getWeiboDtoByUser(User user, String myUsername, Integer page, Integer rows);
	public List<WeiboDto> getWeiboDtoByUserLiked(Long userId, String myUsername, Integer page, Integer rows);
	public List<WeiboDto> getWeiboDtoByUserLiked(Long userId, Long myId, Integer page, Integer rows);
	public List<WeiboDto> getWeiboDtoByKeyword(String keyword, String myUsername, Integer page, Integer rows);
}
