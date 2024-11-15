<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		.container {
			width: 100%;
			max-width: 1000px;
			position: relative;
			margin: 0 auto;
			padding-top: 20px; /* 상단 여백 */
		}
		.container img {
			position: absolute;
			top: 20px; /* 이미지의 상단 여백 */
			left: 20px; /* 이미지의 왼쪽 여백 */
			cursor: pointer; /* 클릭 가능하도록 커서 변경 */
		}
		.text {
			font-size: 42px;
			font-weight: 900;
			text-align: center;
			position: relative;
			top: 20px; /* 텍스트의 상단 여백 */
			transform: translateY(0);
		}
        .submit-button {
            width: 100%;
            padding: 15px;
            border: none;
            border-radius: 10px;
            background-color: #ffae42;
            color: #fff;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .container_form {
    		width: 80%;
            border: 2px solid #ddd; /* 테두리 색상 */
            border-radius: 20px; /* 둥근 모서리 */
            padding: 20px;
            
    		font-size:30px;
    		position: absolute;
			left:50%;
			top:48%;
			transform: translate(-50%, -50%);
        }
        .form-control{
			padding:20px;
			font-size:23px;
			width:98%;
			box-sizing:border-box;
			border-color:#A39F9F;
            padding: 10px;
            border: none;
            border-bottom: 1px solid #ddd;
            outline: none;
		}
		.form-select{
			padding:10px;
			font-size:23px;
			width:50%;
			border-radius:15px;
			box-sizing:border-box;
			border-color:#A39F9F;
		}
		.form-group{
			margin:25px;
		}
		.submit-button{
			font-size:30px;
		}
		.blank{
		font-size:50px;
		}
	</style>
</head>
<body>
	<div class="container">
		<img src="./image/arrow_back.png" onclick="window.location.href='login.jsp'">
		<div class="text">
		회원가입
		</div>
	</div>
	<div class="container_form">
		<form>
			<div class="form-group">
	       		아이디
	       	</div>
	       	<div class="form-group">
	       		<input type="text" class="form-control" name="userID">
	        </div>
	       <div class="form-group">
	       		비밀번호
	       </div>
	       <div class="form-group">
	       		<input type="password" class="form-control" name="userPassword" maxlength="25">
	       </div>
	       <div class="form-group">
	       		이름
	       </div>
	       <div class="form-group">
	       		<input type="text" class="form-control" name="userName" maxlength="25">
	       </div>
	       <div class="form-group">
	       		전화번호
	       </div>
	       <div class="form-group">
	       		<input type="tel" class="form-control" name="userPhoneNumber" maxlength="25">	
	       </div>
	       <div class="form-group">
	       		성별	
	       </div>
	       <div class="form-group">
	       		<select id="gender" class="form-select" name="userGender" required>
           			<option value="" disabled selected>성별</option>
            		<option value="male">남자</option>
           			<option value="female">여자</option>
        		</select>
        	</div>
        	<div class="form-group">
        		생년월일
        	</div>		
	       <div class="form-group">
        		<input type="date" class="form-select" id="birthdate" name="userBirthday" required>
        	</div>
        	<br><br><br><br><br><br><br><br><br><br><br><br><br>
	       <input type="submit" value="가입하기" class="submit-button">	 
		</form>
    </div>
</body>
</html>