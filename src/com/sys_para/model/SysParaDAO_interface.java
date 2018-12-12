package com.sys_para.model;

import java.util.List;

public interface SysParaDAO_interface {
	public void insert(SysParaVO sysparaVO);
	public void update(SysParaVO sysparaVO);
	public void delete(String sys_name);
	public SysParaVO findByPrimaryKey(String sys_name);
	public List<SysParaVO> getAll();
}
