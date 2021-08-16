package com.myspring.daejeon30.admin.reservation.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.daejeon30.admin.member.service.AdminMemberService;
import com.myspring.daejeon30.admin.reservation.service.AdminReservationService;
import com.myspring.daejeon30.boardq.service.BoardqService;
import com.myspring.daejeon30.paging.Criteria;
import com.myspring.daejeon30.paging.PageMaker;

@Controller("adminReservationController")
public class AdminReservationControllerImpl implements AdminReservationController{
	@Autowired
	private AdminReservationService adminReservationService;
	@Autowired
	private AdminMemberService adminMemberService;
	@Autowired
	private BoardqService boardqService;
	
	// 기존 회원 예약 리스트
	@Override
	@RequestMapping(value="/admin/allRsv.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView allRsv(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List rsvAll= adminReservationService.allRsv();
		ModelAndView mav = new ModelAndView();
		mav.addObject("rsv1", rsvAll);
		mav.setViewName("adminrsv");
		return mav;
		
	}
	
	/*@RequestMapping(value="/admin/allRsv.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView allRsv(Criteria cri,HttpServletRequest request, HttpServletResponse response) throws Exception {
		List rsvAll= adminReservationService.selectMemRList(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setTotalCount(adminReservationService.countMemRListTotal());
	    pageMaker.setCri(cri);
		ModelAndView mav = new ModelAndView();
		mav.addObject("rsv1", rsvAll);
		mav.addObject("pageMaker", pageMaker);
		mav.setViewName("adminrsv");
		return mav;
	}*/
	
	
	
	
	@RequestMapping(value="/admin/acceptres.do", method=RequestMethod.GET)
	public String acceptRes(@RequestParam("rsvNum") int rsvNum, 
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		adminReservationService.acceptRsv(rsvNum);
		return "redirect:/admin/allRsv.do";
	}
	
	@RequestMapping(value="/admin/cancelres.do", method=RequestMethod.GET)
	public String cancelRes(@RequestParam("rsvNum") int rsvNum, 
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		adminReservationService.cancelRsv(rsvNum);
		return "redirect:/admin/allRsv.do";
	}
	
	@Override
	@RequestMapping(value="/admin/nonRsv.do", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView allNonRsv (HttpServletRequest request, HttpServletResponse response) throws Exception{
		List nonAll = adminReservationService.Allnon();
		ModelAndView mav = new ModelAndView();
		mav.addObject("rsv1", nonAll);
		mav.setViewName("nonrsv");
		return mav;
	}
	
	@RequestMapping(value="/admin/acceptnonres.do", method=RequestMethod.GET)
	public String acceptnonRes(@RequestParam("rsvNum") int rsvNum, 
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		adminReservationService.acceptnonRsv(rsvNum);
		return "redirect:/admin/nonRsv.do";
	}
	
	@RequestMapping(value="/admin/cancelnonres.do", method=RequestMethod.GET)
	public String cancelnonRes(@RequestParam("rsvNum") int rsvNum, 
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		adminReservationService.cancelnonRsv(rsvNum);
		return "redirect:/admin/nonRsv.do";
	}
	
	
	//회원
	@RequestMapping(value="/admin/memStatus.do")
	public ResponseEntity memStatus(String status,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		ResponseEntity resEntity = null;
		List ss = adminReservationService.selectStatus(status);
		resEntity = new ResponseEntity(ss, HttpStatus.OK);
		return resEntity;
	}
	
	//비회원
	@RequestMapping(value="/admin/nonStatus.do")
	public ResponseEntity nonStatus(String status,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		ResponseEntity resEntity = null;
		List ss = adminReservationService.selectnonStatus(status);
		resEntity = new ResponseEntity(ss, HttpStatus.OK);
		return resEntity;
	}
	
	//관리자 메인
	@RequestMapping(value="/admin/adminmain.do")
	public ModelAndView adminmain(HttpServletRequest request, HttpServletResponse response) throws Exception{
		int newrm = adminReservationService.countNewRsvmem();
		int newmem = adminMemberService.newMember();
		int newqna = boardqService.newQna();
		int newcm = adminReservationService.countCanRsvmem();
		HttpSession session = request.getSession();
		session.setAttribute("newcm", newcm);
		session.setAttribute("newrm", newrm);
		session.setAttribute("newmem", newmem);
		session.setAttribute("newqna", newqna);
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("adminMain");
		return mav;
		
	}

}