package com.rescueCoin.model;

import java.util.List;

public class RescueCoinService {
	
	private RescueCoinDAO_interface dao;
	
	public RescueCoinService() {
		dao = new RescueCoinJDBCDAO();
	}
	
	public RescueCoinVO addRescueCoin(RescueCoinVO rescueCoinVO) {
		
		return rescueCoinVO;
	}
	
	public List<RescueCoinVO> getAll(){
		return dao.getAll();
	}

}
