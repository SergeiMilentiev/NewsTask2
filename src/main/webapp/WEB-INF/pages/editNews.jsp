<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<fmt:setLocale value="${sessionScope.local}" />
<fmt:setBundle basename="localization.local" var="loc" />
<fmt:message bundle="${loc}" key="local.menu_title.name"
	var="news_menu" />
<fmt:message bundle="${loc}" key="local.view_news_label_news_title.name"
	var="news_title" />
<fmt:message bundle="${loc}" key="local.view_news_label_news_brief.name"
	var="news_brief" />	
<fmt:message bundle="${loc}" key="local.view_news_label_news_content.name"
	var="news_content" />	
<fmt:message bundle="${loc}" key="local.view_news_button_edit.name"
	var="edit_button" />	
<fmt:message bundle="${loc}" key="local.news_updated_message.name"
	var="news_updated" />	
<fmt:message bundle="${loc}" key="local.news_not_updated_message.name"
	var="news_not_updated" />	
<fmt:message bundle="${loc}" key="local.edit_news_title.name"
	var="edit_news_title" />		

<div class="body-title">
	<a href=baseLayout>${news_menu} >> </a> ${edit_news_title}
</div>

<div align="center">
	<form:form action="updateNews" modelAttribute="news" method="POST"> 
		<form:hidden path="idNews" />
		<div>
			<p>${news_title}</p>
			<p><form:input type="text" name="title" path="title" value="${news.title}" size=30 maxlength=150 required="required"/></p>
        
        	<p>${news_brief}</p>
			<p><form:input type="text" name="brief" path="briefNews" value="${news.briefNews}" size=30 maxlength=150 required="required"/></p>
       					
			<p>${news_content}</p>	
            <p><form:input name="content" path="content" size="100" height="350" required="required"/><c:out value="${news.content }" /></p>
  		</div>
  <div>
      <input type="submit" value="${edit_button}"/>
  </div>
  
  <c:if test = "${news_updated_status eq false}">
   	  <font color="red">
		  <c:out value="${news_not_updated}"/><br>
	  </font>
  </c:if>
  
  <c:if test = "${news_updated_status eq true}">
   	  <font color="green">
		  <c:out value="${news_updated}"/><br>
	  </font>
  </c:if>
  
	</form:form>  
</div>