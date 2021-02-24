--retorna somente os estados que não forem repetidos.
SELECT DISTINCT(estados) FROM endereco;

-- retorna estados que tem a quantidade dos anderline '_'
SELECT estados FROM endereco WHERE estados LIKE '______'

-- retorna estados que termina com a letra A
SELECT estados FROM endereco WHERE estados LIKE '%a'

-- retorna estados que começa com a letra A
SELECT estados FROM endereco WHERE estados LIKE 'a%'

-- retorna estados que contém a letra A
SELECT estados FROM endereco WHERE estados LIKE '%a%'