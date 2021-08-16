package com.myspring.daejeon30.admin.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.daejeon30.admin.member.service.AdminMemberService;
import com.myspring.daejeon30.member.vo.MemberVO;
import com.myspring.daejeon30.paging.Criteria;
import com.myspring.daejeon30.paging.PageMaker;

@Controller("adminMemberController")
public class AdminMemberControllerImpl implements AdminMemberController{
	@Autowired
	private AdminMemberService adminMemberService;
	
	/*원래쓰던 멤버리스트
	@Override
	@RequestMapping(value="/admin/listMem.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView AllMember(HttpServletRequest request, HttpServletResponse response) throws Exception{
		List memberList = adminMemberService.Allmember();
		ModelAndView mav = new ModelAndView();
		mav.addObject("memList", memberList);
		mav.setViewName("listMem");
		return mav;
	}*/
	
	@RequestMapping(value="/admin/listMem.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView AllMember(Criteria cri,HttpServletRequest request, HttpServletResponse response) throws Exception{
		List memberList = adminMemberService.selectMemberList(cri);
		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(adminMemberService.countMemberListTotal());
		ModelAndView mav = new ModelAndView();
		mav.addObject("memList", memberList);
		mav.addObject("pageMaker", pageMaker);
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
		mav.addObject("mem", mem);
		mav.setViewName("modifyMem");
		return mav;
	}
	
	@Override
	@RequestMapping(value="/admin/modifyMem.do", method=RequestMethod.POST)
	public ModelAndView modifyMem(@ModelAttribute("mem") MemberVO mem,
			HttpServletRequest request, HttpServletResponse response)throws Exception{
		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text; charset=utf-8");
		ModelAndView mav = new ModelAndView();
		adminMemberService.updateMem(mem);
		List memberList = adminMemberService.Allmember();
		mav.addObject("memList", memberList);
		mav.setViewName("listMem");
		return mav;
	}
	
	@Override
	@RequestMapping(value="/admin/selectMemType.do", method=RequestMethod.GET)
	public ModelAndView selectMemType(@RequestParam("memType") String memType, HttpServletRequest request, HttpServletResponse response) throws Exception{
		List memList = adminMemberService.selectMemType(memType);
		ModelAndView mav = new ModelAndView();
		mav.addObject("memList", memList);
		mav.setViewName("listMem");
		return mav;
		
	}
	
	
	//회원검색
	@RequestMapping(value="/admin/searchMember.do")
	public ModelAndView searchMember(String word1, String sorting1, 
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		String word = word1;
		Map map = new HashMap();
		map.put("sorting", sorting1);
		map.put("word", word);
		System.out.print(map);
		List search = adminMemberService.searchMember(map);
		ModelAndView mav = new ModelAndView();
		mav.addObject("memList", search);
		mav.setViewName("listMem");
		return mav;
	
	}
	
	
}