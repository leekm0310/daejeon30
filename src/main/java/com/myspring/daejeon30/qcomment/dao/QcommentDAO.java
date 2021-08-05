package com.myspring.daejeon30.qcomment.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.daejeon30.qcomment.vo.QcommentVO;

public interface QcommentDAO{
	public List selectQcomment(int num) throws DataAccessException;
	public void writeQcomment(QcommentVO qcommentVO) throws DataAccessException;
}