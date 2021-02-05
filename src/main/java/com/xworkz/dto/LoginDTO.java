package com.xworkz.dto;

import java.io.Serializable;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LoginDTO implements Serializable {
	
	private static final long serialVersionUID = 1L;

	private Logger logger = LoggerFactory.getLogger(LoginDTO.class);
	private String userName;
	private String password;

	public LoginDTO() {
		logger.info("{} Is Created...........", this.getClass().getSimpleName());
	}
	

}
