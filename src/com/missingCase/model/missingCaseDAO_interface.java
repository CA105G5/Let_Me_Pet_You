package com.missingCase.model;

import java.util.List;

public interface missingCaseDAO_interface {
    public void insert(missingCaseVO missingCaseVO);
    public void update(missingCaseVO missingCaseVO);
    public void delete(String missing_case_id);
    public missingCaseVO findByPrimaryKey(String missing_case_id);
    public List<missingCaseVO> getAll();
}
