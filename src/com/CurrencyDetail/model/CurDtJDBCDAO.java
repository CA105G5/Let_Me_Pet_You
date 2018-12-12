package com.CurrencyDetail.model;

import java.util.List;

public class CurDtJDBCDAO implements CurDtDAO_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "CA105G5";
	String password = "123456";
	
	private static final String INSERT_STMT="INSERT INTO CURRENCY_DETAIL (cur_dt_id,memb_id,cur_src_id,cur_dt) VALUES (currency_detail_seq.NEXTVAL,?,?,?)";
	private static final String UPDATE_STMT="UPDATE CURRENCY_DETAIL set memb_id=?, cur_src_id=?, cur_dt=? where cur_dt_id=?";
	private static final String DELETE_STMT="DELETE FROM CURRENCY_DETAIL where cur_dt_id=?";
	private static final String GET_ONE_STMT="";
	private static final String GET_ALL_STMT="";
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

	@Override
	public void insert(CurDtVO curdtVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(CurDtVO curdtVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(String cur_dt_id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public CurDtVO findByPrimaryKey(String cur_dt_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CurDtVO> getAll() {
		// TODO Auto-generated method stub
		return null;
	}
	

}
