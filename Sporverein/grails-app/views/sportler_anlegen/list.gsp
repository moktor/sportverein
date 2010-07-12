
<%@ page import="sportvereinrgb.Sportler_anlegen" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'sportler_anlegen.label', default: 'Sportler_anlegen')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'sportler_anlegen.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="vorname" title="${message(code: 'sportler_anlegen.vorname.label', default: 'Vorname')}" />
                        
                            <g:sortableColumn property="nachname" title="${message(code: 'sportler_anlegen.nachname.label', default: 'Nachname')}" />
                        
                            <g:sortableColumn property="email" title="${message(code: 'sportler_anlegen.email.label', default: 'Email')}" />
                        
                            <g:sortableColumn property="strasseHausnummer" title="${message(code: 'sportler_anlegen.strasseHausnummer.label', default: 'Strasse Hausnummer')}" />
                        
                            <g:sortableColumn property="ort" title="${message(code: 'sportler_anlegen.ort.label', default: 'Ort')}" />

                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${sportler_anlegenInstanceList}" status="i" var="sportler_anlegenInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${sportler_anlegenInstance.id}">${fieldValue(bean: sportler_anlegenInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: sportler_anlegenInstance, field: "vorname")}</td>
                        
                            <td>${fieldValue(bean: sportler_anlegenInstance, field: "nachname")}</td>
                        
                            <td>${fieldValue(bean: sportler_anlegenInstance, field: "email")}</td>
                        
                            <td>${fieldValue(bean: sportler_anlegenInstance, field: "strasseHausnummer")}</td>
                        
                            <td>${fieldValue(bean: sportler_anlegenInstance, field: "ort")}</td>

                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${sportler_anlegenInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
