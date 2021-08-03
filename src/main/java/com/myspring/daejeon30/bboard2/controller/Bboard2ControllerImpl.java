package com.myspring.daejeon30.bboard2.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.daejeon30.bboard2.service.Bboard2Service;
import com.myspring.daejeon30.bboard2.vo.Bboard2VO;

@Controller("bboard2Controller")
public class Bboard2ControllerImpl implements Bboard2Controller{
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
	
}