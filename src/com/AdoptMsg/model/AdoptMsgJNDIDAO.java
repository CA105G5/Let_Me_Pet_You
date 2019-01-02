package com.AdoptMsg.model;

import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.AdoptMsg.*;
import com.Adoption.model.AdoptionJDBCDAO;
import com.Adoption.model.AdoptionVO;
import com.missingMsg.model.missingMsgVO;
import com.mysql.jdbc.Driver;
import java.sql.*;

public class AdoptMsgJNDIDAO implements AdoptMsgDAO_Interface {

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB2");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String INSERT_ADOPT_MSG = "INSERT INTO ADOPT_MSG (ADOPT_MSG_ID,ADOPT_ID,ADOPT_MSG_SPER,ADOPT_MSG_COMM) values ('AM'||LPAD(to_char(adopt_msg_seq.NEXTVAL),8,'0'),?,?,?)";
	private static final String GET_ONE_ADOPT_MSG = "SELECT * FROM ADOPT_MSG WHERE ADOPT_MSG_ID=?";
	private static final String GET_ONE_ADOPT = "SELECT * FROM ADOPT_MSG WHERE ADOPT_ID=?";
	private static final String GET_ALL_ADOPT_MSG = "SELECT * FROM ADOPT_MSG ORDER BY ADOPT_MSG_ID";
	private static final String DELETE = "DELETE FROM ADOPT_MSG WHERE ADOPT_MSG_ID=?";
	private static final String UPDATE = "UPDATE ADOPT_MSG SET ADOPT_ID=?,ADOPT_MSG_SPER=?,ADOPT_MSG_TIME=?,ADOPT_MSG_COMM=? WHERE ADOPT_MSG_ID=?";

	// 新增
	@Override
	public void insert(AdoptMsgVO adoptMsgVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_ADOPT_MSG);

			pstmt.setString(1, adoptMsgVO.getAdopt_id());
			pstmt.setString(2, adoptMsgVO.getAdopt_msg_sper());
			pstmt.setString(3, adoptMsgVO.getAdopt_msg_comm());

			pstmt.executeUpdate();

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured" + se.getMessage());

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
	public void update(AdoptMsgVO adoptMsgVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, adoptMsgVO.getAdopt_id());
			pstmt.setString(2, adoptMsgVO.getAdopt_msg_sper());
			pstmt.setTimestamp(3, adoptMsgVO.getAdopt_msg_time());
			pstmt.setString(4, adoptMsgVO.getAdopt_msg_comm());
			pstmt.setString(5, adoptMsgVO.getAdopt_msg_id());

			pstmt.executeUpdate();

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured" + se.getMessage());

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
	public void delete(String adopt_msg_id) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, adopt_msg_id);

			pstmt.executeUpdate();

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured" + se.getMessage());

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

	// 查單筆資料
	@Override
	public AdoptMsgVO findByPrimaryKey(String adopt_msg_id) {
		AdoptMsgVO adoptMsgVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_ADOPT_MSG);

			pstmt.setString(1, adopt_msg_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				adoptMsgVO = new AdoptMsgVO();
				adoptMsgVO.setAdopt_msg_id(rs.getString("adopt_msg_id"));
				adoptMsgVO.setAdopt_id(rs.getString("adopt_id"));
				adoptMsgVO.setAdopt_msg_sper(rs.getString("adopt_msg_sper"));
				adoptMsgVO.setAdopt_msg_time(rs.getTimestamp("adopt_msg_time"));
				adoptMsgVO.setAdopt_msg_comm(rs.getString("adopt_msg_comm"));

			}

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());

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
		return adoptMsgVO;
	}

	// 單獨查詢
	@Override
	public List<AdoptMsgVO> findByAdopt(String adopt_id) {

		List<AdoptMsgVO> list = new ArrayList<AdoptMsgVO>();

		AdoptMsgVO adoptMsgVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_ADOPT);

			pstmt.setString(1, adopt_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				adoptMsgVO = new AdoptMsgVO();
				adoptMsgVO.setAdopt_msg_id(rs.getString("adopt_msg_id"));
				adoptMsgVO.setAdopt_id(rs.getString("adopt_id"));
				adoptMsgVO.setAdopt_msg_sper(rs.getString("adopt_msg_sper"));
				adoptMsgVO.setAdopt_msg_time(rs.getTimestamp("adopt_msg_time"));
				adoptMsgVO.setAdopt_msg_comm(rs.getString("adopt_msg_comm"));
				list.add(adoptMsgVO);

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

	// 查全部
	@Override
	public List<AdoptMsgVO> getAll() {

		List<AdoptMsgVO> list = new ArrayList<AdoptMsgVO>();
		AdoptMsgVO adoptMsgVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_ADOPT_MSG);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				adoptMsgVO = new AdoptMsgVO();
				adoptMsgVO.setAdopt_msg_id(rs.getString("adopt_msg_id"));
				adoptMsgVO.setAdopt_id(rs.getString("adopt_id"));
				adoptMsgVO.setAdopt_msg_sper(rs.getString("adopt_msg_sper"));
				adoptMsgVO.setAdopt_msg_time(rs.getTimestamp("adopt_msg_time"));
				adoptMsgVO.setAdopt_msg_comm(rs.getString("adopt_msg_comm"));
				list.add(adoptMsgVO);
			}

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());

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
