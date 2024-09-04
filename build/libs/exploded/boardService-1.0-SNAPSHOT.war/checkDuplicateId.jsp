<%@ page import="user.UserDAO" %><%--
  Created by IntelliJ IDEA.
  User: smj_o
  Date: 2024-09-02
  Time: AM 12:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
    String userId = request.getParameter("userId");

    UserDAO userDAO = new UserDAO();
    boolean isDuplicate = userDAO.isDuplicateId(userId);

    if (isDuplicate) {
        response.getWriter().print("duplicate");
    } else {
        response.getWriter().print("available");
    }
%>