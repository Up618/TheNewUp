package org.up.agree.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.up.agree.service.IAgreeService;
import org.up.dao.IBaseDao;
import org.up.model.Agree;
import java.util.ArrayList;
import java.util.List;

@Service("agreeService")
public class AgreeService implements IAgreeService {

	@Autowired
	private IBaseDao<Agree> agreeDao;

	/**
	 * 新增点赞
	 */
	public Long addAgree(Agree agree) {
		return (Long) agreeDao.save(agree);
	}

	/**
	 * 取消点赞
	 */
	public boolean cancelAgree(Agree agree) {
		try {
			agreeDao.delete(agree);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public boolean cancelAgreeById(Long id) {
		try {
			agreeDao.delete(agreeDao.get(Agree.class, id));
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public Agree loadAgreeById(Long id) {
		return agreeDao.get(Agree.class, id);
	}

	public List<Agree> listAgreeByUsername(String username) {
		List<Object> params = new ArrayList<Object>();
		params.add(username);
		return agreeDao.find("select a from Agree a where a.user.username = ?", params);
	}

	@Override
	public List<Agree> listAgreeByWeiboId(String weiboId) {
		List<Object> params = new ArrayList<Object>();
		params.add(weiboId);
		return agreeDao.find("select a from Agree a where a.weibo.id = ?", params);
	}

	@Override
	public Long countAgreeAmountByWeiboId(Long weiboId) {
		List<Object> params = new ArrayList<Object>();
		params.add(weiboId);
		return agreeDao.count("select count(a) from Agree a where a.weibo.id = ?", params);
	}

	/**
	 * 判断此条微博是否已经被此用户点赞过。
	 */
	@Override
	public Agree loadAgreeByWeiboAndUser(Long weiboId, String username) {
		List<Object> params = new ArrayList<Object>();
		params.add(weiboId);
		params.add(username);
		// boolean isEmpty = agreeDao.find("select a from Agree a "
		// + "where a.weibo.id = ? and a.user.username = ?", params).isEmpty();
		Agree agree = new Agree();
		agree = agreeDao.get("select a from Agree a " + "where a.weibo.id = ? and a.user.username = ?", params);
		return agree;
	}

}
