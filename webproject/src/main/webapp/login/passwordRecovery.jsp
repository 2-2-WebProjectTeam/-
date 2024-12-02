<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
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
      .form-control {
         padding: 15px;
         margin: 10px 0;
         font-size: 18px;
         width: 100%;
         border-radius: 10px;
         box-sizing: border-box;
         border: 1px solid #A39F9F;
      }
      .btn {
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
      .forgot-password {
         text-align: right;
         margin-top: 10px;
         font-size: 14px;
         color: #808080;
      }
      .gotoJoin {
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
      }
      .gotoJoin span:last-child {
         color: #F7A239;
         margin-left: 5px;
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
</head>
<body>
   <img src="<%= request.getContextPath() %>/image/arrow.back.png" class="arrow" onclick="window.location.href='<%= request.getContextPath() %>/login/login.jsp'">
   <div class="container">
      <form method="post" action="pwdRecoveryAction.jsp">
         <h3>비밀번호를 잊으셨나요?</h3><br>
         <div class="form-group">      
            <input type="text" class="form-control" placeholder="사용자 전화번호" name="userPhoneNumber" maxlength="25">   
         </div>
         <input type="submit" class="btn" value="Show my password">
      </form>
   </div>
</body>
</html>
