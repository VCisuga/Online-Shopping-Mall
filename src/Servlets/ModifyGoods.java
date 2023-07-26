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
		SmartUpload su=new SmartUpload();  //�����µ��ϴ�����
		long maxsize=200*1024; //����ÿ���ϴ��ļ����Ϊ200KB
		HttpSession session = request.getSession();
//		PrintWriter out = response.getWriter();
		try{
			su.initialize(this.getServletConfig(), request, response); //��ʼ��
		    su.setMaxFileSize(maxsize); //�����ϴ��ļ��Ĵ�С
		    su.setAllowedFilesList("jpg,JPG,gif,GIF"); //�趨�����ϴ��ĸ�ʽ
		    su.upload(); //�ϴ��ļ�
		    
		    Request req=su.getRequest(); //����Request����
			String cid=req.getParameter("cid");
			String cname=req.getParameter("cname");
			String number=req.getParameter("cnumber");
			String price=req.getParameter("cprice");
			String cintro=req.getParameter("cintro");
			//��ʽת��
			int cnumber=Integer.parseInt(number);
			float cprice=Float.parseFloat(price);
			//��ȡ�ϴ����ļ�����Ϊֻ�ϴ���һ���ļ������Կ�ֱ�ӻ�ȡ
		    com.jspsmart.upload.File myfile=su.getFiles().getFile(0);
			ext=myfile.getFileExt();  //ȡ����չ��
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
					//���ļ����浽ָ��Ŀ¼��
//				myfile.saveAs(saveurl, SmartUpload.SAVE_PHYSICAL); 
				info="�޸ĳɹ���";
				forward="showGoods.jsp";
			}else{
				info="�޸�ʧ�ܣ�";
				forward="modifyGoods.jsp";
			}
		}
		catch(Exception e){
			e.printStackTrace();
			info="�޸��쳣��";
			forward="modifyGoods.jsp";
		}
	//	jspҳ��ı�������Ϊ��gb2312���������ĵĵط����ǻ��������
	//	response.sendRedirect������ִ�����
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
