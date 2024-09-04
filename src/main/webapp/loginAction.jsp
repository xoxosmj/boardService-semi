<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.UserDTO" %><%--
  Created by IntelliJ IDEA.
  User: smj_o
  Date: 2024-09-01
  Time: PM 8:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    // 1. 폼에서 사용자 입력 받기
    String userId = request.getParameter("userId");
    String password = request.getParameter("password");

    // 2. UserDTO 객체 생성
    UserDTO userDTO = new UserDTO();
    userDTO.setUserId(userId);
    userDTO.setUserPassword(password);

    // 3. UserDAO 객체 생성 및 로그인 수행
    UserDAO userDAO = new UserDAO();
    int result = userDAO.login(userDTO.getUserId(), userDTO.getUserPassword());

    // 4. 로그인 결과 처리
    if (result == 1) { // 로그인 성공
        session.setAttribute("userID", userDTO.getUserId());

        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('로그인 성공!');");
        script.println("location.href = 'board.html';");
        script.println("</script>");
    } else if (result == 0) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('비밀번호가 틀렸습니다!');");
        script.println("history.back();");
        script.println("</script>");
    } else if (result == -1) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('아이디를 찾을 수 없습니다!');");
        script.println("history.back();");
        script.println("</script>");
    } else {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('데이터베이스 오류!');");
        script.println("history.back();");
        script.println("</script>");
    }
%>

</body>
</html>