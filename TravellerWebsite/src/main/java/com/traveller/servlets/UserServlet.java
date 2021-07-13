package com.traveller.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.traveller.dao.UserDao;
import com.traveller.pojo.Message;
import com.traveller.pojo.User;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String email = request.getParameter("email");
		String contact = request.getParameter("contact");
		String password = request.getParameter("password");

		User uadd = new User(fname, lname, email, contact, password);
		UserDao ud = new UserDao();
		boolean b = ud.addUser(uadd);
		if (b) {
			Message m = new Message("Registered Successfully", "success", "alert-success");
			HttpSession session = request.getSession();
			session.setAttribute("msg", m);
			response.sendRedirect("login.jsp");
		} else {
			Message m = new Message("Email already exists...Try again", "error", "alert-danger");
			HttpSession session = request.getSession();
			session.setAttribute("msg", m);
			response.sendRedirect("register.jsp");

		}
	}

}
