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

import com.traveller.dao.PostDao;
import com.traveller.helper.Photo;
import com.traveller.pojo.Message;
import com.traveller.pojo.Posts;
import com.traveller.pojo.User;

/**
 * Servlet implementation class AddPostServlet
 */
@WebServlet("/AddPostServlet")
@MultipartConfig
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddPostServlet() {
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
		User u = (User) session.getAttribute("currentUser");

		int cid = Integer.parseInt(request.getParameter("cid"));
		System.out.println("cid");
		String pTitle = request.getParameter("pTitle");
		String pLocation = request.getParameter("pLocation");
		String pDesc = request.getParameter("pDesc");
		int uid = u.getId();

		Part part = request.getPart("pPic");
		String pPic = part.getSubmittedFileName();

		if (pPic.equals("")) {
			pPic = "defaultBlogPic.jpg";

		}

		Posts p = new Posts(pTitle, pDesc, pPic, cid, uid, pLocation);
		System.out.println(p);
		PostDao pd = new PostDao();
		boolean b = pd.addPost(p);
		if (b) {

			String path = request.getRealPath("/") + "asset" + File.separator + "blogPic" + File.separator
					+ p.getpPic();
			System.out.println(path);

			boolean bb = Photo.SaveFile(part.getInputStream(), path);
			if (bb) {
				System.out.println("Photo Updated");
			}
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			response.sendRedirect("profile.jsp");
		} else {
			Message m = new Message("Something went wrong...", "error", "alert-danger");
			session.setAttribute("msg", m);
			response.sendRedirect("profile.jsp");

		}
	}

}
