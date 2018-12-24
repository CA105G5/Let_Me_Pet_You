package com.pet.model;

public class PetService {
	private PetDAO_interface dao;
	public PetService() {
		dao = new PetJDBCDAO();
	}
	
}
