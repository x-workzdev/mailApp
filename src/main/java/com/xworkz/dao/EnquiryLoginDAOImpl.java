package com.xworkz.dao;

import java.util.Objects;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.xworkz.entity.LoginEntity;
import lombok.Setter;

@Setter
@Repository
public class EnquiryLoginDAOImpl implements EnquiryLoginDAO {

	private Logger logger = LoggerFactory.getLogger(EnquiryLoginDAOImpl.class);

	@Autowired
	private SessionFactory factory;

	public EnquiryLoginDAOImpl() {
		logger.info("created " + this.getClass().getSimpleName());
	}
	
	@Override
	public LoginEntity fecthByUserName(String email) {
		Session session = factory.openSession();

		try {
			Query query = session.getNamedQuery("userCheck");
			query.setParameter("user", email);
			Object result = query.uniqueResult();
			
			if (Objects.nonNull(result)) {
				logger.info("entity found for =" + email);

				LoginEntity entity = (LoginEntity) result;
				return entity;
			}

			else {
				logger.info("entity not found for =" + email);
				logger.info("emailID is wrong!");
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
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

	@Override
	public boolean upadtePassByEmail(String newRandomPassword, String userName) {
		logger.info("invoked upadtePassByEmail()");
		Session session = factory.openSession();
		try {
			session.beginTransaction();
			Query query = session.getNamedQuery("updatePassByEmail");
			query.setParameter("user", userName);
			query.setParameter("pass", newRandomPassword);

			Object result = query.executeUpdate();
			if (Objects.nonNull(result)) {
			logger.info("entity available=" + userName);
			session.getTransaction().commit();
			logger.info("Transaction commited.");
			logger.info("EMAIL=" + userName + " ,AND UPDATED PASSWORD=" + newRandomPassword);
            return true;
			} 
			else {
				logger.info("entity not available=" + userName);
				return false;
			}

		}

		catch (Exception e) {	
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
