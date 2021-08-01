package com.myspring.daejeon30.bboard.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.daejeon30.bboard.service.BboardService;

@Controller("bboardController")
public class BboardControllerImpl implements BboardController{
	@Autowired
	private BboardService bboardService;
	
	@Override
	@RequestMapping(value="/bboard/notice.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView nList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		List noticeList = bboardService.nboardList();
		ModelAndView mav = new ModelAndView();
		mav.addObject("noticeList", noticeList);
		mav.setViewName("notice");
		return mav;
	}
}