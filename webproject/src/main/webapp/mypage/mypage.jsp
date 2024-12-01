<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="errand.errandDAO" %>
<%@ page import="errand.Errand" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>프로필 페이지</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f9f9f9;
    }

    .container {
      margin-top: 50px; /* 전체 페이지를 아래로 내림 */
    }

    .header {
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: 30px; /* 상하좌우 여백 추가 */
      background-color: #fff;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    .profile-info {
      display: flex;
      align-items: center;
    }

    .profile-pic {
      width: 60px; /* 크기를 조금 키웠습니다 */
      height: 60px;
      border-radius: 50%;
      background-image: url('<%= request.getContextPath() %>/image/profile.png');
      background-size: cover;
      background-position: center;
      margin-right: 20px; /* 사진과 이름 사이에 여백 추가 */
    }

    .profile-details {
      display: flex;
      flex-direction: column;
      gap: 8px; /* 이름과 포인트 사이에 간격 추가 */
    }

    .points {
      font-size: 14px;
      color: #888;
    }

    .tabs {
      display: flex;
      justify-content: center;
      margin: 20px 0;
      background-color: #fff;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    .tab {
      flex: 1;
      text-align: center;
      padding: 15px 0;
      font-weight: bold;
      color: #888;
      cursor: pointer;
    }

    .tab.active {
      color: #ff7e00;
      border-bottom: 3px solid #ff7e00;
    }

    .content {
      padding: 20px;
    }

    .task {
      background-color: #fff;
      padding: 15px;
      margin-bottom: 15px;
      border-radius: 8px;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    .task-title {
      font-size: 16px;
      font-weight: bold;
      margin-bottom: 10px;
    }

    .task-details {
      font-size: 14px;
      color: #666;
      margin-bottom: 5px;
    }

    .points {
      font-size: 14px;
      color: #ff7e00;
      font-weight: bold;
    }
    .logout {
      position : absolute;
      left : 80%;
      border: 1px solid #ff7e00;
      border-radius: 8px;
      background-color : #ff7e00;
      padding : 4px 7px;
      font-size : 12px;
      font-weight: bold;
      color: white; 
      
    }
  </style>
</head>
<body>
<%
	String userID = null;
	if(session.getAttribute("userID") != null)
	{
		userID = (String) session.getAttribute("userID");
	}
	boolean enrollActive = true;
%>
<script>
	
	function switchTab(selectedTab) {
	    // 모든 탭에서 active 클래스를 제거
	    const tabs = document.querySelectorAll('.tab');
	    tabs.forEach(tab => tab.classList.remove('active'));
	
	    // 클릭된 탭에 active 클래스 추가
	    const activeTab = document.getElementById(selectedTab);
	    activeTab.classList.add('active');
	    // Ajax 요청 보내기
	    fetch(`mypageGeterrand.jsp?tab=` + String(selectedTab))
	    
	        .then(response => response.text())
	        .then(html => {
	            document.querySelector('.content').innerHTML = html; // 서버에서 받은 데이터를 렌더링
	        })
	        .catch(err => console.error('Error:', err));
	}

		
</script>

  <div class="container"> 
    <div class="header">
      <div class="profile-info">
        <div class="profile-pic"></div>
        <div class="profile-details">
        <% 
        	if(userID == null) {
        %>
        	<div onclick="window.location.href='<%= request.getContextPath() %>/login/login.jsp'">로그인</div>
        	<div class="points">0 point</div>
        <%
        	} else {
        %>
        	<div class=logout onclick="window.location.href='<%= request.getContextPath() %>/login/logoutAction.jsp'">로그아웃</div>
        	<div><%= userID %></div>
        	<div class="points">10000 point</div> 
        <%
        	}
        %>
        </div>
      </div>
    </div>
    
    <div class="tabs">
      <div class="tab" id="tab1" onclick="switchTab('tab1')">내가 신청한 일</div>
      <div class="tab active" id="tab2" onclick="switchTab('tab2')">내가 등록한 일</div>
      <div class="tab-container"></div>
  	</div>
	<div class="content">
		<script>
	        document.addEventListener('DOMContentLoaded', () => {
	            switchTab('tab2');
	        });
	    </script>
  </div>
  </div>
  <jsp:include page="../navigation.jsp"/>  
</body>
</html>
