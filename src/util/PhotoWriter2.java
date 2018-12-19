package util;

import java.io.*;
import java.sql.*;

public class PhotoWriter2 {

	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String userid = "CA105G5";
		String passwd = "123456";

		File dir = new File("D:\\專題\\假資料\\wish_餵假資料用");
		String contents[] = dir.list(); // list() 取得目錄中的目錄、檔案，回傳字串陣列
		System.out.println(contents.length);
		try {
			con = DriverManager.getConnection(url, userid, passwd);
			for (int i = 1; i < contents.length; i++) {

				// 用InputStream送
				File dir2 = new File("D:\\專題\\假資料\\wish_餵假資料用\\" + i);
				String contents2[] = dir2.list();
				System.out.println(contents2.length);
				for (int j = 1; j <= contents2.length; j++) {

					try {
        	    	System.out.println(contents2.length);
			        File pic = new File(dir2, Integer.toString(j)+".PNG"); 
			        
			        InputStream fin = new FileInputStream(pic);  
			        
			        pstmt = con.prepareStatement("insert into wish_IMG (wish_IMG_ID, wish_ID, wish_IMG) values(LPAD(to_char(wish_img_id_seq.NEXTVAL), 10,'0'), ?, ?)");
			        if (i<=9)
			        	pstmt.setString(1, "W00000000"+i);
			        else
			        	pstmt.setString(1, "W0000000"+i);
			        pstmt.setBinaryStream(2, fin, fin.available()); //void pstmt.setBinaryStream(int parameterIndex, InputStream x, int length) throws SQLException
			        int rowsUpdated = pstmt.executeUpdate();
					
			        System.out.print("Changed " + rowsUpdated);
			
			        if (1 == rowsUpdated)
			            System.out.println(" row.");
			        else
			            System.out.println(" rows.");
			
			        fin.close();
					} catch (FileNotFoundException fe) {
						break;
					}

				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				con.close();
			} catch (Exception e) {
			}
		}
	}

}
