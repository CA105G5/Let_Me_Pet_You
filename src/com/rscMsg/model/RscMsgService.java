package com.rscMsg.model;

public class RscMsgService {

	private RscMsgDAO_interface dao;
	
	public RscMsgService() {
		dao = new RscMsgJDBCDAO();
	}
}
