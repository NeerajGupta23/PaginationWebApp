package in.mySite.neeraj.service;

import java.util.ArrayList;
import java.util.List;

import in.mySite.neeraj.bo.StudentBO;
import in.mySite.neeraj.dao.IStudentDAO;
import in.mySite.neeraj.dto.StudentDTO;
import in.mySite.neeraj.factory.StudentDAOFactory;

public class StudentServiceImpl implements IStudentService {

	@Override
	public List<StudentDTO> getRows(Integer startPosition, Integer totalRow) {
		IStudentDAO studentDAO = StudentDAOFactory.getStudentDAO();
		List<StudentBO> rows = studentDAO.getRows(startPosition, totalRow);

		return convertToStudentDTO(rows);
	}

	private List<StudentDTO> convertToStudentDTO(List<StudentBO> rows) {
		List<StudentDTO> dtoRows = new ArrayList<>();

		rows.forEach(boRow -> {
			StudentDTO dto = new StudentDTO();
			dto.setSid(boRow.getSid());
			dto.setSname(boRow.getSname());

			dto.setSage(boRow.getSage());
			dto.setSaddress(boRow.getSaddress());

			dto.setStatus(boRow.getStatus());
			dtoRows.add(dto);
		});

		return dtoRows;
	}

	@Override
	public Long totalRows() {
		return StudentDAOFactory.getStudentDAO().totalRows();
	}

}
