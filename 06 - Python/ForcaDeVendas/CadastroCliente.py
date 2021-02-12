from Clientes.cliente import Cliente
from factory.automacao import Automacao

class CadastrarCliente:
    def __init__(self):
        self.auto       = Automacao() 
        self.cliente   = Cliente()

    def iniciarAutomacao(self):
        print('-------------------- INICIADO AUTOMATIZAÇÃO --------------------')
        self.auto.Iniciar()
        self.auto.actionClick(1077,248)
        self.auto.actionClick(1274,615)

    def inicializarCadastro(self):
        print('-------------------- SELECIONAR O TIPO DE CADASTRO DO CLIENTE --------------------')
        tipoEntrada = input("1 -> Eu vou inserir \n2 -> Cliente CPF Padrão \n3 -> Cliente CNPJ Padrão \n\nDigite o número para fazer o teste automatizado?\n")
        if tipoEntrada == '2':
            print('Você selecionou a opção [2 -> Cliente CPF Padrão]\n')
            return self.cliente.cliente_CPF()

        if tipoEntrada == '3':
            print('Você selecionou a opção [3 -> Cliente CNPJ Padrão]\n')
            return self.cliente.cliente_CNPJ()

        print('Você selecionou a opção [1 -> Eu vou inserir]\n')
        self.cliente.cpf_cnpj           = input('Coloque o CPF/CNPJ:(EXEMPLO: 11111111111 )\n')
        self.cliente.inserirTipoPessoa()
        self.cliente.razao_social       = input('Coloque a Razão Social/ Nome Completo:(EXEMPLO: joao batista )\n')
        self.cliente.inscricao_estadual = input('Coloque a Inscrição Estadual:(EXEMPLO: 111111 )\n')
        self.cliente.contribuinte_icms  = input('Coloque o Contribuinte ICMS (0 - Contribuinte, 1 - Insento e 2 - Não contribuinte):(EXEMPLO: 1 )\n')
        self.cliente.data_fundacao      = input('Coloque a Data Fundação/Nascimento:(EXEMPLO: 01012021)\n')
        self.cliente.telefone           = input('Coloque o Telefone:(EXEMPLO: 6335714321)\n')
        self.cliente.celular            = input('Coloque o Celular:(EXEMPLO: 63991570845)\n')
        self.cliente.email              = input('Coloque o E-mail:(EXEMPLO: joao1@gmail.com)\n')
        self.cliente.cep                = input('Coloque o CEP:(EXEMPLO: 77270000)\n')
        self.cliente.endereco           = input('Coloque o Endereço:(EXEMPLO: rua joao batista )\n')
        self.cliente.numero             = input('Coloque o Número:(EXEMPLO: 12 )\n')
        self.cliente.bairro             = input('Coloque o Bairro:(EXEMPLO: bela vista )\n')
        self.cliente.uf                 = input('Coloque o UF:(EXEMPLO: to )\n')
        self.cliente.municipio          = input('Coloque o Munícipio:(EXEMPLO: palmas )\n')
        self.cliente.cod_municipio      = input('Coloque o Código do Munícipio:(EXEMPLO: 123456)\n')
        
        if self.cliente.tipo_pessoa == 0:
            self.cliente.rg                 = input('Coloque o RG:(EXEMPLO: 11111 )\n')
            self.cliente.sexo               = input('Coloque 0(ZERO) para masculino e 1(UM) para feminino:(EXEMPLO: 1 )\n')
        if self.cliente.tipo_pessoa == 1:
            self.cliente.nome_fantasia  = input('Coloque o Nome Fantasia:(EXEMPLO: mercado feliz sonho)\n')

        print('CADASTRO FINALIZADO!')
        return self.cliente
    
    def cadastrandoNoMobile(self):
        print('AUTOMAÇÃO INICIADA -> SELECIONANDO O TIPO PESSOA') 
        if self.cliente.tipo_pessoa == 0:
            self.PessoaFisica()
        else:
            self.PessoaJuridica()
        #GRAVAR
        self.auto.actionClick(1286,156)
        self.auto.alerta('Concluído o cadastro!')
        print('AUTOMAÇÃO FINALIZADA!') 

    def PessoaFisica(self): 
        print('AUTOMAÇÃO INICIADA -> CADASTRAR CLIENTE TIPO FISICA')       
        self.auto.actionWrite(self.cliente.cpf_cnpj)

        self.auto.actionClick(1160,333)
        self.auto.actionWrite(self.cliente.razao_social)

        if self.cliente.sexo == 1:
            self.auto.actionClick(1133,390)
            self.auto.actionClick(1133,435)

        if self.cliente.contribuinte_icms == 1:
            self.auto.actionClick(1110,435)
            self.auto.actionClick(1110,474)
        if self.cliente.contribuinte_icms == 2:
            self.auto.actionClick(1110,435)
            self.auto.actionClick(1110,512)
        
        self.auto.actionClick(1042,473)
        self.auto.actionWrite(self.cliente.rg)

        self.auto.actionClick(1090,517)
        self.auto.actionWrite(self.cliente.inscricao_estadual)

        self.auto.actionClick(1084,576)
        self.auto.actionWrite(self.cliente.data_fundacao)

        self.auto.actionClick(1092,625)
        self.auto.actionWrite(self.cliente.telefone)

        #Realizar a rolagem
        self.auto.moverTela(1107,620,236)

        self.auto.actionClick(1083,314)
        self.auto.actionWrite(self.cliente.celular)

        self.auto.actionClick(1084,359)
        self.auto.actionWrite(self.cliente.email)

        self.auto.actionClick(1094,399)
        self.auto.actionWrite(self.cliente.cep)

        self.auto.actionClick(1103,441)
        self.auto.actionWrite(self.cliente.endereco)

        self.auto.actionClick(1105,485)
        self.auto.actionWrite(self.cliente.numero)

        self.auto.actionClick(1113,530)
        self.auto.actionWrite(self.cliente.bairro)

        self.auto.actionClick(1145,565,2)
        self.auto.actionWrite(self.cliente.municipio)
        self.auto.actionClick(1145,211)

    def PessoaJuridica(self):
        print('AUTOMAÇÃO INICIADA -> CADASTRAR CLIENTE TIPO JURIDICA') 
        if self.cliente.tipo_pessoa == 1:
            self.auto.actionClick(1060,254)
            self.auto.actionClick(1045,302)
            self.auto.actionClick(1036,290)
        
        self.auto.actionWrite(self.cliente.cpf_cnpj)

        self.auto.actionClick(1160,333)
        self.auto.actionWrite(self.cliente.razao_social)

        self.auto.actionClick(1160,381)
        self.auto.actionWrite(self.cliente.nome_fantasia)

        if self.cliente.contribuinte_icms == 1:
            self.auto.actionClick(1110,423)
            self.auto.actionClick(1110,474)
        if self.cliente.contribuinte_icms == 2:
            self.auto.actionClick(1110,423)
            self.auto.actionClick(1110,512)

        self.auto.actionClick(1090,467)
        self.auto.actionWrite(self.cliente.inscricao_estadual)

        self.auto.actionClick(1084,526)
        self.auto.actionWrite(self.cliente.data_fundacao)

        self.auto.actionClick(1092,584)
        self.auto.actionWrite(self.cliente.telefone)

        self.auto.actionClick(1083,628)
        self.auto.actionWrite(self.cliente.celular)

        #Realizar a rolagem
        self.auto.moverTela(1107,620,236)

        self.auto.actionClick(1084,306)
        self.auto.actionWrite(self.cliente.email)

        self.auto.actionClick(1094,355)
        self.auto.actionWrite(self.cliente.cep)
        self.auto.actionClick(1286,350)

        self.auto.actionClick(1094,398)
        self.auto.actionWrite(self.cliente.endereco)

        self.auto.actionClick(1094,443)
        self.auto.actionWrite(self.cliente.numero)

        self.auto.actionClick(1094,491)
        self.auto.actionWrite(self.cliente.bairro)
    
    pass