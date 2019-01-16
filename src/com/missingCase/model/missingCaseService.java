package com.missingCase.model;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

public class missingCaseService {
	private missingCaseDAO_interface dao;

	public missingCaseService() {
		dao = new missingCaseJNDIDAO();
	}

	public missingCaseVO addMissingCase(String memb_id, Timestamp missing_date, String missing_des, String missing_name,
			String missing_loc, String missing_status_shelve, byte[] missing_photo, String missing_type) {

		missingCaseVO missingCaseVO = new missingCaseVO();

		missingCaseVO.setMemb_id(memb_id);
		missingCaseVO.setMissing_date(missing_date);
		missingCaseVO.setMissing_name(missing_name);
		missingCaseVO.setMissing_des(missing_des);
		missingCaseVO.setMissing_loc(missing_loc);
		missingCaseVO.setMissing_status_shelve(missing_status_shelve);
		missingCaseVO.setMissing_photo(missing_photo);
		missingCaseVO.setMissing_type(missing_type);
		dao.insert(missingCaseVO);

		return missingCaseVO;
	}

	public missingCaseVO updateMissingCase(String missing_case_id, String memb_id, Timestamp missing_date,
			String missing_des, String missing_name, String missing_loc, String missing_status_shelve,
			byte[] missing_photo, String missing_type) {
		missingCaseVO missingCaseVO = new missingCaseVO();
		missingCaseVO.setMissing_case_id(missing_case_id);
		missingCaseVO.setMemb_id(memb_id);
		missingCaseVO.setMissing_date(missing_date);
		missingCaseVO.setMissing_name(missing_name);
		missingCaseVO.setMissing_des(missing_des);
		missingCaseVO.setMissing_loc(missing_loc);
		missingCaseVO.setMissing_status_shelve(missing_status_shelve);
		missingCaseVO.setMissing_photo(missing_photo);
		missingCaseVO.setMissing_type(missing_type);
		dao.update(missingCaseVO);

		return missingCaseVO;

	}

	public missingCaseVO updateStatus(String missing_case_id, String missing_status_shelve) {
		missingCaseVO missingCaseVO = new missingCaseVO();
		missingCaseVO.setMissing_case_id(missing_case_id);
		missingCaseVO.setMissing_status_shelve(missing_status_shelve);
		dao.updateStatus(missingCaseVO);

		return missingCaseVO;

	}

	public void deleteMissingCase(String missing_case_id) {
		dao.delete(missing_case_id);
	}

	public missingCaseVO getOneMissingCase(String missing_case_id) {
		return dao.findByPrimaryKey(missing_case_id);
	}

	public List<missingCaseVO> getAll() {
		return dao.getAll();
	}
	public List<missingCaseVO> getAll(Map<String, String[]> map) {
		return dao.getAll(map);
	}
	
	public List<missingCaseVO> getCount(){
		return dao.getCount();
	}
}
