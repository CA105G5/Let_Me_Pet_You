package com.AdoptTrack.model;

import java.util.List;

public interface AdoptTrackDAO_Interface { 
	public void insert(AdoptTrackVO adoptTrackVO);
	public void insert(String adopt_id, String memb_id);
	public void delete(String adopt_id, String memb_id);
	public List<AdoptTrackVO> getAll();

}
