package com.foundApply.model;

import java.util.List;

public interface foundApplyDAO_interface {
	public void insert(foundApplyVO foundApplyVO);
	public void delete(String fd_case_id, String memb_id);
	public List<foundApplyVO> findByCase(String fd_case_id);
}
