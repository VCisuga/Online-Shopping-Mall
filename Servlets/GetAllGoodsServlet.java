package Servlets;

import java.util.ArrayList;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.GoodsBean;

public class GetAllGoodsServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public GetAllGoodsServlet() {
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


		response.setContentType("text/html;charset=gbk");
		PrintWriter out = response.getWriter();
		String forward="";
		try{
			//第一步：获取用户提交的页码信息
			int pageNo=1;
			String strPageNo=request.getParameter("pageNo");
			int num = Integer.parseInt(strPageNo);
//			if(strPageNo!=null){
//				pageNo=Integer.parseInt(strPageNo);
//			}
			if(num>=1){
				pageNo=Integer.parseInt(strPageNo);
			}else{
				pageNo=1;
			}
			//第二步：调用GoodsBean
			GoodsBean g=new GoodsBean();
			ArrayList goodslist=new ArrayList();
			goodslist=g.getGoodsByPage(pageNo);
			int pageCount=g.getPageCount();
			request.setAttribute("goodslist",goodslist);
			request.setAttribute("pageNo",pageNo);
			request.setAttribute("pageCount",pageCount);	
						
		}catch(Exception e){
			e.printStackTrace();
		}
		forward="getAllGoods.jsp";
		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);
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

		doGet(request,response);
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
