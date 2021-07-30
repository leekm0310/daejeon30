package com.myspring.daejeon30.admin.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.daejeon30.admin.member.service.AdminMemberService;
import com.myspring.daejeon30.member.vo.MemberVO;

@Controller("adminMemberController")
public class AdminMemberControllerImpl implements AdminMemberController{
	@Autowired
	private AdminMemberService adminMemberService;
	
	@Override
	@RequestMapping(value="/admin/listMem.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView AllMember(HttpServletRequest request, HttpServletResponse response) throws Exception{
		List memberList = adminMemberService.Allmember();
		ModelAndView mav = new ModelAndView();
		mav.addObject("memList", memberList);
		mav.setViewName("listMem");
		return mav;
	}
	
	@Override
	@RequestMapping(value="/admin/deleteMem.do", method= RequestMethod.GET)
	public ModelAndView deleteMem(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception{
		adminMemberService.deleteMem(id);
		List memberList = adminMemberService.Allmember();
		ModelAndView mav = new ModelAndView();
		mav.addObject("memList", memberList);
		mav.setViewName("listMem");
		return mav;
		
	}
	
	@Override
	@RequestMapping(value="/admin/memDetail.do", method=RequestMethod.GET)
	public ModelAndView memDetail(@RequestParam("id") String id,HttpServletRequest request, HttpServletResponse response) throws Exception{
		MemberVO mem = adminMemberService.oneMem(id);
		ModelAndView mav = new ModelAndView();
		mav.addObject("member", mem);
		mav.setViewName("modify");
		return mav;
	}
	
}