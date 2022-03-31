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
body, html {
	width:100%;
	height:100%;
}
.container {
	display:flex;
	flex-direction:row;	
	justify-content:center;
	text-align:center;
	height:50vh;
	margin-top:100px;
}
.container div {
	height:10vh;
}
.Id {

}
.Pw {
	display:flex;
	flex-direction:column;
}
.Name{
}
.Email {
}
#idChk {
	position: absolute;
	margin-left: 20px;
    padding: 10px;
}
input[type=text] {
    padding: 10px;
}
button {
    color: #444444;
    background: #F3F3F3;
    border: 1px #DADADA solid;
    padding: 5px 10px;
    border-radius: 2px;
    font-weight: bold;
    font-size: 9pt;
    outline: none;
}
button:hover {
	border: 1px #C6C6C6 solid;
    box-shadow: 1px 1px 1px #EAEAEA;
    color: #333333;
    background: #F7F7F7;
}
button:active {
	box-shadow: inset 1px 1px 1px #DFDFDF;   
}
.buttonWrapper {
	display:flex;
	flex-direction: row;
    text-align: center;
    justify-content: center;
}
</style>
<body>
    <div class="container">
		<form id="join" method="post" action="/register">	
			<div class="Id">
				<input type="text" id="userId" class="userId" name="userId" placeholder="아이디를 입력해주세요">
				<font id = "checkId" size="2"></font>
				<button type="button" id="idChk" onclick="idCheck(); return false;">중복확인</button>
			</div> 
			<div class="Name">
				<input type="text" class="userName" id="userName" name="userName" placeholder="이름을 입력해주세요">
			</div>
			<div class="Pw">
				<input type="text" class="userPwd" id="userPwd" name="userPwd" placeholder="비밀번호를 입력해주세요">
			</div>
			<div class="PwChk">
				<input type="text" class="userPwdChk" id="userPwdChk" name="userPwdChk" placeholder="비밀번호를 입력해주세요">
			</div>
			<div class="Email">
				<input type="text" class="Email" id="Email" name="Email" placeholder="이메일을 입력해주세요">
			</div>
    </div>
    <div class="buttonWrapper">
	    <button type="button" style="margin-right:20px; padding-left: 15px; padding-right: 15px;" onclick="fnSubmit(); return false;">가입</button>
	    <button type="button" style="margin-left: 20px; padding-right: 15px; padding-left: 15px;">취소</button>
    </div>
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
	
function fnSubmit() {
	var email_rule =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
	if ($("#userName").val() == null || $("#userName").val() == "") {
		alert("이름을 입력해주세요");
		$("#userName").focus();
		return false;
	}
	if ($("#userPwd").val() == null || $("#userPwd").val() == "") {
		alert("비밀번호를 입력해주세요");
		return false;
	}
	if ($("#userPwdChk").val() == null || $("#userPwdChk").val() == "") {
		alert("비밀번호를 입력해주세요");
		return false;
	}
	if ($("#userPwd").val() != $("#userPwdChk").val()) {
		alert("비밀번호가 일치하지 않습니다.");
		return false;
	}
	if (!email_rule.test($("#Email").val())) {
		alert("이메일 형식을 맞게 입력해주세요")
		$("#Email").focus();
		return false;
	}
	if (confirm("가입하시겠습니까?")) {
		$("#join").submit();
		return false;
	}
}

 </script>
</body>
