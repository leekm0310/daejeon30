package com.myspring.daejeon30.rsvnon.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.daejeon30.rsvnon.service.RsvnonService;
import com.myspring.daejeon30.rsvnon.vo.RsvnonVO;

@Controller("RsvnonController")
public class RsvnonControllerImpl implements RsvnonController{
	@Autowired
	private RsvnonService rsvnonService;
	@Autowired
	private RsvnonVO rsvnonVO;
	
	@Override
	@RequestMapping(value="rsv/rsvnon.do", method = RequestMethod.POST)
	public ModelAndView addNewRsv(RsvnonVO rsvnonVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text; charset=utf-8");
		ModelAndView mav = new ModelAndView();
		int result =0;
		result = rsvnonService.addNewRsv(rsvnonVO);
		mav.addObject("result", rsvnonVO);
		mav.setViewName("result2");
		return mav;
	}
	
	@Override
	@RequestMapping(value="rsv/selectOneN.do", method = RequestMethod.POST)
	public ModelAndView searchRsvNon(@ModelAttribute("rsvnonVO") RsvnonVO rsvnonVO,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		RsvnonVO rsvOne = rsvnonService.searchRsvNon(rsvnonVO);
		ModelAndView mav = new ModelAndView();
		mav.addObject("rsvOne", rsvOne);
		mav.setViewName("rsvnonView");
		return mav;
	}
}