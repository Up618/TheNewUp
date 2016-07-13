package org.up.picture.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.up.dao.IBaseDao;
import org.up.model.Picture;
import org.up.model.Weibo;
import org.up.picture.service.IPictureService;

@Service("pictureService")
@Transactional
public class PictureService implements IPictureService {
	@Autowired
	private IBaseDao<Picture> pictureDao;

	@Override
	public Picture loadPictureById(Long id) {
		return pictureDao.get(Picture.class, id);
	}

	@Override
	public Long addPicture(Picture picture) {
		return (Long) pictureDao.save(picture);
	}

	@Override
	public void deletePicture(Picture picture) {
		pictureDao.delete(picture);
	}

	@Override
	public void editPicture(Picture picture) {
		pictureDao.update(picture);
	}

	@Override
	public List<Picture> getPicturesByWeiboId(Long weiboId) {
		List<Object> param = new ArrayList<Object>();
		param.add(weiboId);
		return pictureDao.find("select p from Picture p where p.weibo.id = ?",param);
	}

	@Override
	public List<Picture> getPicturesByWeibo(Weibo weibo) {
		List<Object> param = new ArrayList<Object>();
		param.add(weibo);
		return pictureDao.find("select p from Picture p where p.weibo = ?",param);
	}

}
