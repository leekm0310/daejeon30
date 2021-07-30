package com.myspring.daejeon30.rsvnon.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.daejeon30.rsvnon.vo.RsvnonVO;

public interface RsvnonController{
	public ModelAndView addNewRsv(@ModelAttribute("rsvnonVO") RsvnonVO rsvnonVO,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView searchRsvNon(@ModelAttribute("rsvnonVO") RsvnonVO rsvnonVO,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
}