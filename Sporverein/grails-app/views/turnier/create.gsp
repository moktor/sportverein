
<%@ page import="sportvereinrgb.Turnier" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'turnier.label', default: 'Turnier')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${turnierInstance}">
            <div class="errors">
                <g:renderErrors bean="${turnierInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="turnier.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: turnierInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" maxlength="20" value="${turnierInstance?.name}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="startdatum"><g:message code="turnier.startdatum.label" default="Startdatum" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: turnierInstance, field: 'startdatum', 'errors')}">
                                    <g:datePicker name="startdatum" precision="day" value="${turnierInstance?.startdatum}"  />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="enddatum"><g:message code="turnier.enddatum.label" default="Enddatum" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: turnierInstance, field: 'enddatum', 'errors')}">
                                    <g:datePicker name="enddatum" precision="day" value="${turnierInstance?.enddatum}"  />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="ort"><g:message code="turnier.ort.label" default="Ort" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: turnierInstance, field: 'ort', 'errors')}">
                                    <g:textField name="ort" maxlength="20" value="${turnierInstance?.ort}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="beschaffenheit"><g:message code="turnier.beschaffenheit.label" default="Beschaffenheit" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: turnierInstance, field: 'beschaffenheit', 'errors')}">
                                    <g:textField name="beschaffenheit" maxlength="20" value="${turnierInstance?.beschaffenheit}" />

                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
