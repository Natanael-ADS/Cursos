CREATE PROCEDURE sp_atualizarSalarioMinimo( _codigoEmpregado INT)
BEGIN
    -- Declaração de variaves
    DECLARE _salarioMinimo NUMERIC;
    DECLARE _nomeFuncionario VARCHAR(50);
    DECLARE _codigoCargo SMALLINT;
 
    -- Atribuindo valores
    SET _salarioMinimo = 1080;
    SELECT em.nome,em.codCargo INTO _nomeFuncionario, _codigoCargo FROM empregados AS em WHERE em.codigo = _codigoEmpregado;

    -- Atualização dos valores 
    UPDATE cargo AS ca SET ca.salario = _salarioMinimo WHERE ca.codigo = _codigoCargo;

    -- Verificar as Mudança
    SELECT _nomeFuncionario AS "Nome do Funcionario", _salarioMinimo AS "Salario Minimo Atualizados";  
END;

CALL sp_atualizarSalarioMinimo(3);