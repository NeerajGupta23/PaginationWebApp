package in.mySite.neeraj.factory;

import in.mySite.neeraj.service.IStudentService;
import in.mySite.neeraj.service.StudentServiceImpl;

public class StudentServiceFactory {
	private static IStudentService student = null;

	public static IStudentService getStudentService() {
		if (student == null) {
			student = new StudentServiceImpl();
		}

		return student;
	}
}
