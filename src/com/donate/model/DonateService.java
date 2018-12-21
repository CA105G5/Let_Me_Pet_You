package com.donate.model;

import java.sql.Timestamp;
import java.util.List;

public class DonateService {

	private DonateDAO_interface dao;

	public DonateService() {
		dao = new DonateJDBCDAO();
	}

	public DonateVO addDonate(String memb_id, String bank_id, Integer donate_amount, Timestamp donate_date, Integer donate_coin,
							  String donate_private, String donate_src, String donate_src_cre, String donate_src_trn, String donate_status) {

		DonateVO donateVO = new DonateVO();

		donateVO.setMemb_id(memb_id);
		donateVO.setBank_id(bank_id);
		donateVO.setDonate_amount(donate_amount);
		donateVO.setDonate_date(donate_date);
		donateVO.setDonate_coin(donate_coin);
		donateVO.setDonate_private(donate_private);
		donateVO.setDonate_src(donate_src);
		donateVO.setDonate_src_cre(donate_src_cre);
		donateVO.setDonate_src_trn(donate_src_trn);
		donateVO.setDonate_status(donate_status);
		dao.insert(donateVO);

		return donateVO;
	}

	public void addDonate(DonateVO donateVO) {
		dao.insert(donateVO);
	}
	
	public DonateVO updateDonate(String donate_id, String memb_id, String bank_id, Integer donate_amount, Timestamp donate_date, Integer donate_coin,
			  String donate_private, String donate_src, String donate_src_cre, String donate_src_trn, String donate_status) {

		DonateVO donateVO = new DonateVO();

		donateVO.setDonate_id(donate_id);
		donateVO.setMemb_id(memb_id);
		donateVO.setBank_id(bank_id);
		donateVO.setDonate_amount(donate_amount);
		donateVO.setDonate_date(donate_date);
		donateVO.setDonate_coin(donate_coin);
		donateVO.setDonate_private(donate_private);
		donateVO.setDonate_src(donate_src);
		donateVO.setDonate_src_cre(donate_src_cre);
		donateVO.setDonate_src_trn(donate_src_trn);
		donateVO.setDonate_status(donate_status);
		dao.update(donateVO);
		
		return donateVO;
	}

	public void deleteDonate(String donate_id) {
		dao.delete(donate_id);
	}

	public DonateVO getOneDonate(String donate_id) {
		return dao.findByPrimaryKey(donate_id);
	}

	public List<DonateVO> getAll() {
		return dao.getAll();
	}
}
