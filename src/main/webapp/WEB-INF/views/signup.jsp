<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
<script src="../resources/js/jquery-3.3.1.js"></script>
<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<link rel="stylesheet" href="../resources/css/board/boardRegister.css"/>
	<style>

	</style>
</head>

<style>

</style>
<body>
    <div class="container">
	<form id="join" method="post" action="/register">	
		<div class="Id">
			<input type="text" id="userId" class="userId" name="userId" placeholder="아이디를 입력해주세요">
			<font id = "checkId" size="2"></font>
			<button type="idChk" id="check" onclick="idCheck(); return false;">중복확인</button>
		</div> 
		<div class="Pw">
			<input type="text" class="userPwd" name="userPwd" placeholder="비밀번호를 입력해주세요">
		</div>
		<div class="Name">
			<input type="text" class="userName" name="userName" placeholder="이름을 입력해주세요">
		</div>
		<div class="Email">
			<input type="text" class="Email" name="Email" placeholder="이메일을 입력해주세요">
		</div>
    </div>
    <input type="submit" value="확인">   
    </form>
                
	
 <script type="text/javascript">
 function idCheck() {
	let userId = $("#userId").val();
	var submitObj = new Object();
	
	submitObj.userId = userId;
	$.ajax({
		url : "/idCnt",
		type : "POST",
		contentType : "application/json; charset-utf-8",
		data : JSON.stringify(submitObj),
		dataType:"json",
		success : function(resMap) {
			console.log("test");
			if (resMap.res == "ok") {
				console.log(resMap.res+"resMap.res");
				if (resMap.idCnt == 0) {
					alert("사용할 수 있는 아이디입니다.");
				} else {
					alert("중복된 아이디입니다.");
				} 
			}
		},
		error : function() {
			alert("요청실패");
		}
	});	 
 }
 </script>
</body>
