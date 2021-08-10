package com.myspring.daejeon30.admin.reservation.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.daejeon30.admin.reservation.service.AdminReservationService;

@Controller("adminReservationController")
public class AdminReservationControllerImpl implements AdminReservationController{
	@Autowired
	private AdminReservationService adminReservationService;
	
	@Override
	@RequestMapping(value="/admin/allRsv.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView allRsv(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List rsvAll= adminReservationService.allRsv();
		ModelAndView mav = new ModelAndView();
		mav.addObject("rsv1", rsvAll);
		mav.setViewName("adminrsv");
		return mav;
		
	}
	
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

}