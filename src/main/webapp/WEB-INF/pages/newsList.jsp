<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<fmt:setLocale value="${local}" />
<fmt:setBundle basename="localization.local" var="loc" />
<fmt:message bundle="${loc}" key="local.menu_title.name"
	var="menu_title" />
<fmt:message bundle="${loc}" key="local.menu_news_list_link.name"
	var="news_list" />
<fmt:message bundle="${loc}" key="local.view_news_button_edit.name"
	var="edit_news_button" />
<fmt:message bundle="${loc}" key="local.view_news_title.name"
	var="view_news_button" />
<fmt:message bundle="${loc}" key="local.view_news_button_delete.name"
	var="delete_button" />
<fmt:message bundle="${loc}" key="local.news_no_news.name"
	var="no_news" />

<div class="body-title">
	<a href="newsList">${menu_title} >> </a> ${news_list}
</div>

<form:form action="deleteNews" modelAttribute="news" method="get">
	<c:forEach var="news" items="${news}">
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
				<div class="news-link-to-wrapper">
					<div class="link-position">
						<c:url var="editNewsLink" value="editNews">
							<c:param name="id" value="${news.id}" />
						</c:url>
						<a href="${editNewsLink}">${edit_news_button}</a>&nbsp;
						
						<c:url var="viewNewsLink" value="viewNews">
							<c:param name="id" value="${news.id}" />
						</c:url>
						<a href="${viewNewsLink}">${view_news_button}</a>&nbsp;
   					    
   					    <c:if test="${role eq 'admin'}">
   					        <input type="checkbox" id="check" name="id" value="${news.id}" />
   					    </c:if>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
	<div class="delete-button">
		<c:if test="${not(news eq null) && role eq 'admin'}">
			<input	type="submit" value="${delete_button}" class="delete" onclick="if (!(confirm('Are you sure you want to delete this news?'))) return false" /><br />
		</c:if>
	</div>
	<div class="no-news">
		<c:if test="${news eq null}">
        	${no_news}
		</c:if>
	</div>
</form:form>
