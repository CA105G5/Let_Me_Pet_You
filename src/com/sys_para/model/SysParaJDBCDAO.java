package com.sys_para.model;

import java.util.List;

public class SysParaJDBCDAO implements SysParaDAO_interface{
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
	public void insert(SysParaVO sysparaVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(SysParaVO sysparaVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(String sys_name) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public SysParaVO findByPrimaryKey(String sys_name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<SysParaVO> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

}
