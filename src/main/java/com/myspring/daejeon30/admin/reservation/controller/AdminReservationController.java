package com.myspring.daejeon30.admin.reservation.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface AdminReservationController{
	public ModelAndView allRsv(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView allNonRsv (HttpServletRequest request, HttpServletResponse response) throws Exception;
}