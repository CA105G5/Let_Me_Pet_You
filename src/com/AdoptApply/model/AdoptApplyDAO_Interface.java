package com.AdoptApply.model;

import java.util.*;

public interface AdoptApplyDAO_Interface {
	public void insert(AdoptApplyVO adoptApplyVO);
	public void insert(String memb_id, String adopt_id);
	public void update(AdoptApplyVO adoptApplyVO);
	public void delete(String memb_id, String adopt_id);
	public List<AdoptApplyVO> findByPrimaryKey(String memb_id, String adopt_id);
	public List<AdoptApplyVO> getAll();
	

}
