package com.spacefit.common;

import java.io.File;
import java.util.Date;
import java.text.SimpleDateFormat;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class SpFileRenamePolicy implements FileRenamePolicy {

	// 원본파일 전달 받아서 파일명 수정작업 후 수정된 파일 반환시켜주는 메소드
	@Override
	public File rename(File originFile) {
		
		// 원본파일명 ("aaa.jpg")
		String originName = originFile.getName(); 
		
		// 수정파일명 ("space20220715.jpg") 
		//			파일업로드시간(년월일시분초) + 원본파일확장자
		
		// 1) 파일업로드시간(년월일시분초) String currentTime
		String currentTime = new SimpleDateFormat("yyyyMMdd").format(new Date());
		
		int ranNum = (int)(Math.random()*90000 + 10000);
		
		// 2) 원본파일확장자 String ext
		String ext = originName.substring(originName.lastIndexOf(".")); //제일 뒤에있는 점을 찾아야하기 때문에 laseIndexOf메소드 사용
		
		String changeName = "space" + currentTime + ranNum + ext;
		
		// 원본파일의 상위폴더에 다음과 같은 이름 제시를 하겠다.
		return new File(originFile.getParent(), changeName);
	}
}
