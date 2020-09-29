USE Backbone;

DELETE FROM Config WHERE ComponentId IN ('5d435fe2-7e54-43c3-84d2-8f4addf2dac9');

INSERT INTO Config (ApplicationId, ComponentId, ComponentDescription, Name, Value) VALUES
('ControlChannelService', '5d435fe2-7e54-43c3-84d2-8f4addf2dac9', 'ControlChannelServiceDAO', 'DriverClassName', 'com.mysql.jdbc.Driver'),
('ControlChannelService', '5d435fe2-7e54-43c3-84d2-8f4addf2dac9', 'ControlChannelServiceDAO', 'LoginId', 'kj5IPCk6oWkmxezE9yWh3Q=='),
('ControlChannelService', '5d435fe2-7e54-43c3-84d2-8f4addf2dac9', 'ControlChannelServiceDAO', 'Password', 'bSU2ekVvuinOQTa/ywH7kg=='),
('ControlChannelService', '5d435fe2-7e54-43c3-84d2-8f4addf2dac9', 'ControlChannelServiceDAO', 'URL', 'jdbc:mysql://elektos.cty8sfgs1evu.us-east-1.rds.amazonaws.com:3306/'),
('ControlChannelService', '5d435fe2-7e54-43c3-84d2-8f4addf2dac9', 'ControlChannelServiceDAO', 'DecrypterClassName', 'org.piangles.backbone.services.crypto.DefaultDecrypter'),
('ControlChannelService', '5d435fe2-7e54-43c3-84d2-8f4addf2dac9', 'ControlChannelServiceDAO', 'DecrypterAuthorizationId', '4ae056eb-5ec6-4dae-9f84-453b4dd9ea3e');
