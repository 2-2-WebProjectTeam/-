<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="errand.errandDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="errand" class="errand.Errand" scope="page" />
<jsp:setProperty name="errand" property="errandTopic"/>
<jsp:setProperty name="errand" property="errandDeadLine"/>
<jsp:setProperty name="errand" property="errandPlace"/>
<jsp:setProperty name="errand" property="errandFee"/>
<jsp:setProperty name="errand" property="errandType"/>
<jsp:setProperty name="errand" property="errandContent"/>

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
			
		String userID="정선우";
		
		if(session.getAttribute("userID")!=null){
			userID=(String)session.getAttribute("userID");
		}
		
		if(userID==null){
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href='login.jsp'");
			script.println("</script>");	
		}else{
			if(errand.getErrandType() == null)
			{
				script.println("<script>");
				script.println("alert('errandtopic');");
				script.println("history.back();");
				script.println("</script>");
			}
			if(errand.getErrandTopic() == null || errand.getErrandDeadLine() == null || 
					errand.getErrandPlace() == null || errand.getErrandFee() == null ||
					errand.getErrandType() == null || errand.getErrandContent() == null)
					{	
						script.println("<script>");
						script.println("alert('입력이 안 된 사항이 있습니다');");
						script.println("history.back();");
						script.println("</script>");
					}
					else
					{
						errandDAO errandDAO = new errandDAO();
						int result = errandDAO.write(errand.getErrandTopic(), errand.getErrandDeadLine(), errand.getErrandPlace(), errand.getErrandFee(), errand.getErrandType(), userID, errand.getErrandContent());

						if(result == -1) {
							script.println("<script>");
							script.println("alert('글쓰기에 실패했습니다.');");
							script.println("history.back();");
							script.println("</script>");
						} else {
							script.println("<script>");
							script.println("location.href='errand_enroll.jsp'");
							script.println("</script>");
						}
					}
					script.close();
			
		}
	%>
</body>
</html>
