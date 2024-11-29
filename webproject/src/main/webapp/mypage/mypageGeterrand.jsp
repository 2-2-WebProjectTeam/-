<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="errand.errandDAO" %>
<%@ page import="errand.Errand" %>
<%@ page import="java.util.ArrayList" %>
<%
    String tab = request.getParameter("tab");
    String userID = (String) session.getAttribute("userID");
    errandDAO errandDAO = new errandDAO();
    ArrayList<Errand> list = errandDAO.getList();

    if ("tab2".equals(tab) && userID != null) {
    	for(int i =0;i<list.size(); i++){
			if(userID.equals(list.get(i).getEnrollID())) {
%>
    <div class="task" onclick="location.href='<%= request.getContextPath() %>/errand_enroll/errand_show.jsp?errandID=<%=list.get(i).getErrandID()%>'">
        <div class="task-title"><%= list.get(i).getErrandTopic() %></div>
        <div class="task-details">기한: <%= list.get(i).getErrandDeadLine() %></div>
        <div class="task-details">장소: <%= list.get(i).getErrandPlace() %></div>
        <div class="points"><%= list.get(i).getErrandFee() %> point</div>
    </div>
<%
            }
        }
    } else if ("tab1".equals(tab) && userID != null) {
    	for(int i =0;i<list.size(); i++){
			if(userID.equals(list.get(i).getAppliedID())) {
%>
    <div class="task" onclick="location.href='<%= request.getContextPath() %>/errand_enroll/errand_show.jsp?errandID=<%=list.get(i).getErrandID()%>'">
        <div class="task-title"><%= list.get(i).getErrandTopic() %></div>
        <div class="task-details">기한: <%= list.get(i).getErrandDeadLine() %></div>
        <div class="task-details">장소: <%= list.get(i).getErrandPlace() %></div>
        <div class="points"><%= list.get(i).getErrandFee() %> point</div>
    </div>
<%
			}
    	}
    }
%>
    
