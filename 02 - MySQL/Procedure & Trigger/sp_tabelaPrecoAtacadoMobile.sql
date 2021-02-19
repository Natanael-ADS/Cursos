CREATE PROCEDURE sp_tabelaPrecoAtacadoMobile( IN _codInterno INTEGER )
BEGIN
    -- USAR PRECO ATACADO
    -- DECLARAR VALORES
    DECLARE _existeProduto, _totalProdutosAtacados, _codTabelaPreco INT DEFAULT 0;
    DECLARE _usarPrecoAtacado,_permitirDesconto CHAR(2) DEFAULT '0';
    DECLARE _nomeTabela VARCHAR(50) DEFAULT '';
    DECLARE _precoAtacado NUMERIC(16,2);
    DECLARE _dataHora DATETIME;
    DECLARE _detalhesProdutos CURSOR FOR SELECT cod_interno, preco_varejo, data_ult_alteracao FROM produtos WHERE preco_varejo != 0.0;


    -- ATRIBUIR VALORES
    SET _nomeTabela = 'PREÇO ATACADO';
    SELECT c.id INTO _codTabelaPreco FROM cadtabpreco AS c WHERE c.descricao = _nomeTabela; 
    SELECT valor INTO _usarPrecoAtacado FROM parametros_sistema WHERE campo = 'precoatacadomobile';

    -- PERMISSÃO PARA EXECULTAR PROCEDIMENTO
    IF ( _usarPrecoAtacado LIKE '-1' ) THEN
        -- INICIANDO PRECEDIMENTO
        -- ATRIBUIR VALORES
        
        SET _dataHora = NOW();
        SELECT COUNT(*) INTO _totalProdutosAtacados FROM produtos WHERE preco_varejo != 0.0;
        SELECT valor INTO _permitirDesconto FROM parametros_sistema WHERE campo = 'permitirdescontoprecoatacadomobile';
        
        -- VERIFICAÇÃO
        IF ( ( _codTabelaPreco = 0 ) OR ( _codTabelaPreco is NULL ) ) THEN
            INSERT INTO cadtabpreco VALUES(0,_nomeTabela,_dataHora,_permitirDesconto);
            SELECT c.id INTO _codTabelaPreco FROM cadtabpreco AS c WHERE c.descricao = _nomeTabela;
        ELSE
            UPDATE cadtabpreco SET dataversaoregistro = _dataHora, permitirdesc = _permitirDesconto WHERE permitirdesc != _permitirDesconto AND descricao = _nomeTabela; 
        END IF;

        SELECT COUNT(*) INTO _existeProduto FROM produtostabprecos WHERE idtabpreco = _codTabelaPreco;
        IF ( ( _codInterno = 0 ) OR ( _existeProduto = 0 ) ) THEN
            -- ATUALIZAR TODOS OS PRODUTOS
            DELETE FROM produtostabprecos WHERE idtabpreco = _codTabelaPreco;

            -- ATUALIZAR VALORES
            IF ( _totalProdutosAtacados > 0 ) THEN
                OPEN _detalhesProdutos;
                loop1 : LOOP
                    -- VERIFICAR SE ACABOU
                    IF (_totalProdutosAtacados = 0) THEN
                        leave loop1;
                    END IF;

                    -- ATRIBUINDO VALORES
                    FETCH NEXT FROM _detalhesProdutos INTO _codInterno, _precoAtacado, _dataHora;

                    -- DESINCREMENTANDO
                    SET _totalProdutosAtacados = _totalProdutosAtacados - 1; 
                    -- INSERINDO
                    INSERT INTO produtostabprecos VALUES( 0, _codTabelaPreco, _codInterno, 0.0, 0.0, 0.0, _precoAtacado, _dataHora);
                END LOOP loop1;
            END IF;
        ELSE
            -- ATUALIZAR UM PRODUTO
            SELECT preco_varejo INTO _precoAtacado FROM produtos WHERE cod_interno = _codInterno;
            SELECT COUNT(*) INTO _existeProduto FROM produtostabprecos
                WHERE idtabpreco = _codTabelaPreco AND idproduto = _codInterno;
                
            IF _existeProduto = 0 THEN
                INSERT INTO produtostabprecos VALUES( 0, _codTabelaPreco, _codInterno, 0.0, 0.0, 0.0, _precoAtacado, NOW()); 
            ELSE
                UPDATE produtostabprecos SET precovenda = _precoAtacado, dataversaoregistro = NOW()
                    WHERE idtabpreco = _codTabelaPreco AND idproduto = _codInterno;
            END IF;
        END IF;
    ELSE
        DELETE FROM cadtabpreco WHERE descricao = _nomeTabela;
        DELETE FROM produtostabprecos WHERE idtabpreco = _codTabelaPreco;
    END IF;
END;

CALL sp_tabelaPrecoAtacadoMobile();
DROP PROCEDURE sp_tabelaPrecoAtacadoMobile;
