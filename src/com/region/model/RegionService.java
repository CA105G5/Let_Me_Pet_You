package com.region.model;

import java.util.List;

public class RegionService {
	
	private RegionDAO_interface dao;
	
	public RegionService() {
		dao = new RegionJDBCDAO();
	}
	
	public RegionVO addRegion(String reg_id,String reg_name) {
		
		RegionVO regionVO = new RegionVO();
		
		regionVO.setReg_name(reg_name);
		dao.insert(regionVO);
		
		return regionVO;
	}
	
	public RegionVO update(String reg_id,String reg_name) {
		
		RegionVO regionVO = new RegionVO();
		
		regionVO.setReg_id(reg_id);
		regionVO.setReg_name(reg_name);
		dao.update(regionVO);
		
		return regionVO;
		
	}
	
	public void deleteRegion(String reg_id) {
		dao.delete(reg_id);
	}
	
	public RegionVO getOneRegion(String reg_id) {
		return dao.findByPrimaryKey(reg_id);
	}
	
	public List<RegionVO> getAll(){
		return dao.getAll();
	}
	

}
