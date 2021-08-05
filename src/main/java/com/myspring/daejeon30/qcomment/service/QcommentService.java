package com.myspring.daejeon30.qcomment.service;

import java.util.List;

import com.myspring.daejeon30.qcomment.vo.QcommentVO;

public interface QcommentService{
	public List qcomments(int num)throws Exception;
	public void writeQComment(QcommentVO qcommentVO) throws Exception;
}