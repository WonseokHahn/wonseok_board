<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<html>
<head>
<meta charset="UTF-8">

<title>글 상세</title>
</head>
<body>
	<h1>글 상세</h1>
	<hr>
	<form action="updateBoard.do" method="post">
		<input name="boardNo" type="hidden" value="${board.boardNo}" />
		<table border="1">
			<tr>
				<td bgcolor="orange" width="70">제목</td>
				<td align="left"><input name="boardTitle" type="text"
					value="${board.boardTitle }" /></td>
			</tr>
			<tr>
				<td bgcolor="orange">작성자</td>
				<td align="left">${board.boardWriter }</td>
			</tr>
			<tr>
				<td bgcolor="orange">내용</td>
				<td align="left"><textarea name="boardContent" cols="40" rows="10">${board.boardContent }</textarea></td>
			</tr>
			<tr>
				<td bgcolor="orange">등록일</td>
				<td align="left"><fmt:formatDate value="${board.regDate }" pattern="yyyy-MM-dd"/></td>
			</tr>
			<tr>
				<td bgcolor="orange">조회수</td>
				<td align="left">${board.viewCnt }</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="글 수정" /></td>
			</tr>
		</table>
	</form>
	<hr>
	<a href="moveInsertBoard.do">글 쓰기</a>&nbsp;&nbsp;&nbsp; 
	<a href="deleteBoard.do?boardNo=${board.boardNo }">글 삭제</a>&nbsp;&nbsp;&nbsp;
	<a href="getBoardList.do">글 목록</a>	

	
</body>
</html>