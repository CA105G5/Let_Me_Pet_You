package com.mem.model;

import java.util.List;

public interface MemDAO_interface {
	public void insert(MemVO memVO); 
	public void update(MemVO memVO);
	public void delete(String memb_id);
	public void  updateFromClient(MemVO memVO);
	public void updateFromManager(MemVO memVO);
	public MemVO findByPrimaryKey(String memb_id);
	public MemVO findByAccount(String memb_acc);//尋找會員是否存在
	public List<MemVO> getAll();
	
	//安卓功能
	boolean isMemAcc(String memb_acc, String memb_psw);//確認會員存在
	boolean isMembExist(String memb_acc);
	
	//
	//update 
	//Client search 
}
