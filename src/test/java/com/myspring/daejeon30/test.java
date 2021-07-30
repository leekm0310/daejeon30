package com.myspring.daejeon30;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.myspring.daejeon30.member.service.MemberService;
import com.myspring.daejeon30.member.vo.MemberVO;

public class test {
	@Autowired
	MemberService memberService;

	@Test
	public void testLogin() throws Exception {
		MemberVO memberVO = new MemberVO();
		
		memberVO.setId("abc123");
		memberVO.setPassword("1234");
		
		MemberVO mem = new MemberVO();
	    mem = memberService.login(memberVO);
		System.out.print(mem);
	

	}

}
