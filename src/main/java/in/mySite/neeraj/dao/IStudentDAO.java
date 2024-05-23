package in.mySite.neeraj.dao;

import in.mySite.neeraj.bo.StudentBO;
import java.util.List;

public interface IStudentDAO {
	public List<StudentBO> getRows(Integer startPosition, Integer totalRow);
	public Long totalRows();
}
