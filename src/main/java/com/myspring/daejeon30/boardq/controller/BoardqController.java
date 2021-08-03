package com.myspring.daejeon30.boardq.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface BoardqController{
	public ModelAndView qnaList(HttpServletRequest request, HttpServletResponse response) throws Exception;
}