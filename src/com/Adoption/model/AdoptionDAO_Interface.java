package com.Adoption.model;

import java.util.List;

import com.AdoptApply.model.AdoptApplyVO;

public interface AdoptionDAO_Interface {
	public void insert(AdoptionVO adoptionVO);
	public void update(AdoptionVO adoptionVO);
	public AdoptionVO findByPrimaryKey(String adopt_id);
	public List<AdoptionVO> getAll();
	public void changeStatus(String adopt_id, String adopt_apply_status, String adopt_status);
	public void updateStatus(AdoptApplyVO adoptApplyVO, java.sql.Connection con);
	public List<AdoptionVO> getAllBack();
	
	//安卓指令
	byte[] getImage(String adopt_id);
	public List<AdoptionVO> getAllAdoption();

}
