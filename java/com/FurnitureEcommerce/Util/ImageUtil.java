package com.FurnitureEcommerce.Util;

import java.io.File;
import java.io.IOException;

import jakarta.servlet.http.Part;

public class ImageUtil {
	
	public String getImageNamePart(Part part) {
		
		String contentDisp = part.getHeader("content-disposition");
		
		String[] items = contentDisp.split(";");
		
		String imageName = null;
		
		for (String s : items) {
			
			if(s.trim().startsWith("filename")) {
				
				imageName = s.substring(s.indexOf("=")+2, s.length() -1);
			}
		}
		
		if(imageName == null || imageName.isEmpty()) {
			
			imageName = "download.png";
		}
		return imageName;
	}
	
	public boolean uploadImage (Part part, String rootPath, String saveFolder) {
		String savePath = getSavePath(saveFolder);
		File fileSaveDir = new File(savePath);
		
		if(!fileSaveDir.exists()) {
			if(!fileSaveDir.mkdir()) {
				return false;
			}
		}
		try {
			String imageName = getImageNamePart(part);
			String filePath = savePath + "/" + imageName;
			
			part.write(filePath);
			return true;
			
		} catch (IOException e) {
			
			e.printStackTrace();
			return false;
		}
	}

	private String getSavePath(String saveFolder) {
		// TODO Auto-generated method stub
		return null;
	}
	
	public String getSavePath1(String saveFolder) {
	return "C:\\Users\\Samyog Jung Basnet\\Downloads\\Images";
}
}
