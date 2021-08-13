package com.myspring.daejeon30.rsvmember.controller;



import org.springframework.ui.Model;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.daejeon30.member.vo.MemberVO;
import com.myspring.daejeon30.rsvmember.service.RsvMemberService;
import com.myspring.daejeon30.rsvmember.vo.RsvMemberVO;



@Controller("rsvMemberController")
public class RsvMemberControllerImpl implements RsvMemberController {
	@Autowired
	private RsvMemberService rsvMemberService;
	@Autowired
	RsvMemberVO rsvMemberVO;
	@Autowired
	private MemberVO memberVO;

	@Override
	@RequestMapping(value="rsvMember/insertRsvMember.do", method = RequestMethod.POST)
	public ResponseEntity insertRsvMember(RsvMemberVO rsvMemberVO, HttpServletRequest request, HttpServletResponse response) throws Exception{
		ResponseEntity resEntity = null;
		int result = 0;
		result = rsvMemberService.insertRsvMember(rsvMemberVO);
		resEntity = new ResponseEntity(Integer.toString(result), HttpStatus.OK);
		return resEntity;
	}

	/*
	 * @Override
	 * 
	 * @RequestMapping(value="/rsvMember/result1.do", method= RequestMethod.POST)
	 * public ModelAndView rsvResultView(@ModelAttribute("rsvMemberVO") RsvMemberVO
	 * rsvMemberVO, HttpServletRequest request, HttpServletResponse response)throws
	 * Exception{ request.setCharacterEncoding("utf-8");
	 * response.setContentType("html/text; charset=utf-8"); ModelAndView mav = new
	 * ModelAndView("/rsv/result1"); mav.addObject("rsvMemberVO", rsvMemberVO);
	 * return mav; }
	 */
	@RequestMapping(value="/rsvMember/result1.do", method=RequestMethod.POST)
	public String result1(@ModelAttribute("rsvMemberVO") RsvMemberVO rsvMemberVO, Model model) {
		model.addAttribute("rsvMemberVO", rsvMemberVO);
		return "result1";
	}
	
	@Override
	@RequestMapping(value="rsv/res1.do", method = RequestMethod.GET)
	//public ModelAndView listrsv(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception{
	public ModelAndView listrsv(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session = request.getSession();
		memberVO = (MemberVO)session.getAttribute("member");
		String id = memberVO.getId();               
		Date dd = new Date(new Date().getTime()+1000*60*60*24*7);
		Date now = new Date();
		List rsvlist = rsvMemberService.listrsv(id);
		
	
		ModelAndView mav = new ModelAndView();
		mav.addObject("rsvlist", rsvlist);
		mav.addObject("now", now);
		mav.addObject("dd", dd);

		//System.out.print(rsvlist);
		mav.setViewName("res1");
		return mav;
	}
	
	@Override
	@RequestMapping(value="rsv/cancelRsv.do", method= RequestMethod.GET)
	public ModelAndView cancelRsv(@RequestParam("rsvNum") String rsvNum, 
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		rsvMemberService.cancelRsv(rsvNum);
		HttpSession session = request.getSession();
		memberVO = (MemberVO)session.getAttribute("member");
		String id = memberVO.getId();               
		
		List rsvlist = rsvMemberService.listrsv(id);
		
		mav.addObject("rsvlist", rsvlist);
		mav.setViewName("res1");
		return mav;
	}
	
	@Override
	@RequestMapping(value="rsv/selectOne.do", method = RequestMethod.GET)
	public ModelAndView viewOneRsv(@RequestParam("rsvNum") int rsvNum, HttpServletRequest request, HttpServletResponse response) throws Exception {
		RsvMemberVO rsvMemberVO = rsvMemberService.viewOneRsv(rsvNum);
		ModelAndView mav = new ModelAndView();
		mav.addObject("rsvOne", rsvMemberVO);
		mav.setViewName("modifyRsv");
		return mav;
		
	}
	
	//@Override
	//@RequestMapping(value="rsv/updateOne.do", method = RequestMethod.POST)
	//public ModelAndView updateRsvOne(@RequestParam("rsvNum") String rsvNum, HttpServletRequest request, HttpServletResponse response) throws Exception {
	//	rsvMemberService.updateRsvOne(rsvNum);
		
	//	ModelAndView mav = new ModelAndView();
	//	HttpSession session = request.getSession();
	//	memberVO = (MemberVO)session.getAttribute("member");
	//	String id = memberVO.getId();               
	//	List rsvlist = rsvMemberService.listrsv(id);
		
	//	mav.addObject("rsvlist", rsvlist);
	//	mav.setViewName("res1");
	//	return mav;
	//}
	
	@Override
	@RequestMapping(value="rsv/updateOne.do", method = RequestMethod.POST)
	public ModelAndView updateRsvOne(@ModelAttribute("rsvMemberVO") RsvMemberVO rsvMemberVO, 
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		int result = 0;
		result = rsvMemberService.updateRsvOne(rsvMemberVO);
		
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		memberVO = (MemberVO)session.getAttribute("member");
		String id = memberVO.getId();               
		List rsvlist = rsvMemberService.listrsv(id);
			
		mav.addObject("rsvlist", rsvlist);
		mav.setViewName("res1");
		return mav;
		
	}
	
	@Override
	@RequestMapping(value="mypage/mymain.do", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView myPageMain(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		HttpSession session = request.getSession();
		memberVO = (MemberVO)session.getAttribute("member");
		String id = memberVO.getId();  
		
		Map confirm = new HashMap();
		confirm.put("status","예약완료");
		confirm.put("id", id);
		
		int resultConfirm = rsvMemberService.countStatus(confirm);
		
		Map cancel = new HashMap();
		cancel.put("status", "취소완료");
		cancel.put("id", id);
		
		int resultCancel = rsvMemberService.countStatus(cancel);
		
		Map requestR = new HashMap();
		requestR.put("status", "예약요청중");
		requestR.put("id", id);
		
		int resultBC = rsvMemberService.countStatus(requestR);
		
		Map requestC = new HashMap();
		requestC.put("status", "취소요청중");
		requestC.put("id", id);
		
		int resultRC = rsvMemberService.countStatus(requestC);

		ModelAndView mav = new ModelAndView();
		mav.addObject("confirm", resultConfirm);
		mav.addObject("cancel", resultCancel);
		mav.addObject("requestR", resultBC);
		mav.addObject("requestC", resultRC);
		mav.setViewName("mymain1");
		return mav;
		
	}

}



