<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="errand.errandDAO" %>
<%@ page import="errand.Errand" %>
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>
<%@ page import="java.io.PrintWriter" %>

<%
	int point = Integer.parseInt(request.getParameter("point"));
	String userID = (String) session.getAttribute("userID");
	String enrollID = request.getParameter("enrollID");
	int errandID = Integer.parseInt(request.getParameter("errandID"));
	
	User user = new UserDAO().getUser(userID);
	User enroll = new UserDAO().getUser(enrollID);
	
	int userPoint = user.getUserPoint() + point;
	int enrollPoint = enroll.getUserPoint() - point;
	
	UserDAO userDAO = new UserDAO();
    int resultUser = userDAO.addpoint(userPoint, userID);
    int resultErrand = userDAO.addpoint(enrollPoint, enrollID);
    
    if(resultUser == -1 || resultErrand == -1)
    {
    	PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('데이터베이스 오류')");
		script.println("history.back();");
		script.println("</script>");
    }
    else {
    	errandDAO ErrandDAO = new errandDAO();
    	int result = ErrandDAO.delete(errandID);
    	PrintWriter script=response.getWriter();
    	script.println("<script>");
		script.println("alert('심부름이 완료 되었습니다')");
		script.println("location.href='mypage.jsp';");
		script.println("</script>");
    }
%>
