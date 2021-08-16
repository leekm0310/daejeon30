package com.myspring.daejeon30.member.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myspring.daejeon30.member.service.MemberService;
import com.myspring.daejeon30.member.vo.MemberVO;

@Controller("memberController")
public class MemberControllerImpl implements MemberController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private MemberVO memberVO;
	
	@Override //�α��Τ�����
	@RequestMapping(value= "/member/login.do", method= RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("member") MemberVO member, RedirectAttributes rAttr,
			HttpServletRequest request, HttpServletResponse response)throws Exception{
	ModelAndView mav = new ModelAndView();
	memberVO = memberService.login(member);
	if(memberVO != null) {
		HttpSession session = request.getSession();
		session.setAttribute("member", memberVO);
		session.setAttribute("isLogOn", true);
		mav.setViewName("redirect:/main.do");
	}else {
		rAttr.addAttribute("result","loginFailed");
		mav.setViewName("redirect:/login.do");
	}
	return mav;
	}
	
	
	 //�α���2 -�������������� �Ѿ�� �α���
		@RequestMapping(value= "/member/login2.do", method= RequestMethod.POST)
		public ModelAndView login2(@ModelAttribute("member") MemberVO member, RedirectAttributes rAttr,
				HttpServletRequest request, HttpServletResponse response)throws Exception{
		ModelAndView mav = new ModelAndView();
		memberVO = memberService.login(member);
		if(memberVO != null) {
			HttpSession session = request.getSession();
			session.setAttribute("member", memberVO);
			session.setAttribute("isLogOn", true);
			mav.setViewName("redirect:/res/rsv2.do");
		}else {
			rAttr.addAttribute("result","loginFailed");
			mav.setViewName("redirect:/login2.do");
		}
		return mav;
		}
	
	@Override //�α׾ƿ�
	@RequestMapping(value="/member/logout.do", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session = request.getSession();
		session.removeAttribute("member");
		session.removeAttribute("isLogOn");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/main.do");
		return mav;
	}
	

	@Override //ȸ������
	@RequestMapping(value="/member/addMember.do", method= RequestMethod.POST)
	public ModelAndView addMember(@ModelAttribute("member") MemberVO member,
			HttpServletRequest request, HttpServletResponse response)throws Exception{
		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text; charset=utf-8");
		int result = 0;
		result=memberService.addMember(member);
		ModelAndView mav = new ModelAndView("redirect:/main.do");
		return mav;
	}
	
	@Override //���̵��ߺ��˻�
	@RequestMapping(value="member/overlapped.do", method = RequestMethod.POST)
	public ResponseEntity overlapped(@RequestParam("id") String id,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		ResponseEntity resEntity = null;
		String result = memberService.overlapped(id);
		resEntity =new ResponseEntity(result, HttpStatus.OK);
		return resEntity;
	}
	
	//@Override//ȸ��Ż��
	//@RequestMapping(value="/member/removeMember.do" ,method = RequestMethod.GET)
	//public ModelAndView removeMember(@RequestParam("id") String id, 
	//		           HttpServletRequest request, HttpServletResponse response) throws Exception{
	//	request.setCharacterEncoding("utf-8");
	//	memberService.removeMember(id);
	//	ModelAndView mav = new ModelAndView("redirect:/main.do");
	//	return mav;
	//}
	
	
	@Override//ȸ��Ż��2 (ȸ��Ż��+��������) �ڹٽ�ũ��Ʈ ���� �ڹٴܿ��� �۾��ǰ� �����Ұ�
	@RequestMapping(value="/member/removeMember.do" ,method = RequestMethod.POST)
	public ModelAndView removeMember(@ModelAttribute("member") MemberVO member, 
			HttpSession session,RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		
		MemberVO memberVO=(MemberVO)session.getAttribute("member");
		//String sessionPw = member.getPassword();
		//String memberPw = member.getPassword();	
		memberService.removeMember(member);
		session.removeAttribute("member");
		session.removeAttribute("isLogOn");
		
		ModelAndView mav = new ModelAndView("redirect:/main.do");
		return mav;
	}
	
	//ȸ���������� ������
	@Override
	@RequestMapping(value="/member/modifyMember.do", method = RequestMethod.POST)
	public ModelAndView modifyMember(@ModelAttribute("member") MemberVO member,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text; charset=utf-8");
		ModelAndView mav = new ModelAndView();
		String pw = memberVO.getPassword();
		//�Ʒ��� ��й�ȣ Ȯ���ϴ� �� �ۼ��Ұ�
		
		int result=0;
		result = memberService.modifyMember(member);
		memberVO = memberService.login(member);
		HttpSession session = request.getSession();
		session.setAttribute("member", memberVO);
		session.setAttribute("isLogOn", true);
		mav.setViewName("redirect:/modify.do");
		return mav;
		
		
	}

	//���̵�ã��
	@Override
	@RequestMapping(value="/member/findMember.do", method=RequestMethod.POST)
	public ModelAndView findMember(@ModelAttribute("member") MemberVO member,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/find.do");
		//mav.addObject(memberVO);
		MemberVO mem = memberService.findMember(member);
		
		if (mem == null) {
			mav.addObject("check", 1);
			//mav.setViewName("redirect:/find.do");
		} else {
			mav.addObject("check", 0);
			mav.addObject("id",mem.getId());
			mav.setViewName("redirect:/find.do");	
		}	
		return mav;
	}
	
	//��й�ȣã��
	@Override
	@RequestMapping(value="/member/findPassword.do", method=RequestMethod.POST)
	public ModelAndView findPassword(@ModelAttribute("member") MemberVO member,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/find.do");
		MemberVO pw = memberService.findPassword(member);
		
		if (pw == null) {
			mav.addObject("checkPw", 1);
			//mav.setViewName("redirect:/find.do");
		} else {
			mav.addObject("checkPw", 0);
			mav.addObject("password",pw.getPassword());
			mav.setViewName("redirect:/find.do");	
		}	
		return mav;
	}
	

	//public ResponseEntity findMember(@RequestParam("name") String name,
	//		HttpServletRequest request, HttpServletResponse response) throws Exception{
	//	response.setContentType("text/html; charset=utf-8");
	//	PrintWriter out = response.getWriter();
	//	ResponseEntity resEntity=null;
	//	String result=memberService.findMember(name);
	//	resEntity=new ResponseEntity(result,HttpStatus.OK);
	//	if (result == null) {
	//		out.println("<script>");
	//		out.println("alert('���Ե� ���̵� �����ϴ�.');");
	//		out.println("</script>");
	//		out.close();
	//		return null;
	//	} else {
	//		return resEntity;
	//	}
	//}
		
		
		//return resEntity;
	
	@ExceptionHandler(Exception.class)
	public ModelAndView HandleError(HttpServletRequest request, Exception exception) {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("exception", exception);
		mav.addObject("url", request.getRequestURL());
		mav.setViewName("redirect:/WEB-INF/views/error/error.jsp");
		return mav;
		
	}
	
	
	
	}

		
	
