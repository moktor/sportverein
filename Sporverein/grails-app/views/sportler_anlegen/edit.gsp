
<%@ page import="sportvereinrgb.Sportler_anlegen" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'sportler_anlegen.label', default: 'Sportler_anlegen')}" />
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
            <g:hasErrors bean="${sportler_anlegenInstance}">
            <div class="errors">
                <g:renderErrors bean="${sportler_anlegenInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${sportler_anlegenInstance?.id}" />
                <g:hiddenField name="version" value="${sportler_anlegenInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="vorname"><g:message code="sportler_anlegen.vorname.label" default="Vorname" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sportler_anlegenInstance, field: 'vorname', 'errors')}">
                                    <g:textField name="vorname" maxlength="20" value="${sportler_anlegenInstance?.vorname}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nachname"><g:message code="sportler_anlegen.nachname.label" default="Nachname" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sportler_anlegenInstance, field: 'nachname', 'errors')}">
                                    <g:textField name="nachname" maxlength="20" value="${sportler_anlegenInstance?.nachname}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="email"><g:message code="sportler_anlegen.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sportler_anlegenInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${sportler_anlegenInstance?.email}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="strasseHausnummer"><g:message code="sportler_anlegen.strasseHausnummer.label" default="Strasse Hausnummer" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sportler_anlegenInstance, field: 'strasseHausnummer', 'errors')}">
                                    <g:textField name="strasseHausnummer" maxlength="20" value="${sportler_anlegenInstance?.strasseHausnummer}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="ort"><g:message code="sportler_anlegen.ort.label" default="Ort" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sportler_anlegenInstance, field: 'ort', 'errors')}">
                                    <g:textField name="ort" maxlength="20" value="${sportler_anlegenInstance?.ort}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="postleitzahl"><g:message code="sportler_anlegen.postleitzahl.label" default="Postleitzahl" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sportler_anlegenInstance, field: 'postleitzahl', 'errors')}">
                                    <g:textField name="postleitzahl" value="${fieldValue(bean: sportler_anlegenInstance, field: 'postleitzahl')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="gebDatum"><g:message code="sportler_anlegen.gebDatum.label" default="Geb Datum" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sportler_anlegenInstance, field: 'gebDatum', 'errors')}">
                                    <g:datePicker name="gebDatum" precision="day" value="${sportler_anlegenInstance?.gebDatum}"  />
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
