<%@ page import="user.UserDAO" %>
<%@ page import="user.UserDTO" %>
<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: smj_o
  Date: 2024-09-02
  Time: AM 12:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String userId = request.getParameter("userId");
    String Password = request.getParameter("password");
    String Email = request.getParameter("email");

    UserDTO userDTO = new UserDTO();
    userDTO.setUserId(userId);
    userDTO.setUserPassword(Password);
    userDTO.setUserEmail(Email);

    UserDAO userDao = new UserDAO();

    int result = userDao.join(userDTO);

    if (result == 1) {
        session.setAttribute("userID", userDTO.getUserId());
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('회원가입 성공!');");
        script.println("location.href = 'board.html';");
        script.println("</script>");

    } else {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('회원가입 실패!');");
        script.println("history.back();");
        script.println("</script>");
    }
%>