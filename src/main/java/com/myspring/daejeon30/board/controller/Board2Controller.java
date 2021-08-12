package com.myspring.daejeon30.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myspring.daejeon30.board.vo.Board2VO;

public interface Board2Controller {

	//public ModelAndView listboard2(HttpServletRequest request, HttpServletResponse reponse) throws Exception;

	public ResponseEntity addNewBoard(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception;

	public ModelAndView view_r(@RequestParam("boardNO") int boardNO, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public ResponseEntity removeBoard(@RequestParam("boardNO") int boardNO, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
}
