package org.up.agree.service;

import java.util.List;
import org.up.model.Agree;

public interface IAgreeService {
	
	public Long addAgree(Agree agree); //点赞
	public boolean cancelAgree(Agree agree); //取消点赞
	public boolean cancelAgreeById(Long Id);
	public void cancelAgreeByWeiboAndUser(Long weiboId, String username);
	public Agree loadAgreeById(Long id);
	public List<Agree> listAgreeByUsername(String username);
	public List<Agree> listAgreeByWeiboId(String weiboId);
	public Long countAgreeByWeiboId(Long weiboId);
	public Agree loadAgreeByWeiboAndUser(Long weiboId, String username);
	
}


