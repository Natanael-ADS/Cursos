CREATE PROCEDURE sp_atualizarSalarioBaixo(_codigoEmpregado INT, _aumentoSalario NUMERIC)
BEGIN
    -- Declarar variáves
    DECLARE _salarioBaixo, _salarioFuncionario NUMERIC;
    DECLARE _codigoCargo INT;

    -- Atribuir valores
    SET _salarioBaixo = 1800;
    SELECT ca.salario, ca.codigo INTO _salarioFuncionario, _codigoCargo 
        FROM empregados AS em RIGHT JOIN cargo AS ca ON ca.codigo = em.codCargo
        WHERE em.codigo = _codigoEmpregado;

    -- Atualizar valores
    IF _salarioFuncionario < _salarioBaixo THEN
        UPDATE cargo AS ca SET ca.salario = _salarioFuncionario + _aumentoSalario 
            WHERE  ca.codigo = _codigoCargo;
    END IF;

    -- Apresentar Valores alterados
    SELECT 
        em.nome AS 'Nome do Funcionario',
        _salarioFuncionario AS 'Salario Anterior',
        ca.salario AS 'Salario Aumentado'
        FROM empregados AS em INNER JOIN cargo AS ca ON ca.codigo = em.codCargo
        WHERE em.codigo = _codigoEmpregado; 
END;
DROP PROCEDURE sp_atualizarSalarioBaixo;

CALL sp_atualizarSalarioBaixo(1,1000);