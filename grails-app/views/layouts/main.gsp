<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">

        <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" rel="stylesheet">
        %{--<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap-theme.min.css')}" rel="stylesheet">--}%

		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
		<g:layoutHead/>
		<r:layoutResources />

	</head>
	<body>
		<div id="grailsLogo" role="banner"><a href="${ createLink(uri: '/') }"><img src="${resource(dir: 'images', file: 'sinasan_logo.png')}" alt="Grails"/></a></div>

        <nav class="navbar navbar-default">

            <button class="navbar-toggle" data-toggle="collapse" data-target=".navHeaderCollapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>

            <div id="navbar" class="navbar-collapse collapse navHeaderCollapse" style="padding: 0">
                <ul class="nav navbar-nav">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse" style="float: right; display: none"></button>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Administração<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><g:link controller="estado"> <g:message code="estado.label" /> </g:link></li>
                            <li><g:link controller="municipio"> <g:message code="municipio.label" /> </g:link></li>
                            <li><g:link controller="grupoSanguineo"> <g:message code="grupoSanguineo.label" /> </g:link></li>
                            <li><g:link controller="sexo"> <g:message code="sexo.label" /> </g:link></li>
                            <li><g:link controller="perfil"> <g:message code="perfil.label" /> </g:link></li>
                            <li><g:link controller="usuario"> <g:message code="usuario.label" /> </g:link></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Agentes<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><g:link controller="hospital"> <g:message code="hospital.label" /> </g:link></li>
                            <li><g:link controller="unidadeHospitalar"> <g:message code="unidadeHospitalar.label" /> </g:link></li>
                            <li><g:link controller="laboratorio"> <g:message code="laboratorio.label" /> </g:link></li>
                            <li><g:link controller="unidadeLaboratorial"> <g:message code="unidadeLaboratorial.label" /> </g:link></li>
                        </ul>
                    </li>

                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Doações<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><g:link controller="doacao"> <g:message code="doacao.label" /> </g:link></li>
                            <li><g:link controller="doador"> <g:message code="doador.label" /> </g:link></li>
                            <li><g:link controller="bolsaSangue"> <g:message code="bolsaSangue.label" /> </g:link></li>
                        </ul>
                    </li>

                </ul>
            </div>
        </nav>

		<g:layoutBody/>
		<div class="footer_grails" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		<r:layoutResources />
        <script src="${resource(dir: 'js', file: 'jquery-1.12.4.min.js')}" type="text/javascript"></script>
        <script src="${resource(dir: 'js', file: 'bootstrap.min.js')}" type="text/javascript"></script>


	</body>
</html>
