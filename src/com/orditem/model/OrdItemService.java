package com.orditem.model;

import java.sql.Connection;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import com.CurrencyDetail.model.CurDtVO;
import com.mem.model.MemVO;
import com.ord.model.OrdVO;
import com.prod.model.ProdVO;


public class OrdItemService {

	private OrdItemDAO_interface dao;

	public OrdItemService() {
		dao = new OrdItemJNDIDAO();
	}

	public OrdItemVO addOrdItem(String		prod_id, 
								String		ord_id, 
								Integer		ord_item_qty, 
								String		ord_item_sp_status, 
								Timestamp	ord_item_sp_date, 
								String		ord_item_rc_status, 
								Timestamp	ord_item_rc_date, 
								String		ord_item_coin_st, 
								String		ord_item_rt_status, 
								Timestamp	ord_item_rt_date, 
								String		ord_item_rt_comm, 
								String		ord_item_review, 
								String		ord_item_rv_des,
								String		ord_item_rt_pic) {

		OrdItemVO ordItemVO = new OrdItemVO();

		ordItemVO.setProd_id(prod_id);
		ordItemVO.setOrd_id(ord_id);
		ordItemVO.setOrd_item_qty(ord_item_qty);
		ordItemVO.setOrd_item_sp_status(ord_item_sp_status);
		ordItemVO.setOrd_item_sp_date(ord_item_sp_date);
		ordItemVO.setOrd_item_rc_status(ord_item_rc_status);
		ordItemVO.setOrd_item_rc_date(ord_item_rc_date);
		ordItemVO.setOrd_item_coin_st(ord_item_coin_st);
		ordItemVO.setOrd_item_rt_status(ord_item_rt_status);
		ordItemVO.setOrd_item_rt_date(ord_item_rt_date);
		ordItemVO.setOrd_item_rt_comm(ord_item_rt_comm);
		ordItemVO.setOrd_item_review(ord_item_review);
		ordItemVO.setOrd_item_rv_des(ord_item_rv_des);
		ordItemVO.setOrd_item_rt_pic(ord_item_rt_pic);
		dao.insert(ordItemVO);

		return ordItemVO;
	}
	
	//新增訂單時同時新增明細，使用訂單的connection
	public void addOrdItem(OrdItemVO ordItemVO, Connection con) {
		dao.insert2(ordItemVO, con);
	}

	public OrdItemVO updateOrdItem(String		prod_id, 
									String		ord_id, 
									Integer		ord_item_qty, 
									String		ord_item_sp_status, 
									Timestamp	ord_item_sp_date, 
									String		ord_item_rc_status, 
									Timestamp	ord_item_rc_date, 
									String		ord_item_coin_st, 
									String		ord_item_rt_status, 
									Timestamp	ord_item_rt_date, 
									String		ord_item_rt_comm, 
									String		ord_item_review, 
									String		ord_item_rv_des,
									String		ord_item_rt_pic) {

		OrdItemVO ordItemVO = new OrdItemVO();

		ordItemVO.setProd_id(prod_id);
		ordItemVO.setOrd_id(ord_id);
		ordItemVO.setOrd_item_qty(ord_item_qty);
		ordItemVO.setOrd_item_sp_status(ord_item_sp_status);
		ordItemVO.setOrd_item_sp_date(ord_item_sp_date);
		ordItemVO.setOrd_item_rc_status(ord_item_rc_status);
		ordItemVO.setOrd_item_rc_date(ord_item_rc_date);
		ordItemVO.setOrd_item_coin_st(ord_item_coin_st);
		ordItemVO.setOrd_item_rt_status(ord_item_rt_status);
		ordItemVO.setOrd_item_rt_date(ord_item_rt_date);
		ordItemVO.setOrd_item_rt_comm(ord_item_rt_comm);
		ordItemVO.setOrd_item_review(ord_item_review);
		ordItemVO.setOrd_item_rv_des(ord_item_rv_des);
		ordItemVO.setOrd_item_rt_pic(ord_item_rt_pic);
		dao.update(ordItemVO);
		
		return ordItemVO;
	}
	
	//商品明細確認收貨更新，要同時更新會員愛心幣餘額以及愛心幣明細
	public void updateOrdItemWithMem(OrdItemVO ordItemVO, MemVO memVO, CurDtVO curDTVO) {
		dao.update(ordItemVO, memVO, curDTVO);
	}

	//商品明細更新(檢舉或出貨更新)
	public void updateOrdItem(OrdItemVO ordItemVO) {
		dao.update(ordItemVO);
	}
	
	public void deleteOrdItem(String prod_id, String ord_id) {
		dao.delete(prod_id, ord_id);
	}

	public OrdItemVO getOneOrdItem(String prod_id, String ord_id) {
		return dao.findByPrimaryKey(prod_id, ord_id);
	}

	public List<OrdItemVO> getAll() {
		return dao.getAll();
	}
	
	public List<OrdItemVO> getOrdItemByOrd(List<OrdVO> ordList) {
		return dao.getOrdItemByOrd(ordList);
	}
	
	public List<OrdItemVO> getOrdItemByProd(List<ProdVO> prodList) {
		return dao.getOrdItemByProd(prodList);
	}
	
//	public List<OrdItemVO> getAll_Front() {
//		return dao.getAll_Front();
//	}
	
//	public List<OrdItemVO> getAll(Map<String, String[]> map) {
//		return dao.getAll(map);
//	}
}
