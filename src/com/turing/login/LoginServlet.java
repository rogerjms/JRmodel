package com.turing.login;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 登录验证
 * @author 刘凯
 *
 */
public class LoginServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	
	private LoginService loginService = new LoginService();

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String method = request.getParameter("method");
		
		try {
			if("login".equals(method)){
				login(request,response);
			}else if("logout".equals(method)){
				logout(request,response);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}

	private void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		session.invalidate();
		
		response.sendRedirect(request.getContextPath()+"/index.jsp");
	}

	private void login(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException, ServletException, IOException {
		// TODO 登录信息验证
		HttpSession session = request.getSession();
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		Map<String,Object> map = loginService.queryUserByNameAndPass(username,password);
		String data = "";
		if (map==null) {
			data = "false";
		} else {
			session.setAttribute("userInfo", map);
			data = "true";
		}
		request.setAttribute("data", data);
		request.getRequestDispatcher("/common/success.jsp").forward(request, response);
	}

}
