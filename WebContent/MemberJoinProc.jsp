<%@page import="model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberJoinProc</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	
	String[] hobby=request.getParameterValues("hobby");

	// 배열에 있는 내용을 하나의 스트링으로 저장
	String texthobby="";
	
	for(int i=0; i<hobby.length; i++){
		texthobby+=hobby[i]+" ";
	}
%>

<jsp:useBean id="mbean" class="model.MemberBean">
	<jsp:setProperty name="mbean" property="*"/>
</jsp:useBean> 

<%
 	mbean.setHobby(texthobby);
  	MemberDAO mbao=new MemberDAO();
  	mbao.insertMember(mbean);
  	
  	//회원 가입이 되었다면 회원 정보를 보여주는 페이지로 이동
  	response.sendRedirect("MemberList.jsp");
%>
 	Join OK
</body>
</html>