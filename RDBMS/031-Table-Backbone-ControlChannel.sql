USE Backbone;
DROP TABLE IF EXISTS ControlChannel;
CREATE TABLE ControlChannel //TODO this has be changed.
(
	PartitionNo INT(32) UNSIGNED NOT NULL AUTO_INCREMENT,
	TypeName varchar(25)  NOT NULL,
	TypeValue varchar(25)  NOT NULL,
	Topic varchar(150)  NOT NULL,
	
	InsertedTS TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	UpdatedTS TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    KEY(Id) -- combo???
);
