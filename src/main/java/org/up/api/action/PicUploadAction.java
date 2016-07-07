package org.up.api.action;

import java.io.File;

import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import com.opensymphony.xwork2.ActionSupport;
import com.qiniu.common.QiniuException;
import com.qiniu.http.Response;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;

@Results({ @Result(name = "success", type = "json", params = { "includeProperties", "url", "encoding", "UTF-8" }) })
public class PicUploadAction extends ActionSupport {
	private static String ACCESS_KEY = "ZWk08oKr_GnRiv-T-AnXaDs2eLNB2qztD9lhfouX";
	private static String SECRET_KEY = "iU_rF_IW5RD4mAwX4m5WeuXWet-Tw2s9ZbKmd8eH";

	// 要上传的空间
	private static String BUCKET_NAME = "chankc";

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private File upload;
	private String uploadContentType;
	private String uploadFileName;
	private String url;

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	@Override
	public String execute() throws Exception {
		Auth auth = Auth.create(ACCESS_KEY, SECRET_KEY);
		UploadManager uploadManager = new UploadManager();
		try {
			uploadManager.put(upload, upload.getName(), auth.uploadToken(BUCKET_NAME));
		} catch (QiniuException e) {
			Response r = e.response;
			// 请求失败时打印的异常的信息
			System.out.println(r.toString());
			try {
				// 响应的文本信息
				System.out.println(r.bodyString());
			} catch (QiniuException e1) {
				// ignore
			}
		}
		StringBuilder sb = new StringBuilder();
		sb.append("http://o8m79d0cw.bkt.clouddn.com/");
		sb.append(upload.getName());
		url = sb.toString();
		return SUCCESS;
	}

	public String getUrl() {
		return url;
	}
}
