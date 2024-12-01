<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="errand.Errand" %>
<%@ page import="errand.errandDAO" %>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!DOCTYPE html>
<html>
<head>
    
</head>
<body>
<%
	String userID = "정선우";
	if(session.getAttribute("userID") != null)
	{
		userID = (String) session.getAttribute("userID");
	}
	if(userID==null){
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요.')");
		script.println("location.href='main.jsp'");
		script.println("</script>");
	}
	int errandID=0;
	if(request.getParameter("errandID")!=null){
		errandID=Integer.parseInt(request.getParameter("errandID"));
	}
	if(errandID==0){
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("location.href='main.jsp'");
		script.println("</script>");	
	}
	Errand errand = new errandDAO().getErrand(errandID);
	if(!userID.equals(errand.getEnrollID())){
		PrintWriter script=response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		script.println("location.href='main.jsp'");
		script.println("</script>");
	}
%>
    <div class="title-container">
        <img src="<%= request.getContextPath() %>/image/arrow.back.png" onclick="history.back()"> 
        <div class="title">게시판 글 수정 양식</div>
    </div>

    <form method="post" action="updateAction.jsp?errandID=<%=errandID%>">">
        <fieldset class="form">
            <table style="width: 100%;">
                <tr>
                    <td>제목</td>
                </tr>
                <tr>
                    <td><input type="text" name="errandTopic" class="input-field" value="<%= errand.getErrandTopic() %>"></td><br>
                </tr>
                <tr>
                    <td>기한</td>
                </tr>
                <tr>
                    <td><input type="text" name="errandDeadLine" class="input-field" value="<%= errand.getErrandDeadLine() %>"></td>
                </tr>
                <tr>
                    <td>장소</td>
                </tr>
                <tr>
                    <td><input type="text" name="errandPlace" class="input-field-place" value="<%= errand.getErrandPlace() %>">
                    <img src="<%= request.getContextPath() %>/image/map_icon.png"alt="지도 아이콘" class="map-icon" onclick="openMapOverlay()" ></td><tr>
                </tr>
                <tr>
                    <td>활동비</td>
                </tr>
                <tr>
                    <td><input type="text" name="errandFee" class="input-field" value="<%= errand.getErrandFee() %>"></td>
                </tr>
                <tr>
                    <td>오픈채팅 링크</td>
                </tr>
                <tr>
                    <td><input type="text" name="chattingLink" class="input-field" value="<%= errand.getChattingLink() %>"></td>
                </tr>
                <tr>
                    <td>
                        <div class="category-container">
                        	<input type="hidden" id="hiddenField" name="errandType" value="">
            				<button type="button" class="category-button" onclick="sendData('문서 작성');selectCategory(this);">문서 작성</button>
           					<button type="button" class="category-button" onclick="sendData('물품 대여');selectCategory(this);">물품 대여</button>
            				<button type="button" class="category-button" onclick="sendData('배달');selectCategory(this);">배달</button>
            				<button type="button" class="category-button" onclick="sendData('단순 서비스');selectCategory(this);">단순 서비스</button>
            				<button type="button" class="category-button" onclick="sendData('기타');selectCategory(this);">기타</button>
        				</div>
                    </td>
                </tr>
                <tr>
                    <td>요청 내용</td>
                </tr>
                <tr>
                    <td><textarea name="errandContent" rows="6%" style="width: 100%; padding: 0px; font-size: 14px; border: 2px solid #ddd; border-radius: 5px;"><%= errand.getErrandContent() %></textarea></td>
                </tr>
                <tr>
                    <td style="text-align: center;" ><input type="submit" value="글 수정" class="submit-button" ></td>
                </tr>
            </table>
        </fieldset>
    </form>
    <!-- Overlay for the map -->
    <div class="overlay" id="mapOverlay" style="display: none; position: absolute; top: 0%; left: 0; width: 100%; height: 150%; background: rgba(0, 0, 0, 0.5);">
    <div style="position: relative; width: 80%; margin: 0 auto; background: white; padding: 20px; border-radius: 10px; top: 200px;">
        <img src="<%= request.getContextPath() %>/image/arrow.back.png" alt="닫기 버튼" style="position: absolute; top: 10px;left : 10px; cursor: pointer; width : 30px; height : 30px;" onclick="closeMapOverlay()">
        <img src="<%= request.getContextPath() %>/image/dongguk.map.png" alt="지도 이미지" style="width: 100%; height: auto; margin-top: 20px;">
        <input type="text" id="detailAddress" class="address-input" placeholder="상세 주소를 입력하세요" style="width: 95%; padding: 10px; margin-top: 20px; font-size: 14px; border: 1px solid #ddd; border-radius: 5px;">
        <button type="button" style="margin-top: 20px; padding: 7px 15px; font-size: 14px; background-color: #ff9800; color: white; border: none; border-radius: 5px; cursor: pointer;" onclick="setPlace()">저장</button>
    </div>
    </div>  
</body>
</html>