package com.myspring.daejeon30.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myspring.daejeon30.member.vo.MemberVO;

public interface MemberController{
	public ModelAndView login(@ModelAttribute("member") MemberVO member,
			RedirectAttributes rAttr,
			HttpServletRequest request, HttpServletResponse response)throws Exception;
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response)throws Exception;
	public ModelAndView addMember(@ModelAttribute("info") MemberVO memberVO,
			HttpServletRequest request, HttpServletResponse response)throws Exception;
	public ResponseEntity overlapped(@RequestParam("id") String id,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	//회원탈퇴
	//public ModelAndView removeMember(@RequestParam("id") String id, 
	//		HttpServletRequest request, HttpServletResponse response) throws Exception;
	//회원탈퇴2
	public ModelAndView removeMember(@ModelAttribute("member") MemberVO member, 
		HttpSession session, RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception;
	//회원정보수정
	public ModelAndView modifyMember(@ModelAttribute("member") MemberVO memberVO,
			HttpServletRequest request, HttpServletResponse response)throws Exception;
	//아이디찾기
	public ModelAndView findMember(@ModelAttribute("member") MemberVO memberVO, 
			HttpServletRequest request, HttpServletResponse response)throws Exception;
	
	//비밀번호찾기
	public ModelAndView findPassword(@ModelAttribute("member") MemberVO memberVO, 
			HttpServletRequest request, HttpServletResponse response)throws Exception;
}
