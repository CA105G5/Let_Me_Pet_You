package com.manager.model;

import com.mem.model.MemVO;

public class ManagerService {
	private ManagerDAO_interface dao;
	public ManagerService() {
		dao = new ManagerJDBCDAO();
	}
	public ManagerVO getManagerSelf(String ma_acc) {
		return dao.findByManagerAccount(ma_acc);
	}
}
