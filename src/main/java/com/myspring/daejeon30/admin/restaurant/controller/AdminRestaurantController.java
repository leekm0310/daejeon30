package com.myspring.daejeon30.admin.restaurant.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

public interface AdminRestaurantController{
	public ModelAndView listRes(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//조인쓰 - 원래쓰던 리스트 불러오기
	//public ModelAndView allRes(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ResponseEntity addNewRes(MultipartHttpServletRequest multipartRequest,HttpServletResponse response) throws Exception;
	public ModelAndView viewRes(@RequestParam("resNum") int resNum, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity removeRes(@RequestParam("resNum") int resNum, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity modRes(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
}