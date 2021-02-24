CREATE DATABASE [BD_TADS]
    ON (
        PRIMARY NAME = ‘BD_TADS_FILE’,
        FILENAME = ‘Z:\Aula_BD_TADS\’,
        SIZE = 5120KB,
        MAXSIZE = UNLIMITED ,
        FILEGROWTH = 1MB )
    LOG ON ( 
        NAME = ‘BD_TADS_LOG’,
        FILENAME = ‘ Z:\Aula_BD_TADS\’,
        SIZE = 5120KB,
        MAXSIZE = UNLIMITED ,
        FILEGROWTH = 1MB )
    COLLATE Latin1_General_BIN;

ALTER DATABASE [BD_TADS]
    MODIFY FILE ( 
        NAME = ‘BD_TADS_log’,
        SIZE = 204800KB )