-- LEFT OUTER JOIN - retornará todos os campos da tabela da esquerda(cliente)  
-- e a direita(municipio) irá retorna pelo relacionamento.
SELECT id_cliente, nome_cliente, nome_municipio, uf_municipio
    FROM cliente as c LEFT OUTER JOIN municipio as m
    ON ( c.id_municipio = m.id_municipio );

-- RIGHT OUTER JOIN - retornará todos os campos da tabela da direita(municipio) 
-- e a esquerda(cliente) irá retorna pelo relacionamento.
SELECT id_cliente, nome_cliente, nome_municipio, uf_municipio
    FROM cliente as c RIGHT OUTER JOIN municipio as m
    ON ( c.id_municipio = m.id_municipio );

-- FULL OUTER JOIN - retornará todos os campos da duas tabelas
-- porém não é muito usado.