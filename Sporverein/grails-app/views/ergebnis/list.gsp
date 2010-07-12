
<%@ page import="sportvereinrgb.Ergebnis" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'ergebnis.label', default: 'Ergebnis')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="bestenliste" action="bestenliste"><g:message code="Bestenliste" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="bestenlistensportler" action="bestenlistensportler"><g:message code="Ergebnisse nach Sportler" args="[entityName]" /></g:link></span>
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'ergebnis.id.label', default: 'Id')}" />

                            <th><g:message code="ergebnis.sportlerHinzufuegen.label" default="Sportler" /></th>

                            <th><g:message code="ergebnis.turnierHinzufuegen.label" default="Turnier" /></th>

                            <th><g:message code="ergebnis.turnierHinzufuegen.label" default="Ort" /></th>

                            <th><g:message code="ergebnis.sportartAuswaehlen.label" default="Sportart" /></th>

                            <th><g:message code="ergebnis.altersklassehinzufüegen.label" default="Altersklasse" /></th>
                   	  
                            <g:sortableColumn property="ergebnisEintragen" title="${message(code: 'ergebnis.ergebnisEintragen.label', default: 'Ergebnis')}" />
                        
                         
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${ergebnisInstanceList}" status="i" var="ergebnisInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${ergebnisInstance.id}">${fieldValue(bean: ergebnisInstance, field: "id")}</g:link></td>

                            <td>${fieldValue(bean: ergebnisInstance, field: "sportlerHinzufuegen")}</td>

                            <td>${fieldValue(bean: ergebnisInstance, field: "turnierHinzufuegen")}</td>                            

                            <td>${fieldValue(bean: ergebnisInstance, field: "turnierHinzufuegen.ort")}</td>

                            <td>${fieldValue(bean: ergebnisInstance, field: "sportartAuswaehlen.disziplin")}</td>

                            <td>${fieldValue(bean: ergebnisInstance, field: "altersklassehinzufüegen")}</td>

                            <td>${fieldValue(bean: ergebnisInstance, field: "ergebnisEintragen")}</td>
                        
                           
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${ergebnisInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
