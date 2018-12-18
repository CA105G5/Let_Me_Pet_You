package com.mem.model;

import java.util.List;

public class MemService {
	private MemDAO_interface dao;
	public MemService() {
		dao = new MemJDBCDAO();
	}
	public MemVO addMem(String memb_acc, 
						String memb_psw,
						String memb_name, 
						String memb_nick, 
						String memb_email, 
						String memb_cellphone, 
						String memb_gender, 
						String memb_cre_type, 
						String memb_cre_name, 
						String memb_cre_year, 
						String memb_cre_month,
						byte[] memb_photo,
						String memb_fb_login,
						String memb_google_login) {
		MemVO memVO = new MemVO();
		memVO.setMemb_acc(memb_acc);
		memVO.setMemb_psw(memb_psw);
		memVO.setMemb_name(memb_name);
		memVO.setMemb_nick(memb_nick);
		memVO.setMemb_email(memb_email);
		memVO.setMemb_cellphone(memb_cellphone);
		memVO.setMemb_gender(memb_gender);
		memVO.setMemb_cre_type(memb_cre_type);
		memVO.setMemb_cre_name(memb_cre_name);
		memVO.setMemb_cre_year(memb_cre_year);
		memVO.setMemb_cre_month(memb_cre_month);
		memVO.setMemb_photo(memb_photo);
		memVO.setMemb_fb_login(memb_fb_login);
		memVO.setMemb_google_login(memb_google_login);
		dao.insert(memVO);
		return memVO;
	}
	public MemVO updateMem( String memb_id, 
							String memb_sta, 
							String memb_acc, 
							String memb_psw,
							String memb_name, 
							String memb_nick, 
							String memb_email, 
							String memb_cellphone, 
							String memb_gender,
							Integer memb_balance,
							String memb_cre_type, 
							String memb_cre_name, 
							String memb_cre_year, 
							String memb_cre_month,
							Integer memb_vio_times,
							byte[] memb_photo) {
		MemVO memVO = new MemVO();
		memVO.setMemb_id(memb_id);
		memVO.setMemb_sta(memb_sta);
		memVO.setMemb_acc(memb_acc);
		memVO.setMemb_psw(memb_psw);
		memVO.setMemb_name(memb_name);
		memVO.setMemb_nick(memb_nick);
		memVO.setMemb_email(memb_email);
		memVO.setMemb_cellphone(memb_cellphone);
		memVO.setMemb_gender(memb_gender);
		memVO.setMemb_balance(memb_balance);
		memVO.setMemb_cre_type(memb_cre_type);
		memVO.setMemb_cre_name(memb_cre_name);
		memVO.setMemb_cre_year(memb_cre_year);
		memVO.setMemb_cre_month(memb_cre_month);
		memVO.setMemb_vio_times(memb_vio_times);
		memVO.setMemb_photo(memb_photo);
		dao.update(memVO);
		return memVO;
	}
	public MemVO clientUpdateMem( String memb_id,  
								String memb_psw,
								String memb_name, 
								String memb_nick, 
								String memb_email, 
								String memb_cellphone, 
								String memb_gender,
								String memb_cre_type, 
								String memb_cre_name, 
								String memb_cre_year, 
								String memb_cre_month,
								byte[] memb_photo) {
		MemVO memVO = new MemVO();
		memVO.setMemb_id(memb_id);
		memVO.setMemb_psw(memb_psw);
		memVO.setMemb_name(memb_name);
		memVO.setMemb_nick(memb_nick);
		memVO.setMemb_email(memb_email);
		memVO.setMemb_cellphone(memb_cellphone);
		memVO.setMemb_gender(memb_gender);
		memVO.setMemb_cre_type(memb_cre_type);
		memVO.setMemb_cre_name(memb_cre_name);
		memVO.setMemb_cre_year(memb_cre_year);
		memVO.setMemb_cre_month(memb_cre_month);
		memVO.setMemb_photo(memb_photo);
		dao.update(memVO);
		return memVO;
	}
	public MemVO managerUpdateMem( String memb_id, 
			String memb_sta, 
			Integer memb_vio_times) {
		MemVO memVO = new MemVO();
		memVO.setMemb_id(memb_id);
		memVO.setMemb_sta(memb_sta);
		memVO.setMemb_vio_times(memb_vio_times);
		dao.update(memVO);
		return memVO;
	}
	public void deleteMem(String memb_id) {
		dao.delete(memb_id);
	}
	public MemVO getOneMem(String memb_id) {
		return dao.findByPrimaryKey(memb_id);
	}
	public List<MemVO> getAll(){
		return dao.getAll();
	}
}
