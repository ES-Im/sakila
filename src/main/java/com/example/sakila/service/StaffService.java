package com.example.sakila.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.sakila.mapper.StaffMapper;
import com.example.sakila.vo.Staff;

@Service
@Transactional	 // if this Class get Exception, realated tasks are rollback. // Transaction annotation can use above method
public class StaffService {
	@Autowired StaffMapper staffMaffer;
	
	public Staff login(Staff paramStaff) {
		return staffMaffer.login(paramStaff);
	}
	
	public int modifyStaff(Staff paramstaff) {
		return staffMaffer.updateStaff(paramstaff);
	}
	
	public int addStaff(Staff paramStaff) {
		return staffMaffer.insertStaff(paramStaff);
	}
	
	public Map<String, Object> getStaffOne(int staffId) {
		return staffMaffer.selectStaffOne(staffId);
	}
	
	public List<Staff> getStaffList(Map<String, Object> map) {
		return staffMaffer.selectStaffList(map);
	}
	
	public int getLastPage(int rowPerPage) {
		int lastPage = staffMaffer.selectStaffCount() / rowPerPage;
		if(staffMaffer.selectStaffCount() % rowPerPage != 0) {
			lastPage++;
		}
		return lastPage;
	}
	

}
