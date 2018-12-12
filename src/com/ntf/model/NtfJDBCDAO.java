package com.ntf.model;

import java.util.List;

public class NtfJDBCDAO implements NtfDAO_interface{
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
	public void insert(NtfVO ntfVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(NtfVO ntfVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(String ntf_id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public NtfVO findByPrimaryKey(String ntf_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<NtfVO> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

}
