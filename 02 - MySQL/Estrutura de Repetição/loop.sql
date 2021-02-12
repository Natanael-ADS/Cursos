--EXEMPLO
[<rótulo>:] LOOP
    declarações
END LOOP[<rótulo>];


CREATE PROCEDURE sp_testeLoop(_qtd INT)
BEGIN
    --Declarações
    DECLARE _cont INT DEFAULT 0;

    --Atribuir
    loop1: LOOP
        SET _cont = _cont + 1;
        IF _cont = _qtd THEN
            leave loop1;
        END IF;
    END LOOP loop1;

    --Mostrar
    SELECT 0 AS "Valor antes", _cont AS "Valor depois";
END;

DROP PROCEDURE sp_testeLoop;

CALL sp_testeLoop(5);