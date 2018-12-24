package com.volunteer.model;

import java.util.*;


public interface VolunteerDAO_interface {
    public void insert(VolunteerVO volunteerVO);
    public void updateForManager(VolunteerVO volunteerVO);
    public void updateForVolunteer(VolunteerVO volunteerVO);
    public void delete(String vlt_id);
    public VolunteerVO findByPrimaryKey(String vlt_id);
    public List<VolunteerVO> getAll();
    //萬用複合查詢(傳入參數型態Map)(回傳 List)
    public List<VolunteerVO> getAll(Map<String, String[]> map); 
}
