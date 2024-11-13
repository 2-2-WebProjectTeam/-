<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>
<jsp:setProperty name="user" property="userName"/>
<jsp:setProperty name="user" property="userPhoneNumber"/>
<jsp:setProperty name="user" property="userBirthday"/>
<jsp:setProperty name="user" property="userGender"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 처리</title>
</head>
<body>
	<%
		// 출력 스트림 설정
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter script = response.getWriter();
			
		if(user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null ||
		user.getUserBirthday() == null || user.getUserGender() == null || user.getUserPhoneNumber() == null)
		{
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다');");
			script.println("history.back();");
			script.println("</script>");
			
		}
		else
		{
			UserDAO userDAO = new UserDAO();
			int result = userDAO.join(user);

			if(result == -1) {
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디 입니다');");
				script.println("history.back();");
				script.println("</script>");
			} else if(result == 0) {
				script.println("<script>");
				script.println("alert('회원가입이 완료되었습니다');");
				script.println("history.back();");
				script.println("</script>");
			}
		}
		script.close();
	%>
</body>
</html>
