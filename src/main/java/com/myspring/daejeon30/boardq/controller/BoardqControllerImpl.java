package com.myspring.daejeon30.boardq.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.daejeon30.boardq.service.BoardqService;
import com.myspring.daejeon30.boardq.vo.BoardqVO;
import com.myspring.daejeon30.member.vo.MemberVO;

@Controller("boardqController")
public class BoardqControllerImpl implements BoardqController{
	@Autowired
	private BoardqService boardqService;
	@Autowired
	private BoardqVO boardqVO;
	
	@Override
	@RequestMapping(value="/boardq/qna.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView qnaList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		List allqna = boardqService.qnaList();
		ModelAndView mav = new ModelAndView();
		mav.addObject("qnaList", allqna);
		mav.setViewName("qna");
		return mav;
	}
	
	@Override
	@RequestMapping(value="/boardq/addQna.do", method=RequestMethod.POST)
	public String addQna(@ModelAttribute("boardqVO") BoardqVO boardqVO,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		int result = 0;
		result = boardqService.addQna(boardqVO);
		return "redirect:/boardq/qna.do";
	}
	
	@RequestMapping(value="/boardq/writeformq.do", method=RequestMethod.GET)
	public ModelAndView writeformq(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session = request.getSession();
		MemberVO mem= (MemberVO)session.getAttribute("member");
		ModelAndView mav = new ModelAndView();
		mav.addObject("mem", mem);
		mav.setViewName("writeformQ");
		return mav;
	}
	
	
	
}