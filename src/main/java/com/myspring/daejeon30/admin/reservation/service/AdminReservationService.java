package com.myspring.daejeon30.admin.reservation.service;

import java.util.List;

public interface AdminReservationService{
	public List allRsv() throws Exception;
	public void acceptRsv(int rsvNum) throws Exception;
	public void cancelRsv(int rsvNum) throws Exception;
}