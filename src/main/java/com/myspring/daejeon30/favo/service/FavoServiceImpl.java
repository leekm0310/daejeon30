package com.myspring.daejeon30.favo.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.myspring.daejeon30.favo.dao.FavoDAO;
import com.myspring.daejeon30.favo.vo.FavoVO;
import com.myspring.daejeon30.paging.Criteria;

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
	
	@Override
	public int memberfavo(String id)throws Exception{
		return favoDAO.memberfavo(id);
	}
	
	
	
	//페이지 테스트
		@Override
		public List<Map<String, Object>> selectBoardList(Map map) throws Exception{
		    return favoDAO.selectBoardList(map);
		}
		@Override
		public int countBoardListTotal() throws Exception{
			return favoDAO.countBoardList();
		}
	
	
}