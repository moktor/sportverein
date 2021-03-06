
<%@ page import="sportvereinrgb.Turnier_anlegen" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'turnier_anlegen.label', default: 'Turnier_anlegen')}" />
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
            <g:hasErrors bean="${turnier_anlegenInstance}">
            <div class="errors">
                <g:renderErrors bean="${turnier_anlegenInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${turnier_anlegenInstance?.id}" />
                <g:hiddenField name="version" value="${turnier_anlegenInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="turnier_anlegen.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: turnier_anlegenInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" maxlength="20" value="${turnier_anlegenInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="startdatum"><g:message code="turnier_anlegen.startdatum.label" default="Startdatum" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: turnier_anlegenInstance, field: 'startdatum', 'errors')}">
                                    <g:datePicker name="startdatum" precision="day" value="${turnier_anlegenInstance?.startdatum}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="enddatum"><g:message code="turnier_anlegen.enddatum.label" default="Enddatum" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: turnier_anlegenInstance, field: 'enddatum', 'errors')}">
                                    <g:datePicker name="enddatum" precision="day" value="${turnier_anlegenInstance?.enddatum}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="ort"><g:message code="turnier_anlegen.ort.label" default="Ort" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: turnier_anlegenInstance, field: 'ort', 'errors')}">
                                    <g:textField name="ort" maxlength="20" value="${turnier_anlegenInstance?.ort}" />
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
