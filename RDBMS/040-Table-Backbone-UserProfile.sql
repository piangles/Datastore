USE Backbone;
DROP TABLE IF EXISTS UserProfile;
CREATE TABLE UserProfile
(
	Id INT(32) UNSIGNED NOT NULL AUTO_INCREMENT,
	
	UserId varchar(25)  NOT NULL  PRIMARY KEY,
	FirstName varchar(50)  NOT NULL,
	LastName varchar(50)  NOT NULL,
	EMailId varchar(250)  NOT NULL,

	InsertedTS TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	UpdatedTS TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    KEY(Id)
);