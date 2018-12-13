package com.volunteer.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class VolunteerJDBCDAO implements VolunteerDAO_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "test2";
	String passwd = "111";
	
	private static final String INSERT_STMT = 
			"INSERT INTO VOLUNTEER (vlt_id,vlt_name,vlt_mail,vlt_pw,vlt_gender,vlt_tel,vlt_img,vlt_add,vlt_registerdate,vlt_duty_day,vlt_sta,vlt_reg) VALUES ('V'||LPAD(to_char(volunteer_seq.NEXTVAL), 9, '0'),?,?,?,?,?,?,?,?,?,?,?)";
	private static final String GET_ALL_STMT = 
			"SELECT vlt_id,vlt_name,vlt_mail,vlt_pw,vlt_gender,vlt_tel,vlt_img,vlt_add,to_char(vlt_registerdate,'yyyy-mm-dd') vlt_registerdate,vlt_duty_day,vlt_sta,vlt_reg FROM VOLUNTEER order by vlt_id";
	private static final String GET_ONE_STMT = 
			"SELECT vlt_id,vlt_name,vlt_mail,vlt_pw,vlt_gender,vlt_tel,vlt_img,vlt_add,to_char(vlt_registerdate,'yyyy-mm-dd') vlt_registerdate,vlt_duty_day,vlt_sta,vlt_reg FROM VOLUNTEER where vlt_id = ?";
	private static final String DELETE = 
			"DELETE FROM VOLUNTEER where vlt_id = ?";
	private static final String UPDATE = 
			"UPDATE VOLUNTEER set vlt_name =?,vlt_mail =?,vlt_pw =?,vlt_gender =?,vlt_tel =?,vlt_img =?,vlt_add =?,vlt_registerdate =?,vlt_duty_day =?,vlt_sta =?,vlt_reg =? where vlt_id = ?";
	
	
	

	@Override
	public void insert(VolunteerVO volunteerVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, volunteerVO.getVlt_name());
			pstmt.setString(2, volunteerVO.getVlt_mail());
			pstmt.setString(3, volunteerVO.getVlt_pw());
			pstmt.setString(4, volunteerVO.getVlt_gender());
			pstmt.setString(5, volunteerVO.getVlt_tel());
			pstmt.setBytes(6, volunteerVO.getVlt_img());
			pstmt.setString(7, volunteerVO.getVlt_add());
			pstmt.setDate(8, volunteerVO.getVlt_registerdate());
			pstmt.setString(9, volunteerVO.getVlt_duty_day());
			pstmt.setString(10, volunteerVO.getVlt_sta());
			pstmt.setString(11, volunteerVO.getVlt_reg());
			

			int rowsUpdated =pstmt.executeUpdate();
			System.out.println("Changed " + rowsUpdated + "rows");

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		
	}

	@Override
	public void update(VolunteerVO volunteerVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, volunteerVO.getVlt_name());
			pstmt.setString(2, volunteerVO.getVlt_mail());
			pstmt.setString(3, volunteerVO.getVlt_pw());
			pstmt.setString(4, volunteerVO.getVlt_gender());
			pstmt.setString(5, volunteerVO.getVlt_tel());
			pstmt.setBytes(6, volunteerVO.getVlt_img());
			pstmt.setString(7, volunteerVO.getVlt_add());
			pstmt.setDate(8, volunteerVO.getVlt_registerdate());
			pstmt.setString(9, volunteerVO.getVlt_duty_day());
			pstmt.setString(10, volunteerVO.getVlt_sta());
			pstmt.setString(11, volunteerVO.getVlt_reg());
			pstmt.setString(12, volunteerVO.getVlt_id());

			int rowsUpdated = pstmt.executeUpdate();
			System.out.println("Changed " + rowsUpdated + "rows");

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

		
	}

	@Override
	public void delete(String vlt_id) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1,vlt_id);

			int rowsUpdated = pstmt.executeUpdate();
			System.out.println("Changed " + rowsUpdated + "rows");
			
			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	
		
		
	}

	@Override
	public VolunteerVO findByPrimaryKey(String vlt_id) {
		VolunteerVO volunteerVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, vlt_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// regionVo 嘿 Domain objects
				volunteerVO = new VolunteerVO();
				volunteerVO.setVlt_id(rs.getString("vlt_id"));
				volunteerVO.setVlt_name(rs.getString("vlt_name"));
				volunteerVO.setVlt_mail(rs.getString("vlt_mail"));
				volunteerVO.setVlt_pw(rs.getString("vlt_pw"));
				volunteerVO.setVlt_gender(rs.getString("vlt_gender"));
				volunteerVO.setVlt_tel(rs.getString("vlt_tel"));
				volunteerVO.setVlt_img(rs.getBytes("vlt_img"));
				volunteerVO.setVlt_add(rs.getString("vlt_add"));
				volunteerVO.setVlt_registerdate(rs.getDate("vlt_registerdate"));
				volunteerVO.setVlt_duty_day(rs.getString("vlt_duty_day"));
				volunteerVO.setVlt_sta(rs.getString("vlt_sta"));
				volunteerVO.setVlt_reg(rs.getString("vlt_reg"));
				
				
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return volunteerVO;
	}

	@Override
	public List<VolunteerVO> getAll() {
		List<VolunteerVO> list = new ArrayList<VolunteerVO>();
		VolunteerVO volunteerVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVO 嘿 Domain objects
				volunteerVO = new VolunteerVO();
				volunteerVO.setVlt_id(rs.getString("vlt_id"));
				volunteerVO.setVlt_name(rs.getString("vlt_name"));
				volunteerVO.setVlt_mail(rs.getString("vlt_mail"));
				volunteerVO.setVlt_pw(rs.getString("vlt_pw"));
				volunteerVO.setVlt_gender(rs.getString("vlt_gender"));
				volunteerVO.setVlt_tel(rs.getString("vlt_tel"));
				volunteerVO.setVlt_img(rs.getBytes("vlt_img"));
				volunteerVO.setVlt_add(rs.getString("vlt_add"));
				volunteerVO.setVlt_registerdate(rs.getDate("vlt_registerdate"));
				volunteerVO.setVlt_duty_day(rs.getString("vlt_duty_day"));
				volunteerVO.setVlt_sta(rs.getString("vlt_sta"));
				volunteerVO.setVlt_reg(rs.getString("vlt_reg"));
				list.add(volunteerVO); // Store the row in the list
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}

	public static void main(String[] args) {

		VolunteerJDBCDAO dao = new VolunteerJDBCDAO();

		// 穝糤
		VolunteerVO volunteerVO1 = new VolunteerVO();

		
//		volunteerVO1.setVlt_name("花花");
//		volunteerVO1.setVlt_mail("w121212w00@gmail.com");
//		volunteerVO1.setVlt_pw("123");
//		volunteerVO1.setVlt_tel("0958-514661");
//		volunteerVO1.setVlt_registerdate(java.sql.Date.valueOf("2018-12-10"));
//		volunteerVO1.setVlt_duty_day("–ら");
//		volunteerVO1.setVlt_sta("戮в");
//		volunteerVO1.setVlt_reg("REG0000004");
//		dao.insert(volunteerVO1);
//
//		// э
//		VolunteerVO volunteerVO2 = new VolunteerVO();
//		volunteerVO2.setVlt_id("V000000006");
//		volunteerVO2.setVlt_name("花花");
//		volunteerVO2.setVlt_mail("w121212w00@gmail.com");
//		volunteerVO2.setVlt_pw("123");
//		volunteerVO2.setVlt_tel("0958-514661");
//		volunteerVO2.setVlt_registerdate(java.sql.Date.valueOf("2018-12-10"));
//		volunteerVO2.setVlt_duty_day("–ら");
//		volunteerVO2.setVlt_sta("戮в");
//		volunteerVO2.setVlt_reg("REG0000003");
//		dao.update(volunteerVO2);

//		// 埃
//		dao.delete("V000000006");
//
//		// 琩高
//		VolunteerVO volunteerVO3 = dao.findByPrimaryKey("V000000001");
//		System.out.print(volunteerVO3.getVlt_id() + ",");
//		System.out.print(volunteerVO3.getVlt_name() + ",");
//		System.out.print(volunteerVO3.getVlt_mail() + ",");
//		System.out.print(volunteerVO3.getVlt_pw() + ",");
//		System.out.print(volunteerVO3.getVlt_tel() + ",");
//		System.out.print(volunteerVO3.getVlt_duty_day() + ",");
//		System.out.print(volunteerVO3.getVlt_sta()+ ",");
//		System.out.println(volunteerVO3.getVlt_reg());
//		System.out.println("---------------------");
//
		// 琩高
//		List<VolunteerVO> list = dao.getAll();
//		for (VolunteerVO aVol : list) {
//			System.out.print(aVol.getVlt_id() + ",");
//			System.out.print(aVol.getVlt_name() + ",");
//			System.out.print(aVol.getVlt_mail() + ",");
//			System.out.print(aVol.getVlt_pw() + ",");
//			System.out.print(aVol.getVlt_tel() + ",");
//			System.out.print(aVol.getVlt_duty_day() + ",");
//			System.out.print(aVol.getVlt_sta()+ ",");
//			System.out.print(aVol.getVlt_reg());
//			System.out.println();
//		}
	}
}