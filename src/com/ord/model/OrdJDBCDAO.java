package com.ord.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.mem.model.MemService;
import com.mem.model.MemVO;
import com.ord.model.OrdVO;
import com.orditem.model.OrdItemJDBCDAO;
import com.orditem.model.OrdItemVO;

public class OrdJDBCDAO implements OrdDAO_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "CA105G5";
	String passwd = "123456";

	private static final String INSERT_STMT = "INSERT INTO ord (ORD_ID, MEMB_ID, ORD_DATE, ORD_TOTAL,ORD_RECEIVER, ORD_RC_TEL, ORD_RC_ADD, ORD_RC_COMM) VALUES ('O'|| to_char(sysdate,'yyyymmdd')||'-'||LPAD(to_char(ORD_id_seq.NEXTVAL), 3, '0'), ?, ?, ?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = "SELECT ORD_ID, MEMB_ID, ORD_DATE, ORD_TOTAL,ORD_RECEIVER, ORD_RC_TEL, ORD_RC_ADD, ORD_RC_COMM FROM ord order by ORD_ID";
	private static final String GET_ALL_ORD_BY_MEM = "SELECT ORD_ID, MEMB_ID, ORD_DATE, ORD_TOTAL,ORD_RECEIVER, ORD_RC_TEL, ORD_RC_ADD, ORD_RC_COMM FROM ord where mem_id = ? order by ORD_ID";
	private static final String GET_ONE_STMT = "SELECT ORD_ID, MEMB_ID, ORD_DATE, ORD_TOTAL,ORD_RECEIVER, ORD_RC_TEL, ORD_RC_ADD, ORD_RC_COMM FROM ord where ORD_ID = ?";
	private static final String DELETE = "DELETE FROM ord where ORD_ID = ?";
	private static final String UPDATE = "UPDATE ord set MEMB_ID=?, ORD_DATE=?, ORD_TOTAL=?,ORD_RECEIVER=?, ORD_RC_TEL=?, ORD_RC_ADD=?, ORD_RC_COMM=? where ORD_ID = ?";

	@Override
	public void insert(OrdVO ordVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, ordVO.getMemb_id());
			pstmt.setTimestamp(2, ordVO.getOrd_date());
			pstmt.setInt(3, ordVO.getOrd_total());
			pstmt.setString(4, ordVO.getOrd_receiver());
			pstmt.setString(5, ordVO.getOrd_rc_tel());
			pstmt.setString(6, ordVO.getOrd_rc_add());
			pstmt.setString(7, ordVO.getOrd_rc_comm());

			int rowsUpdated = pstmt.executeUpdate();
			System.out.println("Changed " + rowsUpdated + "rows");

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
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

	@Override
	public void update(OrdVO ordVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, ordVO.getMemb_id());
			pstmt.setTimestamp(2, ordVO.getOrd_date());
			pstmt.setInt(3, ordVO.getOrd_total());
			pstmt.setString(4, ordVO.getOrd_receiver());
			pstmt.setString(5, ordVO.getOrd_rc_tel());
			pstmt.setString(6, ordVO.getOrd_rc_add());
			pstmt.setString(7, ordVO.getOrd_rc_comm());
			pstmt.setString(8, ordVO.getOrd_id());

			int rowsUpdated = pstmt.executeUpdate();

			System.out.println("Changed " + rowsUpdated + "rows");

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
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

	@Override
	public OrdVO findByPrimaryKey(String ord_id) {
		OrdVO ordVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, ord_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// ordVo 也稱為 Domain objects
				ordVO = new OrdVO();
				ordVO.setOrd_id(ord_id);
				ordVO.setMemb_id(rs.getString("memb_id"));
				ordVO.setOrd_date(rs.getTimestamp("ord_date"));
				ordVO.setOrd_total(rs.getInt("ord_total"));
				ordVO.setOrd_receiver(rs.getString("ord_receiver"));
				ordVO.setOrd_rc_tel(rs.getString("ord_rc_tel"));
				ordVO.setOrd_rc_add(rs.getString("ord_rc_add"));
				ordVO.setOrd_rc_comm(rs.getString("ord_rc_comm"));
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
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
		return ordVO;

	}

	@Override
	public List<OrdVO> getAll() {
		List<OrdVO> list = new ArrayList<OrdVO>();
		OrdVO ordVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// OrdVO 也稱為 Domain objects
				ordVO = new OrdVO();
				ordVO.setOrd_id(rs.getString("ord_id"));
				ordVO.setMemb_id(rs.getString("memb_id"));
				ordVO.setOrd_date(rs.getTimestamp("ord_date"));
				ordVO.setOrd_total(rs.getInt("ord_total"));
				ordVO.setOrd_receiver(rs.getString("ord_receiver"));
				ordVO.setOrd_rc_tel(rs.getString("ord_rc_tel"));
				ordVO.setOrd_rc_add(rs.getString("ord_rc_add"));
				ordVO.setOrd_rc_comm(rs.getString("ord_rc_comm"));
				list.add(ordVO); // Store the row in the list
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
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
	
	
	@Override
	public List<OrdVO> getAll(Map<String, String[]> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Set<OrdVO> getOrdItemByOrd(String ord_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertWithOrdItem(OrdVO ordVO, List<OrdItemVO> list,  MemVO memVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			
			// 1●設定於 pstm.executeUpdate()之前
    		con.setAutoCommit(false);
			
    		// 先新增部門
			String cols[] = {"ORD_ID"};
			pstmt = con.prepareStatement(INSERT_STMT , cols);			
			pstmt.setString(1, ordVO.getMemb_id());
			pstmt.setTimestamp(2, new Timestamp(new Date().getTime()));
			pstmt.setInt(3, ordVO.getOrd_total());
			pstmt.setString(4, ordVO.getOrd_receiver());
			pstmt.setString(5, ordVO.getOrd_rc_tel());
			pstmt.setString(6, ordVO.getOrd_rc_add());
			pstmt.setString(7, ordVO.getOrd_rc_comm());
			int rowsUpdated = pstmt.executeUpdate();
			System.out.println("Changed " + rowsUpdated + "rows");
			//掘取對應的自增主鍵值
			String next_ordno = null;
			ResultSet rs = pstmt.getGeneratedKeys();
			if (rs.next()) {
				next_ordno = rs.getString(1);
				System.out.println("自增主鍵值= " + next_ordno +"(剛新增成功的訂單編號)");
			} else {
				System.out.println("未取得自增主鍵值");
			}
			rs.close();
			// 再同時新增明細
			OrdItemJDBCDAO dao = new OrdItemJDBCDAO();
			System.out.println("list.size()-A="+list.size());
			for (OrdItemVO ordItemVO : list) {
				ordItemVO.setOrd_id(next_ordno) ;
				dao.insert2(ordItemVO,con);
			}
			
			MemService memSvc = new MemService();
			memSvc.updateMemBal(memVO, con);

			// 2●設定於 pstm.executeUpdate()之後
			con.commit();
			
			System.out.println("list.size()-B="+list.size());
			System.out.println("新增訂單編號" + next_ordno + "時,共有訂單明細 " + list.size()
					+ " 筆同時被新增");
			
			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			if (con != null) {
				try {
					// 3●設定於當有exception發生時之catch區塊內
					System.err.print("Transaction is being ");
					System.err.println("rolled back-由-ord");
					con.rollback();
				} catch (SQLException excep) {
					throw new RuntimeException("rollback error occured. "
							+ excep.getMessage());
				}
			}
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			try {
				con.setAutoCommit(true);
			} catch (SQLException e1) {
				e1.printStackTrace();
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
	}
	

	@Override
	public void delete(String ord_id) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, ord_id);

			int rowsUpdated = pstmt.executeUpdate();

			System.out.println("Changed " + rowsUpdated + "rows");

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
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

	public static void main(String[] args) {

		OrdJDBCDAO dao = new OrdJDBCDAO();
		
		OrdVO ordVO = new OrdVO();
		ordVO.setMemb_id("M000000001");
		ordVO.setOrd_date(new Timestamp(new Date().getTime()));
		ordVO.setOrd_total(30);
		ordVO.setOrd_receiver("Jen");
		ordVO.setOrd_rc_tel("0912345678");
		ordVO.setOrd_rc_add("中壢市平鎮區中央路300號");
		ordVO.setOrd_rc_comm("請晚上六點之後派送");
		
		MemService memSvc = new MemService();
		MemVO memVO = memSvc.getOneMem("M000000001");
		memVO.setMemb_balance(memVO.getMemb_balance()-ordVO.getOrd_total());
		
		List<OrdItemVO> testList = new ArrayList<OrdItemVO>(); // 準備置入明細數筆
		
		OrdItemVO ordItemVO1 = new OrdItemVO();
		ordItemVO1.setProd_id("P000000010");
		ordItemVO1.setOrd_item_qty(3);
		
		OrdItemVO ordItemVO2 = new OrdItemVO();
		ordItemVO2.setProd_id("P000000004");
		ordItemVO2.setOrd_item_qty(5);
		
		testList.add(ordItemVO1);
		testList.add(ordItemVO2);
		
		dao.insertWithOrdItem(ordVO , testList, memVO);
		
		
		
		

		// 新增
//		OrdVO ordVO1 = new OrdVO();
//		ordVO1.setOrd_id("O00000test");
//		ordVO1.setMemb_id("M000000001");
//		ordVO1.setOrd_date(new Timestamp(new Date().getTime()));
//		ordVO1.setOrd_total(30);
//		ordVO1.setOrd_receiver("Jen");
//		ordVO1.setOrd_rc_tel("0912345678");
//		ordVO1.setOrd_rc_add("中壢市平鎮區中央路300號");
//		ordVO1.setOrd_rc_comm("請晚上六點之後派送");
//		dao.insert(ordVO1);

		// 修改
//		OrdVO ordVO2 = new OrdVO();
//		ordVO2.setOrd_id("O20181212-007");
//		ordVO2.setMemb_id("M000000003");
//		ordVO2.setOrd_date(new Timestamp(new Date().getTime()));
//		ordVO2.setOrd_total(30);
//		ordVO2.setOrd_receiver("Jen--");
//		ordVO2.setOrd_rc_tel("0912345678--");
//		ordVO2.setOrd_rc_add("中壢市平鎮區中央路300號--");
//		ordVO2.setOrd_rc_comm("請晚上六點之後派送--");
//		dao.update(ordVO2);

		// 刪除
//		dao.delete("O20181212-007");
//
//		// 查詢
//		OrdVO ordVO3 = dao.findByPrimaryKey("O20181212-008");
//		System.out.print(ordVO3.getOrd_id() + ",");
//		System.out.print(ordVO3.getMemb_id() + ",");
//		System.out.print(ordVO3.getOrd_date() + ",");
//		System.out.print(ordVO3.getOrd_total() + ",");
//		System.out.print(ordVO3.getOrd_receiver() + ",");
//		System.out.print(ordVO3.getOrd_rc_tel() + ",");
//		System.out.print(ordVO3.getOrd_rc_add() + ",");
//		System.out.println(ordVO3.getOrd_rc_comm());
//		System.out.println("---------------------");

//		// 查詢
//		List<OrdVO> list = dao.getAll();
//		for (OrdVO aOrd : list) {
//			System.out.print(aOrd.getOrd_id() + ",");
//			System.out.print(aOrd.getMemb_id() + ",");
//			System.out.print(aOrd.getOrd_date() + ",");
//			System.out.print(aOrd.getOrd_total() + ",");
//			System.out.print(aOrd.getOrd_receiver() + ",");
//			System.out.print(aOrd.getOrd_rc_tel() + ",");
//			System.out.print(aOrd.getOrd_rc_add() + ",");
//			System.out.println(aOrd.getOrd_rc_comm());
//			System.out.println("---------------------");
//			System.out.println();
//		}
	}

	@Override
	public List<OrdVO> getOrdByMem(String memb_id) {
		// TODO Auto-generated method stub
		return null;
	}


}
