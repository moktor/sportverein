
<%@ page import="sportvereinrgb.Disziplin" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'disziplin.label', default: 'Disziplin')}" />
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
            <g:hasErrors bean="${disziplinInstance}">
            <div class="errors">
                <g:renderErrors bean="${disziplinInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="disziplin"><g:message code="disziplin.disziplin.label" default="Disziplin" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: disziplinInstance, field: 'disziplin', 'errors')}">
                                    <g:textField name="disziplin" maxlength="20" value="${disziplinInstance?.disziplin}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="einheit"><g:message code="disziplin.einheit.label" default="Einheit" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: disziplinInstance, field: 'einheit', 'errors')}">
                                    <g:textField name="einheit" maxlength="4" value="${disziplinInstance?.einheit}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="geschlechtHinzufuegen"><g:message code="disziplin.geschlechtHinzufuegen.label" default="Geschlecht" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: disziplinInstance, field: 'geschlechtHinzufuegen', 'errors')}">
                                    <g:select name="geschlechtHinzufuegen.id" from="${sportvereinrgb.Geschlecht.list()}" optionKey="id" value="${disziplinInstance?.geschlechtHinzufuegen?.id}"  />

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
