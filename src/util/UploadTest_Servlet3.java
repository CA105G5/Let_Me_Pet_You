package util;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;

import com.prodimg.model.ProdImgJDBCDAO;
import com.prodimg.model.ProdImgVO;

@WebServlet("/util/uploadServlet3.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class UploadTest_Servlet3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String saveDirectory = "/images_uploaded";

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=Big5");
		PrintWriter out = res.getWriter();
		System.out.println("ContentType=" + req.getContentType());

		String realPath = getServletContext().getRealPath(saveDirectory);
		System.out.println(req.getPathTranslated());
		System.out.println("realPath=" + realPath);

		String prod_id = req.getParameter("prod_id");

		String file = req.getPathTranslated();
		String files = req.getPathInfo();
		System.out.println("getPathTranslated= " + file);
		System.out.println("getPathInfo= " + files);

		File fsaveDirectory = new File(realPath);
		if (!fsaveDirectory.exists())
			fsaveDirectory.mkdirs();

		Collection<Part> parts = req.getParts();
		out.write("<h2> Total parts : " + parts.size() + "</h2>");

		for (Part part : parts) {

			if (getFileNameFromPart(part) != null && part.getContentType() != null) {
//				out.println("file name= " + part.getSubmittedFileName()+ "<br>");
//				out.println("file length= " + part.getSubmittedFileName().length());
//				
//				out.println("<PRE>");
				String name = part.getName();
				String filename = getFileNameFromPart(part);

				String ContentType = part.getContentType();
				long size = part.getSize();
				File f = new File(fsaveDirectory, filename);

//				out.println("name: " + name);
//				out.println("filename: " + filename);
//				out.println("ContentType: " + ContentType);
//				out.println("size: " + size);
//				out.println("File: " + f);

				// 利用File物件,寫入目地目錄,上傳成功
//				part.write(f.toString());

				// 額外測試 InputStream 與 byte[] (幫將來model的VO預作準備)
//				InputStream in = part.getInputStream();
//				byte[] buf = new byte[in.available()];
//				in.read(buf);
//				in.close();
//				out.println("buffer length: " + buf.length);

				ProdImgJDBCDAO dao = new ProdImgJDBCDAO();

				// 將圖片存到資料庫
				// 存到本地目錄或存到資料庫只能二擇一?
				ProdImgVO prodImgVO1 = new ProdImgVO();
				prodImgVO1.setProd_img_id("000000test");
				prodImgVO1.setProd_id(prod_id);

				InputStream in = part.getInputStream();
				ByteArrayOutputStream baos = new ByteArrayOutputStream();
				byte[] buffer = new byte[8192]; // 設定每次讀取的大小
				int i;
				while ((i = in.read(buffer)) != -1) {
					baos.write(buffer, 0, i);
				}

				prodImgVO1.setProd_img(baos.toByteArray());
				dao.insert(prodImgVO1);

				// 額外測試秀圖
//				out.println("<br><img src=\""+req.getContextPath()+saveDirectory+"/"+filename+"\">");

//				out.println();
//				out.println("</PRE>");

				baos.close();
				in.close();

			}
		}
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

		/* 刪除檔案 */
//		Collection<Part> partsDel = req.getParts();
//		for (Part part : partsDel) {
//			if (getFileNameFromPart(part) != null && part.getContentType()!=null) {
//				out.println("<PRE>");
//				String fileName = part.getSubmittedFileName();
//				String dir = getServletContext().getRealPath(saveDirectory);
//				out.println(fileName);
//				out.println(dir);
//				File f = new File(dir, fileName);
//				f.delete();
//				
//			}
//		}
		// Servlet3.1版新增的API方法，可以直接用getSubmittedFileName()得到上傳檔案名稱
	}

	// 取出上傳的檔案名稱 (因為Servlet
	// 3.1以前API未提供method,所以必須自行撰寫)，但Servlet3.1之後有API可以用了(參見Part介面方法)
	public String getFileNameFromPart(Part part) {
		String header = part.getHeader("content-disposition");
		System.out.println("header=" + header);
		String filename = new File(header.substring(header.lastIndexOf("=") + 2, header.length() - 1)).getName();
		System.out.println("filename=" + filename);
		if (filename.length() == 0) {
			return null;
		}
		return filename;
	}

}