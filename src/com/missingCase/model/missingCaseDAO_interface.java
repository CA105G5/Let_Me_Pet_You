package com.missingCase.model;

import java.util.List;
import java.util.Map;

public interface missingCaseDAO_interface {
    public void insert(missingCaseVO missingCaseVO);
    public void update(missingCaseVO missingCaseVO);
    public void delete(String missing_case_id);
    public missingCaseVO findByPrimaryKey(String missing_case_id);
    public List<missingCaseVO> getAll();
    public List<missingCaseVO> getAllBack();
    public void updateStatus(missingCaseVO missingCaseVO);
    public List<missingCaseVO> getCount();
    
    public List<missingCaseVO> getAll(Map<String, String[]> map); 
}
