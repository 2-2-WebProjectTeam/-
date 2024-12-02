<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="errand.errandDAO" %>
<%@ page import="errand.Errand" %>
<%@ page import="java.util.ArrayList" %>
<%
    String categoryTab = request.getParameter("category");
	String sortTab = request.getParameter("sort");
    String userID = (String) session.getAttribute("userID");
    errandDAO errandDAO = new errandDAO();
    ArrayList<Errand> list = errandDAO.getList();

    if ("".equals(categoryTab)) {
    	for(int i = list.size()-1;i>0; i--){
			if(list.get(i).getAppliedID() == null) {
%>
    <div class="task" onclick="location.href='<%= request.getContextPath() %>/errand_enroll/errand_show.jsp?errandID=<%=list.get(i).getErrandID()%>'">
        <div class="task-title"><%= list.get(i).getErrandTopic() %></div>
        <div class="task-details">기한:<%= list.get(i).getErrandDeadLine() %></div>
        <div class="task-details">장소:<%= list.get(i).getErrandPlace() %></div>
        <div class="task-details">활동비:<%= list.get(i).getErrandFee() %> point</div>
	    <div class="task-details"><%= list.get(i).getEnrollDate().substring(0,11)+list.get(i).getEnrollDate().substring(11,13)+"시"+list.get(i).getEnrollDate().substring(14,16)+"분"%></div>
    </div>
<%
            }
        }
    } else if ("포인트순".equals(tab)) {
    	for(int i = list.size()-1;i>0; i--){
			if(userID.equals(list.get(i).getAppliedID())) {
%>
    <div class="task" onclick="location.href='<%= request.getContextPath() %>/errand_enroll/errand_show.jsp?errandID=<%=list.get(i).getErrandID()%>'">
        <div class="task-title"><%= list.get(i).getErrandTopic() %></div>
        <div class="task-details">기한:<%= list.get(i).getErrandDeadLine() %></div>
        <div class="task-details">장소:<%= list.get(i).getErrandPlace() %></div>
        <div class="task-details">활동비:<%= list.get(i).getErrandFee() %> point</div>
	    <div class="task-details"><%= list.get(i).getEnrollDate().substring(0,11)+list.get(i).getEnrollDate().substring(11,13)+"시"+list.get(i).getEnrollDate().substring(14,16)+"분"%></div>
    </div>
<%
			}
    	}
    }
%>