<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<fmt:setLocale value="${local}" />
<fmt:setBundle basename="localization.local" var="loc" />
<fmt:message bundle="${loc}" key="local.menu_title.name"
	var="menu_title" />
<fmt:message bundle="${loc}" key="local.quest_news_title.name"
	var="latest_news" />	
<fmt:message bundle="${loc}" key="local.news_no_news.name"
	var="no_news" />

<div class="body-title">
	<a href=baseLyaout>${menu_title}>> </a> ${latest_news}
</div>

<c:forEach var="news" items="${requestScope.news}">
	<div class="single-news-wrapper">
		<div class="single-news-header-wrapper">
			<div class="news-title">
				<c:out value="${news.title}" />
			</div>
			<div class="news-date">
				<c:out value="${news.newsDate}" />
			</div>

			<div class="news-content">
				<c:out value="${news.briefNews}" />
			</div>
		</div>
	</div>

</c:forEach>

<div class="no-news">
	<c:if test="${requestScope.news eq null}">
       ${no_news}
	</c:if>
</div>

