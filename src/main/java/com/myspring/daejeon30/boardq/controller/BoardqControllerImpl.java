package com.myspring.daejeon30.boardq.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.daejeon30.boardq.service.BoardqService;
import com.myspring.daejeon30.boardq.vo.BoardqVO;

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
}