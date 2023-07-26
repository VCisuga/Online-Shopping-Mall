package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jspsmart.upload.Request;
import com.jspsmart.upload.SmartUpload;

import Bean.*;

import java.sql.*;

public class ModifyGoods extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ModifyGoods() {
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

		String ext="", url="upload/", info = "", forward = "";
		SmartUpload su=new SmartUpload();  //创建新的上传对象
		long maxsize=200*1024; //设置每个上传文件最大为200KB
		HttpSession session = request.getSession();
//		PrintWriter out = response.getWriter();
		try{
			su.initialize(this.getServletConfig(), request, response); //初始化
		    su.setMaxFileSize(maxsize); //限制上传文件的大小
		    su.setAllowedFilesList("jpg,JPG,gif,GIF"); //设定允许上传的格式
		    su.upload(); //上传文件
		    
		    Request req=su.getRequest(); //创建Request对象
			String cid=req.getParameter("cid");
			String cname=req.getParameter("cname");
			String number=req.getParameter("cnumber");
			String price=req.getParameter("cprice");
			String cintro=req.getParameter("cintro");
			//格式转换
			int cnumber=Integer.parseInt(number);
			float cprice=Float.parseFloat(price);
			//获取上传的文件，因为只上传了一个文件，所以可直接获取
		    com.jspsmart.upload.File myfile=su.getFiles().getFile(0);
			ext=myfile.getFileExt();  //取得扩展名
			Calendar cal=Calendar.getInstance();
			String filename=String.valueOf(cal.getTimeInMillis());
			String saveurl=request.getRealPath("/")+url;
			String cimage=url+filename+"."+ext;
			DB db = new DB();
			StringBuffer newsql=new StringBuffer();
			newsql.append("update goods set cname='");
			newsql.append(cname);
			newsql.append("',cnumber='");
			newsql.append(cnumber);
			newsql.append("',cprice='");
			newsql.append(cprice);
			newsql.append("',cintro='");
			newsql.append(cintro);
//			newsql.append("',cimage='");
//			newsql.append(cimage);
			newsql.append("'  where cid='");
			newsql.append(cid);
			newsql.append("'");
			boolean i=db.executeUpdate(newsql.toString());

			if(i){
					//将文件保存到指定目录中
//				myfile.saveAs(saveurl, SmartUpload.SAVE_PHYSICAL); 
				info="修改成功！";
				forward="showGoods.jsp";
			}else{
				info="修改失败！";
				forward="modifyGoods.jsp";
			}
		}
		catch(Exception e){
			e.printStackTrace();
			info="修改异常！";
			forward="modifyGoods.jsp";
		}
	//	jsp页面的编码已设为“gb2312”，有中文的地方还是会出现乱码
	//	response.sendRedirect不会出现此问题
		session.setAttribute("info", info);
		response.sendRedirect(forward);
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
