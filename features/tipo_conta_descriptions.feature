Feature: Cadastrar tipo de conta
	In order ter os tipos de conta cadastrados
	As a usuario do Simple Financial Control
	I want to cadastrar meus tipos de contas
Scenario: cadastrar tipos de conta
	Given tenho que cadastrar um tipo de conta
	When eu entro com o nome e a descricao do tipo de conta
	Then eu deveria ter o tipo conta persistida no SFC