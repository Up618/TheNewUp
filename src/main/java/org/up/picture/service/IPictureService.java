package org.up.picture.service;

import java.util.List;

import org.up.model.Picture;

public interface IPictureService {
	public Picture loadPictureById(Long id);
	public List<Picture> getPictureByUsername(String username);
	public List<Picture> getPictureByUserId(Long userId);
	public List<Picture> getPictureByNickname(String nickname);
	public Long addPicture(Picture picture);
	public void deletePicture(Picture picture);
	public void editPicture(Picture picture);
}
