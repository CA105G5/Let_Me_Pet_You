package com.mem.model;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.*;
import java.util.*;
import java.util.Date;

import com.AdoptApply.model.AdoptApplyVO;
import com.Adoption.model.AdoptionVO;
import com.CurrencyDetail.model.CurDtJDBCDAO;
import com.CurrencyDetail.model.CurDtVO;
import com.missingCase.model.missingCaseVO;
import com.pet.model.PetVO;
import com.prod.model.ProdService;
import com.prod.model.ProdVO;
import com.rescue.model.RescueVO;
import com.rescuing.model.RescuingVO;

public class MemJDBCDAO implements MemDAO_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "CA105G5";
	String password = "123456";  
	
	
	private static final String INSERT_STMT="INSERT INTO MEMBERS "
			+ "(memb_id,memb_acc,memb_psw,memb_name,memb_nick,memb_email,memb_cellphone,memb_gender,memb_cre_type,memb_cre_name,memb_cre_year,memb_cre_month,memb_photo,memb_fb_login,memb_google_login) "
			+ "VALUES ('M'||LPAD(to_char(member_seq.NEXTVAL), 9, '0'),?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	private static final 
	String UPDATE_STMT="UPDATE MEMBERS set memb_sta=?, memb_acc=?, memb_psw=?, memb_name=?, memb_nick=?, memb_email=?, memb_cellphone=?, memb_gender=?, memb_balance=?, memb_cre_type=?, memb_cre_name=?, memb_cre_year=?, memb_cre_month=?, memb_vio_times=?, memb_photo=? where memb_id=?";
	private static final 
	String CLIENT_UPDATE_STMT="UPDATE MEMBERS set memb_psw=?, memb_name=?, memb_nick=?, memb_email=?, memb_cellphone=?, memb_gender=?, memb_cre_type=?, memb_cre_name=?, memb_cre_year=?, memb_cre_month=?, memb_photo=?, memb_acc=? where memb_id=?";
	private static final 
	String MANAGER_UPDATE_STMT="UPDATE MEMBERS set memb_sta=?, memb_vio_times=? where memb_id=?";
	private static final String DELETE_STMT="DELETE FROM MEMBERS where memb_id=?";
	private static final String GET_ONE_STMT="SELECT * FROM MEMBERS where memb_id=?";
	private static final String GET_ALL_STMT="SELECT * FROM MEMBERS order by memb_id";
	private static final String CLIENT_SEARCH_STMT="SELECT * FROM MEMBERS where memb_acc=?";
	private static final String SELECT_RESCUE_SPONSOR = "SELECT * FROM RESCUE where rsc_sponsor=?";
	private static final String SELECT_RSCING_PTCP = "SELECT * FROM RESCUING where rscing_ptcp=?";
	private static final String SELECT_ADOPT_SPONSOR = "SELECT * FROM ADOPTION where adopt_sponsor=?";
	private static final String SELECT_ADOPT_APPLY = "SELECT * FROM ADOPT_APPLY where memb_id=?";
	private static final String SELECT_MISSING_PET = "SELECT * FROM MISSING_CASE where memb_id=?";
	private static final String SELECT_BALANCE ="SELECT memb_balance FROM MEMBERS where memb_id = ?";
	private static final String UPDATE_BALANCE = "UPDATE MEMBERS set memb_balance = ? where memb_id = ?";
	
	//安卓SQL指令
	private static final String FIND_BY_ID_PASWD = "SELECT * FROM MEMBERS WHERE memb_acc = ? AND memb_psw = ?";
	private static final String CHECK_ID_EXIST = "SELECT memb_acc FROM MEMBERS WHERE memb_acc = ?";
	private static final String FIND_PHOTO_BY_MEMACC = "SELECT memb_photo FROM MEMBERS WHERE memb_acc = ?";
	

	public static void main(String[] args) {
		//checked
		MemJDBCDAO dao = new MemJDBCDAO();
		
		//安卓測試
//		System.out.println(dao.isMemAcc("aaa", "123"));
//		System.out.println(dao.isMemExist("bbb"));
	
		
//		//insert
//		MemVO memVO1 = new MemVO();
//		memVO1.setMemb_acc("abcde");
//		memVO1.setMemb_psw("12345");
//		memVO1.setMemb_name("許修豪");
//		memVO1.setMemb_nick("豪豪");
//		memVO1.setMemb_email("w121212w00@gmail.com");		
//		try {
//		byte[] pic1 = getPictureByteArray("C:\\專題\\假資料\\會員照片\\m11.jpg");
//		memVO1.setMemb_photo(pic1);
//	} catch (IOException e) {
//		e.printStackTrace();
//	}
//		dao.insert(memVO1);
//		
//		System.out.println("新增成功");
//		System.out.println("===========");
		
//		//update
//		MemVO memVO1_5 = new MemVO();
//		memVO1_5.setMemb_id("M000000011");
//		memVO1_5.setMemb_psw("33333");
//		memVO1_5.setMemb_name("許許");
//		memVO1_5.setMemb_nick("許許");
//		
//		memVO1_5.setMemb_sta("停權1");
//		memVO1_5.setMemb_acc("edcba");
//		memVO1_5.setMemb_balance(100);
//		memVO1_5.setMemb_vio_times(2);
//		
//		memVO1_5.setMemb_email("xxx@gmail.com");
//		try {
//		byte[] pic2 = getPictureByteArray("C:\\專題\\假資料\\會員照片\\m12.jpg");
//		memVO1_5.setMemb_photo(pic2);
//	} catch (IOException e) {
//		e.printStackTrace();
//	}
//		dao.update(memVO1_5);
//		System.out.println("修改成功");
//		System.out.println("===========");
//		
//		
//		//updateFromClient
//		MemVO memVO2 = new MemVO();
//		memVO2.setMemb_id("M000000011");
//		memVO2.setMemb_acc("a111");
//		memVO2.setMemb_psw("54321");
//		memVO2.setMemb_name("修豪許");
//		memVO2.setMemb_nick("修修");
//		memVO2.setMemb_email("yyy@gmail.com");
//		try {
//		byte[] pic3 = getPictureByteArray("C:\\專題\\假資料\\會員照片\\m11.jpg");
//		memVO2.setMemb_photo(pic3);
//	} catch (IOException e) {
//		e.printStackTrace();
//	}
//		dao.updateFromClient(memVO2);
//		System.out.println("客戶修改成功");
//		System.out.println("===========");
//	
//		//updateFromManager
//		MemVO memVO3 = new MemVO();
//		memVO3.setMemb_id("M000000011");
//		memVO3.setMemb_vio_times(3);
//		memVO3.setMemb_sta("停權2");
//		dao.updateFromManager(memVO3);
//		System.out.println("管理員修改成功");
//		System.out.println("===========");
//		
//		//delete
//		dao.delete("M000000011");
//		System.out.println("刪除成功");
//		System.out.println("===========");
//		
//		//findByPrimaryKey
//		MemVO memVO4 = dao.findByPrimaryKey("M000000001");
//		System.out.println(memVO4.getMemb_acc());
//		System.out.println(memVO4.getMemb_psw());
//		System.out.println(memVO4.getMemb_name());
//		System.out.println(memVO4.getMemb_nick());
//		System.out.println(memVO4.getMemb_email());
//		System.out.println(memVO4.getMemb_photo());
//		System.out.println("==========================");
//		System.out.println("單一資料查詢成功");
//		System.out.println("===========");
		
//		//findByAccount
//		MemVO memVO5 = dao.findByAccount("aaa");
//		System.out.println(memVO5.getMemb_acc());
//		System.out.println(memVO5.getMemb_psw());
//		System.out.println(memVO5.getMemb_name());
//		System.out.println(memVO5.getMemb_nick());
//		System.out.println(memVO5.getMemb_email());
//		System.out.println(memVO5.getMemb_photo());
//		System.out.println("==========================");
//		System.out.println("單一資料查詢成功");
//		System.out.println("===========");
		
//		
//		//getAll
//		List <MemVO> list = dao.getAll();
//		for(MemVO aMem : list) {
//			System.out.println(aMem.getMemb_acc());
//			System.out.println(aMem.getMemb_psw());
//			System.out.println(aMem.getMemb_name());
//			System.out.println(aMem.getMemb_nick());
//			System.out.println(aMem.getMemb_email());
//			System.out.println(aMem.getMemb_photo());
//			System.out.println("~~~~~~~~~~~~~~~~~~~~~~~");
//		}
//		System.out.println("多筆資料查詢成功");
//		System.out.println("===========");
		
//		//getAll
//		List <RescueVO> list2 = dao.selectRescue("M000000002");
//		for(RescueVO aRescue : list2) {
//			System.out.println(aRescue.getRsc_id());
//			System.out.println(aRescue.getRsc_name());
//			System.out.println(aRescue.getRsc_add());
//			System.out.println(aRescue.getRsc_des());
//			System.out.println(aRescue.getRsc_img());
//			System.out.println(aRescue.getRsc_sponsor());
//			System.out.println(aRescue.getVlt_id());
//			System.out.println(aRescue.getRsc_lat());
//			System.out.println(aRescue.getRsc_lon());
//			System.out.println(aRescue.getRsc_sta());
//			System.out.println(aRescue.getRsc_stm_time());
//			System.out.println(aRescue.getRsc_stm_url());
//			System.out.println(aRescue.getRsc_stm_sta());
//			System.out.println(aRescue.getRsc_btime());
//			System.out.println(aRescue.getRsc_coin());
//			System.out.println(aRescue.getRsc_etime());
//			System.out.println(aRescue.getRsc_reg());
//			System.out.println(aRescue.getRsc_rt_status());
//			System.out.println(aRescue.getNtf_vlt_dt());
//			System.out.println(aRescue.getNtf_vlt_link());
//			System.out.println(aRescue.getNtf_vlt_sta());
//			System.out.println(aRescue.getNtf_vlt_time());
//			System.out.println("~~~~~~~~~~~~~~~~~~~~~~~");
//			
//		}
//		System.out.println("多筆資料查詢成功");
//		System.out.println("===========");
		
		
//		List <RescuingVO> list3 =dao.selectRescuing("M000000005");
//		for(RescuingVO aRescuing : list3) {
//			System.out.println(aRescuing.getRsc_id());
//			System.out.println(aRescuing.getRscing_btime());
//			System.out.println(aRescuing.getRscing_ctime());
//			System.out.println(aRescuing.getRscing_etime());
//			System.out.println(aRescuing.getRscing_ptcp());
//			System.out.println(aRescuing.getRscing_sta());
//			System.out.println(aRescuing.getRscing_cdes());
//			System.out.println(aRescuing.getRscing_lat());
//			System.out.println(aRescuing.getRscing_lon());
//			System.out.println(aRescuing.getRscing_rv_des());
//			System.out.println("~~~~~~~~~~~~~~~~~~~~~~~");
//		}
//		System.out.println("多筆資料查詢成功");
//		System.out.println("===========");
	}

	@Override
	public void insert(MemVO memVO) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1,memVO.getMemb_acc());
			pstmt.setString(2,memVO.getMemb_psw());
			pstmt.setString(3,memVO.getMemb_name());
			pstmt.setString(4,memVO.getMemb_nick());
			pstmt.setString(5,memVO.getMemb_email());
			pstmt.setString(6,memVO.getMemb_cellphone());
			pstmt.setString(7,memVO.getMemb_gender());
			pstmt.setString(8,memVO.getMemb_cre_type());
			pstmt.setString(9,memVO.getMemb_cre_name());
			pstmt.setString(10,memVO.getMemb_cre_year());
			pstmt.setString(11,memVO.getMemb_cre_month());
			pstmt.setBytes(12,memVO.getMemb_photo());
			pstmt.setString(13, memVO.getMemb_fb_login());
			pstmt.setString(14, memVO.getMemb_google_login());
			pstmt.executeUpdate();
			
			
			
		}catch(ClassNotFoundException ce){
			throw new RuntimeException("Couldn't load database driver."+ce.getMessage());
		}catch(SQLException se){
			throw new RuntimeException("A database error occured."+se.getMessage());
		}finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}

	@Override
	public void update(MemVO memVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			pstmt = con.prepareStatement(UPDATE_STMT);
			
			pstmt.setString(1,memVO.getMemb_sta());
			pstmt.setString(2,memVO.getMemb_acc());
			pstmt.setString(3,memVO.getMemb_psw());
			pstmt.setString(4,memVO.getMemb_name());
			pstmt.setString(5,memVO.getMemb_nick());
			pstmt.setString(6,memVO.getMemb_email());
			pstmt.setString(7,memVO.getMemb_cellphone());
			pstmt.setString(8,memVO.getMemb_gender());
			pstmt.setInt(9,memVO.getMemb_balance());
			pstmt.setString(10,memVO.getMemb_cre_type());
			pstmt.setString(11,memVO.getMemb_cre_name());
			pstmt.setString(12,memVO.getMemb_cre_year());
			pstmt.setString(13,memVO.getMemb_cre_month());
			pstmt.setInt(14,memVO.getMemb_vio_times());
			pstmt.setBytes(15, memVO.getMemb_photo());
			pstmt.setString(16,memVO.getMemb_id());
			
			
			pstmt.executeUpdate();
			
			
			
		}catch(ClassNotFoundException ce){
			throw new RuntimeException("Couldn't load database driver."+ce.getMessage());
		}catch(SQLException se){
			throw new RuntimeException("A database error occured."+se.getMessage());
		}finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	public void updateMemWithOrdItemAndCurDt(MemVO memVO, CurDtVO curDTVO, Connection con) {
		PreparedStatement pstmt = null;
		
		try {
			pstmt = con.prepareStatement(UPDATE_STMT);
			
			pstmt.setString(1,memVO.getMemb_sta());
			pstmt.setString(2,memVO.getMemb_acc());
			pstmt.setString(3,memVO.getMemb_psw());
			pstmt.setString(4,memVO.getMemb_name());
			pstmt.setString(5,memVO.getMemb_nick());
			pstmt.setString(6,memVO.getMemb_email());
			pstmt.setString(7,memVO.getMemb_cellphone());
			pstmt.setString(8,memVO.getMemb_gender());
			pstmt.setInt(9,memVO.getMemb_balance());
			pstmt.setString(10,memVO.getMemb_cre_type());
			pstmt.setString(11,memVO.getMemb_cre_name());
			pstmt.setString(12,memVO.getMemb_cre_year());
			pstmt.setString(13,memVO.getMemb_cre_month());
			pstmt.setInt(14,memVO.getMemb_vio_times());
			pstmt.setBytes(15, memVO.getMemb_photo());
			pstmt.setString(16,memVO.getMemb_id());
			
			
			int rowsUpdated = pstmt.executeUpdate();
			System.out.println("Changed " + rowsUpdated + "rows");
			
			
			
			//新增愛心幣明細資料
			CurDtJDBCDAO curdao = new CurDtJDBCDAO();
			curdao.insert(curDTVO, con);
			
			// Handle any driver errors
		} catch (Exception se) {
			if (con != null) {
				try {
					// 3●設定於當有exception發生時之catch區塊內
					System.err.print("Transaction is being ");
					System.err.println("rolled back-由-memUpdate");
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
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
		}
	}
	
	@Override
	public void updateFromClient(MemVO memVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			pstmt = con.prepareStatement(CLIENT_UPDATE_STMT);
			
			
			pstmt.setString(1,memVO.getMemb_psw());
			pstmt.setString(2,memVO.getMemb_name());
			pstmt.setString(3,memVO.getMemb_nick());
			pstmt.setString(4,memVO.getMemb_email());
			pstmt.setString(5,memVO.getMemb_cellphone());
			pstmt.setString(6,memVO.getMemb_gender());
			pstmt.setString(7,memVO.getMemb_cre_type());
			pstmt.setString(8,memVO.getMemb_cre_name());
			pstmt.setString(9,memVO.getMemb_cre_year());
			pstmt.setString(10,memVO.getMemb_cre_month());
			pstmt.setBytes(11, memVO.getMemb_photo());
			pstmt.setString(12,memVO.getMemb_acc());
			pstmt.setString(13,memVO.getMemb_id());
			
			pstmt.executeUpdate();
			
			
			
		}catch(ClassNotFoundException ce){
			throw new RuntimeException("Couldn't load database driver."+ce.getMessage());
		}catch(SQLException se){
			throw new RuntimeException("A database error occured."+se.getMessage());
		}finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
	}
	
	@Override
	public void updateFromManager(MemVO memVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			pstmt = con.prepareStatement(MANAGER_UPDATE_STMT);
			
			pstmt.setString(1,memVO.getMemb_sta());
			pstmt.setInt(2,memVO.getMemb_vio_times());
			pstmt.setString(3,memVO.getMemb_id());
			
			pstmt.executeUpdate();
			
			
			
		}catch(ClassNotFoundException ce){
			throw new RuntimeException("Couldn't load database driver."+ce.getMessage());
		}catch(SQLException se){
			throw new RuntimeException("A database error occured."+se.getMessage());
		}finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
	}
	@Override
	public void updateBalance(String memb_id,Integer rsc_coin, Connection con) {
		PreparedStatement pstmt = null;
		PreparedStatement pstmt1 = null;
		ResultSet rs = null;
		Integer coin = 0;
		try {

			//查出愛心幣
          pstmt = con.prepareStatement(SELECT_BALANCE);
          pstmt.setString(1,memb_id);
			
          rs = pstmt.executeQuery();
          while(rs.next()) {
        	  coin = rs.getInt("memb_balance");	
			}
          rs.close();
          //存愛心幣
          pstmt1 = con.prepareStatement(UPDATE_BALANCE);
          
          	pstmt1.setInt(1,(rsc_coin+coin));
			pstmt1.setString(2,memb_id);
     		pstmt1.executeUpdate();

			
			// Handle any driver errors
		} catch (SQLException se) {
			if (con != null) {
				try {
					// 3●設定於當有exception發生時之catch區塊內
					System.err.print("Transaction is being ");
					System.err.println("rolled back-由-rescue");
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
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt1 != null) {
				try {
					pstmt1.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
		}
		
	}

	@Override
	public void delete(String memb_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			pstmt = con.prepareStatement(DELETE_STMT);
			
			pstmt.setString(1,memb_id);
			
			pstmt.executeUpdate();
			
			
			
		}catch(ClassNotFoundException ce){
			throw new RuntimeException("Couldn't load database driver."+ce.getMessage());
		}catch(SQLException se){
			throw new RuntimeException("A database error occured."+se.getMessage());
		}finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
	}


	@Override
	public MemVO findByPrimaryKey(String memb_id) {
		MemVO memVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			pstmt = con.prepareStatement(GET_ONE_STMT);
			
			pstmt.setString(1,memb_id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				memVO = new MemVO();
				memVO.setMemb_id(rs.getString("memb_id"));
				memVO.setMemb_sta(rs.getString("memb_sta"));
				memVO.setMemb_acc(rs.getString("memb_acc"));
				memVO.setMemb_psw(rs.getString("memb_psw"));
				memVO.setMemb_name(rs.getString("memb_name"));
				memVO.setMemb_nick(rs.getString("memb_nick"));
				memVO.setMemb_email(rs.getString("memb_email"));
				memVO.setMemb_cellphone(rs.getString("memb_cellphone"));
				memVO.setMemb_gender(rs.getString("memb_gender"));
				memVO.setMemb_balance(rs.getInt("memb_balance"));
				memVO.setMemb_cre_type(rs.getString("memb_cre_type"));
				memVO.setMemb_cre_name(rs.getString("memb_cre_name"));
				memVO.setMemb_cre_year(rs.getString("memb_cre_year"));
				memVO.setMemb_cre_month(rs.getString("memb_cre_month"));
				memVO.setMemb_vio_times(rs.getInt("memb_vio_times"));
				memVO.setMemb_photo(rs.getBytes("memb_photo"));
			}
			
			
			
		}catch(ClassNotFoundException ce){
			throw new RuntimeException("Couldn't load database driver."+ce.getMessage());
		}catch(SQLException se){
			throw new RuntimeException("A database error occured."+se.getMessage());
		}finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return memVO;
	}

	@Override
	public List<MemVO> getAll() {
		List<MemVO> list = new ArrayList<MemVO>();
		MemVO memVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				memVO = new MemVO();
				memVO.setMemb_id(rs.getString("memb_id"));
				memVO.setMemb_sta(rs.getString("memb_sta"));
				memVO.setMemb_acc(rs.getString("memb_acc"));
				memVO.setMemb_psw(rs.getString("memb_psw"));
				memVO.setMemb_name(rs.getString("memb_name"));
				memVO.setMemb_nick(rs.getString("memb_nick"));
				memVO.setMemb_email(rs.getString("memb_email"));
				memVO.setMemb_cellphone(rs.getString("memb_cellphone"));
				memVO.setMemb_gender(rs.getString("memb_gender"));
				memVO.setMemb_balance(rs.getInt("memb_balance"));
				memVO.setMemb_cre_type(rs.getString("memb_cre_type"));
				memVO.setMemb_cre_name(rs.getString("memb_cre_name"));
				memVO.setMemb_cre_year(rs.getString("memb_cre_year"));
				memVO.setMemb_cre_month(rs.getString("memb_cre_month"));
				memVO.setMemb_vio_times(rs.getInt("memb_vio_times"));
				memVO.setMemb_photo(rs.getBytes("memb_photo"));
				list.add(memVO);
			}
			
			
			
			
			
		}catch(ClassNotFoundException ce){
			throw new RuntimeException("Couldn't load database driver."+ce.getMessage());
		}catch(SQLException se){
			throw new RuntimeException("A database error occured."+se.getMessage());
		}finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return list;
	}
	public static byte[] getPictureByteArray(String path) throws IOException {
		File file = new File(path);
		FileInputStream fis = new FileInputStream(file);
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		byte[] buffer = new byte[8192];	//設定每次讀取的大小
		int i;
		while ((i = fis.read(buffer)) != -1) {
			baos.write(buffer, 0, i);
		}
		baos.close();
		fis.close();

		return baos.toByteArray();	//將ByteArrayOutputStream轉成ByteArray
	}
	
	@Override
	public MemVO findByAccount(String memb_acc) {
		MemVO memVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			pstmt = con.prepareStatement(CLIENT_SEARCH_STMT);
			
			pstmt.setString(1,memb_acc);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				memVO = new MemVO();
				memVO.setMemb_id(rs.getString("memb_id"));
				memVO.setMemb_sta(rs.getString("memb_sta"));
				memVO.setMemb_acc(rs.getString("memb_acc"));
				memVO.setMemb_psw(rs.getString("memb_psw"));
				memVO.setMemb_name(rs.getString("memb_name"));
				memVO.setMemb_nick(rs.getString("memb_nick"));
				memVO.setMemb_email(rs.getString("memb_email"));
				memVO.setMemb_cellphone(rs.getString("memb_cellphone"));
				memVO.setMemb_gender(rs.getString("memb_gender"));
				memVO.setMemb_balance(rs.getInt("memb_balance"));
				memVO.setMemb_cre_type(rs.getString("memb_cre_type"));
				memVO.setMemb_cre_name(rs.getString("memb_cre_name"));
				memVO.setMemb_cre_year(rs.getString("memb_cre_year"));
				memVO.setMemb_cre_month(rs.getString("memb_cre_month"));
				memVO.setMemb_vio_times(rs.getInt("memb_vio_times"));
				memVO.setMemb_photo(rs.getBytes("memb_photo"));
			}
			
			
			
		}catch(ClassNotFoundException ce){
			throw new RuntimeException("Couldn't load database driver."+ce.getMessage());
		}catch(SQLException se){
			throw new RuntimeException("A database error occured."+se.getMessage());
		}finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return memVO;
	}

	@Override
	public List<RescueVO> selectRescue(String memb_id) {
		List<RescueVO> list = new ArrayList<RescueVO>();
		RescueVO rescueVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			pstmt = con.prepareStatement(SELECT_RESCUE_SPONSOR);
			pstmt.setString(1,memb_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				rescueVO= new RescueVO();
				rescueVO.setRsc_id(rs.getString("rsc_id"));
				rescueVO.setRsc_name(rs.getString("rsc_name"));
				rescueVO.setRsc_add(rs.getString("rsc_add"));
				rescueVO.setRsc_des(rs.getString("rsc_des"));
				rescueVO.setRsc_img(rs.getBytes("rsc_img"));
				rescueVO.setRsc_sponsor(rs.getString("rsc_sponsor"));
				rescueVO.setVlt_id(rs.getString("vlt_id"));
				rescueVO.setRsc_lat(rs.getDouble("rsc_lat"));
				rescueVO.setRsc_lon(rs.getDouble("rsc_lon"));
				rescueVO.setRsc_sta(rs.getString("rsc_sta"));
				rescueVO.setRsc_stm_time(rs.getTimestamp("rsc_stm_time"));
				rescueVO.setRsc_stm_url(rs.getString("rsc_stm_url"));
				rescueVO.setRsc_stm_sta(rs.getString("rsc_stm_sta"));
				rescueVO.setRsc_btime(rs.getTimestamp("rsc_btime"));
				rescueVO.setRsc_coin(rs.getInt("rsc_coin"));
				rescueVO.setRsc_etime(rs.getTimestamp("rsc_etime"));
				rescueVO.setRsc_reg(rs.getString("rsc_reg"));
				rescueVO.setRsc_rt_status(rs.getString("rsc_rt_status"));
				rescueVO.setNtf_vlt_dt(rs.getString("ntf_vlt_dt"));
				rescueVO.setNtf_vlt_link(rs.getString("ntf_vlt_link"));
				rescueVO.setNtf_vlt_sta(rs.getString("ntf_vlt_sta"));
				rescueVO.setNtf_vlt_time(rs.getTimestamp("ntf_vlt_time"));
				list.add(rescueVO);
			}
			
			
			
			
			
		}catch(ClassNotFoundException ce){
			throw new RuntimeException("Couldn't load database driver."+ce.getMessage());
		}catch(SQLException se){
			throw new RuntimeException("A database error occured."+se.getMessage());
		}finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return list;
	}

	@Override
	public List<RescuingVO> selectRescuing(String memb_id) {
		List<RescuingVO> list = new ArrayList<RescuingVO>();
		RescuingVO rescuingVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			pstmt = con.prepareStatement(SELECT_RSCING_PTCP);
			pstmt.setString(1,memb_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				rescuingVO= new RescuingVO();
				rescuingVO.setRsc_id(rs.getString("rsc_id"));
				rescuingVO.setRscing_ptcp(rs.getString("rscing_ptcp"));
				rescuingVO.setRscing_btime(rs.getTimestamp("rscing_btime"));
				rescuingVO.setRscing_sta(rs.getString("rscing_sta"));
				rescuingVO.setRscing_cdes(rs.getString("rscing_cdes"));
				rescuingVO.setRscing_ctime(rs.getTimestamp("rscing_ctime"));
				rescuingVO.setRscing_etime(rs.getTimestamp("rscing_etime"));
				rescuingVO.setRscing_lat(rs.getDouble("rscing_lat"));
				rescuingVO.setRscing_lon(rs.getDouble("rscing_lon"));
				rescuingVO.setRscing_rv_des(rs.getString("rscing_rv_des"));
				list.add(rescuingVO);
			}
			
			
			
			
			
		}catch(ClassNotFoundException ce){
			throw new RuntimeException("Couldn't load database driver."+ce.getMessage());
		}catch(SQLException se){
			throw new RuntimeException("A database error occured."+se.getMessage());
		}finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return list;
	}

	@Override
	public List<AdoptionVO> selectAdoption(String memb_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<AdoptApplyVO> selectAdoptApply(String memb_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<missingCaseVO> selectMissingCase(String memb_id) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
	//安卓確認會員帳密
	@Override
	public boolean isMemAcc(String memb_acc, String memb_psw) {
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean isMember = false;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			pstmt = con.prepareStatement(FIND_BY_ID_PASWD);
			pstmt.setString(1,memb_acc);
			pstmt.setString(2,memb_psw);
			ResultSet rs = pstmt.executeQuery();
			isMember = rs.next();
		}catch(ClassNotFoundException ce){
			throw new RuntimeException("Couldn't load database driver."+ce.getMessage());
		}catch(SQLException se){
			throw new RuntimeException("A database error occured."+se.getMessage());
		}finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}return isMember;
	}

	@Override
	public boolean isMemExist(String memb_acc) {
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean isMemberExist = false;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			pstmt = con.prepareStatement(CHECK_ID_EXIST);
			pstmt.setString(1,memb_acc);
			
			ResultSet rs = pstmt.executeQuery();
			isMemberExist = rs.next();
		}catch(ClassNotFoundException ce){
			throw new RuntimeException("Couldn't load database driver."+ce.getMessage());
		}catch(SQLException se){
			throw new RuntimeException("A database error occured."+se.getMessage());
		}finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}return isMemberExist;
	}

	@Override
	public byte[] getImage(String memb_acc) {
		byte[] picture = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			pstmt = con.prepareStatement(FIND_PHOTO_BY_MEMACC);
			
			pstmt.setString(1,memb_acc);
			rs = pstmt.executeQuery();
			
		if (rs.next()) {
			picture = rs.getBytes(1); 
		}
			
		}catch(ClassNotFoundException ce){
			throw new RuntimeException("Couldn't load database driver."+ce.getMessage());
		}catch(SQLException se){
			throw new RuntimeException("A database error occured."+se.getMessage());
		}finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		} return picture;
	}
	
	@Override
	public void updateMemBal(MemVO memVO, Connection con) {
		PreparedStatement pstmt = null;
		
		try {
			pstmt = con.prepareStatement(UPDATE_STMT);
			
			pstmt.setString(1,memVO.getMemb_sta());
			pstmt.setString(2,memVO.getMemb_acc());
			pstmt.setString(3,memVO.getMemb_psw());
			pstmt.setString(4,memVO.getMemb_name());
			pstmt.setString(5,memVO.getMemb_nick());
			pstmt.setString(6,memVO.getMemb_email());
			pstmt.setString(7,memVO.getMemb_cellphone());
			pstmt.setString(8,memVO.getMemb_gender());
			pstmt.setInt(9,memVO.getMemb_balance());
			pstmt.setString(10,memVO.getMemb_cre_type());
			pstmt.setString(11,memVO.getMemb_cre_name());
			pstmt.setString(12,memVO.getMemb_cre_year());
			pstmt.setString(13,memVO.getMemb_cre_month());
			pstmt.setInt(14,memVO.getMemb_vio_times());
			pstmt.setBytes(15, memVO.getMemb_photo());
			pstmt.setString(16,memVO.getMemb_id());
			
			
			int rowsUpdated = pstmt.executeUpdate();
			System.out.println("Changed " + rowsUpdated + "rows");
			System.out.println("會員餘額 " + memVO.getMemb_balance() + "元");
			
			// Handle any driver errors
		} catch (Exception se) {
			if (con != null) {
				try {
					// 3●設定於當有exception發生時之catch區塊內
					System.err.print("Transaction is being ");
					System.err.println("rolled back-由-memUpdate");
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
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
		}
	}



	
}
