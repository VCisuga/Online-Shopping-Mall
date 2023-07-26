package Servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Bean.DB;
import Bean.Tools;

public class ModifyOrder extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ModifyOrder() {
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

		//获取表单提交过来的数据
			PrintWriter out = response.getWriter();
			String orderid=request.getParameter("orderid");
			String receivename=Tools.CodeToString(request.getParameter("receivename"));
			String tele=request.getParameter("tele");
			String address=Tools.CodeToString(request.getParameter("address"));
			String zipcode=request.getParameter("zipcode");
			String paymode=Tools.CodeToString(request.getParameter("paymode"));
			
			HttpSession session = request.getSession();
			
			DB db = new DB();
			StringBuffer newsql=new StringBuffer();
			newsql.append("update ordertable set receivename='");
			newsql.append(receivename);
			newsql.append("',tele='");
			newsql.append(tele);
			newsql.append("',address='");
			newsql.append(address);
			newsql.append("',zipcode='");
			newsql.append(zipcode);
			newsql.append("',paymode='");
			newsql.append(paymode);
			newsql.append("'  where orderid=");
			newsql.append(orderid);
			boolean i=db.executeUpdate(newsql.toString());

			out.println(i);
			if(i){
				// session存储修改成功的语句
				session.setAttribute("mseeage", "订单" + orderid + "的收货信息修改成功！请核对");
			}else{
				// session存储修改失败的语句
				session.setAttribute("mseeage", "修改失败！");
			}				
			// 跳转页面
			response.sendRedirect("showmyorder.jsp");
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
	}

}
