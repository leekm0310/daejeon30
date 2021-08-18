package com.myspring.daejeon30.boardq.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.daejeon30.boardq.vo.BoardqVO;

public interface BoardqController{
	//원래쓰던 리스트 public ModelAndView qnaList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String addQna(@ModelAttribute("boardqVO") BoardqVO boardqVO,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView adminQna(@RequestParam("num") int num, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView myQna(HttpServletRequest request, HttpServletResponse response) throws Exception;
}