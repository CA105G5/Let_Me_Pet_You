package com.ntf.model;

import java.util.List;

import com.CurrencyDetail.model.CurDtVO;

public interface NtfDAO_interface {
	public void insert(NtfVO ntfVO,java.sql.Connection con);
	public void update(NtfVO ntfVO);
	public void updateNtf_sta(String ntf_id);
	public void delete(String ntf_id);
	public NtfVO findByPrimaryKey(String ntf_id);
	public List<NtfVO> getAll();
	public List<NtfVO> getAllNtfsFromSameMember(String memb_id);
	public List<NtfVO> checkMemberNtf(String memb_id,String ntf_id);
	
}
