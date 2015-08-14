[#ftl]
<!DOCTYPE html>
<html id="ng-app" xmlns:ng="http://angularjs.org" data-ng-app="security" >

[#import "/spring.ftl" as spring/]

<head>
    <title>Login</title>
	[#include "../frame-head.ftl" /]
	
</head>
<body>
<div id="unauth">
<div id="main" class="container"  data-ng-controller="SecurityController as securityCtrl">
<div class="container-small">

	<!--
	 ! Logotipo
	 !-->
	<div class="clearfix text-center">
		<img src="/images/logo.png" alt="">
	</div>

	<div class="heading">

	</div>
	<script >
		var email = [#if email??]'${email}' [#else]''[/#if];
	</script>
    <div class="well well-lg">
		<form  name="form"  id="signup" action="/signup" method="POST">
		
			[#--
			 # CSRF
			 #--]
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			
			<div id="form-group-email" class="form-group">
				<label for="firstName">Email</label>
				<input type="email" name="principal" value="${form.principal}" required="true" placeholder="E-mail" class="form-control">
			</div>
			<div id="form-group-email" class="form-group">
				<label for="firstName">Primeiro nome</label>
				<input type="text" name="firstName" required="true" value="${form.firstName}"  placeholder="Primeiro nome" class="form-control">
			</div>
			<div id="form-group-email" class="form-group">
				<label for="lastName">Sobrenome</label>
				<input type="text" name="lastName" required="true" value="${form.lastName}" placeholder="Sobrenome" class="form-control">
			</div>
			<div id="form-group-cnpj" class="form-group">
				<label for="cnpj">CNPJ</label>
				<i class="fa fa-check" style="color:green;" data-ng-show="cnpjOk"></i>
				<i class="fa fa-close" style="color:red;" data-ng-show="!cnpjOk"></i>
				<input type="text" name="cnpj" required="true" data-ng-keyup="valideCNPJ(form.cnpj)" class="form-control" data-ui-mask="99.999.999/9999-99" data-ng-model="form.cnpj">
			</div>
			<br><div id="messages"></div>
			
			<button type="submit" class="btn btn-primary" style="width: 100%;" data-ng-disabled="!cnpjOk" >Confirmação de cadastro</button>

		</form>
	</div>
		
</div>
</div>

	[#include "../frame-foot.ftl" /]

</div>
</body>
</html>
