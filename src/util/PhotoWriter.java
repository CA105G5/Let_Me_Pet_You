package util;
import java.io.*;
import java.sql.*;

public class PhotoWriter {
	
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
        String userid = "Jen";
        String passwd = "123456";
        
        File dir = new File("C:\\專題\\假資料\\WISH_餵假資料用\\6");     
	    String contents[] = dir.list();          //list() 取得目錄中的目錄、檔案，回傳字串陣列 
      
        try {
            con = DriverManager.getConnection(url, userid, passwd);
            for (int i = 1; i <= contents.length; i++) {
	          
        	  //用InputStream送
		        File pic = new File(dir, Integer.toString(i)+".PNG"); 
	
		        InputStream fin = new FileInputStream(pic);  
		
		        pstmt = con.prepareStatement("insert into WISH_IMG (WISH_IMG_ID, WISH_ID, WISH_IMG) values(LPAD(to_char(wish_img_id_seq.NEXTVAL), 10,'0'), ?, ?)");
		        pstmt.setString(1, "W000000006");
		        pstmt.setBinaryStream(2, fin, fin.available()); //void pstmt.setBinaryStream(int parameterIndex, InputStream x, int length) throws SQLException
		        int rowsUpdated = pstmt.executeUpdate();
				
		        System.out.print("Changed " + rowsUpdated);
		
		        if (1 == rowsUpdated)
		            System.out.println(" row.");
		        else
		            System.out.println(" rows.");
		
		        fin.close();
		        pstmt.close();
	          
	        //用byte[]送
//          con = DriverManager.getConnection(url, userid, passwd);
//		    for (int i = 1; i <= contents.length; i++) {
//	          
//	        	File file = new File(dir, Integer.toString(i)+".PNG");
//	      		FileInputStream fis = new FileInputStream(file);
//	      		ByteArrayOutputStream baos = new ByteArrayOutputStream();
//	      		byte[] buffer = new byte[8192];	//設定每次讀取的大小
//	      		
//	      		int j;
//	      		while ((j = fis.read(buffer)) != -1) {
//	      			baos.write(buffer, 0, i);
//	      		}
//      	  
//	      		byte[] pic = baos.toByteArray();
//	
//		        pstmt = con.prepareStatement("insert into PROD_IMG (PROD_IMG_ID, PROD_ID, PROD_IMG) values(LPAD(to_char(prod_img_id_seq.NEXTVAL), 10,'0'), ?, ?)");
//		        pstmt.setString(1, "P000000001");
//		        pstmt.setBytes(2, pic); //void pstmt.setBinaryStream(int parameterIndex, InputStream x, int length) throws SQLException
//		        int rowsUpdated = pstmt.executeUpdate();
//			
//	            System.out.print("Changed " + rowsUpdated);
//	
//	            if (1 == rowsUpdated)
//	                System.out.println(" row.");
//	            else
//	                System.out.println(" rows.");
//	
//	            baos.close();
//	      		fis.close();
//	            pstmt.close();
          }
          

        } catch (Exception e) {
              e.printStackTrace();
        } finally {
              try {
                con.close();
              } catch (Exception e) {
              }
       }
	}

}
