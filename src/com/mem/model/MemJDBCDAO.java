package com.mem.model;

import java.sql.*;
import java.util.*;

public class MemJDBCDAO implements MemDAO_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "CA105G5";
	String password = "123456";
	
	private static final String INSERT_STMT="INSERT INTO MEMBER "
			+ "(memb_id,memb_acc,memb_psw,memb_name,memb_nick,memb_email,memb_cellphone,memb_gender,memb_photo,memb_cre_type,memb_cre_name,memb_cre_year,memb_cre_month) "
			+ "VALUES (member_seq.NEXTVAL,?,?,?,?,?,?,?,?,?,?,?,?)";
	private static final 
	String CLIENT_UPDATE_STMT="UPDATE MEMBER set memb_psw=?,memb_name=?,memb_nick=?,memb_email=?,memb_cellphone=?,memb_gender=?,memb_photo=?,memb_cre_type=?,memb_cre_name=?,memb_cre_year=?,memb_cre_month=? where memb_id=?";
	private static final 
	String MANAGER_UPDATE_STMT="UPDATE MEMBER set memb_sta=?,memb_vio_times=? where memb_id=?";
	private static final String DELETE_STMT="DELETE FROM MEMBER where memb_id=?";
	private static final String GET_ONE_STMT="SELECT * FROM MEMBER where memb_id=?";
	private static final String GET_ALL_STMT="SELECT * FROM MEMBER order by memb_id";

	@Override
	public void insert(MemVO memVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			pstmt = con.prepareStatement(INSERT_STMT);
			
			
			
			
		}catch(Exception e){
			
		}finally {
			
		}
	}

	@Override
	public void updateFromClient(MemVO memVO) {
		
		
	}
	
	@Override
	public void updateFromManager(MemVO memVO) {
		
		
	}

	@Override
	public void delete(MemVO memVO) {
		
		
	}

	@Override
	public MemVO findByPrimaryKey(String memb_id) {
		
		return null;
	}

	@Override
	public List<MemVO> getAll() {
		
		return null;
	}
	
	
	
	public static void main(String[] args) {
		

	}
}
