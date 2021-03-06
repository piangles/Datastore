USE Backbone;
DROP TABLE IF EXISTS TokenBasedCredentials;
CREATE TABLE TokenBasedCredentials
(
	Id INT(32) UNSIGNED NOT NULL AUTO_INCREMENT,
	
	UserId VARCHAR(25)  NOT NULL,
	Token VARCHAR(100) NOT NULL PRIMARY KEY,
	TokenExpirationTime TIMESTAMP NULL,
	
	Active BOOLEAN NOT NULL DEFAULT true,

	InsertedTS TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	UpdatedTS TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	
    KEY(Id)
);
