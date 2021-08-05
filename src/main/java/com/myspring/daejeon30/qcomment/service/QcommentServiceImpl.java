package com.myspring.daejeon30.qcomment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspring.daejeon30.qcomment.dao.QcommentDAO;
import com.myspring.daejeon30.qcomment.vo.QcommentVO;

@Service("qcommentService")
public class QcommentServiceImpl implements QcommentService{
	@Autowired
	QcommentDAO qcommentDAO;
	
	@Override
	public List qcomments(int num)throws Exception{
		List allQcomments = qcommentDAO.selectQcomment(num);
		return allQcomments;
	}
	
	@Override
	public void writeQComment(QcommentVO qcommentVO) throws Exception{
		qcommentDAO.writeQcomment(qcommentVO);
	}
}