-- total de registros encontrado
SELECT COUNT(*) FROM veiculos;

-- total de registros encontrado sem repitir a marca
SELECT COUNT(DISTINCT(marca)) FROM veiculos;

-- retorna o total dos registro somando os valores encontrado.
SELECT SUM(valor) as total FROM veiculos;

-- retorna a media dos valores encontrado na consulta.
SELECT marca, AVG(valor) as media FROM veiculos;

