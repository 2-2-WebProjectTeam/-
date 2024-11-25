<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
      background-image: url('./image/profile.png');
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
  </style>
</head>
<body>
<%
	String userID = null;
	if(session.getAttribute("userID") != null)
	{
		userID = (String) session.getAttribute("userID");
	}
%>
<script>
	function switchTab(selectedTab) {
		  // 모든 탭에서 active 클래스를 제거
		  const tabs = document.querySelectorAll('.tab');
		  tabs.forEach(tab => tab.classList.remove('active'));
	
		  // 클릭된 탭에 active 클래스 추가
		  document.getElementById(selectedTab).classList.add('active');
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
        <%
        	} else {
        %>
        	<div><%= userID %></div> 
        <%
        	}
        %>
          <div class="points">0 point</div>
        </div>
      </div>
    </div>

    <div class="tabs">
      <div class="tab" id="tab1" onclick="switchTab('tab1')">내가 신청한 일</div>
      <div class="tab active" id="tab2" onclick="switchTab('tab2')">내가 등록한 일</div>
      <div class="tab-container">
</div>
      
    </div>

    <div class="content">
      <div class="task">
        <div class="task-title">벌레좀 잡아주세요 ㅠㅠ</div>
        <div class="task-details">기한: 9/5 (목) 22:00</div>
        <div class="task-details">장소: 동대문구 5단거리 자취방</div>
        <div class="points">5000 point</div>
      </div>
      <div class="task">
        <div class="task-title">후문 메가커피에서 아아 좀 사다주세요</div>
        <div class="task-details">기한: 9/4 (수) 14:45</div>
        <div class="task-details">장소: 학술관 K357</div>
        <div class="points">4000 point</div>
      </div>
    </div>
  </div>
</body>
</html>
