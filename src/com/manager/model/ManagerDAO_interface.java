package com.manager.model;

import java.util.List;

public interface ManagerDAO_interface {
	public void insert(ManagerVO managerVO);
	public void update(ManagerVO managerVO);
	public void delete(String ma_id);
	public ManagerVO findByPrimaryKey(String ma_id);
	public List<ManagerVO> getAll();
}
