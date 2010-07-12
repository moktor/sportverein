<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>Turnierverwaltung</title>
<!-- (en) Add your meta data here -->
<!-- (de) Fuegen Sie hier ihre Meta-Daten ein -->
       <link rel="stylesheet" href="${createLinkTo(dir:'css',file:'main.css')}" />
       <link rel="shortcut icon" href="${createLinkTo(dir:'images',file:'baerchen.ico')}" type="image/x-icon" />
<!--[if lte IE 7]>
<link href="css/patches/patch_2col_left_13.css" rel="stylesheet" type="text/css" />
<![endif]-->
</head>
<body>
<!-- skip link navigation -->
<ul id="skiplinks">
	<li><a class="skip" href="#nav">Skip to navigation (Press Enter).</a></li>
	<li><a class="skip" href="#col3">Skip to main content (Press Enter).</a></li>
</ul>

<div class="page_margins">
  <div class="page">
    <div id="header" role="banner">
      <div id="topnav" role="contentinfo">
        <span><a href="#">Login</a> | <a href="#">Contact</a> | <a href="#">Imprint</a></span>
      </div>
      <h1><center>Turnierverwaltung</center></h1>
    </div>
    <!-- begin: main navigation #nav -->

    </div>
    <!-- end: main navigation -->
    <!-- begin: main content area #main -->
    <div id="main">
      <!-- begin: #col1 - first float column -->
      <div id="col1" role="complementary">
        <div id="col1_content" class="clearfix">
          <h3>Hauptmenü:</h3>

	            <table width="200" border="1">

	              <g:each var="c" in="${grailsApplication.controllerClasses}">
                    <tr> <td class="controller"><g:link controller="${c.logicalPropertyName}">${c.name}</g:link></td> </tr>

	              </g:each>
	            </table>
     




        </div>
      </div>
      <!-- end: #col1 -->
      <!-- begin: #col3 static column -->
      <div id="col3" role="main">
        <div id="col3_content" class="clearfix">
  
		<g:layoutBody />


     



        </div>
        <div id="ie_clearing">&nbsp;</div>
        <!-- End: IE Column Clearing -->
      </div>
      <!-- end: #col3 -->
    </div>
    <!-- end: #main -->
    <!-- begin: #footer -->
    <div id="footer" role="contentinfo"><center> &copy; 2010 Proseminar Lehrstuhl Pernul, Universität Regensburg. Erstellung: Lehmann Jonas, Menges Florian, Schlegel Alexander, Scholer Ludwig </center></div>
    <!-- end: #footer -->
  </div>

<!-- full skiplink functionality in webkit browsers -->
<script src="../../yaml/core/js/yaml-focusfix.js" type="text/javascript"></script>
</body>
</html>
