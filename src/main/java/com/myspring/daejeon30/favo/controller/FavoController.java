package com.myspring.daejeon30.favo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.daejeon30.favo.vo.FavoVO;

public interface FavoController{
	public ModelAndView addFavo(@ModelAttribute("favoVO") FavoVO favoVO,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView listFavo(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	
}