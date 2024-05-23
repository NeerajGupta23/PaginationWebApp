package in.mySite.neeraj.util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import in.mySite.neeraj.bo.StudentBO;

public class Utility {
	private static SessionFactory factory = null;

	static {
		factory = new Configuration().configure("in/mySite/neeraj/config/hibernate.cfg.xml")
				.addAnnotatedClass(StudentBO.class).buildSessionFactory();
	}

	public static Session getSession() {
		return factory.openSession();
	}

}
