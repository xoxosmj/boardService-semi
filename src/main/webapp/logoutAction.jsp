<%--
  Created by IntelliJ IDEA.
  User: smj_o
  Date: 2024-09-02
  Time: AM 1:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    session.invalidate(); // 현재 이 페이지에 접속한 회원이 세션을 빼앗기도록 만들어서 로그아웃 시켜준다.
%>
<script>
    location.href = 'main.jsp';
</script>

</body>
</html>
