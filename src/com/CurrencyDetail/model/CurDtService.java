package com.CurrencyDetail.model;

import java.util.List;

import com.pet.model.PetDAO_interface;
import com.pet.model.PetVO;

public class CurDtService {
	private CurDtDAO_interface dao;
	public CurDtService() {
		dao = new CurDtJDBCDAO();
	}
	public List<CurDtVO> getAllCurDtsFromSameMember(String memb_id){
		return dao.getAllCurDtsFromSameMember(memb_id); 
	}
}
