USE Backbone;
DELETE FROM ControlChannel;

INSERT INTO ControlChannel (TypeName, TypeValue, Topic) VALUES
('UserId', '7014b086', 'com.TBD.controlchannel.users'),
('Alias', 'Energy', 'com.TBD.sector.energy'),
('Alias', 'Technology', 'com.TBD.sector.tech');
