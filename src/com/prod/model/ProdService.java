package com.prod.model;

import java.sql.Connection;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import com.ord.model.OrdVO;


public class ProdService {

	private ProdDAO_interface dao;

	public ProdService() {
		dao = new ProdJNDIDAO();
	}

	public ProdVO addProd(String memb_id, String prod_type_id, String prod_ani_type_id, String prod_name,
			String prod_des, String prod_info, Integer prod_qty, Integer prod_stock, Timestamp prod_date, String prod_review,
			String prod_review_des, String prod_status, Integer prod_price) {

		ProdVO prodVO = new ProdVO();

		prodVO.setMemb_id(memb_id);
		prodVO.setProd_type_id(prod_type_id);
		prodVO.setProd_ani_type_id(prod_ani_type_id);
		prodVO.setProd_name(prod_name);
		prodVO.setProd_des(prod_des);
		prodVO.setProd_info(prod_info);
		prodVO.setProd_qty(prod_qty);
		prodVO.setProd_stock(prod_stock);
		prodVO.setProd_date(prod_date);
		prodVO.setProd_review(prod_review);
		prodVO.setProd_review_des(prod_review_des);
		prodVO.setProd_status(prod_status);
		prodVO.setProd_price(prod_price);
		dao.insert(prodVO);

		return prodVO;
	}
	
	public String addProd(ProdVO prodVO) {
		String str = dao.insert(prodVO);
		System.out.println(str);
		return str;
	}

	public ProdVO updateProd(String prod_id, String memb_id, String prod_type_id, String prod_ani_type_id, String prod_name,
			String prod_des, String prod_info, Integer prod_qty, Integer prod_stock, Timestamp prod_date, String prod_review,
			String prod_review_des, String prod_status, Integer prod_price) {

		ProdVO prodVO = new ProdVO();

		prodVO.setProd_id(prod_id);
		prodVO.setMemb_id(memb_id);
		prodVO.setProd_type_id(prod_type_id);
		prodVO.setProd_ani_type_id(prod_ani_type_id);
		prodVO.setProd_name(prod_name);
		prodVO.setProd_des(prod_des);
		prodVO.setProd_info(prod_info);
		prodVO.setProd_qty(prod_qty);
		prodVO.setProd_stock(prod_stock);
		prodVO.setProd_date(prod_date);
		prodVO.setProd_review(prod_review);
		prodVO.setProd_review_des(prod_review_des);
		prodVO.setProd_status(prod_status);
		prodVO.setProd_price(prod_price);
		dao.update(prodVO);
		
		return prodVO;
	}
	
	public void updateProd(ProdVO prodVO) {
		dao.update(prodVO);
	}
	
	public void updateProd(ProdVO prodVO, Connection con) {
		dao.update(prodVO,con);
	}

	public void deleteProd(String prod_id) {
		dao.delete(prod_id);
	}

	public ProdVO getOneProd(String prod_id) {
		return dao.findByPrimaryKey(prod_id);
	}

	public List<ProdVO> getAll() {
		return dao.getAll();
	}
	
	public List<ProdVO> getAll_Front() {
		return dao.getAll_Front();
	}
	
	public List<ProdVO> getAll(Map<String, String[]> map) {
		return dao.getAll(map);
	}
	
	public List<ProdVO> getProdByMem(String memb_id) {
		return dao.getProdByMem(memb_id);
	}
}
