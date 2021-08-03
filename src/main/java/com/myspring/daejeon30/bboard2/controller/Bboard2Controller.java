package com.myspring.daejeon30.bboard2.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface Bboard2Controller{
	public ModelAndView reviewList(HttpServletRequest request, HttpServletResponse response) throws Exception;
}