<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <style>
      .container{
         position: absolute;
         left:50%;
         top:40%;
         transform: translate(-50%, -50%);
         width:90%;
         max-width:600px;
      }
      h3{
         font-size:45px;
         margin-bottom:90px;
      }
      .form-control{
         padding:20px;
         margin:7px;
         font-size:28px;
         width:100%;
         border-radius:15px;
         box-sizing:border-box;
         border-color:#A39F9F;
      }
      .btn{
         background-color:#F7A239;
         border:none;
         color:white;
      }
      .forgot-password{
         text-align: right;
         margin-top: 10px;
         font-size: 20px;
         margin-bottom: 20px;
      }
      .gotoJoin{
         padding:25px;
         margin-top:50px;
         background-color:white;
      }
   </style>
</head>
<body>
   <img src="./image/arrow_back.png" onclick="window.location.href='mypage_beforeLogin.jsp'">
   <div class="container">
      <form method="post" action="loginAction.jsp">
         <h3 style="text-align: center;">로그인</h3>
         <div class="form-group">      
            <input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="25">   
         </div>
         <div class="form-group">
            <input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="25">   
         </div>
         <input type="submit" class="btn btn-primary form-control" value="로그인">
      </form>
      <div class="forgot-password">
         <a href="passwordRecovery.jsp" style="color:#808080;">비밀번호를 잊으셨나요?</a>
      </div>
      <hr>
      <button class="gotoJoin form-control" onclick="window.location.href='join.jsp';">
         <span>계정이 없으신가요?</span>
         <span style="color:#F7A239">가입하기</span>
      </button>
   </div>
</body>
</html>