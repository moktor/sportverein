
<%@ page import="sportvereinrgb.Ergebnis" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'ergebnis.label', default: 'Ergebnis')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${ergebnisInstance}">
            <div class="errors">
                <g:renderErrors bean="${ergebnisInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${ergebnisInstance?.id}" />
                <g:hiddenField name="version" value="${ergebnisInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>

                          <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="sportlerHinzufuegen"><g:message code="ergebnis.sportlerHinzufuegen.label" default="Sportler Hinzufuegen" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ergebnisInstance, field: 'sportlerHinzufuegen', 'errors')}">
                                    <g:select name="sportlerHinzufuegen.id" from="${sportvereinrgb.Sportler.list()}" optionKey="id" value="${ergebnisInstance?.sportlerHinzufuegen?.id}"  />

                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="turnierHinzufuegen"><g:message code="ergebnis.turnierHinzufuegen.label" default="Turnier Hinzufuegen" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ergebnisInstance, field: 'turnierHinzufuegen', 'errors')}">
                                    <g:select name="turnierHinzufuegen.id" from="${sportvereinrgb.Turnier.list()}" optionKey="id" value="${ergebnisInstance?.turnierHinzufuegen?.id}"  />

                                </td>
                            </tr>
                        
                            
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="sportartAuswaehlen"><g:message code="ergebnis.sportartAuswaehlen.label" default="Sportart Auswaehlen" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ergebnisInstance, field: 'sportartAuswaehlen', 'errors')}">
                                    <g:select name="sportartAuswaehlen.id" from="${sportvereinrgb.Disziplin.list()}" optionKey="id" value="${ergebnisInstance?.sportartAuswaehlen?.id}"  />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="ergebnisEintragen"><g:message code="ergebnis.ergebnisEintragen.label" default="Ergebnis Eintragen" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ergebnisInstance, field: 'ergebnisEintragen', 'errors')}">
                                    <g:textField name="ergebnisEintragen" value="${ergebnisInstance?.ergebnisEintragen}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="sortierWert"><g:message code="ergebnis.sortierWert.label" default="Sortier Wert" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ergebnisInstance, field: 'sortierWert', 'errors')}">
                                    <g:textField name="sortierWert" value="${fieldValue(bean: ergebnisInstance, field: 'sortierWert')}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="sportler"><g:message code="ergebnis.sportler.label" default="Sportler" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ergebnisInstance, field: 'sportler', 'errors')}">
                                    <g:select name="sportler" from="${sportvereinrgb.Sportler.list()}" multiple="yes" optionKey="id" size="5" value="${ergebnisInstance?.sportler*.id}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="turniere"><g:message code="ergebnis.turniere.label" default="Turniere" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ergebnisInstance, field: 'turniere', 'errors')}">
                                    <g:select name="turniere" from="${sportvereinrgb.Turnier.list()}" multiple="yes" optionKey="id" size="5" value="${ergebnisInstance?.turniere*.id}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="altersklassehinzufüegen"><g:message code="ergebnis.altersklassehinzufüegen.label" default="Altersklassehinzufüegen" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ergebnisInstance, field: 'altersklassehinzufüegen', 'errors')}">
                                    <g:select name="altersklassehinzufüegen.id" from="${sportvereinrgb.Altersklasse.list()}" optionKey="id" value="${ergebnisInstance?.altersklassehinzufüegen?.id}"  />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="disziplinen"><g:message code="ergebnis.disziplinen.label" default="Disziplinen" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ergebnisInstance, field: 'disziplinen', 'errors')}">
                                    <g:select name="disziplinen" from="${sportvereinrgb.Disziplin.list()}" multiple="yes" optionKey="id" size="5" value="${ergebnisInstance?.disziplinen*.id}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="altersklassen"><g:message code="ergebnis.altersklassen.label" default="Altersklassen" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ergebnisInstance, field: 'altersklassen', 'errors')}">
                                    <g:select name="altersklassen" from="${sportvereinrgb.Altersklasse.list()}" multiple="yes" optionKey="id" size="5" value="${ergebnisInstance?.altersklassen*.id}" />

                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
