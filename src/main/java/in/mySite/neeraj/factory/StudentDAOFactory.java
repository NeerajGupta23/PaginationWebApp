package in.mySite.neeraj.factory;

import in.mySite.neeraj.dao.IStudentDAO;
import in.mySite.neeraj.dao.StudentDAOImpl;

public class StudentDAOFactory {
	private static IStudentDAO student = null;

	public static IStudentDAO getStudentDAO() {
		if (student == null) {
			student = new StudentDAOImpl();
		}

		return student;
	}
}
