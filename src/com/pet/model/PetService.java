package com.pet.model;

import java.sql.Date;
import java.util.List;

public class PetService {
	private PetDAO_interface dao;
	public PetService() { 
		dao = new PetJDBCDAO();
	}
	public PetVO addPet(String pet_name,
						String memb_id,
						String pet_gender,
						Date pet_birth,
						String pet_descr,
						Date pet_death,
						String pet_microchip,
						String pet_type,
						byte[] pet_photo) {
		PetVO petVO = new PetVO();
		petVO.setPet_name(pet_name);
		petVO.setMemb_id(memb_id);
		petVO.setPet_gender(pet_gender);
		petVO.setPet_birth(pet_birth);
		petVO.setPet_descr(pet_descr);
		petVO.setPet_death(pet_death);
		petVO.setPet_microchip(pet_microchip);
		petVO.setPet_type(pet_type);
		petVO.setPet_photo(pet_photo);
		dao.insert(petVO);
		
		return petVO;
		
	}
	public PetVO clientUpdatePet(String pet_name,
								 String memb_id,
								 String pet_gender, 
								 Date pet_birth,
								 String pet_descr,
								 String pet_status,
								 Date pet_death,
								 String pet_microchip,
								 String pet_type,
								 String pet_id,
								 byte[] pet_photo) {
		PetVO petVO = new PetVO();
		petVO.setPet_name(pet_name);
		petVO.setMemb_id(memb_id);
		petVO.setPet_gender(pet_gender);
		petVO.setPet_birth(pet_birth);
		petVO.setPet_descr(pet_descr);
		petVO.setPet_status(pet_status);
		petVO.setPet_death(pet_death);
		petVO.setPet_microchip(pet_microchip);
		petVO.setPet_type(pet_type);
		petVO.setPet_id(pet_id);
		petVO.setPet_photo(pet_photo);
		dao.update(petVO);
		return petVO;
	}
	public void deletePet(String pet_id) {
		dao.delete(pet_id);
	}
	public PetVO getOnePet(String pet_id) {
		return dao.findByPrimaryKey(pet_id);
	}
	public List<PetVO> getAllPetsFromSameMember(String memb_id){
		return dao.getAllPetsFromSameMember(memb_id);
	}
	
}
