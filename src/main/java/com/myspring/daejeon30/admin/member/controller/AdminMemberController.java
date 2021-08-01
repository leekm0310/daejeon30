package com.myspring.daejeon30.admin.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.daejeon30.member.vo.MemberVO;

public interface AdminMemberController{
	public ModelAndView AllMember(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView deleteMem(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView memDetail(@RequestParam("id") String id,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView modifyMem(@ModelAttribute("mem") MemberVO mem,
			HttpServletRequest request, HttpServletResponse response)throws Exception;
	public ModelAndView selectMemType(@RequestParam("memType") String memType, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}