package com.myspring.daejeon30.admin;

import java.net.http.HttpHeaders;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.daejeon30.bboard.service.BboardService;
import com.myspring.daejeon30.bboard.vo.BboardVO;
import com.myspring.daejeon30.bboard2.service.Bboard2Service;
import com.myspring.daejeon30.board.service.Board2Service;
import com.myspring.daejeon30.boardq.service.BoardqService;
import com.myspring.daejeon30.boardq.vo.BoardqVO;
import com.myspring.daejeon30.qcomment.service.QcommentService;

@Controller
public class AdminBoardController{
	@Autowired
	private BboardService bboardService;
	@Autowired
	private Bboard2Service bboard2Service;
	@Autowired
	Board2Service board2Service;
	@Autowired
	private BoardqService boardqService;
	@Autowired
	private QcommentService qcommentService;
	
	@RequestMapping(value="/admin/noticeBoard.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView nboardList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String sort = "notice";
		List result = bboardService.bboardList(sort);
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", result);
		mav.setViewName("adminBoard");
		return mav;
	}
	
	/*@RequestMapping(value="/admin/reviewBoard.do", method= {RequestMethod.GET, RequestMethod.POST})
		public ModelAndView reviewList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		List result = bboard2Service.reviewList();
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", result);
		mav.setViewName("adminBoard");
		return mav;
	} */
	
	@RequestMapping(value="/admin/reviewBoard.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ResponseEntity reviewList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ResponseEntity resEntity = null;
		List result = bboard2Service.reviewList();
		resEntity = new ResponseEntity(result, HttpStatus.OK);
		return resEntity;
	}
	
	@RequestMapping(value="/admin/recBoard.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ResponseEntity recList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ResponseEntity resEntity = null;
		List result = board2Service.listboard2();
		resEntity = new ResponseEntity(result, HttpStatus.OK);
		return resEntity;
	}
	
	@RequestMapping(value="/admin/qnaBoard.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ResponseEntity qnaList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ResponseEntity resEntity = null;
		List result = boardqService.qnaList();
		resEntity = new ResponseEntity(result, HttpStatus.OK);
		return resEntity;
	
	}
	

	@RequestMapping(value="/admin/oneNo.do", method=RequestMethod.GET)
	public ModelAndView selectOne(@RequestParam("num") String num, HttpServletRequest request, HttpServletResponse response) throws Exception{
		BboardVO bbo = bboardService.oneNo(num);
		ModelAndView mav = new ModelAndView();
		mav.addObject("bbo", bbo);
		mav.setViewName("viewone");
		return mav;
	}
	

	@RequestMapping(value="/admin/deleteQna.do")
	public ResponseEntity deleteQna(@RequestParam("num") int num, 
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		ResponseEntity resEntity = null;
		boardqService.deleteQna(num);
		resEntity = new ResponseEntity(HttpStatus.OK);
		return resEntity;
	}
	
	@RequestMapping(value="/admin/deleteNotice.do")
	public ResponseEntity deleteNotice(@RequestParam("num") int num, 
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		ResponseEntity resEntity = null;
		bboardService.deleteOneNo(num);
		resEntity = new ResponseEntity(HttpStatus.OK);
		return resEntity;
	}
	
	// 문의글보기	
	@RequestMapping(value="/admin/viewQna.do")
	public ModelAndView viewQna(@RequestParam("num") int num, 
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		BoardqVO bVO = boardqService.adminQna(num);
		List qcList = qcommentService.qcomments(num);
		Map map = new HashMap();
		map.put("bVO", bVO);
		map.put("qcList", qcList);
		ModelAndView mav = new ModelAndView();
		mav.addObject("map",map);
		mav.setViewName("viewqna");
		return mav;
		
	}


	
}