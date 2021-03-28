package net.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/uploadImage")
@MultipartConfig(maxFileSize = 16177216)
public class UploadImage extends HttpServlet {

	private static final long serialVersionUID = -234066577048385332L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher(getPage(request));
		dispatcher.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String connectionURL = "jdbc:mysql://localhost:3306/employees";
		String user = "root";
		String pass = "";

		int result = 0;
		Connection con = null;
		Part part = req.getPart("photo");

		if (part != null) {
			try {
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection(connectionURL, user, pass);

				PreparedStatement ps = con.prepareStatement("insert into tbl_employee (first_name,last_name,contact,photo) values(?,?,?,?)");
				ps.setString(1, req.getParameter("firstName"));
				ps.setString(2, req.getParameter("lastName"));
				ps.setString(3, req.getParameter("contact"));
				InputStream is = part.getInputStream();
				ps.setBlob(4, is);
				result = ps.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (con != null) {
					try {
						con.close();
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		}

		if (result > 0) {
			RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/result.jsp?message=Image+Uploaded");
			dispatcher.forward(req, resp);
		} else {
			RequestDispatcher dispatcher = req
					.getRequestDispatcher("/WEB-INF/views/result.jsp?message=Some+Error+Occurred");
			dispatcher.forward(req, resp);
		}
	}

	private String getPage(HttpServletRequest request) {
		String page = "/WEB-INF/views/home.jsp";
		if (request.getParameter("page") != null) {
			switch (request.getParameter("page")) {
			case "view":
				page = "/WEB-INF/views/view.jsp";
				break;
			case "home":
				page = "/WEB-INF/views/home.jsp";
				break;
			case "viewImage":
				page = "/WEB-INF/views/viewImage.jsp";
				break;
			case "getImage":
				page = "/WEB-INF/views/getImage.jsp";
				break;
			default:
				break;
			}
		}else if(request.getParameter("id")!=null) {
			page = "/WEB-INF/views/viewImage.jsp";

		}
		System.out.println(page);
		return page;
	}
}