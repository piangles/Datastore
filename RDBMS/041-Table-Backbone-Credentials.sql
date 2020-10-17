USE Backbone;
DROP TABLE IF EXISTS Credentials;
CREATE TABLE Credentials
(
	Id INT(32) UNSIGNED NOT NULL AUTO_INCREMENT,
	
	UserId varchar(25)  NOT NULL  PRIMARY KEY,
	LoginId varchar(250)  NOT NULL,
	Password varchar(100)  NOT NULL,
	Token varchar(100),
	TokenExpirationTime TIMESTAMP,
	
	NoOfAttempts INT NOT NULL DEFAULT 1,
	
	Active BOOLEAN NOT NULL DEFAULT true,

	InsertedTS TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	UpdatedTS TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	
    KEY(Id)
);
