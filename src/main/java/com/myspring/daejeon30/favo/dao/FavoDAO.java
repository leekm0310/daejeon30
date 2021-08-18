package com.myspring.daejeon30.favo.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.daejeon30.favo.vo.FavoVO;
import com.myspring.daejeon30.paging.Criteria;

public interface FavoDAO{
	//public int insertFavo(FavoVO favoVO) throws DataAccessException;
	
	//addfavo
	public FavoVO insertFavo(FavoVO favoVO) throws DataAccessException;
	
	//addfavo1
//	public List insertFavo(FavoVO favoVO) throws DataAccessException;
	public List selectFavo(String id) throws DataAccessException;
	public void deleteFavo(FavoVO favoVO)throws DataAccessException;
	public int memberfavo(String id)throws DataAccessException;
	
	//∆‰¿Ã¡ˆ
		public List selectBoardList(Map map) throws Exception;
		public int countBoardList()throws Exception;
}