package com.prodimg.model;

import java.util.List;

public interface ProdImgDAO_interface {
	public void insert(ProdImgVO prodImgVO);
	public void update(ProdImgVO prodImgVO);
	public void delete(String prod_img_id);
	public List<ProdImgVO> findByPrimaryKey(String prod_id);
	public ProdImgVO findByPrimaryKey2(String prod_img_id);
	public List<ProdImgVO> getAll();
	// 萬用複合查詢(傳入參數型態Map)(回傳 List)
//  public List<ProdImgVO> getAll(Map<String, String[]> map); 
}
