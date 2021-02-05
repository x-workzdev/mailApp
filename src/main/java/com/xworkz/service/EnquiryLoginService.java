package com.xworkz.service;

import org.springframework.ui.Model;

import com.xworkz.dto.LoginDTO;

public interface EnquiryLoginService {

	public String validateLogin(LoginDTO loginDTO , Model model);
	
	public boolean validateAndResetPassword(LoginDTO loginDTO);

}
