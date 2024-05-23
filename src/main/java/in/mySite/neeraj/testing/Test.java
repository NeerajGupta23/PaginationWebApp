package in.mySite.neeraj.testing;

import in.mySite.neeraj.factory.StudentDAOFactory;
import in.mySite.neeraj.util.Utility;

public class Test {
	public static void main(String[] args) {
		System.out.println(Utility.getSession());
		System.out.println();
		
		System.out.println(StudentDAOFactory.getStudentDAO().getRows(8, 12));
		System.out.println();
		
		System.out.println(StudentDAOFactory.getStudentDAO().totalRows());
	}
}
