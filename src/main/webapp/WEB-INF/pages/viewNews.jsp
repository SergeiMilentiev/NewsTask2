<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<fmt:setLocale value="${local}" />
<fmt:setBundle basename="localization.local" var="loc" />
<fmt:message bundle="${loc}" key="local.menu_title.name"
	var="news_menu" />
<fmt:message bundle="${loc}" key="local.view_news_title.name"
	var="view_news_title" />
<fmt:message bundle="${loc}" key="local.view_news_label_news_title.name"
	var="label_news_title" />
<fmt:message bundle="${loc}" key="local.view_news_label_news_date.name"
	var="label_news_date" />
<fmt:message bundle="${loc}" key="local.view_news_label_news_brief.name"
	var="label_news_brief" />
<fmt:message bundle="${loc}" key="local.view_news_label_news_content.name"
	var="label_news_content" />
<fmt:message bundle="${loc}" key="local.view_news_button_edit.name"
	var="button_edit" />
<fmt:message bundle="${loc}" key="local.view_news_button_delete.name"
	var="button_delete" />

<div class="body-title">
<c:url var="toNewsList" value="newsList">
		 <c:param name="id" value="${news.id}" />
	</c:url>
	<a href= "newsList">${news_menu} >> </a> ${view_news_title}
</div>

<div class="add-table-margin">
	<table class="news_text_format">
		<tr>
			<td class="space_around_title_text">${label_news_title}</td>

			<td class="space_around_view_text"><div class="word-breaker">
					<c:out value="${news.title }" />
				</div></td>
		</tr>
		<tr>
			<td class="space_around_title_text">${label_news_date}</td>

			<td class="space_around_view_text"><div class="word-breaker">
					<c:out value="${news.newsDate }" />
				</div></td>
		</tr>
		<tr>
			<td class="space_around_title_text">${label_news_brief}</td>
			<td class="space_around_view_text"><div class="word-breaker">
					<c:out value="${news.briefNews }" />
				</div></td>
		</tr>
		<tr>
			<td class="space_around_title_text">${label_news_content}</td>
			<td class="space_around_view_text"><div class="word-breaker">
					<c:out value="${news.content }" />
				</div></td>
		</tr>
	</table>
</div>


<c:if test="${role eq 'admin'}">
<div class="first-view-button">
	<c:url var="editNewsLink" value="editNews">
		 <c:param name="id" value="${news.id}" />
	</c:url>
	<a href="${editNewsLink}">${button_edit}</a>
</div>

<div class="second-view-button">
	<c:url var="deleteNewsLink" value="deleteNews">
		<c:param name="id" value="${news.id}" />
	</c:url>
	<a href="${deleteNewsLink}">${button_delete}</a>
</div>
</c:if>