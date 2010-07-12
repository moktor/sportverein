
<%@ page import="sportvereinrgb.Sportler" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'sportler.label', default: 'Sportler')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'sportler.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="vorname" title="${message(code: 'sportler.vorname.label', default: 'Vorname')}" />
                        
                            <g:sortableColumn property="nachname" title="${message(code: 'sportler.nachname.label', default: 'Nachname')}" />
                        
                            <g:sortableColumn property="email" title="${message(code: 'sportler.email.label', default: 'Email')}" />
                        
                            <g:sortableColumn property="strasseHausnummer" title="${message(code: 'sportler.strasseHausnummer.label', default: 'Strasse Hausnummer')}" />
                        
                            <g:sortableColumn property="ort" title="${message(code: 'sportler.ort.label', default: 'Ort')}" />
                            
                            <g:sortableColumn property="gebDatum" format="yyyy-MM-dd" title="${message(code: 'sportler.geb_datum.label', default: 'Geb Datum')}" />

                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${sportlerInstanceList}" status="i" var="sportlerInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${sportlerInstance.id}">${fieldValue(bean: sportlerInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: sportlerInstance, field: "vorname")}</td>
                        
                            <td>${fieldValue(bean: sportlerInstance, field: "nachname")}</td>
                        
                            <td>${fieldValue(bean: sportlerInstance, field: "email")}</td>
                        
                            <td>${fieldValue(bean: sportlerInstance, field: "strasseHausnummer")}</td>
                        
                            <td>${fieldValue(bean: sportlerInstance, field: "ort")}</td>

                            <td><g:formatDate format="dd-MM-yyyy" date = "${fieldValue(bean: sportlerInstance, field: "gebDatum")}" /> </td>
                            
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${sportlerInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
