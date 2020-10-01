USE Backbone;
DELETE FROM Messaging;

INSERT INTO Messaging (TypeName, TypeValue, Topic) VALUES
('UserId', '7014b086', 'org.piangles.controlchannel.users'),
('Alias', 'Energy', 'org.piangles.sector.energy'),
('Alias', 'Technology', 'org.piangles.sector.tech');
