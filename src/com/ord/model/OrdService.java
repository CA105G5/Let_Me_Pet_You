package com.ord.model;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import com.mem.model.MemVO;
import com.orditem.model.OrdItemVO;
import com.prod.model.ProdVO;

public class OrdService {

	private OrdDAO_interface dao;

	public OrdService() {
		dao = new OrdJNDIDAO();
	}

	public OrdVO addOrd(String		memb_id, 
					    Timestamp	ord_date, 
					    Integer		ord_total, 
					    String		ord_receiver, 
					    String		ord_rc_tel, 
					    String		ord_rc_add, 
					    String		ord_rc_comm) {

		OrdVO ordVO = new OrdVO();

		ordVO.setMemb_id(memb_id);
		ordVO.setOrd_date(ord_date);
		ordVO.setOrd_total(ord_total);
		ordVO.setOrd_receiver(ord_receiver);
		ordVO.setOrd_rc_tel(ord_rc_tel);
		ordVO.setOrd_rc_add(ord_rc_add);
		ordVO.setOrd_rc_comm(ord_rc_comm);
		dao.insert(ordVO);

		return ordVO;
	}
	
	public void addOrd(OrdVO ordVO) {
		dao.insert(ordVO);
	}

	public OrdVO updateOrd(String		ord_id,
						   String		memb_id, 
					       Timestamp	ord_date, 
					       Integer		ord_total, 
					       String		ord_receiver, 
					       String		ord_rc_tel, 
					       String		ord_rc_add, 
					       String		ord_rc_comm) {

		OrdVO ordVO = new OrdVO();

		ordVO.setOrd_id(ord_id);
		ordVO.setMemb_id(memb_id);
		ordVO.setOrd_date(ord_date);
		ordVO.setOrd_total(ord_total);
		ordVO.setOrd_receiver(ord_receiver);
		ordVO.setOrd_rc_tel(ord_rc_tel);
		ordVO.setOrd_rc_add(ord_rc_add);
		ordVO.setOrd_rc_comm(ord_rc_comm);
		dao.update(ordVO);
		
		return ordVO;
	}
	
	public void updateOrd(OrdVO ordVO) {
		dao.update(ordVO);
	}

	public void deleteOrd(String ord_id) {
		dao.delete(ord_id);
	}

	public OrdVO getOneOrd(String ord_id) {
		return dao.findByPrimaryKey(ord_id);
	}

	public List<OrdVO> getAll() {
		return dao.getAll();
	}
	
//	public List<OrdVO> getAll_Front() {
//		return dao.getAll_Front();
//	}
	
	public List<OrdVO> getAll(Map<String, String[]> map) {
		return dao.getAll(map);
	}
	
	public List<OrdVO> getOrdByMem(String memb_id) {
		return dao.getOrdByMem(memb_id);
	}
	
	public void insertWithOrdItem(OrdVO ordVO, List<OrdItemVO> list, MemVO memVO) {
		dao.insertWithOrdItem(ordVO, list, memVO);
	}
}
