package com.myspring.daejeon30.favo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.myspring.daejeon30.favo.dao.FavoDAO;
import com.myspring.daejeon30.favo.vo.FavoVO;

@Service("favoServiceImpl")
public class FavoServiceImpl implements FavoService{
	@Autowired
	private FavoDAO favoDAO;
	
	//@Override
	//public int insertFavo(FavoVO favoVO) throws DataAccessException{
	//	return favoDAO.insertFavo(favoVO);
	//}
	
	@Override
	public FavoVO insertFavo(FavoVO favoVO) throws DataAccessException{
		return favoDAO.insertFavo(favoVO);
	}
	
	//@Override
	//public List insertFavo(FavoVO favoVO) throws Data
	
	@Override
	public List listfavo(String id) throws Exception{
		List favolist = favoDAO.selectFavo(id);
		return favolist;
	}
	
	@Override
	public void deleteFavo(FavoVO favoVO) throws Exception{
		favoDAO.deleteFavo(favoVO);
	}
}