package com.wishdon.model;

import java.util.List;

public interface WishDonDAO_interface {
	public void insert(WishDonVO wishDonVO);
	public void update(WishDonVO wishDonVO);
	public void delete(String wish_don_id);
	public WishDonVO findByPrimaryKey(String wish_don_id);
	public List<WishDonVO> getAll();
	// 萬用複合查詢(傳入參數型態Map)(回傳 List)
//  public List<WishDonVO> getAll(Map<String, String[]> map); 
}
