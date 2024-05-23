package in.mySite.neeraj.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;

import in.mySite.neeraj.bo.StudentBO;
import in.mySite.neeraj.util.Utility;

public class StudentDAOImpl implements IStudentDAO {

	@SuppressWarnings("unchecked")
	@Override
	public List<StudentBO> getRows(Integer startPosition, Integer totalRow) {
		Session session = null;
		List<StudentBO> listOfStudent = null;

		try {
			session = Utility.getSession();
			Query<StudentBO> namedQuery = session.getNamedQuery("SELECT_ENTITY_QUERY");

			namedQuery.setFirstResult(startPosition);
			namedQuery.setMaxResults(totalRow);

			listOfStudent = namedQuery.getResultList();

		} catch (HibernateException he) {
			he.printStackTrace();
			System.out.println("Hibernate Exception at StudentDAOImpl.getRows()");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Exception at StudentDAOImpl.getRows()");
		} finally {

			if (session != null) {
				session.close();
			}
		}

		return listOfStudent;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Long totalRows() {
		Long totalRows = 0L;
		Session session = null;

		try {
			session = Utility.getSession();
			Query<Long> namedQuery = session.getNamedQuery("TOTAL_ROWS");

			List<Long> resultList = namedQuery.getResultList();
			totalRows = resultList.get(0);
		} catch (HibernateException he) {
			he.printStackTrace();
			System.out.println("Hibernate Exception at StudentDAOImpl.totalRows()");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Exception at StudentDAOImpl.totalRows()");
		} finally {

			if (session != null) {
				session.close();
			}
		}

		return totalRows;
	}

}
