package com.myspring.daejeon30.common.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FileDownloadController {
	private static final String ARTICLE_IMAGE_REPO = "C:\\res\\res_image";
	private static final String BOARD_IMAGE_REPO = "C:\\board\\board_image";
	
	@RequestMapping("/download.do")
	protected void download(@RequestParam("resImageFileName") String resImageFileName,
			@RequestParam("resNum") String resNum,HttpServletResponse response)throws Exception {
		OutputStream out = response.getOutputStream();
		String downFile = ARTICLE_IMAGE_REPO + "\\" + resNum + "\\" + resImageFileName;
		File file = new File(downFile);
		
		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment; fileName=" + resImageFileName);
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024 * 8];
		while (true) {
			int count = in.read(buffer); 
			if (count == -1) 
				break;
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();
		
	}
	
	@RequestMapping("/downloadBoard.do")//바로 아래 행에서 이미지 파일 이름을 바로 설정합니다.
	public void downloadBoard(@RequestParam("imageFileName") String imageFileName, 
						 @RequestParam("boardNO") String boardNO,
						 HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String downFile = BOARD_IMAGE_REPO + "\\"+boardNO + "\\" + imageFileName; //글 번호와 파일 이름으로 다운로드할 파일 경로를 설정합니다.
		File file = new File(downFile);
		
		
		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment; fileName=" + imageFileName);
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024*8];
		while(true) {
			int count = in.read(buffer); //버퍼에 읽어들인 문자개수
			if (count == -1) // 버퍼의 마지막에 도달했는지 체크
				break;
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();
	}
}