package com.traveller.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.traveller.dao.PostDao;
import com.traveller.pojo.Posts;

/**
 * Servlet implementation class EditPostServlet
 */
@WebServlet("/EditPostServlet")
@MultipartConfig
public class EditPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditPostServlet() {
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

		int pid = Integer.parseInt(request.getParameter("pid"));
		PostDao pd = new PostDao();
		Posts pu = pd.getPostsByPid(pid);

		int cid = Integer.parseInt(request.getParameter("cid"));
		String poTitle = request.getParameter("poTitle");
		String poLocation = request.getParameter("poLocation");
		String poDesc = request.getParameter("poDesc");

		pu.setCatId(cid);
		pu.setpTitle(poTitle);
		pu.setpLocation(poLocation);
		pu.setpDesc(poDesc);

		boolean b = pd.updatePost(pu);
		if (b) {
			System.out.println("updated");
			try {
				Thread.sleep(1500);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			response.sendRedirect("myPost.jsp");
		} else {

			response.sendRedirect("myPost.jsp");
		}

	}

}
