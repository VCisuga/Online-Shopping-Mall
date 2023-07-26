package Servlets;

import Bean.*;

import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ModifyServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ModifyServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			//获取request信息
			String id = request.getParameter("id");
			String username = Tools.CodeToString(request.getParameter("username"));
			String userpass = request.getParameter("userpass");
			String gender = Tools.CodeToString(request.getParameter("gender"));
			String birthdate = request.getParameter("birthdate");
			String nativeplace = Tools.CodeToString(request.getParameter("nativeplace"));
			
			HttpSession session = request.getSession();
			
			DB db = new DB();
			StringBuffer newsql=new StringBuffer();
			newsql.append("update user set username='");
			newsql.append(username);
			newsql.append("',userpass='");
			newsql.append(userpass);
			newsql.append("',gender='");
			newsql.append(gender);
			newsql.append("',birthdate='");
			newsql.append(birthdate);
			newsql.append("',nativeplace='");
			newsql.append(nativeplace);
			newsql.append("'  where id=");
			newsql.append(id);
			boolean i=db.executeUpdate(newsql.toString());

			if(i){
				// session存储修改成功的语句
				session.setAttribute("mseeage", username + "修改成功！");
			}else{
				// session存储修改失败的语句
				session.setAttribute("mseeage", "修改失败！");
			}				
			// 跳转页面
			response.sendRedirect("userinfo.jsp");
	}
	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
		String classname="com.mysql.jdbc.Driver";
		try{
			Class.forName(classname);
		}catch(ClassNotFoundException ce){
			throw new ServletException("加载数据库驱动失败");
		}
	}

}
