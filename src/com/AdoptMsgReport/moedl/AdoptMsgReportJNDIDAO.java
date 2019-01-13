package com.AdoptMsgReport.moedl;

import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.AdoptApply.model.AdoptApplyVO;
import com.AdoptMsg.model.AdoptMsgJDBCDAO;
import com.missingMsgReport.model.missingMsgReportVO;

public class AdoptMsgReportJNDIDAO implements AdoptMsgReportDAO_Interface {

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB2");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String INSERT_ADOPT_MSG_RT = "INSERT INTO ADOPT_MSG_RT (ADOPT_MSG_RT_ID,ADOPT_MSG_ID,MEMB_ID,ADOPT_MSG_RT_COMM) values ('AMR'||LPAD(to_char(adopt_msg_rt_seq.NEXTVAL),7,'0'),?,?,?)";
	private static final String UPDATE = "SELECT * FROM ADOPT_MSG_RT WHERE ADOPT_MSG_ID=?";
	private static final String GET_ONE_ADOPT_MSG_RT = "SELECT * FROM ADOPT_MSG_RT WHERE ADOPT_MSG_ID=?";
	private static final String GET_ALL_ADOPT_MSG_RT = "SELECT * FROM ADOPT_MSG_RT ORDER BY ADOPT_MSG_RT_ID";
	private static final String DELETE = "DELETE FROM ADOPT_MSG_RT WHERE ADOPT_MSG_RT_ID=?";
	private static final String UPDATE_STATUS = "UPDATE adopt_msg_rt set adopt_msg_rt_status=? where adopt_msg_rt_id=?";

	// 新增
	@Override
	public void insert(AdoptMsgReportVO adoptMsgReportVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_ADOPT_MSG_RT);

			pstmt.setString(1, adoptMsgReportVO.getAdopt_msg_id());
			pstmt.setString(2, adoptMsgReportVO.getMemb_id());
			pstmt.setString(3, adoptMsgReportVO.getAdopt_msg_rt_comm());

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

	// 修改狀態
	public void updateStatus(AdoptMsgReportVO adoptMsgReportVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_STATUS);

			pstmt.setString(1, adoptMsgReportVO.getAdopt_msg_rt_status());
			pstmt.setString(2, adoptMsgReportVO.getAdopt_msg_rt_id());

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
	public void update(AdoptMsgReportVO adoptMsgReportVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, adoptMsgReportVO.getAdopt_msg_rt_id());
			pstmt.setString(2, adoptMsgReportVO.getMemb_id());
			pstmt.setTimestamp(3, adoptMsgReportVO.getAdopt_msg_rt_time());
			pstmt.setString(4, adoptMsgReportVO.getAdopt_msg_rt_comm());
			pstmt.setString(5, adoptMsgReportVO.getAdopt_msg_rv_des());
			pstmt.setString(6, adoptMsgReportVO.getAdopt_msg_rt_status());

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
	public void delete(String adopt_msg_rt_id) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, adopt_msg_rt_id);

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

	// 查一個
	@Override
	public AdoptMsgReportVO findByPrimaryKey(String adopt_msg_id) {
		List<AdoptMsgReportVO> list = new ArrayList<AdoptMsgReportVO>();
		AdoptMsgReportVO adoptMsgReportVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;

		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_ADOPT_MSG_RT);
			pstmt.setString(1, adopt_msg_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				adoptMsgReportVO = new AdoptMsgReportVO();
				adoptMsgReportVO.setAdopt_msg_rt_id(rs.getString("adopt_msg_rt_id"));
				adoptMsgReportVO.setAdopt_msg_id(rs.getString("adopt_msg_id"));
				adoptMsgReportVO.setMemb_id(rs.getString("memb_id"));
				adoptMsgReportVO.setAdopt_msg_rt_time(rs.getTimestamp("adopt_msg_rt_time"));
				adoptMsgReportVO.setAdopt_msg_rt_comm(rs.getString("adopt_msg_rt_comm"));
				adoptMsgReportVO.setAdopt_msg_rv_des(rs.getString("adopt_msg_rv_des"));
				adoptMsgReportVO.setAdopt_msg_rt_status(rs.getString("adopt_msg_rt_status"));
				
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
		return adoptMsgReportVO;
	}

	@Override
	public List<AdoptMsgReportVO> getAll() {
		List<AdoptMsgReportVO> list = new ArrayList<AdoptMsgReportVO>();
		AdoptMsgReportVO adoptMsgReportVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;

		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_ADOPT_MSG_RT);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				adoptMsgReportVO = new AdoptMsgReportVO();
				adoptMsgReportVO.setAdopt_msg_rt_id(rs.getString("adopt_msg_rt_id"));
				adoptMsgReportVO.setAdopt_msg_id(rs.getString("adopt_msg_id"));
				adoptMsgReportVO.setMemb_id(rs.getString("memb_id"));
				adoptMsgReportVO.setAdopt_msg_rt_time(rs.getTimestamp("adopt_msg_rt_time"));
				adoptMsgReportVO.setAdopt_msg_rt_comm(rs.getString("adopt_msg_rt_comm"));
				adoptMsgReportVO.setAdopt_msg_rv_des(rs.getString("adopt_msg_rv_des"));
				adoptMsgReportVO.setAdopt_msg_rt_status(rs.getString("adopt_msg_rt_status"));
				list.add(adoptMsgReportVO);
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
