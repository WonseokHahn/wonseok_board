<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 목록</title>

</head>
<body>
	<table border="1" >
		<tr>
			<th bgcolor="" width="50">no</th>
			<th bgcolor="" width="200">제목</th>
			<th bgcolor="" width="150">작성자</th>
			<th bgcolor="" width="150">작성일</th>
			<th bgcolor="" width="100">조회수</th>
		</tr>
		<c:choose>
			<c:when test="${ not empty boardList}">
				<c:forEach items="${ boardList }" var="board">
					<tr>
						<td>${ board.boardNo }</td>
						<td><a href="getContent.do?boardNo=${ board.boardNo }">
								${board.boardTitle }</a></td>
						<td>${ board.boardWriter }</td>
						<td><fmt:formatDate value="${ board.regDate }" pattern="yyyy-MM-dd"/></td>
						<td>${ board.viewCnt }</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="5">등록된 글이 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
	<br>
	<a href="moveInsertBoard.do">글 쓰기</a>
</body>
</html>