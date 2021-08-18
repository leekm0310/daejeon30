package com.myspring.daejeon30.favo.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.daejeon30.favo.vo.FavoVO;
import com.myspring.daejeon30.paging.Criteria;

public interface FavoService{
	//public int insertFavo(FavoVO favoVO) throws DataAccessException;
	
	//addfavo
	public FavoVO insertFavo(FavoVO favoVO) throws DataAccessException;
	
	//addfavo1
	//public List insertFavo(FavoVO favoVO) throws DataAccessException;
	public List listfavo(String id) throws Exception;
	public void deleteFavo(FavoVO favoVO) throws Exception;
	public int memberfavo(String id)throws Exception;
	
	
	//페이지테스트
	public List selectBoardList(Map map) throws Exception;
	public int countBoardListTotal() throws Exception;
	
}