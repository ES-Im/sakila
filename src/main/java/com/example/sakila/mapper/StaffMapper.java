package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Staff;

@Mapper
public interface StaffMapper {
	// /off/login.jsp
	Staff login(Staff staff);
	
	// /on/staffOne.jsp
	Map<String, Object> selectStaffOne(int staffId);
	
	// /on/insertStaff
	int insertStaff(Staff staff);
	
	// /on/staffList
	List<Staff> selectStaffList(Map<String, Object> map);
	
	// for /getLastPage
	int selectStaffCount();
	
	// this query can modify column individually  
	int updateStaff(Staff staff);
	
}
