package com.myspring.daejeon30;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.myspring.daejeon30.member.service.MemberService;
import com.myspring.daejeon30.member.vo.MemberVO;

public class test2 {
	@Autowired
	MemberService memberService;

	@Test
	public void testFindMember() throws Exception {
		MemberVO memberVO = new MemberVO();
		
		memberVO.setName("¹Úº¸°Ë");
		memberVO.setEmail("test@test.com");
		
		MemberVO mem = new MemberVO();
		mem = memberService.findMember(memberVO);
		System.out.print(mem);
	}

}
