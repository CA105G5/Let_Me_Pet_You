package com.pet.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.mem.model.MemService;
import com.mem.model.MemVO;
import com.pet.model.PetService;
import com.pet.model.PetVO;

public class PetServlet extends HttpServlet{ 
	private static final long serialVersionUID = -1115382316914923109L;
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		HttpSession session = req.getSession();
		MemVO memVO = (MemVO)session.getAttribute("memVO");
		if("select_pet".equals(action)) {
			RequestDispatcher successView = 
					req.getRequestDispatcher("/front-end/pet/listAllPets.jsp");
			successView.forward(req, res);	
		}
		if("addPet".equals(action)) {//為何進不來?
			System.out.println("1");
			String memb_id = req.getParameter("memb_id");
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				System.out.println("2");
				String pet_name = req.getParameter("pet_name");
				if(pet_name == null || pet_name.trim().length() == 0) {
					errorMsgs.add("寵物名稱不得為空");
				}
				String pet_gender = req.getParameter("pet_gender");
				java.sql.Date pet_birth = null;
				try {
					System.out.println("3");
					pet_birth = java.sql.Date.valueOf(req.getParameter("pet_birth").trim());
				} catch (IllegalArgumentException e) {
					System.out.println("4");
					pet_birth = new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}
				System.out.println("5");
				String pet_descr = req.getParameter("pet_descr");
				String pet_type = req.getParameter("pet_type");
				java.sql.Date pet_death= null;
				String pet_microchip="";
				Part part = req.getPart("upfile");
				InputStream is = part.getInputStream();
				byte[] pet_photo = transbyte(is);
				PetVO petVO = new PetVO();
				petVO.setMemb_id(memb_id);
				petVO.setPet_name(pet_name);
				petVO.setPet_gender(pet_gender);
				petVO.setPet_birth(pet_birth);
				petVO.setPet_descr(pet_descr);
				petVO.setPet_type(pet_type);
				

				if(!errorMsgs.isEmpty()) {
					System.out.println("6");
					req.setAttribute("petVO", petVO);
					RequestDispatcher failureView = 
					req.getRequestDispatcher("/front-end/pet/addPets.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.開始新增資料*****************************************/
				System.out.println("7");
				PetService petSvc = new PetService();
				petVO = petSvc.addPet(pet_name, memb_id, pet_gender, pet_birth, pet_descr, pet_death, pet_microchip, pet_type, pet_photo);
				System.out.println("8");
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("petVO", petVO);
				String url = "/front-end/pet/listAllPets.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);
						
				
			}catch(Exception e) {
				System.out.println("9");
				errorMsgs.add("無法新增資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/pet/addPets.jsp");
				failureView.forward(req, res);
			}
		}
		
		
	}
	public static final byte[] transbyte(InputStream inStream) throws IOException {
		ByteArrayOutputStream swapStream = new ByteArrayOutputStream();
		byte[] buff = new byte[100];
		int rc = 0;
		while ((rc = inStream.read(buff, 0, 100)) > 0) {
			swapStream.write(buff, 0, rc);
		}
		byte[] in2b = swapStream.toByteArray();
		return in2b;
	}
}
