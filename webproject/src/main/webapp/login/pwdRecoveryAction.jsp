<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
      .container {
         position: absolute;
         left: 50%;
         top: 40%;
         transform: translate(-50%, -50%);
         width: 90%;
         max-width: 400px;
      }
      h3 {
         font-size: 28px;
         margin-bottom: 20px;
         text-align: center;
      }
      .gotoLogin {
         padding: 15px;
         margin-top: 20px;
         font-size: 16px;
         border: 1px solid #A39F9F;
         border-radius: 10px;
         background-color: white;
         width: 100%;
         cursor: pointer;
         color: black;
         display: flex;
         justify-content: center;
         align-items: center;
         
         background-color: #F7A239;
         border: none;
         color: white;
         padding: 15px;
         font-size: 18px;
         border-radius: 10px;
         width: 100%;
         cursor: pointer;
         margin-top: 10px;
      }
      .arrow {
         position: fixed;
         top: 20px;
         left: 20px;
         cursor: pointer;
         width: 30px;
         height: 30px; 
      }
   </style>
<title>Insert title here</title>
</head>
<body>
<img src="<%= request.getContextPath() %>/image/arrow.back.png" class="arrow" onclick="window.location.href='<%= request.getContextPath() %>/login/passwordRecovery.jsp'">
<%
	String userPhoneNumber=request.getParameter("userPhoneNumber");
	
	UserDAO UserDAO = new UserDAO();
	String password = UserDAO.getPassword(userPhoneNumber);
	 if (password != null) {
%>
   <div class="container">
      <h2>회원님의 비밀번호는 <%=password %>입니다.</h2>
      <hr>
      <button class="gotoLogin" onclick="window.location.href='login.jsp';">
      로그인하기</button>
   </div>
<%
}else{
%>
   <div class="container">
      <h3>비밀번호가 존재하지 않습니다.</h3>
      <hr>
      <button class="gotoLogin" onclick="window.location.href='login.jsp';">
      로그인하기</button>
   </div>
<%
}
%>
</body>
</html>