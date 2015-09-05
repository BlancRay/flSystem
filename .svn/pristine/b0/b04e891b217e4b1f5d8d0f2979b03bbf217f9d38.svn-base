/**
 * 文件上传及管理
 * @author 邹青
 * @date 2014-9-20
 */
package cn.nwsuaf.util;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletContext;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import cn.nwsuaf.action.BaseAction;

import com.opensymphony.xwork2.Action;

public class FileUploadAction extends BaseAction {
	private File imgFile; // 上传的文件
	private String imgFileFileName; // 文件名称
	private String imgFileContentType; // 文件类型
	private String dir; // 上传类型，分别为image、flash、media、file
	private String path; //管理文件路径
	private String order; //文件排序类型
	private HashMap<String, Object> result = new HashMap<String, Object>();;
	private static HashMap<String, String> extMap = new HashMap<String, String>();
	
	static{
		extMap.put("image", "gif,jpg,jpeg,png,bmp");
		extMap.put("flash", "swf,flv");
		extMap.put("media", "swf,flv,mp3,wav,wma,wmv,mid,avi,mpg,asf,rm,rmvb");
		extMap.put("file", "pdf,doc,docx,xls,xlsx,ppt,txt,zip,rar,gz,bz2");
	}
	
	/**
	 * 文件上传
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String upload(){
		ServletContext app = ServletActionContext.getServletContext();
		String uploadDir = app.getRealPath("/attached/");
		String saveUrl = app.getContextPath() + "/attached/";
		if(imgFile == null){
			getError("请选择文件。");
			return Action.SUCCESS;
		}
		//检查目录是否存在
		File upDir = new File(uploadDir);
		if(!upDir.isDirectory()){
			getError("上传目录不存在。");
			return Action.SUCCESS;
		}
		
		//检查目录写权限
		if(!upDir.canWrite()){
			getError("上传目录没有写权限。");
			return Action.SUCCESS;
		}
		
		//默认为上传图片
		if (dir == null) {
			dir = "image";
		}
		
		if(!extMap.containsKey(dir)){
			getError("目录名不正确。");
			return Action.SUCCESS;
		}
		
		//创建上传子目录
		uploadDir += "/" + dir + "/";
		saveUrl += "/" + dir + "/";
		File saveDirFile = new File(uploadDir);
		if (!saveDirFile.exists()) {
			saveDirFile.mkdirs();
		}
		
		//按登录名创建保存目录
		//SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		//String ymd = sdf.format(new Date());
		Object usr = getSession().getAttribute("loginUser");
		if(usr == null){
			getError("你尚未登录或已经登录超时，请重新登录...");
			result.put("error", 2);
			return Action.SUCCESS;
		}
		HashMap<String, Object> usrMap = (HashMap<String,Object>)usr;
		 String loginName = usrMap.get("loginName").toString();
		uploadDir += loginName + "/";	
		saveUrl  += loginName + "/";
		File dirFile = new File(uploadDir);
		if (!dirFile.exists()) {
			dirFile.mkdirs();
		}
		
		//检查扩展名
		String fileExt = imgFileFileName.substring(imgFileFileName.lastIndexOf(".") + 1).toLowerCase();
		if(!Arrays.<String>asList(extMap.get(dir).split(",")).contains(fileExt)){
			getError("上传文件扩展名是不允许的扩展名。\n只允许" + extMap.get(dir) + "格式。");
			return Action.SUCCESS;
		}
		
		//新文件名
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		String newFileName = df.format(new Date()) + "_" + new Random().nextInt(1000) + "." + fileExt;
		
		//上传文件
		File savefile = new File(new File(uploadDir), newFileName);
		try {
			FileUtils.copyFile(imgFile,savefile);
		} catch (IOException e) {
			getError("上传失败...");
			return Action.SUCCESS;
		}
		
		result.put("error", 0);
		result.put("url", saveUrl + newFileName);
		
		return Action.SUCCESS;
	}
	
	/**
	 *文件管理 
	 * @return
	 */
	public String manage(){
		String[] fileTypes = new String[]{"gif", "jpg", "jpeg", "png", "bmp"};
		ServletContext app = ServletActionContext.getServletContext();
		String uploadDir = app.getRealPath("/attached/");
		String saveUrl = app.getContextPath() + "/attached/";
		
		if (dir != null) {
			if(!Arrays.<String>asList(new String[]{"image", "flash", "media", "file"}).contains(dir)){
				getError("上传类型布允许。。.");
				return Action.SUCCESS;
			}
			uploadDir += "/" + dir + "/";
			saveUrl += "/" + dir + "/";
			File saveDirFile = new File(uploadDir);
			if (!saveDirFile.exists()) {
				saveDirFile.mkdirs();
			}
		}
		else{
			getError("未指定文件目录。。。");
			return Action.SUCCESS;
		}
		
		path = path != null ? path : "";
		String currentPath = uploadDir + path;
		String currentUrl = saveUrl + path;
		String currentDirPath = path;
		String moveupDirPath = "";
		if (!"".equals(path)) {
			String str = currentDirPath.substring(0, currentDirPath.length() - 1);
			moveupDirPath = str.lastIndexOf("/") >= 0 ? str.substring(0, str.lastIndexOf("/") + 1) : "";
		}
		
		//排序形式，name or size or type
		order = order!= null ? order.toLowerCase() : "name";
	
		//不允许使用..移动到上一级目录
		if (path.indexOf("..") >= 0) {
			getError("指定目录访问被禁止。。.");
			return Action.SUCCESS;
		}
		//最后一个字符不是/
		if (!"".equals(path) && !path.endsWith("/")) {
			getError("参数不正确。。。");
			return Action.SUCCESS;
		}
		//目录不存在或不是目录
		File currentPathFile = new File(currentPath);
		if(!currentPathFile.isDirectory()){
			getError("指定目录不存在。。。");
			return Action.SUCCESS;
		}
	
		//遍历目录取的文件信息
		List<Hashtable<?, ?>> fileList = new ArrayList<Hashtable<?,?>>();
		if(currentPathFile.listFiles() != null) {
			for (File file : currentPathFile.listFiles()) {
				Hashtable<String, Object> hash = new Hashtable<String, Object>();
				String fileName = file.getName();
				if(file.isDirectory()) {
					hash.put("is_dir", true);
					hash.put("has_file", (file.listFiles() != null));
					hash.put("filesize", 0L);
					hash.put("is_photo", false);
					hash.put("filetype", "");
				} else if(file.isFile()){
					String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
					hash.put("is_dir", false);
					hash.put("has_file", false);
					hash.put("filesize", file.length());
					hash.put("is_photo", Arrays.<String>asList(fileTypes).contains(fileExt));
					hash.put("filetype", fileExt);
				}
				hash.put("filename", fileName);
				hash.put("datetime", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(file.lastModified()));
				fileList.add(hash);
			}
		}
	
		if ("size".equals(order)) {
			Collections.sort(fileList, new SizeComparator());
		} else if ("type".equals(order)) {
			Collections.sort(fileList, new TypeComparator());
		} else {
			Collections.sort(fileList, new NameComparator());
		}
		result.put("moveup_dir_path", moveupDirPath);
		result.put("current_dir_path", currentDirPath);
		result.put("current_url", currentUrl);
		result.put("total_count", fileList.size());
		result.put("file_list", fileList);
		
		return Action.SUCCESS;
	}
	
