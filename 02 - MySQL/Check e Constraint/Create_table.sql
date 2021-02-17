-- CHECK(CONDIÇÃO) se a condição der falso cancelará retornando o erro.

CREATE TABLE ponto_turistico(
    id INT NOT NULL IDENTITY PRIMARY KEY,
    nome VARCHAR(50) NOT NULL DEFAULT '',
    populacao INT NOT NULL DEFAULT 0,
    tipo VARCHAR(20) CHECK(tipo IN('Atrativo','Serviço','Equipamento','Infraestrutura',
        'Instituição','Organização')),
    publicado CHAR(3) CHECK(publicado IN('Não','Sim')) NOT NULL DEFAULT 'Não'
);

-- Colocando as restrição com o CONSTRAINT

ALTER TABLE NFItens ADD CONSTRAINT qtd CHECK(qtd > 0),
    CONSTRAINT desconto CHECK(PrecoVenda * qtd > desconto);

-- Colocando duas chaves primaria porém eles não podem repetir juntas

ALTER TABLE nf ADD CONSTRAINT serieNumero PRIMARY(numero,serie)

-- O unique não permite que na tabela valor repedito

ALTER TABLE clientes ADD CONSTRAINT id PRIMARY KEY(id),
    CONSTRAINT cpf UNIQUE(cpf);
