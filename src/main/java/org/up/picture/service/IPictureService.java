package org.up.picture.service;

import java.util.List;
import org.up.model.Weibo;
import org.up.model.Picture;

public interface IPictureService {
	public Picture loadPictureById(Long id);
	public Long addPicture(Picture picture);
	public void deletePicture(Picture picture);
	public void editPicture(Picture picture);
	public List<Picture> getPicturesByWeiboId(Long weiboId);
	public List<Picture> getPicturesByWeibo(Weibo weibo);
}
