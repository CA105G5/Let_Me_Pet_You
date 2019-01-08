package com.Adoption.model;

import java.sql.Timestamp;
import java.util.List;

public class AdoptionService {
	private AdoptionDAO_Interface dao;

	public AdoptionService() {
		dao = new AdoptionJNDIDAO();
	}

	public AdoptionVO addAdoption(String adopt_species, String adopt_sponsor, String adopt_des, byte[] adopt_img) {

		AdoptionVO adoptionVO = new AdoptionVO();

		adoptionVO.setAdopt_species(adopt_species);
		adoptionVO.setAdopt_sponsor(adopt_sponsor);
		adoptionVO.setAdopt_des(adopt_des);
		adoptionVO.setAdopt_img(adopt_img);
		dao.insert(adoptionVO);

		return adoptionVO; 
	}

	public AdoptionVO updateAdoption(String adopt_id, String adopt_species, String adopt_sponsor, String adopt_status,
			String adopt_apply_status, Timestamp adopt_btime, String adopt_des, byte[] adopt_img) {

		AdoptionVO adoptionVO = new AdoptionVO();
		
		adoptionVO.setAdopt_id(adopt_id);
		adoptionVO.setAdopt_species(adopt_species);
		adoptionVO.setAdopt_sponsor(adopt_sponsor);
		adoptionVO.setAdopt_status(adopt_status);
		adoptionVO.setAdopt_apply_status(adopt_apply_status);
		adoptionVO.setAdopt_btime(adopt_btime);
		adoptionVO.setAdopt_des(adopt_des);
		adoptionVO.setAdopt_img(adopt_img);
		dao.update(adoptionVO);
		
		return adoptionVO;
		
	}
	public AdoptionVO getOneAdopt(String adopt_id) {
		return dao.findByPrimaryKey(adopt_id);
	}
	public List<AdoptionVO> getAll(){
		return dao.getAll();
	}
	public void changeStatus(String adopt_id, String adopt_apply_status, String adopt_status) {
		dao.changeStatus(adopt_id, adopt_apply_status, adopt_status);
	}
}
