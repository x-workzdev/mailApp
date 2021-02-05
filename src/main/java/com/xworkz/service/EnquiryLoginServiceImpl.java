package com.xworkz.service;

import java.util.Objects;

import org.apache.commons.lang3.RandomStringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.thymeleaf.context.Context;
import org.thymeleaf.spring5.SpringTemplateEngine;

import com.xworkz.dao.EnquiryLoginDAO;
import com.xworkz.dto.LoginDTO;
import com.xworkz.entity.LoginEntity;

import lombok.Setter;

@Setter
@Service
@EnableWebMvc
public class EnquiryLoginServiceImpl implements EnquiryLoginService {

	private Logger logger = LoggerFactory.getLogger(EnquiryLoginServiceImpl.class);

	@Autowired
	EnquiryLoginDAO enuiryDAO;

	@Autowired
	private SpringMailService emailService;

	@Autowired
	private SpringTemplateEngine templateEngine;

	@Value("${passResetMailSubject}")
	private String passResetMailSubject;
	@Value("${mailFrom}")
	private String mailFrom;
	@Value("${ccmailID}")
	private String[] ccmailID;

	@Override
	public String validateLogin(LoginDTO loginDTO, Model model) {
		logger.info("invoked validateAndLogin...");

		String givenUser = loginDTO.getUserName();
		logger.info("givenUser=" + givenUser);

		String givenPassword = loginDTO.getPassword();
		logger.info("givenPassword=" + givenPassword);
		try {
			LoginEntity entity = new LoginEntity();
			BeanUtils.copyProperties(loginDTO, entity);
			logger.info("ready to fecth....");
			LoginEntity originalData = enuiryDAO.fecthByUserName(givenUser);
			logger.info("orginal data =" + originalData);
			String originalPassword = originalData.getPassword();
			logger.info("original password=" + originalPassword);

			if (Objects.nonNull(originalData)) {
				if (originalPassword.equals(loginDTO.getPassword())) {
					return "loginSuccess";
				} else {
					return "loginfaild";
				}
			} else {
				logger.info("Data is not available for givin userNameSSSS");
			}

		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage(), e);
			throw e;
		}
		return null;
	}

	@Override
	public boolean validateAndResetPassword(LoginDTO loginDTO) {
		logger.info("invoked validateAndResetPassword...");

		String enterdUserName = loginDTO.getUserName();
		logger.info("Enterd Email=" + enterdUserName);
		try {
			LoginDTO entity = new LoginDTO();
			BeanUtils.copyProperties(loginDTO, entity);
			logger.info("ready to fecth....");
			LoginEntity originalData = enuiryDAO.fecthByUserName(entity.getUserName());

			if (Objects.isNull(originalData)) {
				logger.info("Password Reset Faild! , Email Does Not Exicit {}",enterdUserName);
				return false;
			    } 
			else {
				logger.info("orginal data =" + originalData);
				String userName = originalData.getUserName();
				logger.info("user Name=" + userName);

				//String oldPassword = originalData.getPassword();
				//logger.info("Old Password=" + oldPassword);

				String newRandomPassword = RandomStringUtils.randomAlphabetic(8);
				entity.setPassword(newRandomPassword);
				//logger.info("New Password is : {}", newRandomPassword);

				if (Objects.nonNull(newRandomPassword)) {
					boolean isUpdated = enuiryDAO.upadtePassByEmail(newRandomPassword, userName);

					if (Objects.nonNull(isUpdated)) {
						logger.info("Password updated in data");
						Context context = new Context();
						context.setVariable("newRandomPassword", newRandomPassword);
						context.setVariable("userName", userName);

						String content = templateEngine.process("resetPasswordTemplate", context);
						MimeMessagePreparator messagePreparator = mimeMessage -> {

							MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage);
							messageHelper.setFrom(mailFrom);
							//messageHelper.setCc(ccmailID);
							messageHelper.setTo(userName);
							messageHelper.setSubject(passResetMailSubject);
							messageHelper.setText(content, true);

						};

						if (Objects.nonNull(messagePreparator)) {
							boolean isMailSent = emailService.validateAndSendMailByMailId(messagePreparator);
							if (isMailSent) {
								logger.info("Password successfuly sent to MailID {}", userName);
								return true;
							} else {
								logger.info("Password Not able to sent to Mail {}", userName);
							}
						} else {
							logger.info("Password Not able to sent to Mail {}", userName);
						}
					}
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage(), e);
			throw e;
		}
		return false;
	}

}
