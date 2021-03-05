CREATE EVENT event_clientes_sem_compra_comodato 
    ON SCHEDULE EVERY 2 MINUTE STARTS '2021-03-05 15:32:00' 
    ON COMPLETION NOT PRESERVE ENABLE 
    DO CALL sp_clientescomodatosemcompras ();