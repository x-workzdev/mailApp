package com.xworkz.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.xworkz.dto.LoginDTO;
import com.xworkz.service.EnquiryLoginService;

@RestController
@RequestMapping("/")
public class EnquiryLoginController {
	
	private Logger logger = LoggerFactory.getLogger(EnquiryLoginController.class);
	
	@Autowired
	private EnquiryLoginService enquiryLoginService;
	
	public EnquiryLoginController() {  
	  logger.info("{} Is Created...........", this.getClass().getSimpleName());
	}
	
	@RequestMapping("/enquiryLogin.do")
	public ModelAndView enquiryLogin(LoginDTO loginDTO,Model model){
		logger.info("invoking on login...");
		
		String mailId=loginDTO.getUserName();
		logger.info("Login MailId :"+mailId);
		
		logger.info("----------------");
		
		String pwd=loginDTO.getPassword();
		logger.info("Login Password :"+pwd);
		
		try {
			String  datafmDB=this.enquiryLoginService.validateLogin(loginDTO, model);
			logger.info("Data From DB:"+datafmDB);
			
			if(datafmDB.equals("loginSuccess")) {
				logger.info("SignIn Successful");
				model.addAttribute("LoginMsg", "Login Successful "+loginDTO.getUserName());
				return new ModelAndView("Home");
			}
			else{
				logger.info("Email or Password is wrong");
				System.out.println("Email or password is wrong");
				model.addAttribute("LoginMsg", "Email or Password is Incorrect");
				return new ModelAndView("EnquiryLogin");
			}
			
		}
		catch (Exception e) {
			logger.error(e.getMessage(),e);
			throw e;
		}
	}
	
	
	@RequestMapping(value = "passReset.do", method = RequestMethod.POST)
	public ModelAndView enquiryResetPass(@ModelAttribute LoginDTO loginDTO){
		logger.info("invoked onReset()...");
       
		ModelAndView modelAndView = new ModelAndView("EnquiryPasswordReset");
		try {
		    boolean validation= enquiryLoginService.validateAndResetPassword(loginDTO);
		    if (validation) {	
		    	return modelAndView.addObject("resetedpassword","Password Reset Successfull! ,Password Sent to your MailId");
		    	
			} else {
				return modelAndView.addObject("resetfaildbyemail", "Password Reset Faild! , Email doesn't Exicit. ");
			}
			
			
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			throw e;
		}
	}
	
}
