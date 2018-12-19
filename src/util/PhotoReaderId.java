package util;

import java.io.*;
import java.sql.*;
import java.util.List;
import java.util.Vector;

import javax.servlet.*;
import javax.servlet.http.*;

public class PhotoReaderId extends HttpServlet {
// 第一版，SQL查詢路徑寫死
	
	Connection con;

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		res.setContentType("image/gif");
//		ServletOutputStream out = res.getOutputStream();
		PrintWriter out = res.getWriter();

		Vector<String> imgIdList = new Vector<String>();
		
		//從資料庫讀取出圖片後，有兩種輸出: 1. 輸出到瀏覽器， 2.輸出到硬碟。
		//只差別在out不同，輸出到硬碟是用FileOutputStream，輸出到瀏覽器是用ServletOutputStream。
		

		try {
			System.out.println("aaa");
			Statement stmt = con.createStatement();
			String wish_id = req.getParameter("wish_id");
			System.out.println("aaa");
			ResultSet rs = stmt.executeQuery("select wish_IMG_ID from wish_IMG where wish_ID = '" + wish_id + "'");
			System.out.println("aaa");

			while (rs.next()) {
				System.out.println("aaa");
				String str = rs.getString(1);
				System.out.println("aaa");
				imgIdList.add(str);
				System.out.println(str);
			}
			req.setAttribute("imgIdList", imgIdList);
			
			RequestDispatcher showPhoto = req.getRequestDispatcher("/util/showPhoto.jsp");
			showPhoto.forward(req, res);
			
//			if (rs.next()) {
//				BufferedInputStream in = new BufferedInputStream(rs.getBinaryStream(1)); 
//				// 這句即等同於 InputStream in = rs.getBinaryStream("picture"); 只是再包一層BufferedInputStream 緩衝加快速度。
//				byte[] buf = new byte[4 * 1024]; // 4K buffer
//				int len;
//				while ((len = in.read(buf)) != -1) {
//					out.write(buf, 0, len);
//				}
//				in.close();
//			} else {
//				res.sendError(HttpServletResponse.SC_NOT_FOUND);
//			}
			rs.close();
			stmt.close();
		} catch (NullPointerException ne) {
			System.out.println(ne);
		} catch (SQLException se) {
			System.out.println(se);
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public void init() throws ServletException {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "Jen", "123456");
		} catch (ClassNotFoundException e) {
			throw new UnavailableException("Couldn't load JdbcOdbcDriver");
		} catch (SQLException e) {
			throw new UnavailableException("Couldn't get db connection");
		}
	}

	public void destroy() {
		try {
			if (con != null) con.close();
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

}