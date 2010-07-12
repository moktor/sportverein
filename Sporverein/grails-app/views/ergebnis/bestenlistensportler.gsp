# To change this template, choose Tools | Templates
# and open the template in the editor.


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <title></title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="layout" content="main" />
  <g:set var="entityName" value="${message(code: 'ergebnis.label', default: 'Ergebnis')}" />
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
           <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="bestenliste" action="bestenliste"><g:message code="Bestenliste" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="bestenlistensportler" action="bestenlistensportler"><g:message code="Ergenisse nach Sportler" args="[entityName]" /></g:link></span>
       </div>
  <br>


<g:form action="bestenlistensportler" method="post" >

<div id="sportlerHinzufuegenText">[Type an Nachname]</div>
<input type="text" name="sportlerHinzufuegenNachname" id="sportlerHinzufuegenNachname"/>
<input type="button" value="Find" onClick="get('sportlerHinzufuegen')"/>
<div id="buttonContainer">
    <!--<g:select name="sportlerHinzufuegen.id" from="${sportvereinrgb.Sportler.list()}" optionKey="id" value="${flash.message}"  />
-->
</div
   <g:select name="sportartAuswaehlen_id" from="${sportvereinrgb.Disziplin.list()}" optionKey="id" value="${flash.message}"  />
  <!-- <g:if test="${flash.message}"><div class="message">${flash.message}</div></g:if>
-->


      <select name ="anzahl">
        <option value="5"> 5 Ergebnisse anzeigen</option>
        <option value="10"> 10 Ergebnisse anzeigen</option>
        <option value="15"> 15 Ergebnisse anzeigen</option>
        <option value="20"> 20 Ergebnisse anzeigen</option>
        <option value="25"> 25 Ergebnisse anzeigen</option>
      </select>

     <input type="submit" value="Auswahl bestätigen" />

</g:form>

<table>
                   <thead>
                       <tr>

                           <g:sortableColumn property="id" title="${message(code: 'ergebnis.id.label', default: 'Id')}" />

                           <th><g:message code="ergebnis.turnierHinzufuegen.label" default="Turnier" /></th>

                           <th><g:message code="ergebnis.turnierHinzufuegen.label" default="Ort" /></th>

                            <th><g:message code="ergebnis.altersklassehinzufüegen.label" default="Altersklasse" /></th>

                           <g:sortableColumn property="ergebnisEintragen" title="${message(code: 'ergebnis.ergebnisEintragen.label', default: 'Ergebnis')}" />



                       </tr>
                   </thead>
                   <tbody>
                   <g:each in="${ergebnisInstanceList}" status="i" var="ergebnisInstance">
                       <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                           <td><g:link action="show" id="${ergebnisInstance.id}">${fieldValue(bean: ergebnisInstance, field: "id")}</g:link></td>

                            <td>${fieldValue(bean: ergebnisInstance, field: "turnierHinzufuegen")}</td>

                            <td>${fieldValue(bean: ergebnisInstance, field: "turnierHinzufuegen.ort")}</td>

                            <td>${fieldValue(bean: ergebnisInstance, field: "altersklassehinzufüegen")}</td>

                           <td>${fieldValue(bean: ergebnisInstance, field: "ergebnisEintragen")}</td>

                           



                       </tr>
                   </g:each>
                   </tbody>
               </table>








  </body>
</html>
