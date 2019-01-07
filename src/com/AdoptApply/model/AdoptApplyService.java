package com.AdoptApply.model;

import java.util.List;

public class AdoptApplyService {
	private AdoptApplyDAO_Interface dao;

	public AdoptApplyService() {
		dao = new AdoptApplyJNDIDAO();
	}

	public AdoptApplyVO addApply(String memb_id, String adopt_id, String adopt_des) {
		AdoptApplyVO adoptApplyVO = new AdoptApplyVO();
		adoptApplyVO.setMemb_id(memb_id);
		adoptApplyVO.setAdopt_id(adopt_id);
		adoptApplyVO.setAdopt_des(adopt_des);
		dao.insert(adoptApplyVO);

		return adoptApplyVO;
	}

	public AdoptApplyVO changetStatus(String adopt_id, String adopt_id_status, String memb_id) {
		AdoptApplyVO adoptApplyVO = new AdoptApplyVO();
		adoptApplyVO.setAdopt_id(adopt_id);
		adoptApplyVO.setAdopt_id_status(adopt_id_status);
		adoptApplyVO.setMemb_id(memb_id);
		dao.update(adoptApplyVO);

		return adoptApplyVO;

	}
	
	public List<AdoptApplyVO>getAllApply(){
		return dao.getAll();
	}
	public List<AdoptApplyVO>getAllMem(String adopt_id){
		return dao.findByAdopt(adopt_id);
	}
	
}