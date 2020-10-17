USE BackboneTier3;
DROP TABLE IF EXISTS Identifiers;
CREATE TABLE Identifiers
(
	Id INT(32) UNSIGNED NOT NULL AUTO_INCREMENT,
	InsertedTS timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	UpdatedTS TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	
	Type varchar(15) NOT NULL,
	GeneratedIdPointer INT(64) UNSIGNED NOT NULL,

	KEY (Id)
);
ALTER TABLE Identifiers ADD CONSTRAINT PK_Id PRIMARY KEY(Id);