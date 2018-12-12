package com.mem.model;

import java.util.List;

public interface MemDAO_interface {
	public void insert(MemVO memVO);
	public void update(MemVO memVO);
	public void updateFromClient(MemVO memVO);
	public void updateFromManager(MemVO memVO);
	public void delete(String memb_id);
	public MemVO findByPrimaryKey(String memb_id);
	public List<MemVO> getAll();
	
	//
	//update 
	//Client search 
}
