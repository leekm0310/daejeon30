package com.myspring.daejeon30.bboard2.controller;

import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.daejeon30.bboard2.service.Bboard2Service;
import com.myspring.daejeon30.bboard2.vo.Bboard2VO;
import com.myspring.daejeon30.member.vo.MemberVO;
import com.myspring.daejeon30.paging.Criteria;
import com.myspring.daejeon30.paging.PageMaker;

@Controller("bboard2Controller")
public class Bboard2ControllerImpl implements Bboard2Controller{
	private static final String REVIEW_IMAGE_REPO = "C:\\bboard2\\review_image";
	@Autowired
	private Bboard2Service bboard2Service;
	@Autowired
	private Bboard2VO bboard2VO;
	
	/*@Override �������� ����Ʈ �ҷ�����
	@RequestMapping(value="/bboard2/reviewList.do" , method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView reviewList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		List listReview = bboard2Service.reviewList();
		ModelAndView mav = new ModelAndView();
		mav.addObject("revlist", listReview);
		mav.setViewName("reviewlist");
		return mav;
	}*/
	
	
	//����¡�ؼ� ��ü����Ʈ �ҷ�����
	@RequestMapping(value = "/bboard2/reviewList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView reviewList(Criteria cri, HttpServletRequest request, HttpServletResponse reponse) throws Exception {
		List listReview = bboard2Service.selectReviewList(cri);
		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(bboard2Service.countReviewListTotal());
	    ModelAndView mav = new ModelAndView();
		mav.addObject("revlist", listReview);
		mav.addObject("pageMaker", pageMaker);
		mav.setViewName("reviewlist");
		return mav;
		
	}
	
	//�˻�
	@RequestMapping(value="/bboard2/search.do")
	public ModelAndView searchTitle(String word1, String sorting1,
			HttpServletRequest request, HttpServletResponse response) throws Exception{			
		//String word = "%"+word1+"%";
		String word = word1;
		Map map = new HashMap();
		map.put("sorting", sorting1);
		map.put("word", word);
		System.out.print(map);
		List search = bboard2Service.searchTitle(map);
		System.out.print(search);
		ModelAndView mav = new ModelAndView();
		mav.addObject("revlist", search);
		mav.setViewName("reviewlist");
		return mav;
	}
	
	@Override
	@RequestMapping(value="/bboard2/oneReview.do", method=RequestMethod.GET)
	public ModelAndView oneReview(@RequestParam("num") int num, HttpServletRequest request, HttpServletResponse response) throws Exception{
		Bboard2VO review = bboard2Service.selectReview(num);
		ModelAndView mav = new ModelAndView();
		mav.addObject("review", review);
		mav.setViewName("viewReview");
		return mav;
	}
	
	@Override
	@RequestMapping(value="/bboard2/deleteReview.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ResponseEntity deleteReview(@RequestParam("num") int num, 
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		response.setContentType("text/html; charset=utf-8");
		ResponseEntity resEnt=null;
		String message;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		try {
			bboard2Service.deleteReview(num);
			File destDir = new File(REVIEW_IMAGE_REPO+"\\"+num);
			FileUtils.deleteDirectory(destDir);
			
			message="<script>";
			message +=" alert('���� �Ϸ� �߽��ϴ�.');";
			message +=" location.href='"+request.getContextPath()+"/bboard2/reviewList.do';";
			message +="</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			
		} catch (Exception e) {
			message = "<script>";
			message += " alert('�۾��� ������ �߻��߽��ϴ�.�ٽ� �õ��� �ּ���.');";
			message += " location.href='"+request.getContextPath()+"/bboard2/reviewList.do';";
			message +=" </script>";
		    resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}
	
	
	@Override
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
				File(REVIEW_IMAGE_REPO+ "\\" + "temp"+ "\\" + imageFileName);
				File destDir = new File(REVIEW_IMAGE_REPO+"\\"+num);
				FileUtils.moveFileToDirectory(srcFile, destDir,true);
			}
	
			message = "<script>";
			message += " alert('������ �߰��߽��ϴ�.');";
			message += " location.href='"+multipartRequest.getContextPath()+"/board/listArticles.do'; ";
			message +=" </script>";
		    resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}catch(Exception e) {
			File srcFile = new File(REVIEW_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
			srcFile.delete();
			
			message = " <script>";
			message +=" alert('������ �߻��߽��ϴ�. �ٽ� �õ��� �ּ���');');";
			message +=" location.href='"+multipartRequest.getContextPath()+"/board/articleForm.do'; ";
			message +=" </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}
	
	
	
	
	@RequestMapping(value="/bboard2/updateReview.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity updateReview(MultipartHttpServletRequest multipartRequest,
									HttpServletResponse response) throws Exception{
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String,Object> reviewMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while(enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = multipartRequest.getParameter(name);
			reviewMap.put(name, value);
		}
		
		String imageFileName = upload(multipartRequest);
		reviewMap.put("imageFileName",imageFileName);
		
		
		String num = (String)reviewMap.get("num");
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			bboard2Service.updateReview(reviewMap);
			if(imageFileName != null && imageFileName.length() != 0) {
				File srcFile = new File(REVIEW_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
				File destDir = new File(REVIEW_IMAGE_REPO + "\\" + num);
				FileUtils.moveFileToDirectory(srcFile, destDir, true);
				
				String originalFileName = (String)reviewMap.get("originalFileName");
				File oldFile = new File(REVIEW_IMAGE_REPO + "\\" + num + "\\" + originalFileName);
				oldFile.delete();
			}
			message = "<script>";
			message += "alert('���� �����߽��ϴ�.');";
			message += "location.href='" + multipartRequest.getContextPath() + "/bboard2/oneReview.do?num=" + num +"';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch(Exception e) {
			File srcFile = new File(REVIEW_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
			srcFile.delete();
			message = "<script>";
			message += "alert('������ �߻��߽��ϴ�. �ٽ� �������ּ���');";
			message += "location.href='"+multipartRequest.getContextPath()+"/bboard2/oneReview.do?num=" + num +"';";
			message += "</script>";
			resEnt = new ResponseEntity(message,responseHeaders,HttpStatus.CREATED);
		}
		return resEnt;
		
	}
	
	
	
	
	
	
	
	
	private String upload(MultipartHttpServletRequest multipartRequest) throws Exception{
		String imageFileName= null;
		Iterator<String> fileNames = multipartRequest.getFileNames();
		
		while(fileNames.hasNext()){
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			imageFileName=mFile.getOriginalFilename();
			File file = new File(REVIEW_IMAGE_REPO +"\\"+"temp"+"\\" + fileName);
			if(mFile.getSize()!=0){ //File Null Check
				if(!file.exists()){ //��λ� ������ �������� ���� ���
					file.getParentFile().mkdirs();  //��ο� �ش��ϴ� ���丮���� ����
					mFile.transferTo(new File(REVIEW_IMAGE_REPO +"\\"+"temp"+ "\\"+imageFileName)); //�ӽ÷� ����� multipartFile�� ���� ���Ϸ� ����
				}
			}
			
		}
		return imageFileName;	
	}
	
	
	
}
