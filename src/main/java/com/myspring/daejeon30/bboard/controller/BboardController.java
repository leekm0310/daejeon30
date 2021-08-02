package com.myspring.daejeon30.bboard.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.daejeon30.bboard.vo.BboardVO;

public interface BboardController{
	//public ModelAndView nList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String addNotice(@ModelAttribute("bboardVO") BboardVO bboardVO,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView bboardList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView nboardList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView selectOne(@RequestParam("num") String num, HttpServletRequest request, HttpServletResponse response) throws Exception;
}
