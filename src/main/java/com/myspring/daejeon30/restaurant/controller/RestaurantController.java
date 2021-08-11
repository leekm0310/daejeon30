package com.myspring.daejeon30.restaurant.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.daejeon30.restaurant.vo.RestaurantVO;

public interface RestaurantController {
	public ModelAndView listRestaurant(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView allRes(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView viewRestaurant(@RequestParam("resNum") int resNum,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	//public ModelAndView rsv3(HttpServletRequest request, HttpServletResponse response) throws Exception;
	

}