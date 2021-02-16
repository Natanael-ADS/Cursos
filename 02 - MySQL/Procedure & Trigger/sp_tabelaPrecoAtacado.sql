CREATE PROCEDURE sp_tabelaPrecoAtadado()
BEGIN
    -- DECLARAR VALORES
    DECLARE _existeProduto, _existeProdutosAtacados, _codInterno INT;
    DECLARE _codTabelaPreco INT DEFAULT 0;
    DECLARE _precoAtacado NUMERIC(16,2);
    DECLARE _nomeTabela, _dataHora VARCHAR;
    DECLARE _detalhesProdutos CURSOR FOR SELECT p.cod_interno, p.preco_varejo 
        FROM produtos AS p WHERE p.preco_varejo != 0.0;

    -- ATRIBUIR VALORES
    SET _nomeTabela = 'PREÇO ATACADO';
    SET _dataHora = NOW;
    SET _permitirDesconto = -1; -- NÃO
    SELECT COUNT(*) INTO _existeProduto FROM produtostabprecos WHERE descricao = _nomeTabela;
    SELECT COUNT(*) INTO _existeProdutosAtacados FROM produtos WHERE preco_varejo != 0.0;
    SELECT c.id INTO _codTabelaPreco FROM cadtabpreco AS c WHERE c.descricao = _nomeTabela; 
    
    -- VERIFICAÇÃO
    IF ( ( _codTabelaPreco = 0 ) OR ( _codTabelaPreco is NULL ) ) THEN
    BEGIN
        INSERT INTO cadtabpreco VALUES(0,_nomeTabela,_dataHora,_permitirDesconto);
        SELECT c.id INTO _codTabelaPreco FROM cadtabpreco AS c WHERE c.descricao = _nomeTabela;
    END IF;

    -- ATUALIZAR VALORES
    IF (( _existeProduto = 0 ) AND ( _existeProdutosAtacados > 0 )) THEN
    BEGIN
        OPEN _detalhesProdutos;
        loop1 : LOOP
            -- VERIFICAR SE ACABOU
            IF (_existeProdutosAtacados = 0) THEN
                leave loop1;
            END IF;

            -- ATRIBUINDO VALORES
            FETCH NEXT FROM _detalhesProdutos INTO _codInterno,_nome;

            -- DESINCREMENTANDO
            SET _existeProdutosAtacados = _existeProdutosAtacados - 1; 
            -- INSERINDO
            INSERT INTO produtostabprecos VALUES(0,);
        END LOOP loop1;
    END IF;

    -- MOSTRAR RESULTADO

END