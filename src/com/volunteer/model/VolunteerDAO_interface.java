package com.volunteer.model;

import java.util.*;

import com.rescue.model.RescueVO;




public interface VolunteerDAO_interface {
    public void insert(VolunteerVO volunteerVO);
    public void updateForManager(VolunteerVO volunteerVO);
    public void updateForVolunteer(VolunteerVO volunteerVO);
    public void updateStaByManager(String vlt_id, java.sql.Connection con);
    public void delete(String vlt_id);
    public VolunteerVO findByPrimaryKey(String vlt_id);
    public List<VolunteerVO> getAll();
    //萬用複合查詢(傳入參數型態Map)(回傳 List)
    public List<VolunteerVO> getAll(Map<String, String[]> map); 
    //登入志工
    public VolunteerVO findByAccount(String vlt_mail);
    public RescueVO volunteerCheckOut(String vlt_id);
    //安卓功能
    boolean isVltMail(String vlt_mail, String vlt_psw);//確認志工存在
	boolean isVltExist(String vlt_mail);
}
