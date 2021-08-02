package com.myspring.daejeon30.bboard.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.daejeon30.bboard.vo.BboardVO;

public interface BboardService{
	//public List nboardList()throws Exception;
	public int addNotice(BboardVO bboardVO)throws Exception;
	public List bboardList(String sort)throws Exception;
	public BboardVO oneNo(String num)throws Exception;
	public void deleteOneNo(String num)throws Exception;
}