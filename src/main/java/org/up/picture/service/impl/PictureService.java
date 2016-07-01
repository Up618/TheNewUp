package org.up.picture.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.up.dao.IBaseDao;
import org.up.model.Picture;
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
	public List<Picture> getPictureByUsername(String username) {
		List<Object> params = new ArrayList<Object>();
		params.add(username);
		return pictureDao.find("select p from Picture p where p.user.username = ?");
	}

	@Override
	public List<Picture> getPictureByUserId(Long userId) {
		List<Object> params = new ArrayList<Object>();
		params.add(userId);
		return pictureDao.find("select p from Picture p where p.user.userId = ?");
	}

	@Override
	public List<Picture> getPictureByNickname(String nickname) {
		List<Object> params = new ArrayList<Object>();
		params.add(nickname);
		return pictureDao.find("select p from Picture p where p.user.nickname = ?");
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

}
