
<%@ page import="sportvereinrgb.Ergebnis" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'ergebnis.label', default: 'Ergebnis')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="bestenliste" action="bestenliste"><g:message code="Bestenliste" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="bestenlistensportler" action="bestenlistensportler"><g:message code="Ergebnisse nach Sportler" args="[entityName]" /></g:link></span>
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
                            <td valign="top" class="name"><g:message code="ergebnis.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: ergebnisInstance, field: "id")}</td>
                            
                        </tr>
                    
                       
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="ergebnis.sportlerHinzufuegen.label" default="Sportler" /></td>
                            
                            <td valign="top" class="value"><g:link controller="sportler" action="show" id="${ergebnisInstance?.sportlerHinzufuegen?.id}">${ergebnisInstance?.sportlerHinzufuegen?.encodeAsHTML()}</g:link></td>
                            
                        </tr>


                         <tr class="prop">
                            <td valign="top" class="name"><g:message code="ergebnis.altersklassehinzufüegen.label" default="Altersklasse" /></td>

                            <td valign="top" class="value"><g:link controller="altersklasse" action="show" id="${ergebnisInstance?.altersklassehinzufüegen?.id}">${ergebnisInstance?.altersklassehinzufüegen?.encodeAsHTML()}</g:link></td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="ergebnis.sportartAuswaehlen.label" default="Sportart" /></td>
                            
                            <td valign="top" class="value"><g:link controller="disziplin" action="show" id="${ergebnisInstance?.sportartAuswaehlen?.id}">${ergebnisInstance?.sportartAuswaehlen?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="ergebnis.ergebnisEintragen.label" default="Ergebnis" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: ergebnisInstance, field: "ergebnisEintragen")}</td>
                            
                        </tr>
                    
                      
                   
                   
                       
                    
                        
                    
                     
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${ergebnisInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
