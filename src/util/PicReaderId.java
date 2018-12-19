package util;

import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.*;
import javax.servlet.http.*;

import com.prodimg.model.ProdImgJDBCDAO;
import com.prodimg.model.ProdImgVO;

public class PicReaderId extends HttpServlet {

	Connection con;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String prod_id = req.getParameter("prod_id");

		ProdImgJDBCDAO dao = new ProdImgJDBCDAO();
		List<ProdImgVO> list = dao.findByPrimaryKey(prod_id);
		
		List<String> prodImgIdList = new ArrayList<String>();
		req.setAttribute("prodImgIdList", prodImgIdList);

		for (ProdImgVO prodImgVO : list) {
			String prod_img_id = prodImgVO.getProd_img_id();
			prodImgIdList.add(prod_img_id);
			System.out.println(prod_img_id);
		}

		RequestDispatcher showPic = req.getRequestDispatcher("/util/showPic.jsp");
		showPic.forward(req, res);

	}

}