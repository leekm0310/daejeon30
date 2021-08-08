package com.myspring.daejeon30.bboard2.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

public interface Bboard2Controller{
	public ModelAndView reviewList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	//public ResponseEntity addreview(MultipartHttpServletRequest multipartRequest,
	//		HttpServletResponse response) throws Exception;
}