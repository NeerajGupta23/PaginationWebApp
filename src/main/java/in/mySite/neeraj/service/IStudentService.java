package in.mySite.neeraj.service;

import java.util.List;

import in.mySite.neeraj.dto.StudentDTO;

public interface IStudentService {
	public List<StudentDTO> getRows(Integer startPosition, Integer totalRow);
	public Long totalRows();
}
