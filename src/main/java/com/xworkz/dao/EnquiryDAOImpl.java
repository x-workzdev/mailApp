package com.xworkz.dao;



import java.util.Objects;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.xworkz.entity.EnquiryEntity;
import lombok.Setter;

@Setter
@Repository
public class EnquiryDAOImpl implements EnquiryDAO {

	private static final Logger logger = LoggerFactory.getLogger(EnquiryDAOImpl.class);

	@Autowired
	private SessionFactory factory;

	public EnquiryDAOImpl() {
		logger.info("created " + this.getClass().getSimpleName());
	}
	
	@Override
	public boolean saveEnquiry(EnquiryEntity entity) {
		logger.info("invoked saveUser()...");
		Session session = factory.openSession();
		try {
			if (Objects.nonNull(session)) {
				session.beginTransaction();
				logger.info("transcation stared..");
				session.save(entity);
				session.getTransaction().commit();
				logger.info("Transaction commited");
				logger.info("Entity is not null , the entity is saved");
				return true;
			}
			else {
				logger.info("not able to create Session");
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
			logger.error(e.getMessage(), e);
			throw e;
		}

		finally {
			if (Objects.nonNull(session)) {
				session.close();
				logger.info("session closed");
			}
		}
	}

}
