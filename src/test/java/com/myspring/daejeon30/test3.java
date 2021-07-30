package com.myspring.daejeon30;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.myspring.daejeon30.member.service.MemberService;
import com.myspring.daejeon30.member.vo.MemberVO;

public class test3 {
	@Autowired
	MemberService memberService;

	@Test
	public void testOverlapped() throws Exception {
		String id = "abc1";
		String result = memberService.overlapped(id);
		System.out.println(result);
	}

}
