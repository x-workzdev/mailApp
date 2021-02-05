package com.xworkz.dto;

import java.io.Serializable;
import java.sql.Timestamp;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class EnquiryDTO implements Serializable{

	private static final long serialVersionUID = 1L;

	private Logger logger = LoggerFactory.getLogger(EnquiryDTO.class);
	
	public EnquiryDTO() {
		logger.info("{} Is Created...........", this.getClass().getSimpleName());
	}
	
	private Timestamp dateTime;
	private String fullName;
	private String mobileNo;
	private String alternateMobileNo;
	private String emailId;
	private String course;
	private String batchType;
	private String source;
	private String branch;
	private String refrenceName;
	private String refrenceMobileNo;
	private String counselor;
	private String comments;
	
}
