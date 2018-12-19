package com.android.mem.model;

import java.util.List;

public interface MemDAO_interface {
	boolean isMemID(String memb_id, String password);
	boolean isMemACC(String memb_acc, String memb_psw);
	boolean isMembIdExist(String memb_id);
	boolean isMembAccExist(String memb_acc);
	public void insert(MemVO memVO); 
	public void update(MemVO memVO);
	public void delete(String memb_id);
	public void  updateFromClient(MemVO memVO);
	public void updateFromManager(MemVO memVO);
	public MemVO findByPrimaryKey(String memb_id);
	public List<MemVO> getAll();
	
	
	
	//
	//update 
	//Client search 
}
