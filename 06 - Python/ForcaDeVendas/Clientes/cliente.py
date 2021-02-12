class Cliente:
    def __init__(self):
        self.tipo_pessoa = 0
        self.cpf_cnpj = ''
        self.sexo = 0
        self.razao_social = ''
        self.nome_fantasia = ''
        self.rg = ''
        self.contribuinte_icms = 0
        self.inscricao_estadual = ''
        self.data_fundacao = ''
        self.telefone = ''
        self.celular = ''
        self.email = ''
        self.cep = ''
        self.endereco = ''
        self.numero = ''
        self.bairro = ''
        self.uf = ''
        self.municipio = ''
        self.cod_municipio = ''

    def toPrint(self):
        return 'Cliente ' + self.razao_social.upper + ' cadastrado! Iniciando a operação...'

    def inserirTipoPessoa(self):
        if len(self.cpf_cnpj) > 11:
            self.tipo_pessoa = 1
    
    def cliente_CPF(self):
        self.tipo_pessoa = 0
        self.cpf_cnpj = '34765151093'
        self.sexo = 0
        self.razao_social = 'Fulano Teste'
        self.nome_fantasia = ''
        self.rg = '11111'
        self.contribuinte_icms = 2
        self.inscricao_estadual = 'SSP-TO'
        self.data_fundacao = '30061986'
        self.telefone = '6335719498'
        self.celular = '63992575530'
        self.email = 'fulanoteste@gmail.com'
        self.cep = '77064704'
        self.endereco = 'Rua NC 14'
        self.numero = '14'
        self.bairro = 'Bela Vista'
        self.uf = 'TO'
        self.municipio = 'PALMAS'
        self.cod_municipio = '15682'

    def cliente_CNPJ(self):
        self.tipo_pessoa = 1
        self.cpf_cnpj = '06127497000190'
        self.razao_social = 'SUPERMERCADO DO POVO DESPESAS'
        self.nome_fantasia = 'SUPERMERCADO DO POVO DESPESAS'
        self.contribuinte_icms = 1
        self.inscricao_estadual = 'NAO CONTRIBUINTE'
        self.data_fundacao = '28042017'
        self.telefone = '6333811126'
        self.celular = '63991406666'
        self.email = 'teste@gmail.com'
        self.cep = '77305000'
        self.endereco = 'RUA CORONEL GUEDES S/N'
        self.numero = '0'
        self.bairro = 'CENTRO'
        self.municipio = 'PALMAS'
    pass
