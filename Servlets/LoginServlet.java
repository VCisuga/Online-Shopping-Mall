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

public class LoginServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public LoginServlet() {
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
		//��ȡrequest��Ϣ
		String username = Tools.CodeToString(request.getParameter("username"));
		String userpass = request.getParameter("userpass");
		String identity = request.getParameter("identity");
		//���Խ������ݿ����ӵı�Ҫ��Ϣ
		String url = "jdbc:mysql://localhost:3306/class";
		String user = "root";
		String password = "";
		String sql = "select * from user where username='" + username + "'and userpass='" + userpass + "'"; //ʡ�Ժű�ʾҪ��������sql���
		//������������
		Connection conn = null; //�������ݿ����ӵĶ���
		Statement stmt = null; //��������ִ��SQL����Statement����
		ResultSet rs = null; //�������������
		HttpSession session = request.getSession();
		try{
			//�������Ӳ�ִ�����
			conn = DriverManager.getConnection(url, user, password);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			//��������
			if(rs.next()){
				//session�洢��¼�ɹ������
				session.setAttribute("mseeage", username + "��¼�ɹ���");
				session.setAttribute("id", rs.getString(1));
				session.setAttribute("username", username);
				session.setAttribute("identity", identity);
				// ��תҳ��
				response.sendRedirect("userinfo.jsp");
			}else{
				//session�洢��¼ʧ�ܵ����
				session.setAttribute("mseeage", "��¼ʧ�ܣ������µ�¼��");
				// ��תҳ��
				response.sendRedirect("check.jsp");
			}
		}catch(SQLException se){
			throw new ServletException(se);
		}finally{
			try{rs.close();}catch(SQLException se){}
			try{stmt.close();}catch(SQLException se){}
			try{conn.close();}catch(SQLException se){}
		}

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
			throw new ServletException("�������ݿ�����ʧ��");
		}

	}

}
