<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<fmt:setLocale value="${sessionScope.local}" />
<fmt:setBundle basename="localization.local" var="loc" />
<fmt:message bundle="${loc}" key="local.menu_title.name"
	var="menu_title" />
<fmt:message bundle="${loc}" key="local.menu_news_list_link.name"
	var="menu_news_list_link" />
<fmt:message bundle="${loc}" key="local.menu_add_news_link.name"
	var="menu_add_news_link" />


<div class="menu-wrapper">
	<div class="menu-title-wrapper">
		<div class="menu-title">
		       ${menu_title}
		</div>
	</div>

	<div class="list-menu-invisible-wrapper">
		<div class="list-menu-wrapper" style="float: right;">
			<ul style="list-style-image: url(images/img.jpg); text-align: left;">
				<li style="padding-left: 15px;">
					<a href="newsList">${menu_news_list_link}</a><br />
				</li>

				<c:if test="${role eq 'admin'}">
					<li style="padding-left: 15px;">
                		<c:url var="addLink" value="addNews"></c:url>
                		<a href="${addLink}">${menu_add_news_link}</a> <br />
					</li>
				</c:if>
			</ul>
		</div>
		<div class="clear"></div>
	</div>
	<div style="height: 25px;"></div>
</div>

