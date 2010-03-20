Feature: Cadastrar conta
	In order ter minhas contas cadastradas
	As a usuario do Simple Financial Control
	I want to cadastrar minhas contas
Scenario: cadastrar contas
	Given tenho que cadastrar uma conta
	When eu entro com o nome e a descricao da conta e o tipo de conta
	Then eu deveria ter a conta persistida no SFC