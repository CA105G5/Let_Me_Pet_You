package com.AdoptMsg.model;

import java.util.*;

public interface AdoptMsgDAO_Interface {
	public void insert(AdoptMsgVO adoptMsgVO);
	public void update(AdoptMsgVO adoptMsgVO);
	public void delete(String adopt_msg_id);
	public AdoptMsgVO findByPrimaryKey(String adopt_msg_id);
	public List<AdoptMsgVO> getAll();
}
