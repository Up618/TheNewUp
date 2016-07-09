package org.up.agree.service;

import java.util.List;
import org.up.model.Agree;

public interface IAgreeService {

	public Long addAgree(Agree agree); // 点赞
	public boolean cancelAgree(Agree agree); // 取消点赞
	public boolean cancelAgreeById(Long Id);
	
	public Agree loadAgreeById(Long id);
	public Agree loadAgreeByWeiboAndUser(Long weiboId, String username);
	public List<Agree> listAgreeByUsername(String username);
	public List<Agree> listAgreeByWeiboId(String weiboId);

	public Long countAgreeAmountByWeiboId(Long weiboId); // 某条微博的点赞数

}
