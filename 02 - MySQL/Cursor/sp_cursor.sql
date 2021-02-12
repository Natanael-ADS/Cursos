CREATE PROCEDURE  sp_cursor()
BEGIN
    DECLARE _cpf VARCHAR(50);
    DECLARE _nome VARCHAR(50);
    DECLARE _detalhesFuncionarios CURSOR 
        FOR SELECT em.cpf, em.nome FROM  empregados AS em;

    OPEN _detalhesFuncionarios;
    FETCH NEXT FROM _detalhesFuncionarios
        INTO _cpf,_nome;
        
    SELECT _cpf,_nome;
END;