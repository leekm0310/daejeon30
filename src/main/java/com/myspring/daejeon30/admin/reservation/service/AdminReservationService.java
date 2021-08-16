package com.myspring.daejeon30.admin.reservation.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.daejeon30.paging.Criteria;

public interface AdminReservationService{
	public List allRsv() throws Exception;
	public void acceptRsv(int rsvNum) throws Exception;
	public void cancelRsv(int rsvNum) throws Exception;
	public List selectStatus(String status) throws Exception;
	
	//��ȸ��
	public List Allnon() throws Exception;
	public void acceptnonRsv(int rsvNum) throws Exception;
	public void cancelnonRsv(int rsvNum) throws Exception;
	public List selectnonStatus(String status) throws Exception;
	
	//�ű� ���� - ȸ��
	public int countNewRsvmem()throws Exception;
	
	//ȸ�� - ���
	public int countCanRsvmem() throws Exception;
	
	//�������׽�Ʈ
	public List selectMemRList(Criteria cri) throws Exception;
	public int countMemRListTotal() throws Exception;

}