
<%@ page import="sportvereinrgb.Altersklasse" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'altersklasse.label', default: 'Altersklasse')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'altersklasse.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="altersklasse" title="${message(code: 'altersklasse.altersklasse.label', default: 'Altersklasse')}" />
                        
                            <th><g:message code="altersklasse.geschlechtHinzufuegen.label" default="Geschlecht" /></th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${altersklasseInstanceList}" status="i" var="altersklasseInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${altersklasseInstance.id}">${fieldValue(bean: altersklasseInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: altersklasseInstance, field: "altersklasse")}</td>
                        
                            <td>${fieldValue(bean: altersklasseInstance, field: "geschlechtHinzufuegen")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${altersklasseInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
