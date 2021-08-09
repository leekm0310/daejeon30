package com.myspring.daejeon30.bboard2.service;

import java.util.List;
import java.util.Map;

import com.myspring.daejeon30.bboard2.vo.Bboard2VO;

public interface Bboard2Service{
	public List reviewList() throws Exception;
	public int addreivew(Map reviewMap) throws Exception;
	public Bboard2VO selectReview(int num) throws Exception;
	public void deleteReview(int num) throws Exception;
}