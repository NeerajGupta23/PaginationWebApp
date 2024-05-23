package in.mySite.neeraj.controller;

import java.util.List;

import in.mySite.neeraj.vo.StudentVO;

public interface IStudentController {
	public List<StudentVO> getRows(Integer startPosition, Integer totalRow);
	public Long totalRows();
}
