
<%@ page import="sportvereinrgb.Sportart" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'sportart.label', default: 'Sportart')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'sportart.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="einheit" title="${message(code: 'sportart.einheit.label', default: 'Einheit')}" />
                        
                            <g:sortableColumn property="disziplien" title="${message(code: 'sportart.disziplien.label', default: 'Disziplien')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${sportartInstanceList}" status="i" var="sportartInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${sportartInstance.id}">${fieldValue(bean: sportartInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: sportartInstance, field: "einheit")}</td>
                        
                            <td>${fieldValue(bean: sportartInstance, field: "disziplien")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${sportartInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
