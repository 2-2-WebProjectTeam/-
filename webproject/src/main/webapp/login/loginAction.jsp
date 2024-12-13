<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인 처리</title>
</head>
<body>
	<%
	
		String userID = null;
		if(session.getAttribute("userID") != null)
		{
			userID = (String) session.getAttribute("userID");
		}
	
		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(user.getUserID(), user.getUserPassword());

		// 출력 스트림 설정
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter script = response.getWriter();

		if(result == 1) {
			session.setAttribute("userID", user.getUserID());
			session.setMaxInactiveInterval(1800);
			script.println("<script>");
			script.println("alert('로그인 성공');");
			script.println("window.location.href='" + request.getContextPath() + "/mypage/mypage.jsp';");
			script.println("</script>");
		} else if(result == 0) {
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다');");
			script.println("history.back();");
			script.println("</script>");
		} else if(result == -1) {
			script.println("<script>");
			script.println("alert('아이디가 존재하지 않습니다');");
			script.println("history.back();");
			script.println("</script>");
		} else if(result == -2) {
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생했습니다');");
			script.println("history.back();");
			script.println("</script>");
		}
		script.close();
	%>
</body>
</html>
