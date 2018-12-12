package com.ntf.model;

import java.util.List;

public interface NtfDAO_interface {
	public void insert(NtfVO ntfVO);
	public void update(NtfVO ntfVO);
	public void delete(String ntf_id);
	public NtfVO findByPrimaryKey(String ntf_id);
	public List<NtfVO> getAll();
}
