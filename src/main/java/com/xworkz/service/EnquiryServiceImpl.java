package com.xworkz.service;

import java.sql.Timestamp;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xworkz.dao.EnquiryDAO;
import com.xworkz.dto.EnquiryDTO;
import com.xworkz.entity.EnquiryEntity;

import lombok.Setter;

@Setter
@Service
public class EnquiryServiceImpl implements EnquiryService {

	private static final Logger logger = LoggerFactory.getLogger(EnquiryServiceImpl.class);
	
	@Autowired
	private EnquiryDAO dao;
	
	public EnquiryServiceImpl() {
		logger.info("created " + this.getClass().getSimpleName());
	}
	
	@Override
	public boolean validateAndSaveEnquiry(EnquiryDTO dto) {
		if (dto != null) {
			Date date = new Date();
			Timestamp currentTimestamp = new Timestamp(date.getTime());
	        logger.info("Timestamp:{}",currentTimestamp);
			dto.setDateTime(currentTimestamp);
			EnquiryEntity entity = new EnquiryEntity();
			BeanUtils.copyProperties(dto, entity);
			logger.info("Data are valid..ready to save");
			boolean isSaved =dao.saveEnquiry(entity);
			if (isSaved) {
				logger.info("Enquiry Saved");
				return true;
			} else {
				logger.info("Enquiry Not Saved");
				return false;
			}
		}
		else {
			logger.info("Data is null..not able to save");
		}
		return false;
	}

}
