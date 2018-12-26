package com.missingMsg.model;

import java.util.List;

public interface missingMsgDAO_interface {
	   public void insert(missingMsgVO missingMsgVO);
	    public void update(missingMsgVO missingMsgVO);
	    public void delete(String missing_msg_id);
	    public missingMsgVO findByCase(String missing_case_id);
	    public List<missingMsgVO> getAll();
}
