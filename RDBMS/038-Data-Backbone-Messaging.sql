USE Backbone;
DELETE FROM MessagingAliases;

INSERT INTO MessagingAliases (Alias, Topic) VALUES
('Energy', 'org.piangles.sector.energy'),
('Technology', 'org.piangles.sector.tech');

USE Backbone;
DELETE FROM MessagingEntities;
INSERT INTO MessagingEntities (TypeName, TypeValue, Topic, PartitionNo) VALUES
('UserId', '7014b086', 'com.TBD.playground', 0);
