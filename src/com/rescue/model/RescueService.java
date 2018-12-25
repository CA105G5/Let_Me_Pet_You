package com.rescue.model;

public class RescueService {
	
	public RescueDAO_interface dao;
	
	public RescueService() {
		dao = new RescueJDBCDAO();
	}
	

}
