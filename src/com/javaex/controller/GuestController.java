package com.javaex.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javaex.dao.GuestDao;
import com.javaex.util.WebUtil;
import com.javaex.vo.GuestVo;

@WebServlet("/pbc")
public class GuestController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("controller");

		String action = request.getParameter("action");

		// 리스트
		if ("addList".equals(action)) {
			System.out.println("addList");

			GuestDao dao = new GuestDao();
			List<GuestVo> gList = dao.getBookList();

			// 데이터 리퀘스트에 추가
			request.setAttribute("guestList", gList);
			
			// forword
			WebUtil.forword(request, response, "/WEB-INF/addList.jsp");
		}
		
		// 등록
		else if("add".equals(action)) {
			System.out.println("add");
			
			request.setCharacterEncoding("UTF-8");

			GuestDao dao = new GuestDao();
			
			String name = request.getParameter("name");
			String pw = request.getParameter("pw");
			String content = request.getParameter("content");
			
			GuestVo vo = new GuestVo(name, pw, content);
			dao.bookInsert(vo);

			// 리다이렉트
			WebUtil.redirect(request, response, "/gb02/pbc?action=addList");
		}
		
		// 삭제폼
		else if("deleteForm".equals(action)) {
			System.out.println("deleteForm");

			// forword
			WebUtil.forword(request, response, "/WEB-INF/deleteForm.jsp");
		}
		
		else if("delete".equals(action)) {
			System.out.println("delete");
			int no = Integer.parseInt(request.getParameter("no"));
			String pw = request.getParameter("pw");
			
			GuestDao bookDao = new GuestDao();
			bookDao.bookDelete(no, pw);

			// 리다이렉트
			WebUtil.redirect(request, response, "/gb02/pbc?action=addList");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
