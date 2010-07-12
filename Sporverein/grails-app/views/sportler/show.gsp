
<%@ page import="sportvereinrgb.Sportler" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'sportler.label', default: 'Sportler')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sportler.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: sportlerInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sportler.vorname.label" default="Vorname" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: sportlerInstance, field: "vorname")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sportler.nachname.label" default="Nachname" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: sportlerInstance, field: "nachname")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sportler.email.label" default="Email" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: sportlerInstance, field: "email")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sportler.strasseHausnummer.label" default="Strasse Hausnummer" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: sportlerInstance, field: "strasseHausnummer")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sportler.ort.label" default="Ort" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: sportlerInstance, field: "ort")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sportler.postleitzahl.label" default="Postleitzahl" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: sportlerInstance, field: "postleitzahl")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sportler.geschlechtHinzufuegen.label" default="Geschlecht" /></td>
                            
                            <td valign="top" class="value"><g:link controller="geschlecht" action="show" id="${sportlerInstance?.geschlechtHinzufuegen?.id}">${sportlerInstance?.geschlechtHinzufuegen?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="sportler.gebDatum.label" default="Geb Datum" /></td>
                            
                            <td valign="top" class="value"><g:formatDate format="dd-MM-yyyy" date="${sportlerInstance?.gebDatum}"  /></td>
                            
                        </tr>
                    
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${sportlerInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
