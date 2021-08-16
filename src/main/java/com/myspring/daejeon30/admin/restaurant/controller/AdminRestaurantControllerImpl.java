package com.myspring.daejeon30.admin.restaurant.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

import com.myspring.daejeon30.admin.restaurant.service.AdminRestaurantService;
import com.myspring.daejeon30.paging.Criteria;
import com.myspring.daejeon30.paging.PageMaker;
import com.myspring.daejeon30.restaurant.vo.ResImageVO;
import com.myspring.daejeon30.restaurant.vo.RestaurantVO;

@Controller("adminRestaurantController")
public class AdminRestaurantControllerImpl implements AdminRestaurantController{
	private static final String ARTICLE_IMAGE_REPO = "C:\\res\\res_image";
	@Autowired
	private AdminRestaurantService adminRestaurantService;
	@Autowired
	private RestaurantVO restaurantVO;
	
	@Override
	@RequestMapping(value="/admin/listRes.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView listRes(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List restaurantList = adminRestaurantService.listRes();
		ModelAndView mav = new ModelAndView();
		mav.addObject("resList", restaurantList);
		//System.out.print(restaurantList);
		mav.setViewName("adminRes");
		return mav;
	}
	
	
	/* 원래쓰던 리스트 불러오기
	@Override
	@RequestMapping(value="/admin/listRes1.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView allRes(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List resAll = adminRestaurantService.allRes();
		ModelAndView mav = new ModelAndView();
		mav.addObject("resList", resAll);
		mav.setViewName("adminRes");
		return mav;
		
	}*/
	//페이징포함 리스트 불러오기
	@RequestMapping(value="/admin/listRes1.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView allRes(Criteria cri, HttpServletRequest request, HttpServletResponse response) throws Exception {
		List resAll = adminRestaurantService.selectResList(cri);
		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(adminRestaurantService.countResListTotal());
		ModelAndView mav = new ModelAndView();
		mav.addObject("resList", resAll);
		mav.addObject("pageMaker", pageMaker);
		mav.setViewName("adminRes");
		return mav;
	}
	
	
	
	@RequestMapping(value="admin/viewRes.do", method=RequestMethod.GET)
	public ModelAndView viewRes(@RequestParam("resNum") int resNum, HttpServletRequest request, HttpServletResponse response) throws Exception{
		Map resMap = adminRestaurantService.viewRes(resNum);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("viewRes");
		mav.addObject("resMap", resMap);
		return mav;
	}
	
