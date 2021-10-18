<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<header class="masthead-login">
    <div class="container position-relative">
        <div class="row justify-content-center">
            <div class="col-xl-6">
                <div class="text-center text-black">
                    <div class="button-wrap mb-5" style="position: relative;">
	                    <div id="btn-toggle"></div>
	                    <button type="button" class="togglebtn" onclick="login()">LOG IN</button>
	                    <button type="button" class="togglebtn" onclick="register()">REGISTER</button>
                	</div>
                	
                	<p style="color: tomato">${success_message }${login_message }</p>
                	<p id="register-msg" style="color: tomato">${message }</p>
                	
	                <form id="login" action="${pageContext.request.contextPath }/login" method="post">
	                    <input type="text" class="input-field" id="loginEmail" name="email" placeholder="User Email">
	                    <input type="password" class="input-field" id="loaginPassword" name="password" placeholder="Enter Password">
	                    <input type="checkbox" id="login-check"><span>Remember Password</span>
	                    <div style="display: block; margin-top: 50px;">
		                    <button type="submit" class="btn btn-primary">Login</button>
	                    </div>
	                </form>
	                
	                <form id="register" action="${pageContext.request.contextPath }/join" method="post">
	                    <input type="text" class="input-field" id="email" name="email" value="${member.email }" placeholder="User Email">
	                    <input type="password" class="input-field" id="password" name="password" placeholder="Enter Password">
	                    <input type="text" class="input-field" id="name" name="name" value="${member.name }" placeholder="User Name">
	                    <input type="text" class="input-field" id="phone" name="phone" value="${member.phone }" placeholder="Phone Number">
	                    <div style="display: block; margin-top: 50px;">
		                    <button type="submit" id="insertMember" class="btn btn-primary">Register</button>
	                    </div>
	                </form>
                </div>
            </div>
        </div>
    </div>
</header>
<section class="call-to-action-login text-white text-center">
    <div class="container position-relative">
        <div class="row justify-content-center">
            
        </div>
    </div>
</section>
<script type="text/javascript">
	var x = document.getElementById("login");
	var y = document.getElementById("register");
	var z = document.getElementById("btn-toggle");
	
	if(document.getElementById("register-msg").innerHTML != "") {
		x.style.display = "none";
		y.style.display = "block";
        z.style.left = "125px";
	}

    function login(){
        z.style.left = "0";
        x.style.display = "block";
        y.style.display = "none";
    }

    function register(){
        z.style.left = "125px";
        x.style.display = "none";
        y.style.display = "block";
    }
</script>

<script type="text/javascript">
$("#register").submit(function() {
	var emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var email = $("#email").val();
	if(email == "") {
		$("#register-msg").html("이메일을 입력해주세요");
		return false;
	} else if(!emailReg.test(email)) {
		$("#register-msg").html("이메일을 형식에 맞게 입력해주세요");
		return false;
	}
	
	var passwordReg = /^[A-Za-z0-9]{6,12}$/;
	var password = $("#password").val();
	if(password == "") {
		$("#register-msg").html("비밀번호를 입력해주세요");
		return false;
	} else if(!passwordReg.test(password)) {
		$("#register-msg").html("비밀번호는 숫자,영문자 포함 6~12자리로 입력해주세요");
		return false;
	}
	
	var phoneReg = /^\d{3}-\d{3,4}-\d{4}$/;
	var phone = $("#phone").val();
	if(phone == "") {
		$("#register-msg").html("전화번호를 입력해주세요");
		return false;
	} else if(!phoneReg.test(phone)) {
		$("#register-msg").html("전화번호를 형식에 맞게 입력해주세요. (-)포함");
		return false;
	}
	
	return true;
});

$("#login").submit(function() {
	var emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var email = $("#loginEmail").val();
	if(email == "") {
		$("#register-msg").html("이메일을 입력해주세요");
		return false;
	} 
	
	var passwordReg = /^[A-Za-z0-9]{6,12}$/;
	var password = $("#loaginPassword").val();
	if(password == "") {
		$("#register-msg").html("비밀번호를 입력해주세요");
		return false;
	}
	
	return true;
});
</script>