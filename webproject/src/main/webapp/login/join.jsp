<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
      <form method="post" action="joinAction.jsp">
         <h3 style="text-align: center;">회원가입</h3>
         <div class="form-group">      
            <input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="25">   
         </div>
         
         <div class="form-group">
            <input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="25">   
         </div>
         
         <div class="form-group">
            <input type="text" class="form-control" placeholder="이름" name="userName" maxlength="25">   
         </div>
         
         <div class="form-group">
            <input type="tel" class="form-control" placeholder="전화번호" name="userPhoneNumber" maxlength="25">   
         </div>
         
         <div class="form-group">
            <select id="gender" name="userGender" required>
    			<option value="" disabled selected>성별</option>
    			<option value="male">남자</option>
    			<option value="female">여자</option>
			</select>
        </div>
        
        <div class="form-group">
            <label for="birthdate">생년월일</label>
			<input type="date" id="birthdate" name="userBirthday" required>  
         </div>
        
        
         
         <input type="submit" class="btn btn-primary form-control" value="회원가입">
      </form>
   </div>
</body>
</html>