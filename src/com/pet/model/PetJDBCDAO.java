package com.pet.model;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.CurrencyDetail.model.CurDtVO;



public class PetJDBCDAO implements PetDAO_interface{
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "CA105G5";
	String password = "123456"; 
	
	private static final String INSERT_STMT="INSERT INTO PET_DATA (pet_id,pet_name,memb_id,pet_gender,pet_birth,pet_descr,pet_death,pet_microchip,pet_type,pet_photo) VALUES ('PT'||lpad(to_char(pet_data_seq.nextval), 8, '0'),?,?,?,?,?,?,?,?,?)";
	private static final String UPDATE_STMT="UPDATE PET_DATA set pet_name=?, memb_id=?,pet_gender=?,pet_birth=?,pet_descr=?,pet_status=?,pet_death=?, pet_microchip=?, pet_type=?, pet_photo=? where pet_id=?";
	private static final String DELETE_STMT="DELETE FROM PET_DATA where pet_id=?";
	private static final String GET_ONE_STMT="SELECT * FROM PET_DATA where pet_id=?";
	private static final String GET_ALL_STMT="SELECT * FROM PET_DATA order by pet_id";

	public static void main(String[] args) {
		//checked
		PetJDBCDAO dao = new PetJDBCDAO();
		//insert
//		PetVO petVO1 = new PetVO();
//		petVO1.setPet_name("lucky");
//		petVO1.setMemb_id("M000000001");
//		
//		try {
//		byte[] pic1 = getPictureByteArray("C:\\專題\\假資料\\寵物照片\\p1.jpg");
//		petVO1.setPet_photo(pic1);
//	} catch (IOException e) {
//		e.printStackTrace();
//	}
//		dao.insert(petVO1);
//		System.out.println("新增成功");
//		System.out.println("===========");
		
//		//update
//		PetVO petVO2 = new PetVO();
//		petVO2.setPet_id("PT00000007");
//		petVO2.setMemb_id("M000000001");
//		petVO2.setPet_name("lovely");
//		try {
//		byte[] pic2 = getPictureByteArray("C:\\專題\\假資料\\寵物照片\\p2.jpg");
//		petVO2.setPet_photo(pic2);
//	} catch (IOException e) {
//		e.printStackTrace();
//	}	
//		dao.update(petVO2);
//		System.out.println("修改成功");
//		System.out.println("===========");
//		
//		//delete
//		dao.delete("PT00000007");
//		System.out.println("刪除成功");
//		System.out.println("===========");
//		
//		//findByPrimaryKey
//		PetVO petVO3 = dao.findByPrimaryKey("PT00000001");
//		System.out.println(petVO3.getPet_id());
//		System.out.println(petVO3.getPet_name());
//		System.out.println(petVO3.getMemb_id());
//		System.out.println(petVO3.getPet_gender());
//		System.out.println(petVO3.getPet_birth());
//		System.out.println(petVO3.getPet_descr());
//		System.out.println(petVO3.getPet_status());
//		System.out.println(petVO3.getPet_death());
//		System.out.println(petVO3.getPet_microchip());
//		System.out.println(petVO3.getPet_type());
//		System.out.println(petVO3.getPet_photo());
//		System.out.println("==========================");
//		System.out.println("單一資料查詢成功");
//		System.out.println("===========");
//		
//		
//		//getAll
//		
//		List<PetVO> list = dao.getAll();
//		for(PetVO aPet : list) {
//			System.out.println(aPet.getPet_id());
//			System.out.println(aPet.getPet_name());
//			System.out.println(aPet.getMemb_id());
//			System.out.println(aPet.getPet_gender());
//			System.out.println(aPet.getPet_birth());
//			System.out.println(aPet.getPet_descr());
//			System.out.println(aPet.getPet_status());
//			System.out.println(aPet.getPet_death());
//			System.out.println(aPet.getPet_microchip());
//			System.out.println(aPet.getPet_type());
//		    System.out.println(aPet.getPet_photo());
//			System.out.println("~~~~~~~~~~~~~~~~~~~~~~");
//		}
//		System.out.println("多筆資料查詢成功");
//		System.out.println("===========");
		

	}

	@Override
	public void insert(PetVO petVO) {

		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1,petVO.getPet_name());
			pstmt.setString(2,petVO.getMemb_id());
			pstmt.setString(3,petVO.getPet_gender());
			pstmt.setDate(4,petVO.getPet_birth());
			pstmt.setString(5,petVO.getPet_descr());
			pstmt.setDate(6,petVO.getPet_death());
			pstmt.setString(7,petVO.getPet_microchip());
			pstmt.setString(8,petVO.getPet_type());
			pstmt.setBytes(9, petVO.getPet_photo());
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
	public void update(PetVO petVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			pstmt = con.prepareStatement(UPDATE_STMT);
			
			pstmt.setString(1,petVO.getPet_name());
			pstmt.setString(2,petVO.getMemb_id());
			pstmt.setString(3,petVO.getPet_gender());
			pstmt.setDate(4,petVO.getPet_birth());
			pstmt.setString(5,petVO.getPet_descr());
			pstmt.setString(6,petVO.getPet_status());
			pstmt.setDate(7,petVO.getPet_death());
			pstmt.setString(8,petVO.getPet_microchip());
			pstmt.setString(9,petVO.getPet_type());
			pstmt.setBytes(10,petVO.getPet_photo());
			pstmt.setString(11,petVO.getPet_id());
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
	public void delete(String pet_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			pstmt = con.prepareStatement(DELETE_STMT);
			
			pstmt.setString(1,pet_id);
			
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
	public PetVO findByPrimaryKey(String pet_id) {
		PetVO petVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			pstmt = con.prepareStatement(GET_ONE_STMT);
			
			pstmt.setString(1,pet_id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				petVO = new PetVO();
				petVO.setPet_id(rs.getString("pet_id"));
				petVO.setPet_name(rs.getString("pet_name"));
				petVO.setMemb_id(rs.getString("memb_id"));
				petVO.setPet_gender(rs.getString("pet_gender"));
				petVO.setPet_birth(rs.getDate("pet_birth"));
				petVO.setPet_descr(rs.getString("pet_descr"));
				petVO.setPet_status(rs.getString("pet_status"));
				petVO.setPet_death(rs.getDate("pet_death"));
				petVO.setPet_microchip(rs.getString("pet_microchip"));
				petVO.setPet_type(rs.getString("pet_type"));
				petVO.setPet_photo(rs.getBytes("pet_photo"));
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
		return petVO;
	}

	@Override
	public List<PetVO> getAll() {
		List<PetVO> list = new ArrayList<PetVO>();
		PetVO petVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				petVO = new PetVO();
				petVO = new PetVO();
				petVO.setPet_id(rs.getString("pet_id"));
				petVO.setPet_name(rs.getString("pet_name"));
				petVO.setMemb_id(rs.getString("memb_id"));
				petVO.setPet_gender(rs.getString("pet_gender"));
				petVO.setPet_birth(rs.getDate("pet_birth"));
				petVO.setPet_descr(rs.getString("pet_descr"));
				petVO.setPet_status(rs.getString("pet_status"));
				petVO.setPet_death(rs.getDate("pet_death"));
				petVO.setPet_microchip(rs.getString("pet_microchip"));
				petVO.setPet_type(rs.getString("pet_type"));
				petVO.setPet_photo(rs.getBytes("pet_photo"));
				list.add(petVO);
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
}
