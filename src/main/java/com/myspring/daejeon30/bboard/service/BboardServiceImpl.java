package com.myspring.daejeon30.bboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspring.daejeon30.bboard.dao.BboardDAO;

@Service("bboardService")
public class BboardServiceImpl implements BboardService{
	@Autowired
	BboardDAO bboardDAO;
	
	public List nboardList()throws Exception{
		List nList = bboardDAO.selectNBoard();
		return nList;
	}
}