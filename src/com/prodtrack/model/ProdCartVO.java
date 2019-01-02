package com.prodtrack.model;

public class ProdCartVO {
	private int id;
	private String prod_id;
	private Integer prod_qty;
	
	public ProdCartVO() {
		super();
	}

	public ProdCartVO(int id, String prod_id, Integer prod_qty) {
		super();
		this.id = id;
		this.prod_qty = prod_qty;
		this.prod_id = prod_id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getProd_id() {
		return prod_id;
	}

	public void setProd_id(String prod_id) {
		this.prod_id = prod_id;
	}

	public double getProd_qty() {
		return prod_qty;
	}

	public void setProd_qty(Integer prod_qty) {
		this.prod_qty = prod_qty;
	}
}