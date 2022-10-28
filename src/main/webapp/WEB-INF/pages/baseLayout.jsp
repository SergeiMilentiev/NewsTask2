<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<link href="<c:url value="${webappRoot}/resources/css/newsStyle.css"/>" />
<style type="text/css">
	/* for base layout */
html,body {
	height: 100%;
	width: 1000px;

}

* {
	margin: 0 auto;
}

.verticalcenter {
    text-align: center;
}

.page {
	border: solid 1px black;
	font: normal 100% Times New Roman, Verdana, Tahoma, sans-serif;
	height: 99%;
	min-width: 500px;
	min-height: 500px;
	position: relative;
	width: 1000px;
}

.header {
	border: solid 1px black;
	height: 110px;
	font-size : 24px;
	margin-left: -1px; 
	margin-right: -1px; 
	margin-top: -1px; 
}

.menu,.content {
	bottom: 20px;
	position: absolute;
	top: 110px;
 	overflow: auto; 
}

.menu {
	left: 0;
	width: 25%;
	font-size: 18px;
}

.content {
	left: 25%; 
	right: 0;
	
	padding-top: 5px;
	padding-bottom: 5px;
	padding-right: 5px;
 	padding-left: 10px; 
	
	border: solid 1px grey;
	
	margin-top: 5px;
	margin-bottom: 10px;
	margin-left: 10px;
	margin-right: 5px;
}

.footer {
	position: absolute;
	bottom: 0;
	left: 0;
	width: 1000px;
	height: 20px;
	border: solid 1px black;
	
	margin-left: -1px;
	margin-right: -1px;
	margin-bottom: -1px;
}

.clear {
	clear: both;
}

.registration {
	display: flex;
    align-items: center;
    -webkit-align-items: center;
    justify-content: center;
    height: auto;
    min-height: 500px;
    border: 2px;
    margin-bottom: 10px;
}

/* for menu */
 .menu-wrapper {
 	margin-top : 5px;
 	margin-left : 10px;
 
	background: LightGray;
	padding-left: 10px;
	
}

.menu-title {
	background: Gray;
	padding-top: 5px;
	padding-bottom: 5px;
	padding-left: 10px;
}

.list-menu-wrapper {
	background: White;
	line-height: 1.5;
	width: 80%;
	padding-top: 10px;
	padding-bottom: 20px;
	padding-left: 10px;
}

.list-menu-invisible-wrapper {
	padding-bottom: 5px;
	padding-left: 10px;
	padding-top: 0px;
	padding-right: 5px;
}

.menu-title-wrapper {
	padding-bottom: 5px;
	padding-left: 5px;
	padding-top: 5px;
} 

/* for header */
 .wrapper {
	margin-left: 20px;
	position: relative;
}

.newstitle {
	width: 550px;
	height: 110px;
	display: table-cell;
	vertical-align: middle;
	text-align: left;
	color: #353596;
	font-weight: bold;
}

.local-link {
	position: absolute;
	bottom: 10px;
	right: 20px;
	color: blue;
	font-size: 14px;
} 

/* for news list */
 .single-news-wrapper {
	margin-top: 15px;
}

.single-news-header-wrapper {
	width: 100%;
	border-style: double;
}

.news-title {
	width: 80%;
	float: left;
	text-align: left;
	padding-bottom: 10px;
	padding-top: 20px;
	padding-right: 5px;
	padding-left: 20px;
	word-break: break-all;
}

/*.news-date {
 	width: 10% float: right;
	text-align: right;
	padding-bottom: 5px;
	padding-top: 20px;
	padding-right: 30px;
	padding-left: 5px;
	text-decoration: underline;
} */

.news-content {
	word-break: break-all;
	text-align: left;
	padding-bottom: 5px;
	padding-top: 5px;
	padding-right: 25%;
	padding-left: 20px; 
}

.link-position {
	text-align: right;
	padding-right: 15px;
}

.body-title {
	text-align: left;
	margin-top: 10px;
	margin-left: 10px;
}

.delete-button{
	display: block;
	text-align: right;
	padding-top: 40px;
	padding-bottom: 20px;
	padding-right: 15px;
}

input[type="checkbox"]:checked ~.delete-button {
	display: block;
	text-align: right;
	padding-top: 40px;
	padding-bottom: 20px;
	padding-right: 15px;
}

.no-news{
	margin-top: 10px;
	text-align: center;
}
 
/* for view news */
 .news_text_format {
 margin: 0;
	width: 80%;
	text-align: left;
	word-break: break-all;
}

.word-breaker {
	word-break: break-all;
}

.space_around_view_text {
	padding-left: 10px;
	padding-top: 10px;
	padding-bottom: 10px;
}

.space_around_title_text {
	width: 20%;
	padding-left: 10px;
	padding-top: 10px;
	padding-bottom: 10px;
	color: Grey;
}

.first-view-button {
	width: 50px;
	position: relative;
	margin-top: 20px;
	left: 25px;
}

.second-view-button {
	width: 50px;
	position: relative;
	margin-top: 5px;
	left: 25px;
}

a:visited {
	color: #CC6600;
}

/* for add news  */
 .cancel-button {
	width: 40px;
	position: relative;
	bottom: 23px;
}

.save-button {
	width: 40px;
	position: relative;
	left: -90px;
}

.add-table-margin {
	margin-left: 20px;
	margin-top: 15px;
	margin-bottom: 20px;
}

.add-table-cell-space-top {
	margin-top: 5px;
	margin-bottom: 5px;
}

.add-table-cell-space-bottom {
	margin-top: 10px;
	margin-bottom: 10px;
}

.text-font {
	font: normal 100% Times New Roman;
}

.all_buttons_size {
    width: 80px;
}

/* more than one  */
.error-box{
	margin-top: 10px;
	text-align: center;	
}
</style>
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