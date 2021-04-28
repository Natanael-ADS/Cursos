BEGIN TRANSACTION processo01    
    UPDATE ContaBancaria 
        SET saldo = saldo - 900
    WHERE 
        banco = '005' AND
        agencia = '6658' AND
        conta = '118779-5'

    UPDATE ContaBancaria
        SET saldo = saldo + 900
    WHERE
        banco = '633' AND
        agencia = '2115' AND
        conta = '5496085-9'

IF @@ERROR <> 0
    ROLLBACK TRANSACTION processo01
ELSE
    COMMIT TRANSACTION processo01

