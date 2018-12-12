package com.manager.model;

import java.util.List;

public class ManagerJDBCDAO implements ManagerDAO_interface{
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "CA105G5";
	String password = "123456"; 
	
	private static final String INSERT_STMT="";
	private static final String UPDATE_STMT="";
	private static final String DELETE_STMT="";
	private static final String GET_ONE_STMT="";
	private static final String GET_ALL_STMT="";

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

	@Override
	public void insert(ManagerVO managerVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(ManagerVO managerVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(String ma_id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ManagerVO findByPrimaryKey(String ma_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ManagerVO> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

}
