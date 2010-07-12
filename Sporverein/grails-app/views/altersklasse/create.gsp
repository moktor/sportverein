
<%@ page import="sportvereinrgb.Altersklasse" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'altersklasse.label', default: 'Altersklasse')}" />
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
            <g:hasErrors bean="${altersklasseInstance}">
            <div class="errors">
                <g:renderErrors bean="${altersklasseInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="altersklasse"><g:message code="altersklasse.altersklasse.label" default="Altersklasse" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: altersklasseInstance, field: 'altersklasse', 'errors')}">
                                    <g:textField name="altersklasse" maxlength="20" value="${altersklasseInstance?.altersklasse}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="geschlechtHinzufuegen"><g:message code="altersklasse.geschlechtHinzufuegen.label" default="Geschlecht" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: altersklasseInstance, field: 'geschlechtHinzufuegen', 'errors')}">
                                    <g:select name="geschlechtHinzufuegen.id" from="${sportvereinrgb.Geschlecht.list()}" optionKey="id" value="${altersklasseInstance?.geschlechtHinzufuegen?.id}"  />

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
