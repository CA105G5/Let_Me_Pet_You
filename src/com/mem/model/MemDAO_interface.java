package com.mem.model;

import java.sql.Connection;
import java.util.List;

import com.AdoptApply.model.AdoptApplyVO;
import com.Adoption.model.AdoptionVO;
import com.CurrencyDetail.model.CurDtVO;
import com.missingCase.model.missingCaseVO;
import com.rescue.model.RescueVO;
import com.rescuing.model.RescuingVO;

public interface MemDAO_interface {
	public void insert(MemVO memVO); 
	public void update(MemVO memVO);
	public void updateMemWithOrdItemAndCurDt(MemVO memVO, CurDtVO curDTVO, Connection con);
	public void updateMemBal(MemVO memVO, Connection con); 
	public void delete(String memb_id);
	public void  updateFromClient(MemVO memVO);
	public void updateFromManager(MemVO memVO);
	public MemVO findByPrimaryKey(String memb_id);
	public MemVO findByAccount(String memb_acc);
	public List<MemVO> getAll();
	public List<RescueVO> selectRescue(String memb_id);
	public List<RescuingVO> selectRescuing(String memb_id);
	public List<AdoptionVO> selectAdoption(String memb_id);
	public List<AdoptApplyVO> selectAdoptApply(String memb_id);
	public List<missingCaseVO> selectMissingCase(String memb_id);
	public void updateBalance(String memb_id,Integer rsc_coin,Connection con);
	
	//安卓功能
	boolean isMemAcc(MemVO memVO);//確認會員存在
	boolean isMemExist(String memb_acc);
	byte[] getImage(String memb_acc);
	 
	//
	//update 
	//Client search 
}
