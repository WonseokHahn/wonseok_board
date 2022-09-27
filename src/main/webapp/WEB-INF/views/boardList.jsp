<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
	#boardList{
		border : solid 1px black;
		width : 684px;
	}
	#boardList > div{
		border : solid 1px black;
	}
	#boardList > div > div{
		display : inline-block;
	}
</style>

<meta charset="UTF-8">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 목록</title>

</head>
<body>
	

	<table border="1" >
		<thead>
		<tr>
			<th bgcolor="" width="50">no</th>
			<th bgcolor="" width="200">제목</th>
			<th bgcolor="" width="150">작성자</th>
			<th bgcolor="" width="150">작성일</th>
			<th bgcolor="" width="100">조회수</th>
		</tr>
		</thead>
		<tbody id="listBody">
		</tbody>
		
	</table>
	<br>
	<a href="moveInsertBoard.do">글 쓰기</a>
	<br>
	<!-- 검색부분 -->
	<div id="searchBoard">
		<p>게시판 검색</p>
		<select id="condition" name="condition">
         	<option value="boardWriter">글쓴이</option>
         	<option value="boardTitle">제목</option>
            <option value="boardContent">내용</option>
        </select>
		<input type="text" onkeyup="searchButton();" name="keyword" id="keyword" placeholder="게시글 검색">

	</div>
	<div id="boardList" ></div>
	
	<script>
	
		//리스트 나열
		$(function(){
			boardList();
				$(document).on("click","#listBody > tr", function(){
		            location.href="getContent.do?boardNo=" + $(this).children().eq(0).text();
		        });
		})
		
		function boardList(){
			$.ajax({
				url : "/ajax/list",
				data : {
					
				},
				dataType : "JSON" ,
				type : "POST" ,
				success : function(result){
					successBoard(result);
					console.log("성공?");

				},
				error : function(){
					console.log("뭐가 문제일까?");
				}
			})
			
		}
		function successBoard(result){
			var list = result.b;
			var listHtml = "";
			console.log(list);
			
				for(var i in list){
					var boardNo = list[i].boardNo;
					var boardTitle = list[i].boardTitle;
					var boardWriter = list[i].boardWriter;
					var regDate = list[i].regDate;
					var viewCnt = list[i].viewCnt;
					
					listHtml +="<tr>";
					listHtml +="<td>" + boardNo + "</td>";
					listHtml +="<td>" + boardTitle + "</td>";
					listHtml +="<td>" + boardWriter + "</td>";
					listHtml +="<td>" + regDate + "</td>";
					listHtml +="<td>" + viewCnt + "</td>";
					listHtml +="<tr>";
				
				}
			
			$('#listBody').append(listHtml);
		}
		
		
		//게시글 검색
	
			function searchButton(){						
					$.ajax({
						url : "/ajax/search",
						data : {
							keyword : $("#keyword").val(),
							condition : $("#condition").val()
						},
						dataType : "JSON" ,
						type : "POST" ,
						success : function(searchList){
							if(searchList == 0){
								$('#boardList').text('조회된 게시글이 없습니다.');
							}else{
								var input = "";
								for(var i in searchList){
									input += "<div id='boardL'>" +
											 "<div>no :</div>"+ 
									 		 "<div>"+ searchList[i].boardNo  + "</div>" +
									 		 "<div>&nbsp;&nbsp;제목 :"+ searchList[i].boardTitle  + "</div>" +
									 		 "<div>&nbsp;&nbsp;글쓴이 :"+ searchList[i].boardWriter  + "</div>" +
									 		 "<div>&nbsp;&nbsp;날짜 :"+ searchList[i].regDate  + "</div>" +
									 		 "<div>&nbsp;&nbsp;조회수 :"+ searchList[i].viewCnt  + "</div>" +
									 		 "</div>"	
								}
								console.log(input);
								$("#boardList").html(input);
							}
						}, error : function(){
							  console.log("게시글 못가져왔지롱~");
						}
						
					})

			}
			
			
			$(document).on("click", "#boardL", function(){
				
	            location.href="getContent.do?boardNo="+ $(this).children().eq(1).text();
				
			})
		
		
		
		
		
	
	</script>
</body>
</html>