package com.missingCase.model;

import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class missingCaseJNDIDAO implements missingCaseDAO_interface {
	
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB2");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	private static final String INSERT_STMT = "INSERT INTO missing_case(missing_case_id,memb_id,missing_date,missing_name,missing_des,missing_loc,missing_status_shelve,missing_photo,missing_type) VALUES ('S'||LPAD(to_char(missing_case_seq.NEXTVAL), 9, '0'), ?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = "SELECT missing_case_id,memb_id,to_char(missing_date,'yyyy-mm-dd hh24:mi:ss')missing_date,missing_name,missing_des,missing_loc,missing_status_shelve,missing_photo,missing_type FROM missing_case order by missing_case_id";
	private static final String GET_ONE_STMT = "SELECT missing_case_id,memb_id,to_char(missing_date,'yyyy-mm-dd hh24:mi:ss')missing_date,missing_name,missing_des,missing_loc,missing_status_shelve,missing_photo,missing_type FROM missing_case where missing_case_id = ?";
	private static final String DELETE = "DELETE FROM missing_case where missing_case_id = ?";
	private static final String UPDATE = "UPDATE missing_case set memb_id=?, missing_date=?, missing_name=?, missing_des=?, missing_loc=?, missing_status_shelve=?, missing_photo=?, missing_type=? where missing_case_id = ?";

	// 新增
	@Override
	public void insert(missingCaseVO missingCaseVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, missingCaseVO.getMemb_id());
			pstmt.setTimestamp(2, missingCaseVO.getMissing_date());
			pstmt.setString(3, missingCaseVO.getMissing_name());
			pstmt.setString(4, missingCaseVO.getMissing_des());
			pstmt.setString(5, missingCaseVO.getMissing_loc());
			pstmt.setString(6, missingCaseVO.getMissing_status_shelve());
			pstmt.setBytes(7, missingCaseVO.getMissing_photo());
			pstmt.setString(8, missingCaseVO.getMissing_type());

			pstmt.executeUpdate();


		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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

	// 修改
	@Override
	public void update(missingCaseVO missingCaseVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, missingCaseVO.getMemb_id());
			pstmt.setTimestamp(2, missingCaseVO.getMissing_date());
			pstmt.setString(3, missingCaseVO.getMissing_name());
			pstmt.setString(4, missingCaseVO.getMissing_des());
			pstmt.setString(5, missingCaseVO.getMissing_loc());
			pstmt.setString(6, missingCaseVO.getMissing_status_shelve());
			pstmt.setBytes(7, missingCaseVO.getMissing_photo());
			pstmt.setString(8, missingCaseVO.getMissing_type());
			pstmt.setString(9, missingCaseVO.getMissing_case_id());

			pstmt.executeUpdate();

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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

	// 刪除
	@Override
	public void delete(String missing_case_id) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, missing_case_id);

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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

	// 單獨查詢
	@Override
	public missingCaseVO findByPrimaryKey(String missing_case_id) {

		missingCaseVO missingCaseVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, missing_case_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				missingCaseVO = new missingCaseVO();
				missingCaseVO.setMissing_case_id(rs.getString("missing_case_id"));
				missingCaseVO.setMemb_id(rs.getString("memb_id"));
				missingCaseVO.setMissing_date(rs.getTimestamp("missing_date"));
				missingCaseVO.setMissing_name(rs.getString("missing_name"));
				missingCaseVO.setMissing_des(rs.getString("missing_des"));
				missingCaseVO.setMissing_loc(rs.getString("missing_loc"));
				missingCaseVO.setMissing_status_shelve(rs.getString("missing_status_shelve"));
				missingCaseVO.setMissing_photo(rs.getBytes("missing_photo"));
				missingCaseVO.setMissing_type(rs.getString("missing_type"));
			}
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
		return missingCaseVO;
	}

	// 查全部
	@Override
	public List<missingCaseVO> getAll() {
		List<missingCaseVO> list = new ArrayList<missingCaseVO>();
		missingCaseVO missingCaseVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				missingCaseVO = new missingCaseVO();
				missingCaseVO.setMissing_case_id(rs.getString("missing_case_id"));
				missingCaseVO.setMemb_id(rs.getString("memb_id"));
				missingCaseVO.setMissing_date(rs.getTimestamp("missing_date"));
				missingCaseVO.setMissing_name(rs.getString("missing_name"));
				missingCaseVO.setMissing_des(rs.getString("missing_des"));
				missingCaseVO.setMissing_loc(rs.getString("missing_loc"));
				missingCaseVO.setMissing_status_shelve(rs.getString("missing_status_shelve"));
				missingCaseVO.setMissing_photo(rs.getBytes("missing_photo"));
				missingCaseVO.setMissing_type(rs.getString("missing_type"));
				list.add(missingCaseVO);
			}
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
}
