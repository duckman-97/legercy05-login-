<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>/sample/admin page</h1>

<p>principal : <sec:authentication property = "principal"/></p>
<p>MemberVO : <sec:authentication property="principal.member"/></p>
<p>����� �̸� : <sec:authentication property="principal.member.userName"/></p>
<p>����� ���̵� : <sec:authentication property = "principal.username"/>
<p>����� ���� ����Ʈ : <sec:authentication property= "principal.member.authList"/></p>







<a href = "/customLogout">Logout</a>
</body>
</html>