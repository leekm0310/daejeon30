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

import com.myspring.daejeon30.bboard2.service.Bboard2Service;
import com.myspring.daejeon30.boardq.service.BoardqService;
import com.myspring.daejeon30.boardq.vo.BoardqVO;
import com.myspring.daejeon30.member.vo.MemberVO;
import com.myspring.daejeon30.paging.Criteria;
import com.myspring.daejeon30.paging.PageMaker;
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
	@Autowired
	private Bboard2Service bboard2Service;
	
	
	/*원래쓰던 리스트
	@Override
	@RequestMapping(value="/boardq/qna.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView qnaList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		List allqna = boardqService.qnaList();
		ModelAndView mav = new ModelAndView();
		mav.addObject("qnaList", allqna);
		mav.setViewName("qna");
		return mav;
	}*/
	
	//모든글 조회 페이징 테스트
	@RequestMapping(value = "/boardq/qna.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView listboard2(Criteria cri, HttpServletRequest request, HttpServletResponse reponse) throws Exception {
		
		List allqna = boardqService.selectBoardList(cri);// 모든 글 정보 조회
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(boardqService.countBoardListTotal());

		ModelAndView mav = new ModelAndView();
		mav.addObject("qnaList", allqna);
		mav.addObject("pageMaker", pageMaker);
		mav.setViewName("qna");
		return mav;
		}
	
	
	
	
	
	@Override
	@RequestMapping(value="/boardq/addQna.do", method=RequestMethod.POST)
	public String addQna(@ModelAttribute("boardqVO") BoardqVO boardqVO,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		//int result = 0;
		//result = 
		boardqService.addQna(boardqVO);
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
	

	//댓글등록
	@RequestMapping(value="boardq/addqcomment.do")
	public ResponseEntity addqcomment(QcommentVO qcommentVO,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		ResponseEntity resEntity = null;
		qcommentService.writeQComment(qcommentVO);
		resEntity = new ResponseEntity(HttpStatus.OK);
		return resEntity;
	}
	
	
	//댓글조회
	@RequestMapping(value="/boardq/listQC.do")
	public ResponseEntity listQC(int num, 
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		ResponseEntity resEntity = null;
		List qc = qcommentService.qcomments(num);
		resEntity = new ResponseEntity(qc, HttpStatus.OK);
		return resEntity;
	}
	
	
	//댓글 수정
	@RequestMapping(value="/boardq/updateQC.do")
	public ResponseEntity updateQC(QcommentVO qcommentVO,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		ResponseEntity resEntity = null;
		qcommentService.updateQcomment(qcommentVO);
		resEntity = new ResponseEntity(HttpStatus.OK);
		return resEntity;
	}
	
	//댓글 삭제
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
	
	
	
	//댓글 + 글보기 2
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
	
	
	//검색
	@RequestMapping(value="/boardq/searchTitle.do")
	public ModelAndView searchTitle(String word1, String sorting1,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		//String word = "%"+word1+"%";
		String word = word1;
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

	//아이디별 문의글 리뷰글 - 마이페이지
	@Override
	@RequestMapping(value="/mypage/myqna.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView myQna(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session = request.getSession();
		MemberVO mem= (MemberVO)session.getAttribute("member");
		String id = mem.getId();
		List myqna = boardqService.searchbyId(id);
		List myreview = bboard2Service.reviewById(id);
		ModelAndView mav = new ModelAndView();
		mav.addObject("myqna", myqna);
		mav.addObject("myreview", myreview);
		mav.setViewName("myboard");
		return mav;
		
	}
	
}