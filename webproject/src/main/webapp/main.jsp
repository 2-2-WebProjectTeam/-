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
    <title>메인페이지(홈)</title>
    <style>
       /* category-박스 설정 */
        .category-container {
            display: flex;
            flex-wrap: wrap;
            gap: 15px; /* 버튼 간 간격 조정 */
            justify-content: center;
            margin-top: 20px; /* 상단 여백 조정 */
        }

        /* category-버튼 스타일 */
        .category-button {
            width: 20%; /* 버튼 너비 조정 */
            padding: 5px 0px; /* 버튼 내부 여백 조정 */
            border: 1px solid #ddd;
            border-radius: 15px;
            background-color: #f5f5f5;
            font-size: 12px; /* 글자 크기 조정 */
            color: #333;
            cursor: pointer; /* 마우스 오버 시 포인터 커서 이미지 */
            text-align: center;
        }

        /* 정렬-박스 설정 */
        .sorting-container {
            display: flex;
            gap: 5px;
            justify-content: center;
            margin-top: 15px;
            margin-left: 55%;
        }

        /* 정렬-버튼 스타일 */
        .sorting-button {
            width: 70px;
            padding: 8px 0px;
            border: 1px solid #ddd;
            border-radius: 15px;
            background-color: #f5f5f5;
            font-size: 11px;
            color: #333;
            cursor: pointer;
            text-align: center;
        }

        /* 선택된 버튼 스타일 */
        .selected {
            background-color: #ffae42;
            color: white;
            border-color: #ffae42;
        }

        /* 박스 위에 올렸을 때 */
        .category-button:hover {
            background-color: #ffae42;
            color: #f5f5f5;
        }
        .sorting-button:hover {
            background-color: #ffae42;
            color: #f5f5f5;
        }

        /* 플러스 버튼 */
        .plus {
            position: fixed;
            width: 50px;
            height: 50px;
            bottom: 90px;
            right: 20px;
        }

        /* 줄 바꿈용 */
        .break {
            width: 100%;
            height: 0;
        }
    </style>
    <%
	String userID = null;
	if(session.getAttribute("userID") != null)
	{
		userID = (String) session.getAttribute("userID");
	}
	%>
    <script>
        function selectCategory(element) { 
            const buttons = document.querySelectorAll('.category-button');
            buttons.forEach(button => button.classList.remove('selected'));
            element.classList.add('selected');
        }

        function selectSorting(element) {
            const buttons = document.querySelectorAll('.sorting-button');
            buttons.forEach(button => button.classList.remove('selected'));
            element.classList.add('selected');
        }
        function gotoPage() {
        	const userID = "<%= userID %>";
        	if(userID != null)
        		{
        		location.href='errand_enroll/errand_enroll.jsp';
        		}
        	
        }
    </script>
</head>
<body>

    <div class="category-container">
        <div class="category-button selected" onclick="selectCategory(this)">전체</div>
        <div class="category-button" onclick="selectCategory(this)">물품 대여</div>
        <div class="category-button" onclick="selectCategory(this)">배달</div>
        <div class="break"></div> <!-- 줄 바꿈 추가 -->
        <div class="category-button" onclick="selectCategory(this)">문서 작성</div>
        <div class="category-button" onclick="selectCategory(this)">단순 서비스</div>
        <div class="category-button" onclick="selectCategory(this)">기타</div>
    </div>

    <div class="sorting-container">
        <div class="sorting-button" onclick="selectSorting(this)">최신순</div>
        <div class="sorting-button" onclick="selectSorting(this)">포인트순</div>
        <div class="sorting-button" onclick="selectSorting(this)">마감순</div>
    </div>
    <img class="plus" src="./image/plus.png" onclick="gotoPage();">
    <jsp:include page="navigation.jsp"/>
	<%
		errandDAO errandDAO=new errandDAO();
		ArrayList<Errand> list = errandDAO.getList();
		for(int i =0;i<list.size(); i++){
	%>
	<div class="task">
        <div class="task-title"><a href="errand_show.jsp?errandID=<%=list.get(i).getErrandID()%>"><%= list.get(i).getErrandTopic() %></div>
        <div class="task-details">기한:<%= list.get(i).getErrandDeadLine() %></div>
        <div class="task-details">장소:<%= list.get(i).getErrandPlace() %></div>
        <div class="points">:<%= list.get(i).getErrandFee() %></div>
   <%
		}
	%>
      </div>
</body>
</html>

