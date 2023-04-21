package com.project.web.util;
//ip, 숫자검사, 변경

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

@Component
public class Util {
	// 문자열을 정수타입으로 변경하기
	public int str2Int(String str) {
		return Integer.parseInt(str);
	}

	public String changeText(String txt) {
		txt = txt.replaceAll("<", "&lt;");
		txt = txt.replaceAll(">", "&gt;");
		return txt;
	}

	public String fileSave(String path, MultipartFile si_photo1) throws IOException {
		File upFile = new File(path);
		if (!upFile.exists()) {
			upFile.mkdirs();// 경로까지 폴더가 없다면 다 만들어주세요.
		}
		String fileName1 = UUID.randomUUID().toString() + "_" + si_photo1.getOriginalFilename();
		// 파일경로 + 파일명으로 만들어줍니다(경로, 파일명)
		upFile = new File(upFile, fileName1);
		// 파일 올리기 (저장할 파일, 파일경로)
		FileCopyUtils.copy(si_photo1.getBytes(), upFile);
		return fileName1.toString();
	}

	public String reviewSave(String path, MultipartFile rv_photo1) throws IOException {
		File upFile = new File(path);
		if (!upFile.exists()) {
			upFile.mkdirs();
		}
		String photoName1 = UUID.randomUUID().toString() + "_" + rv_photo1.getOriginalFilename();
		upFile = new File(upFile, photoName1);
		FileCopyUtils.copy(rv_photo1.getBytes(), upFile);

		return photoName1.toString();
	}
}
