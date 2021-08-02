package com.myspring.daejeon30.bboard.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.daejeon30.bboard.service.BboardService;
import com.myspring.daejeon30.bboard.vo.BboardVO;
import com.myspring.daejeon30.member.vo.MemberVO;

@Controller("bboardController")
public class BboardControllerImpl implements BboardController{
	@Autowired
	private BboardService bboardService;
	
	@Override
	@RequestMapping(value="/bboard/notice.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView nboardList(HttpServletRequest request, HttpServletResponse response) throws Exception{
	//List noticeList = bboardService.nboardList();
	//	ModelAndView mav = new ModelAndView();
	//	mav.addObject("noticeList", noticeList);
	//	mav.setViewName("notice");
	//	return mav;
		String sort = "notice";
		List noticeList = bboardService.bboardList(sort);
		ModelAndView mav = new ModelAndView();
		mav.addObject("noticeList", noticeList);
		mav.setViewName("notice");
		return mav;
	}
	
	@Override
	@RequestMapping(value="/bboard/addNotice.do", method=RequestMethod.POST)
	public String addNotice(@ModelAttribute("bboardVO") BboardVO bboardVO,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text; charset=utf-8");
		HttpSession session = request.getSession();
		MemberVO mem= (MemberVO)session.getAttribute("member");
		String id = mem.getId();
		bboardVO.setId(id);
		
		int result =0;
		result = bboardService.addNotice(bboardVO);
		
		return "redirect:/bboard/notice.do";
	}
	
	
	@Override
	@RequestMapping(value="/bboard/oneNo.do", method=RequestMethod.GET)
	public ModelAndView selectOne(@RequestParam("num") String num, HttpServletRequest request, HttpServletResponse response) throws Exception{
		BboardVO bbo = bboardService.oneNo(num);
		ModelAndView mav = new ModelAndView();
		mav.addObject("bbo", bbo);
		mav.setViewName("viewOne");
		return mav;
	}
	
	
	@RequestMapping(value="/bboard/deleteOneNo.do", method=RequestMethod.GET)
	public String deleteOneNo(@RequestParam("num") int num, HttpServletRequest request, HttpServletResponse response) throws Exception{
		bboardService.deleteOneNo(num);
		return "redirect:/bboard/notice.do";
	}
	
	@RequestMapping(value="/bboard/updateOneNo.do", method=RequestMethod.POST)
	public String updateOneNo(@ModelAttribute("bboardVO") BboardVO bboardVO, HttpServletRequest request, HttpServletResponse response) throws Exception{
		bboardService.updateOneNo(bboardVO);
		return "redirect:/bboard/notice.do";
	}
	
	
	
	//faq ¸®½ºÆ®
	@Override
	@RequestMapping(value="/bboard/faq.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView bboardList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String sort = "faq";
		List bboardList = bboardService.bboardList(sort);
		ModelAndView mav = new ModelAndView();
		mav.addObject("bboardList", bboardList);
		mav.setViewName("faq");
		return mav;
	}
	
	
	
	
}