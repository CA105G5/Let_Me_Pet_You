package com.foundCase.model;

import java.util.List;

public interface foundCaseDAO_interface {
    public void insert(foundCaseVO foundCaseVO);
    public void update(foundCaseVO foundCaseVO);
    public void delete(String fd_case_id);
    public foundCaseVO findByPrimaryKey(String fd_case_id);
    public List<foundCaseVO> getAll();
}
