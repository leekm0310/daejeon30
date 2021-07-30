package com.myspring.daejeon30.rsvmember.controller;


import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.ui.Model;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import com.myspring.daejeon30.rsvmember.vo.RsvMemberVO;
import org.springframework.web.servlet.ModelAndView;

public interface RsvMemberController{
	public ResponseEntity insertRsvMember(@ModelAttribute("rsvMemberVO") RsvMemberVO rsvMemberVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String result1(@ModelAttribute("rsvMemberVO") RsvMemberVO rsvMemberVO, Model model);
	//public ModelAndView listrsv(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView listrsv(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView cancelRsv(@RequestParam("rsvNum") String rsvNum, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView viewOneRsv(@RequestParam("rsvNum") int rsvNum, HttpServletRequest request, HttpServletResponse response) throws Exception;
	//public ModelAndView updateRsvOne(@RequestParam("rsvNum") String rsvNum, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView updateRsvOne(@ModelAttribute("rsvMemberVO") RsvMemberVO rsvMemberVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
}