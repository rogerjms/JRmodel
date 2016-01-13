package com.turing.users;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.formula.ptg.TblPtg;

import com.alibaba.fastjson.JSON;

public class UserServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	private UserService userService = new UserService();
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String method = request.getParameter("method");
		
		try {
			if("register".equals(method)){
				register( request,  response);
			}else if("checkaccountno".equals(method)){
				checkaccountno( request,  response);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.getRequestDispatcher("/common/success.jsp").forward(request, response);
	}
	/**
	 * 验证账号是否重复，验证验证码输入是否正确
	 * @param request
	 * @param response
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	private void checkaccountno(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException {
		Map<String,String> dataMap = new HashMap<String, String>();
		
		String accountno = request.getParameter("accountno");
		Map<String,Object> user = userService.queryUserByAccountno(accountno);
		if (user==null) {
			dataMap.put("accountno", "true");
		} else {
			dataMap.put("accountno", "false");
		}
		String safecode = request.getParameter("safecode");
		boolean isSafecodeRight = request.getSession().getAttribute("safecode").equals(safecode)==true;
		dataMap.put("safecode", isSafecodeRight+"");
		
		String data = JSON.toJSONString(dataMap);
		request.setAttribute("data", data);
	}

	private void register(HttpServletRequest request, HttpServletResponse response) throws ClassNotFoundException, SQLException {
		// TODO 注册信息提交处理
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		
		userService.saveRegisterInfo(username,password,email);

	}

}
