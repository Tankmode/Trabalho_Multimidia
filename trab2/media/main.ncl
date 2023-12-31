<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- Generated by NCL Eclipse -->
<ncl id="main" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
	<head>
		
		<!-- Base de transições usadas nos efeitos dos botões e das fotos -->
		<transitionBase>
			<transition id="inOut" type="fade" dur="0.5s"/>
		</transitionBase>
		
		<!-- Base de regiões divididas em região principal, e região inferior do menu de fotos -->
		<regionBase>
			<region id="rgFull" height="100%" width="100%">
				<region id="rgBt_It" height="8%" width="10.5%" top="4%" right="2%" />
				
				<region id="rgFoto" height="61.33%" width="69.5%" left="15.40%" top="6%" />
				
				<region id="rgMenu" height="30%" top="65%">
					
					
					<region id="rgBack" width="10%" height="35%" top="50%" left="3%"/>
					<region id="rgFor" width="10%" height="35%" top="50%" right="3%"/>	
					
					
					<region id="rgFoto1" width="14.77%" height="47.22%" top="42%" left="17.87%"/>
					<region id="rgFoto2" width="14.77%" height="47.22%" top="42%" left="34.65%"/>
					
					<region id="rgFoto3" width="14.77%" height="47.22%" top="42%" left="51.05%"/>
					<region id="rgFoto4" width="14.77%" height="47.22%" top="42%" left="67.75%"/>
				
				</region>
			</region>
		</regionBase>
		
		<!--Base de  descritores,definição do focusindex das fotos do menu -->
		<descriptorBase>
			<descriptor id="dsFundo" region="rgFull"/>
			<descriptor id="dsMenu" region="rgMenu"/>
			
			<descriptor id="dsBack" region="rgBack" transIn="inOut" transOut="inOut" />
			<descriptor id="dsFor" region="rgFor"  transOut="inOut" transIn="inOut"/>
		
			<descriptor id="dsFoto1m1" region="rgFoto1" focusIndex="1" transIn="inOut" transOut="inOut" moveRight="2"/>
			<descriptor id="dsFoto2m1" region="rgFoto2" focusIndex="2" transIn="inOut" transOut="inOut" moveLeft="1" moveRight="3"/>
			<descriptor id="dsFoto3m1" region="rgFoto3" focusIndex="3" transIn="inOut" transOut="inOut" moveLeft="2" moveRight="4"/>
			<descriptor id="dsFoto4m1" region="rgFoto4" focusIndex="4" transIn="inOut" transOut="inOut" moveLeft="3"/>
			<descriptor id="dsFoto1m2" region="rgFoto1" focusIndex="5" transIn="inOut" transOut="inOut" moveRight="6"/>
			<descriptor id="dsFoto2m2" region="rgFoto2" focusIndex="6" transIn="inOut" transOut="inOut" moveLeft="5" moveRight="7"/>
			<descriptor id="dsFoto3m2" region="rgFoto3" focusIndex="7" transIn="inOut" transOut="inOut" moveLeft="6" moveRight="8"/>
			<descriptor id="dsFoto4m2" region="rgFoto4" focusIndex="8" transIn="inOut" transOut="inOut" moveLeft="7"/>
			<descriptor id="dsFoto" region="rgFoto" transIn="inOut" />
			
		
		
			<descriptor id="dsBt_It" region="rgBt_It"  />
			<descriptor id="dsVid" region="rgFull"/>
			
		
		
		</descriptorBase>
		
		<!--Importação da Base de conectores -->
		<connectorBase>
			<importBase documentURI="ConnectorBase.ncl" alias="conn"/>
		</connectorBase>
	
	</head>
	
	<body id="Princ">
		<!--A porta de início da aplicação,video principal -->
		<port id="VideoPrincipal" component="Vid"/>
		
	
		<!--Definições de mídias usada no contexto principal-->
		<media id="Bt_Qt" descriptor="dsBt_It" src="media/botao_sair.png"/>
		<media id="Bt_It" descriptor="dsBt_It" src="media/botao_verfotos.png"/>
		<media id="Vid" src="media/video.mp4" descriptor="dsVid"/>
		<media id="Fundo" src="media/porta-retratos-quadrados.png" descriptor="dsFundo"/>
		
		
		
		<!--Nó que contém a variável que guarda o valor do focus no momento -->
		<media id="settings" type="application/x-ginga-settings">
			<property name="service.currentFocus"/>
		</media>
		
		
		
		<context id="menu1">
			<!--Menu das primeiras fotos-->
			<port id="port1" component="foto1m1"/>
			<port id="port12" component="st"/>
			
			
			
			
				
			<media id="btFor" src="media/botao_direito.png" descriptor="dsFor"  />	
			
			<!--Referência ao nó que guarda o valor de focusindex -->
			<media id="st" refer="settings" instance="instSame"/>
			
			
			<media id="foto1m1" src="media/01.jpg" descriptor="dsFoto1m1"/>
			<media id="foto2m1" src="media/02.jpg" descriptor="dsFoto2m1"/>
			<media id="foto3m1" src="media/03.jpg" descriptor="dsFoto3m1"/>
			<media id="foto4m1" src="media/04.jpg" descriptor="dsFoto4m1"/>
			
			<media id="ft1m1" src="media/01.jpg" descriptor="dsFoto"/>
			<media id="ft2m1" src="media/02.jpg" descriptor="dsFoto"/>
			<media id="ft3m1" src="media/03.jpg" descriptor="dsFoto"/>
			<media id="ft4m1" src="media/04.jpg" descriptor="dsFoto"/>
			
			
			
			
			<link xconnector="conn#onBeginStartN">
				<bind role="onBegin" component="foto1m1"/>
				<bind role="start" component="foto2m1"/>
				<bind role="start" component="foto3m1"/>
				<bind role="start" component="foto4m1"/>
				<bind role="start" component="btFor"/>
				<bind role="start" component="ft1m1"/>
			</link>
			
		
		
		
			<!--Link para verificar o valor do focusindex e mudar a foto que aparece acima do menu -->
			<link xconnector="conn#onEndAttributionTestStopNStart">
				<bind role="onEndAttribution" component="st" interface="service.currentFocus"/>
				<bind role="stop" component="ft2m1"/>
				<bind role="stop" component="ft3m1"/>
				<bind role="stop" component="ft4m1"/>
				<bind role="start" component="ft1m1" descriptor="dsFoto"/>
				<bind role="test" component="st" interface="service.currentFocus">
					<bindParam name="value" value="1"/>
				</bind>
			</link>
			
			<link xconnector="conn#onEndAttributionTestStopNStart">
				<bind role="onEndAttribution" component="st" interface="service.currentFocus"/>
				<bind role="stop" component="ft1m1"/>
				<bind role="stop" component="ft3m1"/>
				<bind role="stop" component="ft4m1"/>
				<bind role="start" component="ft2m1" descriptor="dsFoto"/>
				<bind role="test" component="st" interface="service.currentFocus">
					<bindParam name="value" value="2"/>
				</bind>
			</link>
			
			<link xconnector="conn#onEndAttributionTestStopNStart">
				<bind role="onEndAttribution" component="st" interface="service.currentFocus"/>
				<bind role="stop" component="ft2m1"/>
				<bind role="stop" component="ft4m1"/>
				<bind role="stop" component="ft1m1"/>
				<bind role="start" component="ft3m1" descriptor="dsFoto"/>
				<bind role="test" component="st" interface="service.currentFocus">
					<bindParam name="value" value="3"/>
				</bind>
			</link>
			
			<link xconnector="conn#onEndAttributionTestStopNStart">
				<bind role="onEndAttribution" component="st" interface="service.currentFocus"/>
				<bind role="stop" component="ft3m1"/>
				<bind role="stop" component="ft1m1"/>
				<bind role="stop" component="ft2m1"/>
				<bind role="start" component="ft4m1" descriptor="dsFoto"/>
				<bind role="test" component="st" interface="service.currentFocus">
					<bindParam name="value" value="4"/>
				</bind>
			</link>
		
		</context>
		
		<context id="menu2">
			<!--Menu das fotos restantes-->
			<port id="port2" component="foto1m2"/>
			<port id="port122" component="st2"/>
			
			<media id="st2" type="application/x-ginga-settings">
				<property name="service.currentFocus"/>
			</media>
			
			
			<media id="btBack" src="media/botao_esquerdo.png" descriptor="dsBack"  />
			
			<media id="foto1m2" src="media/60.jpg" descriptor="dsFoto1m2"/>
			<media id="foto2m2" src="media/61.jpg" descriptor="dsFoto2m2"/>
			<media id="foto3m2" src="media/62.jpg" descriptor="dsFoto3m2"/>
			<media id="foto4m2" src="media/63.jpg" descriptor="dsFoto4m2"/>
			
			<media id="ft1m2" src="media/60.jpg" descriptor="dsFoto"/>
			<media id="ft2m2" src="media/61.jpg" descriptor="dsFoto"/>
			<media id="ft3m2" src="media/62.jpg" descriptor="dsFoto"/>
			<media id="ft4m2" src="media/63.jpg" descriptor="dsFoto"/>
			
			<link xconnector="conn#onBeginStartN">
				<bind role="onBegin" component="foto1m2"/>
				<bind role="start" component="foto2m2"/>
				<bind role="start" component="foto3m2"/>
				<bind role="start" component="foto4m2"/>
				<bind role="start" component="btBack"/>
				<bind role="start" component="ft1m2"/>
			</link>
			
			<link xconnector="conn#onEndAttributionTestStopNStart">
				<bind role="onEndAttribution" component="st2" interface="service.currentFocus"/>
				<bind role="stop" component="ft2m2"/>
				<bind role="stop" component="ft3m2"/>
				<bind role="stop" component="ft4m2"/>
				<bind role="start" component="ft1m2" descriptor="dsFoto"/>
				<bind role="test" component="st2" interface="service.currentFocus">
					<bindParam name="value" value="5"/>
				</bind>
			</link>
			
			<link xconnector="conn#onEndAttributionTestStopNStart">
				<bind role="onEndAttribution" component="st2" interface="service.currentFocus"/>
				<bind role="stop" component="ft1m2"/>
				<bind role="stop" component="ft3m2"/>
				<bind role="stop" component="ft4m2"/>
				<bind role="start" component="ft2m2" descriptor="dsFoto"/>
				<bind role="test" component="st2" interface="service.currentFocus">
					<bindParam name="value" value="6"/>
				</bind>
			</link>
			
			<link xconnector="conn#onEndAttributionTestStopNStart">
				<bind role="onEndAttribution" component="st2" interface="service.currentFocus"/>
				<bind role="stop" component="ft2m2"/>
				<bind role="stop" component="ft1m2"/>
				<bind role="stop" component="ft4m2"/>
				<bind role="start" component="ft3m2" descriptor="dsFoto"/>
				<bind role="test" component="st2" interface="service.currentFocus">
					<bindParam name="value" value="7"/>
				</bind>
			</link>
			
			<link xconnector="conn#onEndAttributionTestStopNStart">
				<bind role="onEndAttribution" component="st2" interface="service.currentFocus"/>
				<bind role="stop" component="ft3m2"/>
				<bind role="stop" component="ft1m2"/>
				<bind role="stop" component="ft2m2"/>
				<bind role="start" component="ft4m2" descriptor="dsFoto"/>
				<bind role="test" component="st2" interface="service.currentFocus">
					<bindParam name="value" value="8"/>
				</bind>
			</link>
		
		</context>
		
	

		
		
	
	
		<link xconnector="conn#onBeginStartN">
			<bind role="onBegin" component="Vid"/>
			<bind role="start" component="Bt_It"/>
		</link>
		
		
		<!--Quando o botão de interação é ativado, o album aparece por cima do video -->
		<link xconnector="conn#onKeySelectionStopNStartN">
			<bind role="onSelection" component="Bt_It">
				<bindParam name="keyCode" value="RED"/>
			</bind>
			<bind role="stop" component="Bt_It"/>
			
			<bind role="start" component="Fundo"/>
			<bind role="start" component="menu1"/>
			<bind role="start" component="Bt_Qt"/>
			
		</link>
		
		
		
		
		<!-- Sair da aplicação e continuar vendo o video -->
		<link xconnector="conn#onKeySelectionStopN">
			<bind role="onSelection" component="Bt_Qt">
				<bindParam name="keyCode" value="YELLOW"/>
			</bind>
			<bind role="stop" component="menu1"/>
			<bind role="stop" component="menu2"/>
			<bind role="stop" component="Fundo"/>
			<bind role="stop" component="Bt_Qt"/>
		</link>
		
		<!-- Quando o video termina, toda a aplicação termina -->
		<link xconnector="conn#onEndStopN">
			<bind role="onEnd" component="Vid"/>
			<bind role="stop" component="menu1"/>
			<bind role="stop" component="menu2"/>
			<bind role="stop" component="Fundo"/>
			<bind role="stop" component="Bt_Qt"/>
		</link>
		
		
		<!--Passa do menu 1 para o menu 2 -->
		<link xconnector="conn#onKeySelectionStopNStartN">
			<bind role="onSelection" component="Fundo">
				<bindParam name="keyCode" value="BLUE"/>
			</bind>
			<bind role="stop" component="menu1"/>
			<bind role="start" component="menu2"/>
		</link>
		<!-- Volta do menu 2 par ao menu 1 -->
		<link xconnector="conn#onKeySelectionStopNStartN">
			<bind role="onSelection" component="Fundo">
				<bindParam name="keyCode" value="RED"/>
			</bind>
			<bind role="stop" component="menu2"/>
			<bind role="start" component="menu1"/>
		</link>
		
		
	
	</body>
</ncl>
