package com.wish.model;

import java.util.List;

public interface WishDAO_interface {
	public void insert(WishVO wishVO);
	public void update(WishVO wishVO);
	public void delete(String wish_id);
	public WishVO findByPrimaryKey(String wish_id);
	public List<WishVO> getAll();
	// 萬用複合查詢(傳入參數型態Map)(回傳 List)
//  public List<WishVO> getAll(Map<String, String[]> map); 
}
