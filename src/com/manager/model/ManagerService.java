package com.manager.model;

public class ManagerService {
	private ManagerDAO_interface dao;
	public ManagerService() {
		dao = new ManagerJDBCDAO();
	}
	
}
