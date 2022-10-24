<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<link rel="stylesheet" type="text/css"
	href=<c:url value="/resources/css/newsStyle.css"/> />

<title>Main page</title>

</head>

<body>
	<div class="page">
		<div class="header">
			<c:import url="/WEB-INF/pages/header.jsp" />
		</div>

		<div class="base-layout-wrapper">
			<div class="menu">

				<c:if test="${not (user eq 'active')}">
				<div class="verticalcenter">
					<img src="/resources/images/image1.jpg" alt="HTML5 Icon" style="width:200px;height:350px;">
				</div>
				</c:if>
				<c:if test="${user eq 'active'}">
					<c:import url="/WEB-INF/pages/menu.jsp" />
				</c:if>
			</div>

		<div class="content">
				<c:if test="${not (user eq 'active')}">
     				<c:if test="${not (registration_status eq 'active')}">
     					<c:import url="/WEB-INF/pages/guestInfo.jsp" />
     				</c:if>
    				<c:if test="${(registration_status eq 'active')}">
     					<c:import url="/WEB-INF/jsp/registration.jsp" />
    				</c:if>
    			</c:if>
    			<c:if test="${user eq 'active'}">
     				<c:import url="/WEB-INF/pages/body.jsp" />
    			</c:if>
		</div>
		</div>

		<div class="footer">
			<c:import url="/WEB-INF/pages/footer.jsp" />
		</div>
	</div>
</body>
</html>