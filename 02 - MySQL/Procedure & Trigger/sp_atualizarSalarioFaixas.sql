CREATE PROCEDURE sp_atualizarSalarioFaixas(_codigoCargo INT)
BEGIN
    -- Declarar Variaves
    DECLARE _salario,_novoSalario NUMERIC;

    -- Atribuir Valores
    SELECT ca.salario INTO _salario FROM cargo AS ca WHERE ca.codigo = _codigoCargo;
    
    -- Atualizar Valores
    IF _salario <= 1300 THEN
        SET _novoSalario = _salario * 1.3;
        UPDATE cargo AS ca SET ca.salario = _novoSalario WHERE ca.codigo = _codigoCargo;
    ELSEIF _salario < 1300 AND _salario <= 1800 THEN
        SET _novoSalario = _salario * 1.2 ;
        UPDATE cargo AS ca SET ca.salario = _novoSalario WHERE ca.codigo = _codigoCargo;
    ELSE 
        SET _novoSalario = _salario * 1.1; 
        UPDATE cargo AS ca SET ca.salario = _novoSalario WHERE ca.codigo = _codigoCargo;
    END IF;

    -- Mostra Valores
    SELECT _salario AS "Salario antigo", _novoSalario AS "Salario alterado";
END;

DROP PROCEDURE sp_atualizarSalarioFaixas;
CALL sp_atualizarSalarioFaixas(1);