package com.spacefit.common;

import java.io.File;
import java.util.Date;
import java.text.SimpleDateFormat;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class SpacefitFileRenamePolicy implements FileRenamePolicy{

	
	// 원본파일 전달받아서 파일명 수정작업 후 수정된 파일 반환시켜주는 메소드
		@Override
		public File rename(File originFile) {
			
			// 원본파일명 ("aaa.jpg")  <= 원본파일의 확장자를 알아야하므로 세팅필요
			String originName = originFile.getName();
			
			// 수정파일명 ("2020071512243023145.jpg")
			//			파일업로드시간(년월일시분초) + 5자리랜덤값(10000~99999) + 원본파일확장자
			
			// 1) 파일업로드시간(년월일시분초) String currentTime
			String currentTime = new SimpleDateFormat("yyyyMMddhhmmss").format(new Date()); // java.util.Date로 기본Date생성=> 현재날짜시간
			// 2) 5자리랜덤값(10000~99999): int ranNum
									//       갯수    시작수
			int ranNum = (int)(Math.random()*90000 + 10000);
			
			// 3) 원본파일확장자 String ext
			//* .이 파일명.jsp에 쓰일뿐만아니라 파일명안에도 .이 있을수 있음 ex)aa.aaa.jsp
			//String ext = originName.substring(원본파일명에 제일 뒤에있는 .의 인덱스 위치);  // subString 제시한인덱스위치에서부터끝까지추출 
			String ext = originName.substring(originName.lastIndexOf("."));
			
			String changeName = currentTime + ranNum + ext;
			
							// 원본파일의 상위폴더를 제시하고 이름변경하겠다.
			return new File(originFile.getParent(), changeName);
		}
}
