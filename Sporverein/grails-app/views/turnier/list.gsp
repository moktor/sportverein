
<%@ page import="sportvereinrgb.Turnier" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'turnier.label', default: 'Turnier')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'turnier.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'turnier.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="startdatum" title="${message(code: 'turnier.startdatum.label', default: 'Startdatum')}" />
                        
                            <g:sortableColumn property="enddatum" title="${message(code: 'turnier.enddatum.label', default: 'Enddatum')}" />
                        
                            <g:sortableColumn property="ort" title="${message(code: 'turnier.ort.label', default: 'Ort')}" />
                        
                            <g:sortableColumn property="beschaffenheit" title="${message(code: 'turnier.beschaffenheit.label', default: 'Beschaffenheit')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${turnierInstanceList}" status="i" var="turnierInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${turnierInstance.id}">${fieldValue(bean: turnierInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: turnierInstance, field: "name")}</td>
                        
                            <td><g:formatDate format="dd-MM-yyyy" date="${turnierInstance.startdatum}" /></td>
                        
                            <td><g:formatDate format="dd-MM-yyyy" date="${turnierInstance.enddatum}" /></td>
                        
                            <td>${fieldValue(bean: turnierInstance, field: "ort")}</td>
                        
                            <td>${fieldValue(bean: turnierInstance, field: "beschaffenheit")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${turnierInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
