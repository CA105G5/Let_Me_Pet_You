package com.CurrencyDetail.model;

import java.util.List; 

import com.pet.model.PetVO;

public interface CurDtDAO_interface {
	public void insert(CurDtVO curdtVO);
	public void update(CurDtVO curdtVO);
	public void delete(String cur_dt_id);
	public CurDtVO findByPrimaryKey(String cur_dt_id);
	public List<CurDtVO> getAll();
	public List<CurDtVO> getAllCurDtsFromSameMember(String memb_id);
}
