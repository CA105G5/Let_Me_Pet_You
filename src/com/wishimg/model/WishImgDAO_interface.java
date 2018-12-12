package com.wishimg.model;

import java.util.List;

public interface WishImgDAO_interface {
	public void insert(WishImgVO wishImgVO);
	public void update(WishImgVO wishImgVO);
	public void delete(String wish_img_id);
	public List<WishImgVO> findByPrimaryKey(String wish_img_id);
	public List<WishImgVO> getAll();
	// 萬用複合查詢(傳入參數型態Map)(回傳 List)
//  public List<WishImgVO> getAll(Map<String, String[]> map); 
}