	//검색
	@RequestMapping(value="admin/searchRes.do", method=RequestMethod.POST)
	public ModelAndView searchRes(String word1, 
		HttpServletRequest request, HttpServletResponse response) throws Exception{
		String word = "%"+word1+"%";
		System.out.print(word);
		List search = adminRestaurantService.searchRes(word);
		ModelAndView mav = new ModelAndView();
		mav.addObject("resList", search);
		mav.setViewName("adminRes");
		return mav;
				
	}
	
	
	
	
	@Override
	@RequestMapping(value="/admin/removeRes.do", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity removeRes(@RequestParam("resNum") int resNum, HttpServletRequest request, HttpServletResponse response) throws Exception{
		response.setContentType("text/html; charset=utf-8");
		ResponseEntity resEnt=null;
		String message;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		try {
			adminRestaurantService.removeRes(resNum);
			File destDir = new File(ARTICLE_IMAGE_REPO+"\\"+resNum);
			FileUtils.deleteDirectory(destDir);
			
			message="<script>";
			message +=" alert('삭제 완료 했습니다.');";
			message +=" location.href='"+request.getContextPath()+"/admin/listRes.do';";
			message +="</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			
		} catch (Exception e) {
			message = "<script>";
			message += " alert('작업중 오류가 발생했습니다.다시 시도해 주세요.');";
			message += " location.href='"+request.getContextPath()+"/admin/listRes.do';";
			message +=" </script>";
		    resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}
	
	
	@Override
	@RequestMapping(value="/admin/addNewRes.do", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addNewRes(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		String resImageFileName=null;
		
		Map resMap = new HashMap();
		Enumeration enu=multipartRequest.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=multipartRequest.getParameter(name);
			resMap.put(name,value);
		}
		
		List<String> fileList = upload(multipartRequest);
		List<ResImageVO> resImageFileList = new ArrayList<ResImageVO>();
		if(fileList != null && fileList.size() !=0) {
			for(String fileName : fileList) {
				ResImageVO resImageVO = new ResImageVO();
				resImageVO.setResImageFileName(fileName);
				resImageFileList.add(resImageVO);
			}
			resMap.put("resImageFileList", resImageFileList);
		}
		String message;
		ResponseEntity resEnt=null;
		HttpHeaders responseHeaders = new HttpHeaders();
	    responseHeaders.add("Content-Type", "text/html; charset=utf-8");
	    try {
	    	int resNum = adminRestaurantService.addNewRes(resMap);
	    	//String resNum = adminRestaurantService.addNewRes(resMap);
	    	if(resImageFileList != null && resImageFileList.size() !=0) {
		    	for(ResImageVO resImageVO : resImageFileList) {
		    		resImageFileName = resImageVO.getResImageFileName();
		    		File srcFile = new File(ARTICLE_IMAGE_REPO+"\\"+"TEMP"+"\\"+resImageFileName);
		    		File destDir = new File(ARTICLE_IMAGE_REPO+"\\"+resNum);
		    		//destDir.mkdirs();
		    		FileUtils.moveFileToDirectory(srcFile, destDir, true);
		    				
		    	}
		    }
	    	
	    	message = "<script>";
			message += " alert('식당 등록이 완료 되었습니다.');";
			message += " location.href='"+multipartRequest.getContextPath()+"/admin/listRes.do'; ";
			message +=" </script>";
		    resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
	    	
	    	
	    } catch (Exception e) {
	    	if(resImageFileList != null && resImageFileList.size()!=0) {
	    		for(ResImageVO resImageVO : resImageFileList) {
	    			resImageFileName = resImageVO.getResImageFileName();
		    		File srcFile = new File(ARTICLE_IMAGE_REPO+"\\"+"TEMP"+"\\"+resImageFileName);
		    		srcFile.delete();
	    		}
	    	}
	    	
	    	message = "<script>";
			message += " alert('오류가 발생했습니다. 다시 시도해주세요');";
			message += " location.href='"+multipartRequest.getContextPath()+"/admin/listRes.do'; ";
			message +=" </script>";
		    resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
	    	e.printStackTrace();
	    }
	    
	    return resEnt;
	}
	  
	
	
	@RequestMapping(value="admin/modRes.do", method= RequestMethod.POST)
	@ResponseBody
	public ResponseEntity modRes(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
	throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
	
		Map resMap = new HashMap();
		Enumeration enu=multipartRequest.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=multipartRequest.getParameter(name);
			resMap.put(name,value);
			}
		String message;
		ResponseEntity resEnt=null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		adminRestaurantService.modRes(resMap);
	
		message = "<script>";
		message += "alert('상세정보를 수정했습니다.');";
		message += "location.href='" + multipartRequest.getContextPath() + "/admin/listRes1.do';";
		message += "</script>";
		resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		return resEnt;
	}
	
	
	
	
	
	private List<String> upload(MultipartHttpServletRequest multipartRequest) throws Exception{
		List<String> fileList= new ArrayList<String>();
		Iterator<String> fileNames = multipartRequest.getFileNames();
		while(fileNames.hasNext()){
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			String originalFileName=mFile.getOriginalFilename();
			fileList.add(originalFileName);
			File file = new File(ARTICLE_IMAGE_REPO +"\\"+"TEMP"+"\\" + fileName);
			if(mFile.getSize()!=0) {
				if(!file.exists()) {
					file.getParentFile().mkdirs();
					mFile.transferTo(new File(ARTICLE_IMAGE_REPO +"\\"+"TEMP"+"\\" + originalFileName));
				}
			}
		}
		return fileList;
	}
}
	
