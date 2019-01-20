package com.ntf.model;

import java.util.List;

import com.pet.model.PetJDBCDAO;
import com.pet.model.PetVO;

public class NtfService {
	private NtfDAO_interface dao;
	public NtfService() {
		dao = new NtfJNDIDAO();	
	}
	public List<NtfVO> getAllNtfsFromSameMember(String memb_id){
		return dao.getAllNtfsFromSameMember(memb_id);
	}
	public List<NtfVO> checkMemberNtf(String memb_id,String ntf_src_id){
		return dao.checkMemberNtf(memb_id,ntf_src_id);
	}
	public void updateNtf_sta(String ntf_id) {
		dao.updateNtf_sta(ntf_id);
	}
}
