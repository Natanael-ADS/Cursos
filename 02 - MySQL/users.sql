/* Create a new login at database */
CREATE LOGIN new_user WITH PASSWORD = 'new_password';

/*Select the database*/
USE DB_TABS;

/*Inserting the login of user on database*/
CREATE USER new_user FOR LOGIN new_user;

/*Inserting the permissions at DML to user created*/
GRANT SELECT ON consumer,city TO new_user
GRANT SELECT, UPDATE ON nf, nfItems TO new_user

/*Inserting the denial at DMl to user created*/
DENY INSERT, DELETE ON nf, nfItems, consumer, city TO new_user

/*Inserting the denial or permissions on column(s)*/
GRANT UPDATE(discount_nfItems) ON nf TO new_user

/*Remove all permissions or denial*/
REVOKE SELECT ON consumer FROM new_user