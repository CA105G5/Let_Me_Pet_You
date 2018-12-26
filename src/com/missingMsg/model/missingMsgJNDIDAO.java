package com.missingMsg.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.missingCase.model.missingCaseVO;

public class missingMsgJNDIDAO implements missingMsgDAO_interface {
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB2");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String INSERT_STMT = "INSERT INTO missing_msg(missing_msg_id,missing_case_id,memb_id,missing_msg_date,missing_msg_cont) VALUES ('SM'||LPAD(to_char(missing_msg_seq.NEXTVAL), 8, '0'), ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = "SELECT missing_msg_id,missing_case_id,memb_id,to_char(missing_msg_date,'yyyy-mm-dd hh24:mi:ss')missing_msg_date,missing_msg_cont FROM missing_msg order by missing_msg_id";
	private static final String GET_ONE_STMT = "SELECT missing_msg_id,missing_case_id,memb_id,to_char(missing_msg_date,'yyyy-mm-dd hh24:mi:ss')missing_msg_date,missing_msg_cont FROM missing_msg where missing_case_id = ?";
	private static final String DELETE = "DELETE FROM missing_msg where missing_msg_id = ?";
	private static final String UPDATE = "UPDATE missing_msg set missing_case_id=?, memb_id=?, missing_msg_date=?, missing_msg_cont=? where missing_msg_id = ?";

	// 新增
	@Override
	public void insert(missingMsgVO missingMsgVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, missingMsgVO.getMissing_case_id());
			pstmt.setString(2, missingMsgVO.getMemb_id());
			pstmt.setTimestamp(3, missingMsgVO.getMissing_msg_date());
			pstmt.setString(4, missingMsgVO.getMissing_msg_cont());

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
	public void update(missingMsgVO missingMsgVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, missingMsgVO.getMissing_case_id());
			pstmt.setString(2, missingMsgVO.getMemb_id());
			pstmt.setTimestamp(3, missingMsgVO.getMissing_msg_date());
			pstmt.setString(4, missingMsgVO.getMissing_msg_cont());
			pstmt.setString(5, missingMsgVO.getMissing_msg_id());

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
	public void delete(String missing_msg_id) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, missing_msg_id);

			pstmt.executeUpdate();

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
	public missingMsgVO findByCase(String missing_case_id) {

		missingMsgVO missingMsgVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, missing_case_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				missingMsgVO = new missingMsgVO();
				missingMsgVO.setMissing_msg_id(rs.getString("missing_msg_id"));
				missingMsgVO.setMissing_case_id(rs.getString("missing_case_id"));
				missingMsgVO.setMemb_id(rs.getString("memb_id"));
				missingMsgVO.setMissing_msg_date(rs.getTimestamp("missing_msg_date"));
				missingMsgVO.setMissing_msg_cont(rs.getString("missing_msg_cont"));
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
		return missingMsgVO;
	}

	// 查全部
	@Override
	public List<missingMsgVO> getAll() {
		List<missingMsgVO> list = new ArrayList<missingMsgVO>();
		missingMsgVO missingMsgVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				missingMsgVO = new missingMsgVO();
				missingMsgVO.setMissing_msg_id(rs.getString("missing_msg_id"));
				missingMsgVO.setMissing_case_id(rs.getString("missing_case_id"));
				missingMsgVO.setMemb_id(rs.getString("memb_id"));
				missingMsgVO.setMissing_msg_date(rs.getTimestamp("missing_msg_date"));
				missingMsgVO.setMissing_msg_cont(rs.getString("missing_msg_cont"));
				list.add(missingMsgVO);
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
