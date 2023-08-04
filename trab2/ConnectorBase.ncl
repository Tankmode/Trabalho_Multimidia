<?xml version="1.0" encoding="ISO-8859-1"?>
<ncl id="composerConnBase" xmlns="http://www.ncl.org.br/NCL3.0/CausalConnectorProfile" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.ncl.org.br/NCL3.0/CausalConnectorProfile http://www.ncl.org.br/NCL3.0/profiles/NCL30CausalConnector.xsd">
	<!-- A sintaxe dos nomes dos conectores causais segue a seguinte terminologia:
     * Primeiro sao definidas as condicoes (conditions), sempre precedidas do termo "on";
       - onBegin: ao comecar a exibicao da ancora;
       - onEnd: ao terminar a exibicao da ancora;
       - onMouseSelection: ao ser selecionada a ancora pelo mouse;
       - onKeySelection: ao ser selecionada a ancora por uma chave do teclado(ou controle remoto);
       - etc.
     * Em seguida sao definidas as avaliacoes (assessments), sempre seguidas do termo $ e depois Test, 
       onde $ eh nulo ou um numeral qualquer para identificar papeis com mesmos testes de avaliacao;
       - TrNomeDaTransicao$Test: para testes efetuados sobre valores de tempos de transicao;
       - AttState$Test: para testes efetuados sobre valores de estado dos eventos;
       - AttRepeat$Test: para testes efetuados sobre valores do atributo repeat de um evento. 
       - AttOccurences$Test: para testes efetuados sobre valores do atributo occurences de um evento. 
       - AttNode$Test: para testes efetuados sobre valores de atributos dos nos. 
     * Sobre os comparadores para teste, a menos que explicitamente comentado, eh assumido "eq".
     * Apos sao definidas as acoes (actions);
     * Condicoes, avaliacoes e acoes sao sempre seguidas de 1 ou N: 
       - 1 significa que apenas um ator pode exercer aquele papel; 
       - N significa que qualquer numero de atores pode exercer o papel.
     * Sobre os qualificadores (qualifiers), a menos que explicitamente comentado, eh assumido:
       - Nos papeis "condition" e "assessment" o valor eh "any";
       - Nos papeis "action" o valor eh "all".
     * Quando mais de uma acao eh especificada, elas sao aplicadas em sequencia, a menos quando 
       comentado o contrario;
     * Acoes precedidas por "Delay" devem esperar o retardo especificado para serem disparadas.
-->
	<head>
		<connectorBase>
			<!--@doc Ativação:
			                Inicio de um nó de contexto, de alternativa ou 
			                de mídia (ou uma âncora de um nó de mídia) 
					 Ação:
			                Inicia N nós de contexto, de alternativa ou 
			                de mídia (ou uma âncora de um nó de mídia)
			 		-->
			<causalConnector id="onBeginStartN">
				<simpleCondition role="onBegin"/>
				<simpleAction role="start" max="unbounded" qualifier="par"/>
			</causalConnector>
			<!--@doc Ativação:
			                Seleção de um nó de contexto, de alternativa ou 
			                de mídia (ou uma âncora de um nó de mídia) com
			                a tecla $keyCode passada como parâmetro para o
			                conector
					 Ação:
			                Termina e inicia N nós de contexto, de alternativa 
			                ou de mídia (ou uma âncora de um nó de mídia) de 
			                forma sequencial
			 		-->
			<causalConnector id="onKeySelectionStopNStartN">
				<connectorParam name="keyCode"/>
				<simpleCondition role="onSelection" key="$keyCode"/>
				<compoundAction operator="seq">
					<simpleAction role="stop" max="unbounded" qualifier="seq"/>
					<simpleAction role="start" max="unbounded" qualifier="seq"/>
				</compoundAction>
			</causalConnector>
			<!--@doc Ativação:
			                Seleção de um nó de contexto, de alternativa ou 
			                de mídia (ou uma âncora de um nó de mídia) com
			                a tecla $keyCode passada como parâmetro para o
			                conector
					 Ação:
			                Termina N nós de contexto, de alternativa ou 
			                de mídia (ou uma âncora de um nó de mídia)
			 		-->
			<causalConnector id="onKeySelectionStopN">
				<connectorParam name="keyCode"/>
				<simpleCondition role="onSelection" key="$keyCode"/>
				<simpleAction role="stop" max="unbounded" qualifier="seq"/>
			</causalConnector>
			<!--@doc Ativação:
			                Termino de um nó de contexto, de alternativa ou 
			                de mídia (ou uma âncora de um nó de mídia) 
					 Ação:
			                Termina N nós de contexto, de alternativa ou 
			                de mídia (ou uma âncora de um nó de mídia)
			 		-->
			<causalConnector id="onEndStopN">
				<simpleCondition role="onEnd"/>
				<simpleAction role="stop" max="unbounded" qualifier="par"/>
			</causalConnector>
			<!--@doc Ativação:
			                Término de um nó de contexto, de alternativa ou de 
			                mídia (ou uma âncora de um nó de mídia) e o valor
			                da propriedade que assume o papel attNodeTest sendo
			                igual a $value (passado como parâmetro para o conector)
					 Ação:
			                Atribui o valor de $setValue (passado como parâmetro
			                para o conector) a N propriedades e termina N nós de 
			                contexto, de alternativa ou de mídia (ou uma âncora
			                de um nó de mídia) de forma sequencial
			 		-->
			<causalConnector id="onEndAttributionTestStopNStart">
				<connectorParam name="value"/>
				<compoundCondition operator="and">
					<simpleCondition role="onEndAttribution"/>
					<assessmentStatement comparator="eq">
						<attributeAssessment role="test" eventType="attribution" attributeType="nodeProperty"/>
						<valueAssessment value="$value"/>
					</assessmentStatement>
				</compoundCondition>
				<compoundAction operator="seq">
					<simpleAction role="stop" max="unbounded"/>
					<simpleAction role="start" max="unbounded"/>
				</compoundAction>
			</causalConnector>
		</connectorBase>
	</head>
</ncl>
