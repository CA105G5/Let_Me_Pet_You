package com.ntf.model;

import java.util.List;

import com.pet.model.PetJDBCDAO;
import com.pet.model.PetVO;

public class NtfService {
	private NtfDAO_interface dao;
	public NtfService() {
		dao = new NtfJDBCDAO();	
	}
	public List<NtfVO> getAllNtfsFromSameMember(String memb_id){
		return dao.getAllNtfsFromSameMember(memb_id);
	}
}
