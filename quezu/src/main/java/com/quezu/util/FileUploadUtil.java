package com.quezu.util;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.web.multipart.MultipartFile;

public class FileUploadUtil {
	
	/**
	 * 将图片保存到本地文件系统，并返回图片文件名
	 * @param file
	 * @return
	 */
	public static String imageHandler(MultipartFile file) {
		//生成一个UUID作为图片的文件名
		String name = UUID.randomUUID().toString().replaceAll("-", "");
		//获取文件扩展名
		String ext = FilenameUtils.getExtension(file.getOriginalFilename());
		try {
			//将图片保存到D:\\upload
			file.transferTo(new File("D:\\upload\\" + name + "." + ext));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return name+"."+ext;
	}
	
	/**
	 * 将图片文件数组中的图片保存到本地文件系统，并以List形式返回图片文件名
	 * @param files
	 * @return
	 */
	public static List<String> imageListHandler(MultipartFile[] files) {
		List<String> imageList = new ArrayList<String>();
		for (MultipartFile file : files) {
			if(file.getSize() != 0) {
				//生成一个UUID作为图片的文件名
				String name = UUID.randomUUID().toString().replaceAll("-", "");
				//获取文件扩展名
				String ext = FilenameUtils.getExtension(file.getOriginalFilename());
				try {
					//将图片保存到D:\\upload
					file.transferTo(new File("D:\\upload\\" + name + "." + ext));
					imageList.add(name+"."+ext);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}else {
				continue;
			}
		}
		return imageList;
	}

}
