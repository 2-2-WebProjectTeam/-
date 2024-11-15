<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
	<style>
		.container {
			width: 100%;
			max-width: 600px; /* Reduced max width */
			position: relative;
			margin: 0 auto;
			padding-top: 20px;
		}
		.container img {
			position: fixed;
			top: 20px;
			left: 20px;
			width: 30px; /* Smaller arrow size */
			height: 30px;
			cursor: pointer;
			z-index: 100;
		}
		.text {
			font-size: 24px; /* Reduced font size */
			font-weight: 900;
			text-align: center;
			position: relative;
			top: 20px;
			transform: translateY(0);
		}
        .submit-button {
            width: 100%;
            padding: 12px; /* Reduced padding */
            border: none;
            border-radius: 10px;
            background-color: #ffae42;
            color: #fff;
            font-size: 16px; /* Reduced font size */
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .container_form {
    		width: 90%; /* Reduced width */
            border: 2px solid #ddd;
            border-radius: 15px;
            padding: 15px; /* Reduced padding */
    		font-size: 18px; /* Reduced font size */
    		position: absolute;
			left: 50%;
			top: 50%;
			transform: translate(-50%, -50%);
        }
        .form-control {
			padding: 10px;
			font-size: 16px; /* Reduced font size */
			width: 98%;
			box-sizing: border-box;
			border: none;
			border-bottom: 1px solid #ddd;
			outline: none;
		}
		.form-select {
			padding: 8px;
			font-size: 16px; /* Reduced font size */
			width: 48%;
			border-radius: 10px;
			box-sizing: border-box;
			border-color: #A39F9F;
		}
		.form-group {
			margin: 15px 0; /* Reduced margin */
		}
	</style>
</head>
<body>
	<div class="container">
		<img src="<%= request.getContextPath() %>/image/arrow.back.png" onclick="window.location.href='login.jsp'">
		<div class="text">회원가입</div>
	</div>
	<div class="container_form">
		<form>
			<div class="form-group">아이디</div>
	       	<div class="form-group">
	       		<input type="text" class="form-control" name="userID">
	        </div>
	       <div class="form-group">비밀번호</div>
	       <div class="form-group">
	       		<input type="password" class="form-control" name="userPassword" maxlength="25">
	       </div>
	       <div class="form-group">이름</div>
	       <div class="form-group">
	       		<input type="text" class="form-control" name="userName" maxlength="25">
	       </div>
	       <div class="form-group">전화번호</div>
	       <div class="form-group">
	       		<input type="tel" class="form-control" name="userPhoneNumber" maxlength="25">	
	       </div>
	       <div class="form-group">성별</div>
	       <div class="form-group">
	       		<select id="gender" class="form-select" name="userGender" required>
           			<option value="" disabled selected>성별</option>
            		<option value="male">남자</option>
           			<option value="female">여자</option>
        		</select>
        	</div>
        	<div class="form-group">생년월일</div>		
	       <div class="form-group">
        		<input type="date" class="form-select" id="birthdate" name="userBirthday" required>
        	</div>
	       <input type="submit" value="가입하기" class="submit-button">	 
		</form>
    </div>
</body>
</html>
