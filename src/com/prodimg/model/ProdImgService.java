package com.prodimg.model;

import java.sql.Timestamp;
import java.util.List;

public class ProdImgService {

	private ProdImgDAO_interface dao;

	public ProdImgService() {
		dao = new ProdImgJDBCDAO();
	}

	public ProdImgVO addProdImg(String prod_id, byte[] prod_img) {

		ProdImgVO prodImgVO = new ProdImgVO();

		prodImgVO.setProd_id(prod_id);
		prodImgVO.setProd_img(prod_img);
		dao.insert(prodImgVO);

		return prodImgVO;
	}

	public ProdImgVO updateProdImg(String prod_img_id, String prod_id, byte[] prod_img) {

		ProdImgVO prodImgVO = new ProdImgVO();

		prodImgVO.setProd_img_id(prod_img_id);
		prodImgVO.setProd_id(prod_id);
		prodImgVO.setProd_img(prod_img);
		dao.insert(prodImgVO);

		return prodImgVO;
	}

	public void deleteProdImg(String prod_img_id) {
		dao.delete(prod_img_id);
	}

	public List<ProdImgVO> getOneProdImg(String prod_id) {
		return dao.findByPrimaryKey(prod_id);
	}
	
	public ProdImgVO getOneProdImg1(String prod_id) {
		return dao.findByPrimaryKey1(prod_id);
	}
	
	public ProdImgVO getOneProdImg2(String prod_img_id) {
		return dao.findByPrimaryKey2(prod_img_id);
	}

	public List<ProdImgVO> getAll() {
		return dao.getAll();
	}
}
