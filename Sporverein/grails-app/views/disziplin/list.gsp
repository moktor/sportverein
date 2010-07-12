
<%@ page import="sportvereinrgb.Disziplin" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'disziplin.label', default: 'Disziplin')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'disziplin.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="disziplin" title="${message(code: 'disziplin.disziplin.label', default: 'Disziplin')}" />
                        
                            <g:sortableColumn property="einheit" title="${message(code: 'disziplin.einheit.label', default: 'Einheit')}" />
                        
                            <th><g:message code="disziplin.geschlechtHinzufuegen.label" default="Geschlecht" /></th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${disziplinInstanceList}" status="i" var="disziplinInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${disziplinInstance.id}">${fieldValue(bean: disziplinInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: disziplinInstance, field: "disziplin")}</td>
                        
                            <td>${fieldValue(bean: disziplinInstance, field: "einheit")}</td>
                        
                            <td>${fieldValue(bean: disziplinInstance, field: "geschlechtHinzufuegen")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${disziplinInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
