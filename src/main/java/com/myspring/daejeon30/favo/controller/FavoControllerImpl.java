package com.myspring.daejeon30.favo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.daejeon30.favo.service.FavoService;
import com.myspring.daejeon30.favo.vo.FavoVO;
import com.myspring.daejeon30.member.vo.MemberVO;

@Controller("FavoController")
public class FavoControllerImpl implements FavoController{
	@Autowired
	private FavoService favoService;
	@Autowired
	private FavoVO favoVO;
	@Autowired
	private MemberVO memberVO;
	
	@Override
	@RequestMapping(value="favo/addfavo.do", method= RequestMethod.POST)
	public ModelAndView addFavo(@ModelAttribute("favoVO") FavoVO favoVO,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text; charset=utf-8");
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession();
		memberVO = (MemberVO)session.getAttribute("member");
		String id = memberVO.getId();
		
		favoVO.setId(id);
		FavoVO fav = new FavoVO();
		fav = favoService.insertFavo(favoVO);
		mav.addObject("fav",fav);
		mav.setViewName("forward:/res/rlist1.do");
		return mav;
		
	}
	
	
//	@RequestMapping(value="favo/addfavo1.do", method = RequestMethod.POST)
//	public ResponseEntity addFavo1(@RequestBody FavoVO favoVO,HttpServletRequest request,
 //           HttpServletResponse response) throws Exception {
//		   
//		ResponseEntity resEntity = null;
//	        HttpSession session = request.getSession();
//	        MemberVO member = (MemberVO) session.getAttribute("member");
//	        String id = member.getId();
//	        
//	        favoVO.setId(id);
//	        
//	        List likelist = (List) favoService.insertFavo(favoVO);
//	        resEntity = new ResponseEntity(likelist, HttpStatus.OK);
//
//		}

	
	@Override
	@RequestMapping(value="favo/list1.do", method= RequestMethod.GET)
	public ModelAndView listFavo(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session = request.getSession();
		memberVO = (MemberVO)session.getAttribute("member");
		String id = memberVO.getId();
		
		List favolist = favoService.listfavo(id);
		ModelAndView mav = new ModelAndView();
		mav.addObject("favolist", favolist);
		mav.setViewName("like1");
		return mav;
	}
	
	@RequestMapping(value="favo/removeFavo.do", method=RequestMethod.POST)
	public String removeFavo(@ModelAttribute("favoVO") FavoVO favoVO, HttpServletRequest request, HttpServletResponse response) throws Exception{

		HttpSession session = request.getSession();
		memberVO = (MemberVO)session.getAttribute("member");
		String id = memberVO.getId();
		
		favoVO.setId(id);
		FavoVO fav = new FavoVO();
		favoService.deleteFavo(favoVO);
		return "redirect:/favo/list1.do";
	}

}
	
	
	
	
