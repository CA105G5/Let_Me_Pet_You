package com.mem.model;

import java.sql.Connection;
import java.util.List;

import com.AdoptApply.model.AdoptApplyVO;
import com.Adoption.model.AdoptionVO;
import com.CurrencyDetail.model.CurDtVO;
import com.missingCase.model.missingCaseVO;
import com.orditem.model.OrdItemVO;
import com.rescue.model.RescueVO;
import com.rescuing.model.RescuingVO;

public class MemService {
	private MemDAO_interface dao; 
	public MemService() {
		dao = new MemJNDIDAO();
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
	public MemVO updateMem(MemVO memVO) {
		dao.update(memVO);
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
								String memb_acc,
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
		memVO.setMemb_acc(memb_acc);
		dao.updateFromClient(memVO);
		return memVO;
	}
	public MemVO managerUpdateMem( String memb_id, 
			String memb_sta, 
			Integer memb_vio_times) {
		MemVO memVO = new MemVO();
		memVO.setMemb_id(memb_id);
		memVO.setMemb_sta(memb_sta);
		memVO.setMemb_vio_times(memb_vio_times);
		dao.updateFromManager(memVO);
		return memVO;
	}
	public void deleteMem(String memb_id) {
		dao.delete(memb_id);
	}
	public MemVO getOneMem(String memb_id) {
		return dao.findByPrimaryKey(memb_id);
	}
	public MemVO getMemSelf(String memb_acc) {
		return dao.findByAccount(memb_acc);
	}
	public List<MemVO> getAll(){
		return dao.getAll();
	}
	public List<RescueVO> selectRescue(String memb_id){
		return dao.selectRescue(memb_id);
	}
	public List<RescuingVO> selectRescuing(String memb_id){
		return dao.selectRescuing(memb_id);
	}
	public List<missingCaseVO> selectMissingCase(String memb_id){
		return dao.selectMissingCase(memb_id);
	}
	public List<AdoptionVO> selectAdoption(String memb_id){
		return dao.selectAdoption(memb_id);
	}
	public List<AdoptApplyVO> selectAdoptApply(String memb_id){
		return dao.selectAdoptApply(memb_id);
	}
	
	public void updateMem(MemVO memVO, CurDtVO curDTVO, Connection con) {
		dao.updateMemWithOrdItemAndCurDt(memVO, curDTVO, con);
	}
	public void updateMemBal(MemVO memVO, Connection con) {
		dao.updateMemBal(memVO, con); 
	}
}
