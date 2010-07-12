
<%@ page import="sportvereinrgb.Sportler" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'sportler.label', default: 'Sportler')}" />
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
            <g:hasErrors bean="${sportlerInstance}">
            <div class="errors">
                <g:renderErrors bean="${sportlerInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>


                            

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="vorname"><g:message code="sportler.vorname.label" default="Vorname" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sportlerInstance, field: 'vorname', 'errors')}">
                                    <g:textField name="vorname" maxlength="20" value="${sportlerInstance?.vorname}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nachname"><g:message code="sportler.nachname.label" default="Nachname" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sportlerInstance, field: 'nachname', 'errors')}">
                                    <g:textField name="nachname" maxlength="20" value="${sportlerInstance?.nachname}" />

                                </td>
                            </tr>

                          <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="gebDatum"><g:message code="sportler.gebDatum.label" default="Geb Datum" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sportlerInstance, field: 'gebDatum', 'errors')}">
                                    <g:datePicker name="gebDatum" precision="day" value="${sportlerInstance?.gebDatum}"  />

                                </td>
                            </tr>

                           <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="geschlechtHinzufuegen"><g:message code="sportler.geschlechtHinzufuegen.label" default="Geschlecht" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sportlerInstance, field: 'geschlechtHinzufuegen', 'errors')}">
                                    <g:select name="geschlechtHinzufuegen.id" from="${sportvereinrgb.Geschlecht.list()}" optionKey="id" value="${sportlerInstance?.geschlechtHinzufuegen?.id}"  />

                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="email"><g:message code="sportler.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sportlerInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${sportlerInstance?.email}" />

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="strasseHausnummer"><g:message code="sportler.strasseHausnummer.label" default="Strasse Hausnummer" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sportlerInstance, field: 'strasseHausnummer', 'errors')}">
                                    <g:textField name="strasseHausnummer" maxlength="20" value="${sportlerInstance?.strasseHausnummer}" />

                                </td>
                            </tr>



                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="postleitzahl"><g:message code="sportler.postleitzahl.label" default="Postleitzahl" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sportlerInstance, field: 'postleitzahl', 'errors')}">
                                    <g:textField name="postleitzahl" value="${fieldValue(bean: sportlerInstance, field: 'postleitzahl')}" />

                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="ort"><g:message code="sportler.ort.label" default="Ort" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sportlerInstance, field: 'ort', 'errors')}">
                                    <g:textField name="ort" maxlength="20" value="${sportlerInstance?.ort}" />

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
