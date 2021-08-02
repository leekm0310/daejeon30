package com.myspring.daejeon30.bboard.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.daejeon30.bboard.vo.BboardVO;

public interface BboardDAO{
	//public List selectNBoard() throws DataAccessException;
	public int addNotice(BboardVO bboardVO) throws Exception;
	public List selectbboard(String sort)throws DataAccessException;
	public BboardVO oneNo(String num)throws DataAccessException;
	public void deleteOne(int num) throws Exception;
	public void updateOne(BboardVO bboardVO) throws DataAccessException;
	
}