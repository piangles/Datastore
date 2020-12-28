DROP TABLE IF EXISTS Backbone.MessagingEntities;
CREATE TABLE Backbone.MessagingEntities
(
	Id SERIAL NOT NULL PRIMARY KEY,
	InsertedTS TIMESTAMP NOT NULL DEFAULT NOW(),
	UpdatedTS TIMESTAMP NOT NULL,
	
	TypeName varchar(25)  NOT NULL,
	TypeValue varchar(25)  NOT NULL,
	Topic varchar(150)  NOT NULL,
	PartitionNo INT DEFAULT -1
);

CREATE TRIGGER update_updated_timestamp BEFORE INSERT OR UPDATE ON Backbone.MessagingEntities FOR EACH ROW EXECUTE PROCEDURE  public.update_updated_timestamp();