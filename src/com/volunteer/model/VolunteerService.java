package com.volunteer.model;

public class VolunteerService {
	
	private VolunteerDAO_interface dao;
	
	public VolunteerService() {
		dao = new VolunteerJDBCDAO();
	}
	
	public VolunteerVO addVolunteer(String vlt_id,String vlt_name,String vlt_mail,String vlt_pw,String vlt_gender,String vlt_tel,byte[] vlt_img,java.sql.Date vlt_registerdate,String vlt_duty_day,String vlt_sta,String vlt_reg) {
		
		VolunteerVO volunteerVO = new VolunteerVO();
		
		volunteerVO.setVlt_name(vlt_name);
		volunteerVO.setVlt_mail(vlt_mail);
		volunteerVO.setVlt_pw(vlt_pw);
		volunteerVO.setVlt_gender(vlt_gender);		
		volunteerVO.setVlt_tel(vlt_tel);
		volunteerVO.setVlt_img(vlt_img);
		volunteerVO.setVlt_registerdate(vlt_registerdate);
		volunteerVO.setVlt_duty_day(vlt_duty_day);
		volunteerVO.setVlt_sta(vlt_sta);
		volunteerVO.setVlt_reg(vlt_reg);
		dao.insert(volunteerVO);
		
		return volunteerVO;
	}

}
