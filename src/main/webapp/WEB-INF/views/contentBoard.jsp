<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<title>글 상세</title>
</head>
<body>
	<h1>글 상세</h1>
	<hr>
		<input name="boardNo" id="boardNo" type="hidden" value="${board.boardNo}" />
		<table border="1">
			<tr>
				<td bgcolor="gray">제목</td>
				<td align="left"><input name="boardTitle" id="boardTitle" type="text" value="${board.boardTitle }"></td>
			</tr>
			<tr>
				<td bgcolor="gray">작성자</td>
				<td align="left" id="boardWriter"><c:out value="${board.boardWriter }"/></td>
			</tr>
			<tr>
				<td bgcolor="gray">내용</td>
				<td align="left"><textarea name="boardContent" cols="40" rows="10" id="boardContent"><c:out value="${board.boardContent }"/></textarea></td>
			</tr>
			<tr>
				<td bgcolor="gray">등록일</td>
				<td align="left" id="regDate"><fmt:formatDate value="${board.regDate }" pattern="yyyy-MM-dd"/></td>
			</tr>
			<tr>
				<td bgcolor="gray">조회수</td>
				<td align="left" id="viewCnt"><c:out value="${board.viewCnt }"/></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><button type="button" onclick="updateBoard();">수정하기</button></td>
			</tr>
		</table>
	<hr>
	<a href="moveInsertBoard.do">글 쓰기</a>&nbsp;&nbsp;&nbsp; 
	<button type="button" onclick="deleteBoard();">글 삭제하기</button>
	<a href="getBoardList.do">글 목록</a>	

<script>
	function updateBoard(){
		$.ajax({
			url : "/ajax/update",
			data : {
				boardNo : $("#boardNo").val(),
				boardTitle : $("#boardTitle").val(),
				boardContent : $("#boardContent").val(),
			},
			dataType : "JSON" ,
			type : "POST" ,
			success : function(result){
				if(result > 0){
					location.reload();				
				}else{
					alert("수정 실패!!");
				}
			},
			error : function(){
				console.log("실패");
			}
		})
	}
	
	function deleteBoard(){
		$.ajax({
			url : "/ajax/delete",
			data : {boardNo : $("#boardNo").val()},
			dataType : "JSON" ,
			type : "POST" ,
			success : function(result){
				if(result > 0){
					location.href="/getBoardList.do";		
				}else{
					alert("수정 실패!!");
				}
			},
			error : function(){
				console.log("실패");
			}
		})
	}


</script>
	
</body>
</html>