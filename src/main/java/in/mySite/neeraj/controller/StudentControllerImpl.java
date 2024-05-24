package in.mySite.neeraj.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import in.mySite.neeraj.dto.StudentDTO;
import in.mySite.neeraj.factory.StudentServiceFactory;
import in.mySite.neeraj.service.IStudentService;
import in.mySite.neeraj.vo.StudentVO;

@WebServlet("/pagination/*")
public class StudentControllerImpl extends HttpServlet implements IStudentController {

	private static final long serialVersionUID = 1L;

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String location = requestURI.substring(requestURI.lastIndexOf("/") + 1);
		String forwardLocation = "/pagination.jsp";

		switch (location) {
		case "first": {
			firstRequest(request, response, forwardLocation);
			break;
		}
		case "second": {
			secondRequest(request, response);
			break;
		}
		default:
			throw new IllegalArgumentException("Unexpected value: " + location);
		}

		RequestDispatcher rd = request.getRequestDispatcher(forwardLocation);
		rd.forward(request, response);
	}

	private void secondRequest(HttpServletRequest request, HttpServletResponse response) {
		Integer currPageNo = Integer.parseInt(request.getParameter("currPageNo"));
		System.out.println(currPageNo);

		HttpSession session = request.getSession();
		Integer totalPages = (Integer) session.getAttribute("totalPages");

		if (currPageNo < 0) {
			currPageNo = 0;
		} else if (currPageNo >= totalPages) {
			currPageNo = totalPages - 1;
		}

		Integer pageSize = (Integer) session.getAttribute("pageSize");
		Integer pageCount = pageSize * currPageNo;

		session.setAttribute("totalPages", totalPages);
		session.setAttribute("currPageNo", currPageNo);

		List<StudentVO> rows = getRows(pageCount, pageSize);
		session.setAttribute("studentArr", rows);
	}

	private void firstRequest(HttpServletRequest request, HttpServletResponse response, String forwardLocation) {
		Integer pageSize = Integer.parseInt(request.getParameter("pageSize"));

		if (pageSize <= 0) {
			pageSize = 1;
		}

		Integer pageCount = 0;
		Integer totalPages = getTotalPages(pageSize);

		HttpSession session = request.getSession();
		session.setAttribute("pageSize", pageSize);
		session.setAttribute("pageCount", pageCount);
		session.setAttribute("totalPages", totalPages);
		session.setAttribute("currPageNo", 0);

		List<StudentVO> rows = getRows(pageCount, pageSize);
		if (rows.isEmpty()) {
			forwardLocation = "/EmptyArr.jsp";
		}

		session.setAttribute("studentArr", rows);
	}

	private Integer getTotalPages(Integer pageSize) {
		Long totalRows = totalRows();
		Integer totalPages = (int) (totalRows / pageSize);

		if (totalRows % pageSize != 0) {
			totalPages++;
		}

		return totalPages;
	}

	@Override
	public Long totalRows() {
		return StudentServiceFactory.getStudentService().totalRows();
	}

	@Override
	public List<StudentVO> getRows(Integer startPosition, Integer totalRow) {
		IStudentService studentService = StudentServiceFactory.getStudentService();
		List<StudentDTO> dtoRows = studentService.getRows(startPosition, totalRow);

		return convertToStudentVO(dtoRows);
	}

	private List<StudentVO> convertToStudentVO(List<StudentDTO> dtoRows) {
		List<StudentVO> voRows = new ArrayList<>();

		dtoRows.forEach(dtoRow -> {
			StudentVO vo = new StudentVO();
			vo.setSid(String.valueOf(dtoRow.getSid()));
			vo.setSname(dtoRow.getSname());

			vo.setSage(String.valueOf(dtoRow.getSage()));
			vo.setSaddress(dtoRow.getSaddress());
			voRows.add(vo);
		});

		return voRows;
	}
}
