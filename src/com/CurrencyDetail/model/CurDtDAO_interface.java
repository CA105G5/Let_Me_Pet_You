package com.CurrencyDetail.model;

import java.util.List;

import com.ntf.model.NtfVO;
import com.rescue.model.RescueVO;

public interface CurDtDAO_interface {
	public void insert(CurDtVO curdtVO);
	public void insert(String memb_id,RescueVO rescueVO,java.sql.Connection con);
	public void update(CurDtVO curdtVO);
	public void delete(String cur_dt_id);
	public CurDtVO findByPrimaryKey(String cur_dt_id);
	public List<CurDtVO> getAll();
	public List<CurDtVO> getAllCurdtsFromSameMember(String memb_id);
}
