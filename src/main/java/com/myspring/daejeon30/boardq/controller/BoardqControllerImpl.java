package com.myspring.daejeon30.boardq.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.daejeon30.boardq.service.BoardqService;
import com.myspring.daejeon30.boardq.vo.BoardqVO;
import com.myspring.daejeon30.member.vo.MemberVO;
import com.myspring.daejeon30.qcomment.service.QcommentService;
import com.myspring.daejeon30.qcomment.vo.QcommentVO;

@Controller("boardqController")
public class BoardqControllerImpl implements BoardqController{
	@Autowired
	private BoardqService boardqService;
	@Autowired
	private BoardqVO boardqVO;
	@Autowired
	private QcommentService qcommentService;
	
	@Override
	@RequestMapping(value="/boardq/qna.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView qnaList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		List allqna = boardqService.qnaList();
		ModelAndView mav = new ModelAndView();
		mav.addObject("qnaList", allqna);
		mav.setViewName("qna");
		return mav;
	}
	
	@Override
	@RequestMapping(value="/boardq/addQna.do", method=RequestMethod.POST)
	public String addQna(@ModelAttribute("boardqVO") BoardqVO boardqVO,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		int result = 0;
		result = boardqService.addQna(boardqVO);
		return "redirect:/boardq/qna.do";
	}
	
	@RequestMapping(value="/boardq/writeformq.do", method=RequestMethod.GET)
	public ModelAndView writeformq(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session = request.getSession();
		MemberVO mem= (MemberVO)session.getAttribute("member");
		ModelAndView mav = new ModelAndView();
		mav.addObject("mem", mem);
		mav.setViewName("writeformQ");
		return mav;
	}
	
	@Override
	@RequestMapping(value="/boardq/adminQna.do", method=RequestMethod.GET)
	public ModelAndView adminQna(@RequestParam("num") int num, 
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		BoardqVO bVO = boardqService.adminQna(num);
		
		List qcList = qcommentService.qcomments(num);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("comment", qcList);
		mav.addObject("bVO", bVO);
		mav.setViewName("viewQna");
		return mav;
	}
	

	
	@RequestMapping(value="/boardq/passthro.do", method= RequestMethod.POST)
	public ModelAndView passthro(@ModelAttribute("boardqVO") BoardqVO boardqVO, 
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		String referer = (String)request.getHeader("REFERER");
		BoardqVO bVO = boardqService.passthrow(boardqVO);
		mav.setViewName("redirect:"+referer);
		
		if (bVO == null) {
			mav.addObject("check", 1);
			
		} else {
			mav.addObject("check", 0);
			//mav.setViewName("redirect:/boardq/adminQna.do?num=" + bVO.getNum());
			mav.setViewName("redirect:/boardq/viewQna.do?num="+ bVO.getNum());
		} return mav;

	}
	
	
	
	@RequestMapping(value="/boardq/updateQna.do", method=RequestMethod.POST)
	public String updateQna(@ModelAttribute("boardqVO") BoardqVO boardqVO, 
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		boardqService.updateQna(boardqVO);
		return "redirect:/boardq/qna.do";
	}
	
	@RequestMapping(value="/boardq/deleteQna.do", method=RequestMethod.GET)
	public String deleteQna(@RequestParam("num") int num, 
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		boardqService.deleteQna(num);
		return "redirect:/boardq/qna.do";
	}
	

	//´ñ±Ûµî·Ï
	@RequestMapping(value="boardq/addqcomment.do")
	public ResponseEntity addqcomment(QcommentVO qcommentVO,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		ResponseEntity resEntity = null;
		qcommentService.writeQComment(qcommentVO);
		resEntity = new ResponseEntity(HttpStatus.OK);
		return resEntity;
	}
	
	
	//´ñ±ÛÁ¶È¸
	@RequestMapping(value="/boardq/listQC.do")
	public ResponseEntity listQC(int num, 
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		ResponseEntity resEntity = null;
		List qc = qcommentService.qcomments(num);
		resEntity = new ResponseEntity(qc, HttpStatus.OK);
		return resEntity;
	}
	
	
	//´ñ±Û ¼öÁ¤
	@RequestMapping(value="/boardq/updateQC.do")
	public ResponseEntity updateQC(QcommentVO qcommentVO,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		ResponseEntity resEntity = null;
		qcommentService.updateQcomment(qcommentVO);
		resEntity = new ResponseEntity(HttpStatus.OK);
		return resEntity;
	}
	
	//´ñ±Û »èÁ¦
	//@RequestMapping(value="/boardq/deleteQC.do")
	//public String deleteQC(int num, 
	//		HttpServletRequest request, HttpServletResponse response) throws Exception{
	//	String referer = (String)request.getHeader("REFERER");
	//	qcommentService.deleteQcomment(num);
	//	return "redirect:" + referer;
	//}
	
	@RequestMapping(value="/boardq/deleteQC.do")
	public ResponseEntity deleteQC(int num, 
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		ResponseEntity resEntity = null;
		qcommentService.deleteQcomment(num);
		resEntity = new ResponseEntity(HttpStatus.OK);
		return resEntity;
	}
	
	
	
	//´ñ±Û + ±Ûº¸±â 2
	@RequestMapping(value="/boardq/viewQna.do")
	public ModelAndView viewQna(@RequestParam("num") int num, 
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		BoardqVO bVO = boardqService.adminQna(num);
		List qcList = qcommentService.qcomments(num);
		Map map = new HashMap();
		map.put("bVO", bVO);
		map.put("qcList", qcList);
		ModelAndView mav = new ModelAndView();
		mav.addObject("map",map);
		mav.setViewName("viewQna1");
		return mav;
		
	}
	
	
	//°Ë»ö ¹Ì¿Ï
	@RequestMapping(value="/boardq/searchTitle.do")
	public ModelAndView searchTitle(String word1, String sorting1,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		String word = "%"+word1+"%";
		System.out.print(sorting1);
		Map map = new HashMap();
		map.put("sorting", sorting1);
		map.put("word", word);
		System.out.print(map);
		List search = boardqService.searchTitle(map);
		System.out.print(search);
		ModelAndView mav = new ModelAndView();
		mav.addObject("qnaList", search);
		mav.setViewName("qna");
		return mav;
	}

	
	
}