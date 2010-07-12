
<%@ page import="sportvereinrgb.Ergebnis" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'ergebnis.label', default: 'Ergebnis')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>



      <g:javascript library="jquery" />

      <g:javascript>


        function get(nameField){
   var baseUrl = "${createLink(controller:'sportler', action:'ajaxGetSportler')}";

   var tmp = $("#" + nameField + "Nachname");
   var tmpNachname = tmp[0].value;

   $.ajax({
       url: baseUrl,
       dataType: 'json',
       type: 'GET',
       data: ({
           nachname: tmpNachname
       }),
       success: function(data) {
           update(data, nameField);
       }
   });
}

        function update(json, nameField){

        var sportlerListe = json;
        var tmpResult = "";

 for(var i=0;i<sportlerListe.length;i++)
   {
     var sportler = sportlerListe[i];
     <!-- alert ("dinge");   -->

   tmpResult = tmpResult + "<input type=\'radio\' name=\'sportlerHinzufuegen.id\' id=\'sportlerHinzufuegen.id\' value=\'"+sportler.id+"\'> " +sportler.nachname+" , "+sportler.vorname+" <br/>";

   <!-- buttonContainer.innerHTML = "test"; -->
 }

if (tmpResult == "") {

       alert("Name nicht gefunden");
       }
        var output = $("#buttonContainer");
          //output.innerHTML = sportler.nachname + ", " + sportler.vorname;
          output[0].innerHTML = tmpResult;
          var hiddenField = $(nameField + ".id");
          sportler.id == null ? hiddenField.value = -1 : hiddenField.value = sportler.id
        }




        function validate(){
          if( $F("sportlerHinzufuegen.id") == -1 ){
            alert("Please supply a valid Name")
            return false
          }



          return true
        }


      </g:javascript>




        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="bestenliste" action="bestenliste"><g:message code="Bestenliste" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="bestenlistensportler" action="bestenlistensportler"><g:message code="Ergebnisse nach Sportler" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${ergebnisInstance}">
            <div class="errors">
                <g:renderErrors bean="${ergebnisInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="sportlerHinzufuegen"><g:message code="ergebnis.sportlerHinzufuegen.label" default="Sportler" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ergebnisInstance, field: 'sportlerHinzufuegen', 'errors')}">

<div id="sportlerHinzufuegenText">[Nachname Eingeben]</div>
<input type="text" name="sportlerHinzufuegenNachname" id="sportlerHinzufuegenNachname"/>
<input type="button" value="Find" onClick="get('sportlerHinzufuegen')"/>
<div id="buttonContainer">

 <!-- hier inhalt von radiobuttons -->

</div



                            <!-- >
                            <g:select name="sportlerHinzufuegen.id" from="${sportvereinrgb.Sportler.list()}" optionKey="id" value="${ergebnisInstance?.sportlerHinzufuegen?.id}"  />
                            < -->

                                </td>
                            </tr>


                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="turnierHinzufuegen"><g:message code="ergebnis.turnierHinzufuegen.label" default="Turnier" /></label>
                                </td>
                                  <td valign="top" class="value ${hasErrors(bean: ergebnisInstance, field: 'turnierHinzufuegen', 'errors')}">
                                    <g:select name="turnierHinzufuegen.id" from="${sportvereinrgb.Turnier.list()}" optionKey="id" value="${ergebnisInstance?.turnierHinzufuegen?.id}"  />

                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="altersklassehinzufüegen"><g:message code="ergebnis.altersklassehinzufüegen.label" default="Altersklasse" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ergebnisInstance, field: 'altersklassehinzufüegen', 'errors')}">
                                    <g:select name="altersklassehinzufüegen.id" from="${sportvereinrgb.Altersklasse.list()}" optionKey="id" value="${ergebnisInstance?.altersklassehinzufüegen?.id}"  />

                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="sportartAuswaehlen"><g:message code="ergebnis.sportartAuswaehlen.label" default="Sportart" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ergebnisInstance, field: 'sportartAuswaehlen', 'errors')}">
                                    <g:select name="sportartAuswaehlen.id" from="${sportvereinrgb.Disziplin.list()}" optionKey="id" value="${ergebnisInstance?.sportartAuswaehlen?.id}"  />

                                </td>
                            </tr>


                           

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="ergebnisEintragen"><g:message code="ergebnis.ergebnisEintragen.label" default="Ergebnis" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ergebnisInstance, field: 'ergebnisEintragen', 'errors')}">
                                    <g:textField name="ergebnisEintragen" value="${ergebnisInstance?.ergebnisEintragen}" />

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
