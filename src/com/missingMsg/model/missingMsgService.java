package com.missingMsg.model;

import java.sql.Timestamp;

public class missingMsgService {
	private missingMsgDAO_interface dao;

	public missingMsgService() {
		dao = new missingMsgJNDIDAO();
	}

	public missingMsgVO addMissingMsg(String missing_case_id, String memb_id, Timestamp missing_msg_date,
			String missing_msg_cont) {

		missingMsgVO missingMsgVO = new missingMsgVO();
		missingMsgVO.setMissing_case_id(missing_case_id);
		missingMsgVO.setMemb_id(memb_id);
		missingMsgVO.setMissing_msg_date(missing_msg_date);
		missingMsgVO.setMissing_msg_cont(missing_msg_cont);
		dao.insert(missingMsgVO);

		return missingMsgVO;
	}

	public missingMsgVO updateMissingMsg(String missing_msg_id ,String missing_case_id, String memb_id, Timestamp missing_msg_date,
			String missing_msg_cont) {

		missingMsgVO missingMsgVO = new missingMsgVO();
		missingMsgVO.setMissing_case_id(missing_case_id);
		missingMsgVO.setMemb_id(memb_id);
		missingMsgVO.setMissing_msg_date(missing_msg_date);
		missingMsgVO.setMissing_msg_cont(missing_msg_cont);
		dao.update(missingMsgVO);

		return missingMsgVO;

	}

	public missingMsgVO findByCase(String missing_case_id) {
		return dao.findByCase(missing_case_id);
	}
}
