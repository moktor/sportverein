
<%@ page import="sportvereinrgb.Turnier_anlegen" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'turnier_anlegen.label', default: 'Turnier_anlegen')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'turnier_anlegen.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'turnier_anlegen.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="startdatum" title="${message(code: 'turnier_anlegen.startdatum.label', default: 'Startdatum')}" />
                        
                            <g:sortableColumn property="enddatum" title="${message(code: 'turnier_anlegen.enddatum.label', default: 'Enddatum')}" />
                        
                            <g:sortableColumn property="ort" title="${message(code: 'turnier_anlegen.ort.label', default: 'Ort')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${turnier_anlegenInstanceList}" status="i" var="turnier_anlegenInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${turnier_anlegenInstance.id}">${fieldValue(bean: turnier_anlegenInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: turnier_anlegenInstance, field: "name")}</td>
                        
                            <td><g:formatDate format="yyyy-MM-dd" date="${turnier_anlegenInstance.startdatum}" /></td>
                        
                            <td><g:formatDate format="yyyy-MM-dd" date="${turnier_anlegenInstance.enddatum}" /></td>
                        
                            <td>${fieldValue(bean: turnier_anlegenInstance, field: "ort")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${turnier_anlegenInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
