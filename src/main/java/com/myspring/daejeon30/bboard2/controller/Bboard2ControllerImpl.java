package com.myspring.daejeon30.bboard2.controller;

import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.daejeon30.bboard2.service.Bboard2Service;
import com.myspring.daejeon30.bboard2.vo.Bboard2VO;
import com.myspring.daejeon30.member.vo.MemberVO;

@Controller("bboard2Controller")
public class Bboard2ControllerImpl implements Bboard2Controller{
	private static final String ARTICLE_IMAGE_REPO = "C:\\board\\article_image";
	@Autowired
	private Bboard2Service bboard2Service;
	@Autowired
	private Bboard2VO bboard2VO;
	
	@Override
	@RequestMapping(value="/bboard2/reviewList.do" , method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView reviewList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		List listReview = bboard2Service.reviewList();
		ModelAndView mav = new ModelAndView();
		mav.addObject("revlist", listReview);
		mav.setViewName("reviewlist");
		return mav;
	}
	
	/*@Override
	@RequestMapping(value="/bboard2/addreview.do", method = RequestMethod.POST)
	public ResponseEntity addreview(MultipartHttpServletRequest multipartRequest,
			HttpServletResponse response) throws Exception{
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String,Object> reviewMap = new HashMap<String, Object>();
		Enumeration enu=multipartRequest.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=multipartRequest.getParameter(name);
			reviewMap.put(name,value);
		}
		
		String imageFileName= upload(multipartRequest);
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String id = memberVO.getId();
		reviewMap.put("id", id);
		reviewMap.put("imageFileName", imageFileName);
		
		String message;
		ResponseEntity resEnt=null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			int num = bboard2Service.addreivew(reviewMap);
			if(imageFileName!=null && imageFileName.length()!=0) {
				File srcFile = new 
				File(ARTICLE_IMAGE_REPO+ "\\" + "temp"+ "\\" + imageFileName);
				File destDir = new File(ARTICLE_IMAGE_REPO+"\\"+num);
				FileUtils.moveFileToDirectory(srcFile, destDir,true);
			}
	
			message = "<script>";
			message += " alert('새글을 추가했습니다.');";
			message += " location.href='"+multipartRequest.getContextPath()+"/board/listArticles.do'; ";
			message +=" </script>";
		    resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}catch(Exception e) {
			File srcFile = new File(ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
			srcFile.delete();
			
			message = " <script>";
			message +=" alert('오류가 발생했습니다. 다시 시도해 주세요');');";
			message +=" location.href='"+multipartRequest.getContextPath()+"/board/articleForm.do'; ";
			message +=" </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}*/
		
}
