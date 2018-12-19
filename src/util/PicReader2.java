package util;

import java.io.*;
import java.sql.*;
import java.util.List;

import javax.servlet.*;
import javax.servlet.http.*;

import com.prodimg.model.ProdImgJDBCDAO;
import com.prodimg.model.ProdImgVO;

public class PicReader2 extends HttpServlet {

	Connection con;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		res.setContentType("image/gif");
		ServletOutputStream out = res.getOutputStream();
		
		//用prod_img_id來查詢
		String prod_img_id = req.getParameter("prod_img_id");

		ProdImgJDBCDAO dao = new ProdImgJDBCDAO();
		ProdImgVO prodImgVO  = dao.findByPrimaryKey2(prod_img_id);

		System.out.println(prodImgVO.getProd_img());
		out.write(prodImgVO.getProd_img());

		//用prod_id來查詢
//		String prod_id = req.getParameter("prod_id");
//		
//		ProdImgJDBCDAO dao = new ProdImgJDBCDAO();
//		ProdImgVO prodImgVO  = dao.findByPrimaryKey1(prod_id);
//		
//		System.out.println(prodImgVO.getProd_img());
//		out.write(prodImgVO.getProd_img());
		
		

	}

}