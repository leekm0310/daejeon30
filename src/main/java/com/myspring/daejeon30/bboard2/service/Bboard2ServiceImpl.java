package com.myspring.daejeon30.bboard2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspring.daejeon30.bboard2.dao.Bboard2DAO;

@Service("bboard2Service")
public class Bboard2ServiceImpl implements Bboard2Service{
	@Autowired
	Bboard2DAO bboard2DAO;
	
	@Override
	public List reviewList() throws Exception{
		List allreview = bboard2DAO.selectAllReview();
		return allreview;
	}
}