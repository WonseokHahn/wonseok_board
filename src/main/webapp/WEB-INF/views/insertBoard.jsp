<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>새글등록</title>
</head>
<body>
	<h1>글 쓰기</h1>
	<hr>
		<table border="1">
			<tr>
				<td bgcolor="gray">제목</td>
				<td align="left"><input type="text" id="boardTitle" name="boardTitle" /></td>
			</tr>
			<tr>
				<td bgcolor="gray">작성자</td>
				<td align="left"><input type="text" id="boardWriter" name="boardWriter"/></td>
			</tr>
			<tr>
				<td bgcolor="gray">내용</td>
				<td align="left"><textarea name="boardContent" id="boardContent" cols="40" rows="10"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><button type="button" onclick="insertWrite()">글쓰기</button></td>
			</tr>
		</table>
	<hr>
	<a href="getBoardList.do">글 목록 가기</a>
	
	<script>
		function insertWrite(){
			$.ajax({
				url : "/ajax/write",
				data : {
					boardTitle : $("#boardTitle").val(),
					boardWriter : $("#boardWriter").val(),
					boardContent : $("#boardContent").val()
				},
				dataType : "JSON" ,
				type : "POST" ,
				success : function(result){
					if(result > 0) location.href = "/getBoardList.do";
				},
				error : function(){
					console.log("문제잇나..?");
					alert("등록 실패!!");
				}
			})
		}
		

	</script>
</body>
</html>