package com.example.sakila.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.mapper.AddressMapper;
import com.example.sakila.mapper.StaffMapper;
import com.example.sakila.mapper.StoreMapper;
import com.example.sakila.vo.Address;
import com.example.sakila.vo.Staff;
import com.example.sakila.vo.Store;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class StaffController {
	@Autowired StaffMapper staffMapper;
	@Autowired StoreMapper storeMapper;
	@Autowired AddressMapper addressMapper;
	

	@GetMapping("/on/staffOne")
	public String staffOne(HttpSession session, Model model) {
		int staffId= ((Staff) (session.getAttribute("loginStaff"))).getStaffId();
		Map<String, Object> staff = staffMapper.selectStaffOne(staffId);
		model.addAttribute("staff", staff);
		log.debug(staff.toString());
		return "on/staffOne";
	}
	
	// (1) LeftMenu - a tag, (2) addStaff.jsp - click search btn  
	@GetMapping("/on/addStaff")
	public String addStaff(Model model, @RequestParam(defaultValue ="") String searchAddress) {	// model (storeList, addressList)
		
		List<Store> storeList = storeMapper.selectStoreList(); 
		model.addAttribute("storeList", storeList);
		
		if(!searchAddress.equals("")) {
			List<Address> addressList = addressMapper.selectAddressListByWord(searchAddress);
			model.addAttribute("addressList", addressList);
			log.debug(addressList.toString());
		}
		return "on/addStaff";
	}
	
	@PostMapping("/on/addStaff")
	public String addStaff(Staff staff) {	// model (insert)
		log.debug(staff.toString());
		int checkSuccess = staffMapper.insertStaff(staff);
		log.debug("insert result = " + checkSuccess);
		if(checkSuccess == 0) {
			return "on/addStaff";
		}
		return "redirect:/on/staffList";
	}
	
	@GetMapping("/on/staffList")
	public String staffList(Model model, @RequestParam(defaultValue="1") int currentPage, @RequestParam(defaultValue = "10") int rowPerPage) {
		Map<String, Object> map = new HashMap<>();
		map.put("beginRow", (currentPage-1) * rowPerPage);
		map.put("rowPerPage", rowPerPage);
		
		List<Staff> staffList = staffMapper.selectStaffList(map);
		log.debug(staffList.toString());
		model.addAttribute("staffMap", staffList);
		model.addAttribute("currentPage", currentPage);
		int lastPage = staffMapper.selectStaffCount() / rowPerPage;
		if(staffMapper.selectStaffCount() % rowPerPage != 0) {
			lastPage++;
		}
		model.addAttribute("lastPage", lastPage);
		
		return "on/staffList";
	}
	
	@GetMapping("/on/modifyStaffActive")
	public String modifyStaffActive(Staff staff) {
		if(staff.getActive() == 1) {
			staff.setActive(2);
		} else {
			staff.setActive(1);
		}
		staffMapper.updateStaff(staff);
		return "redirect:/on/staffList";
	}
	
}
