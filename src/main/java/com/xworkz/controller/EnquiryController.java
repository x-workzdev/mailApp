package com.xworkz.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.xworkz.dto.EnquiryDTO;
import com.xworkz.service.EnquiryService;

@RestController
@RequestMapping("/")
public class EnquiryController {
	
	@Autowired
	private EnquiryService enquiryService;

	private Logger logger = LoggerFactory.getLogger(EnquiryController.class);
	
	@RequestMapping(value="/newEnquiry.do", method = RequestMethod.POST)
	public ModelAndView newEnquiry(EnquiryDTO enqiryDTO , BindingResult result,Model m){
		ModelAndView modelAndView = new ModelAndView("Home");
		logger.info("invoked newEnquiry");
		logger.info("Enquiry dto={}",enqiryDTO.toString());
		
		try {
			logger.info("Enquiry Reday to save...");
			boolean validate = enquiryService.validateAndSaveEnquiry(enqiryDTO);
			if (validate) {
			logger.info("Enquiry Saved Successfuly");
			modelAndView.addObject("success", "Enquiry Saved Successfuly");
			}
			else {
			logger.info("Enquiry Not saved...Please Enter the valid Details");
			modelAndView.addObject("faild", "Enquiry Not saved...Please Enter the valid Details");	
			}
		}

		catch (Exception e) {
			logger.error(e.getMessage(), e);
			throw e;
		}
		
		return modelAndView;
		
}
}
