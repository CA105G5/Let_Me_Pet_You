package com.CurrencyDetail.model;

import java.util.List;

import com.ntf.model.NtfVO;
import com.pet.model.PetDAO_interface;
import com.pet.model.PetVO;

public class CurDtService {
	private CurDtDAO_interface dao;
	public CurDtService() {
		dao = new CurDtJNDIDAO();
	}
	public List<CurDtVO> getAllCurdtsFromSameMember(String memb_id){
		return dao.getAllCurdtsFromSameMember(memb_id);
	}
}
