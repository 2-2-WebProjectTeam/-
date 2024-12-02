<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="errand.Errand" %>
<%@ page import="errand.errandDAO" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
    String userID = request.getParameter("userID");
    int errandID = Integer.parseInt(request.getParameter("errandID"));
    
    errandDAO ErrandDAO = new errandDAO();
    int result = ErrandDAO.addApplyID(errandID, userID);
    if(result == -1) {
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('신청하기 실패')");
		script.println("history.back();");
		script.println("</script>");
	}else {
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("location.href='" + request.getContextPath() + "/main.jsp';");
		script.println("</script>");
	}
	%>
</body>
</html>