package com.myspring.daejeon30.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.daejeon30.bboard.service.BboardService;
import com.myspring.daejeon30.bboard2.service.Bboard2Service;
import com.myspring.daejeon30.board.service.Board2Service;

@Controller
public class AdminBoardController{
	@Autowired
	private BboardService bboardService;
	@Autowired
	private Bboard2Service bboard2Service;
	@Autowired
	Board2Service board2Service;
	
	@RequestMapping(value="/admin/noticeBoard.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView nboardList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String sort = "notice";
		List result = bboardService.bboardList(sort);
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", result);
		mav.setViewName("adminBoard");
		return mav;
	}
	
	@RequestMapping(value="/admin/reviewBoard.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView reviewList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		List result = bboard2Service.reviewList();
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", result);
		mav.setViewName("adminBoard");
		return mav;
	}
	
	@RequestMapping(value="/admin/recBoard.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView recList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		List result = board2Service.listboard2();
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", result);
		mav.setViewName("adminBoard");
		return mav;
	}
	
}