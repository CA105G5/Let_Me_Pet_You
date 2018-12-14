package com.foundMsg.model;

import java.util.List;

public interface foundMsgDAO_interface {
	   public void insert(foundMsgVO foundMsgVO);
	    public void update(foundMsgVO foundMsgVO);
	    public void delete(String fd_msg_id);
	    public foundMsgVO findByPrimaryKey(String fd_msg_id);
	    public List<foundMsgVO> getAll();

}
