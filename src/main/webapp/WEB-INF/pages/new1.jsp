<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>
<html>
<meta charset="utf-8">
<!--<script>
function change_action1() {
	document.form1.setAttribute('action', "insert");
}

function change_action2() {
if(confirm("Are you sure to delete it?"))
	{
		document.form1.setAttribute('action', "delete");
		document.form1.submit();
	}	
	else
	{
		return false;
	}
}
</script>-->
<script>
function change_crab1() {
	document.form2.setAttribute('action', "insertcrab");
}

function change_crab2() {
if(confirm("Are you sure to delete it?"))
	{
		document.form2.setAttribute('action', "deletecrab");
		document.form2.submit();
	}	
	else
	{
		return false;
	}
}
</script>
<body>
	<h1>Title : ${title}</h1>
	<h1>Message : ${message}</h1>
	
	
	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<!-- For login user -->
    <!--<form id="form1" name="form1" method="post" action="delete">
	    <table width="500" border="1" cellspacing="0" cellpadding="0" style="border:1 px; border-collapse:collapse">
	        <tr>
	        	<td width="50">Select</td>
	            <td width="100">Name</td>
	            <td width="100">Password</td>
	            <td width="250">Email</td>
	        </tr>
		    <c:forEach items="${alluserinfo}" var="p">
		       <tr>
		        <td><input type="radio" name="check_radio" id="check_radio" value="${p.username}" /></td>
		        <td><c:out value="${p.username}"/></td>
		        <td><c:out value="${p.password}"/></td>
		        <td><c:out value="${p.email}"/></td>
		      </tr>
		    </c:forEach>
	    </table>
	    <br>
		<table width="500" border="0" cellspacing="0" cellpadding="0">
		  <tr>
		    <td width="250" align="center"><input type="submit" name="button" id="button" value="insert" OnClick="change_action1();"></td>
		    <td width="250" align="center"><input type="submit" name="button2" id="button2" value="delete"></td>
		  </tr>
		</table>
		<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
    </form>-->
     <form id="form2" name="form2" method="post" action="delete">
	    <table width="1000" border="1" cellspacing="0" cellpadding="0" style="border:1 px; border-collapse:collapse">
	        <tr>
	        	<td width="50">Select</td>
	            <td width="100">crabName</td>
	            <td width="100">crabSubject</td>
	            <td width="250">crabFeature</td>
	            <td width="250">crabHabits</td>
	            <td width="250">crabLocation</td>
	        </tr>
		    <c:forEach items="${allCrabinfo}" var="p">
		       <tr>
		        <td><input type="radio" name="check_radio" id="check_radio" value="${p.crab_ID}" /></td>
		        <td><c:out value="${p.crab_Name}"/></td>
		        <td><c:out value="${p.crab_Subject}"/></td>
		        <td><c:out value="${p.crab_Feature}"/></td>
		        <td><c:out value="${p.crab_Habits}"/></td>
		        <td><c:out value="${p.crab_Location}"/></td>
		      </tr>
		    </c:forEach>
	    </table>
	    <br>
		<table width="1000" border="0" cellspacing="0" cellpadding="0">
		  <tr>
		    <td width="250" align="center"><input type="submit" name="button" id="button" value="insert_crab" OnClick="change_crab1();"></td>
		    <td width="250" align="center"><input type="submit" name="button2" id="button2" value="delete_crab" OnClick="change_crab2();"~></td>
		  </tr>
		</table>
		<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
    </form>
    
		<c:url value="/j_spring_security_logout" var="logoutUrl" />
		<form action="${logoutUrl}" method="post" id="logoutForm">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		</form>
	    
		<script>
			function formSubmit() {
				document.getElementById("logoutForm").submit();
			}
		</script>

		<c:if test="${pageContext.request.userPrincipal.name != null}">
			<h2>
				User : ${pageContext.request.userPrincipal.name} | <a
					href="javascript:formSubmit()"> Logout</a>
			</h2>
		</c:if>


	</sec:authorize>

	<sec:authorize access="hasRole('ROLE_USER') and !hasRole('ROLE_ADMIN')">
		<!-- For login user -->
		<h1>User : ${useremail}</h1>
		<c:url value="/j_spring_security_logout" var="logoutUrl" />
		<form action="${logoutUrl}" method="post" id="logoutForm">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		</form>
	    
		<script>
			function formSubmit() {
				document.getElementById("logoutForm").submit();
			}
		</script>

		<c:if test="${pageContext.request.userPrincipal.name != null}">
			<h2>
				User : ${pageContext.request.userPrincipal.name} | <a
					href="javascript:formSubmit()"> Logout</a>
			</h2>
		</c:if>


	</sec:authorize>
</body>
</html>