package com.myspring.daejeon30.bboard.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface BboardController{
	public ModelAndView nList(HttpServletRequest request, HttpServletResponse response) throws Exception;
}