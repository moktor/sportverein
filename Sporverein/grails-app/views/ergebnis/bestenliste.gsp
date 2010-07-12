

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="layout" content="main" />
  <g:set var="entityName" value="${message(code: 'ergebnis.label', default: 'Ergebnis')}" />
</head>
<body>

  <div class="nav">
    <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
    <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
    <span class="menuButton"><g:link class="bestenliste" action="bestenliste"><g:message code="Bestenliste" args="[entityName]" /></g:link></span>
    <span class="menuButton"><g:link class="bestenlistensportler" action="bestenlistensportler"><g:message code="Ergenisse nach Sportler" args="[entityName]" /></g:link></span>
  </div>
  <br>


<g:form action="bestenliste" method="post" >


  <g:select name="sportartAuswaehlen_id" from="${sportvereinrgb.Disziplin.list()}" optionKey="id" value="${flash.message}"  />
  <g:if test="${flash.message}"><div class="message">${flash.message}</div></g:if>



  <g:select name="altersklassehinzufüegen.id" from="${sportvereinrgb.Altersklasse.list()}" optionKey="id" value="${flash.message}"  />
  <g:if test="${flash.message}"><div class="message">message: ${flash.message}</div></g:if>


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
  <th><g:message code="ergebnis.sportlerHinzufuegen.label" default="Sportler" /></th>
<th><g:message code="ergebnis.turnierHinzufuegen.label" default="Turnier" /></th>
<g:sortableColumn property="ergebnisEintragen" title="${message(code: 'ergebnis.ergebnisEintragen.label', default: 'Ergebnis')}" />

</tr>
</thead>
<tbody>
<g:each in="${ergebnisInstanceList}" status="i" var="ergebnisInstance">
  <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
    <td><g:link action="show" id="${ergebnisInstance[1]}">${ergebnisInstance[1]}</g:link></td>
  <td>${ergebnisInstance[2]}</td>
  <td>${ergebnisInstance[3]}</td>
  <td>${ergebnisInstance[4]}</td>
  </tr>
</g:each>
</tbody>
</table>

</body>
</html>

