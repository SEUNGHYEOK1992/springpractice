<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<style>

</style>
<body>
    <div class="container">
	<form id="join" method="post" action="/register">	
		<div class="Id">
			<input type="text" class="userId" name="userId" placeholder="아이디를 입력해주세요">
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
 <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
 <script type="text/javascript">

 </script>

</body>