	private void getError(String msg){
		result.put("error", 1);
		result.put("message", msg);
	}
	

	public String getDir() {
		return dir;
	}

	public void setDir(String dir) {
		this.dir = dir;
	}

	public String getImgFileContentType() {
		return imgFileContentType;
	}

	public void setImgFileContentType(String imgFileContentType) {
		this.imgFileContentType = imgFileContentType;
	}

	public File getImgFile() {
		return imgFile;
	}

	public void setImgFile(File imgFile) {
		this.imgFile = imgFile;
	}

	public String getImgFileFileName() {
		return imgFileFileName;
	}

	public void setImgFileFileName(String imgFileFileName) {
		this.imgFileFileName = imgFileFileName;
	}

	public HashMap<String, Object> getResult() {
		return result;
	}

	public void setResult(HashMap<String, Object> result) {
		this.result = result;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

}


/**
 * 排序
 * @author Administrator
 *
 */
class SizeComparator implements Comparator<Object> {
	public int compare(Object a, Object b) {
		Hashtable<?, ?> hashA = (Hashtable<?, ?>)a;
		Hashtable<?, ?> hashB = (Hashtable<?, ?>)b;
		if (((Boolean)hashA.get("is_dir")) && !((Boolean)hashB.get("is_dir"))) {
			return -1;
		} else if (!((Boolean)hashA.get("is_dir")) && ((Boolean)hashB.get("is_dir"))) {
			return 1;
		} else {
			if (((Long)hashA.get("filesize")) > ((Long)hashB.get("filesize"))) {
				return 1;
			} else if (((Long)hashA.get("filesize")) < ((Long)hashB.get("filesize"))) {
				return -1;
			} else {
				return 0;
			}
		}
	}
}

class NameComparator implements Comparator<Object> {
	public int compare(Object a, Object b) {
		Hashtable<?, ?> hashA = (Hashtable<?, ?>)a;
		Hashtable<?, ?> hashB = (Hashtable<?, ?>)b;
		if (((Boolean)hashA.get("is_dir")) && !((Boolean)hashB.get("is_dir"))) {
			return -1;
		} else if (!((Boolean)hashA.get("is_dir")) && ((Boolean)hashB.get("is_dir"))) {
			return 1;
		} else {
			return ((String)hashA.get("filename")).compareTo((String)hashB.get("filename"));
		}
	}
}

class TypeComparator implements Comparator<Object> {
	public int compare(Object a, Object b) {
		Hashtable<?, ?> hashA = (Hashtable<?, ?>)a;
		Hashtable<?, ?> hashB = (Hashtable<?, ?>)b;
		if (((Boolean)hashA.get("is_dir")) && !((Boolean)hashB.get("is_dir"))) {
			return -1;
		} else if (!((Boolean)hashA.get("is_dir")) && ((Boolean)hashB.get("is_dir"))) {
			return 1;
		} else {
			return ((String)hashA.get("filetype")).compareTo((String)hashB.get("filetype"));
		}
	}
}