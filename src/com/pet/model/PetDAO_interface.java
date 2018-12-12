package com.pet.model;

import java.util.List;

public interface PetDAO_interface {
	public void insert(PetVO petVO);
	public void update(PetVO petVO);
	public void delete(String pet_id);
	public PetVO findByPrimaryKey(String pet_id);
	public List<PetVO> getAll();
}
