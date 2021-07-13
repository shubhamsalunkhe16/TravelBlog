package com.traveller.servlets;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.traveller.dao.UserDao;
import com.traveller.helper.Photo;
import com.traveller.pojo.Message;
import com.traveller.pojo.User;

/**
 * Servlet implementation class EditServlet
 */
@WebServlet("/EditServlet")
@MultipartConfig
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditServlet() {
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		User uUpdate = (User) session.getAttribute("currentUser");

		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String email = request.getParameter("email");
		String contact = request.getParameter("contact");
		String password = request.getParameter("password");
		Part part = request.getPart("profile");
		String profile = part.getSubmittedFileName();

		System.out.println("profile :" + profile);
		if (profile.equals("")) {
			profile = uUpdate.getProfile();
			System.out.println(profile);
		}

		uUpdate.setFname(fname);
		uUpdate.setLname(lname);
		uUpdate.setEmail(email);
		uUpdate.setContact(contact);
		uUpdate.setPassword(password);

		String oldFile = uUpdate.getProfile();
		System.out.println("old pic: " + oldFile);

		uUpdate.setProfile(profile);

		UserDao ud = new UserDao();
		boolean b = ud.updateUser(uUpdate);
		if (b) {

			String path = request.getRealPath("/") + "asset" + File.separator + "profilePic" + File.separator
					+ uUpdate.getProfile();

			System.out.println("new pic: " + uUpdate.getProfile());

			String oldFilePath = request.getRealPath("/") + "asset" + File.separator + "profilePic" + File.separator
					+ oldFile;

			if (!oldFile.equals("default.png")) {
				System.out.println("file deleted" + oldFilePath);
				Photo.deleteFile(oldFilePath);

			}

			boolean bb = Photo.SaveFile(part.getInputStream(), path);
			if (bb) {
				System.out.println("Photo Updated");
			}

			Message m = new Message("Updated Successfully", "success", "alert-success");

			session.setAttribute("msg", m);
			response.sendRedirect("profile.jsp");
		} else {
			Message m = new Message("Something went wrong...", "error", "alert-danger");

			session.setAttribute("msg", m);
			response.sendRedirect("profile.jsp");
		}

	}
}
