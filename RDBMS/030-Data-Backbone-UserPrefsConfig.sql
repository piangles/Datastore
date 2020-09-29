USE Backbone;

DELETE FROM Config WHERE ComponentId IN ('131a693b-a821-4e58-a44e-ddef529ca634');

INSERT INTO Config (ApplicationId, ComponentId, ComponentDescription, Name, Value) VALUES
('UserPreferencesService', '131a693b-a821-4e58-a44e-ddef529ca634', 'UserPreferencesServiceDAO', 'DriverClassName', 'com.mysql.jdbc.Driver'),
('UserPreferencesService', '131a693b-a821-4e58-a44e-ddef529ca634', 'UserPreferencesServiceDAO', 'LoginId', 'kj5IPCk6oWkmxezE9yWh3Q=='),
('UserPreferencesService', '131a693b-a821-4e58-a44e-ddef529ca634', 'UserPreferencesServiceDAO', 'Password', 'bSU2ekVvuinOQTa/ywH7kg=='),
('UserPreferencesService', '131a693b-a821-4e58-a44e-ddef529ca634', 'UserPreferencesServiceDAO', 'URL', 'jdbc:mysql://elektos.cty8sfgs1evu.us-east-1.rds.amazonaws.com:3306/'),
('UserPreferencesService', '131a693b-a821-4e58-a44e-ddef529ca634', 'UserPreferencesServiceDAO', 'DecrypterClassName', 'org.piangles.backbone.services.crypto.DefaultDecrypter'),
('UserPreferencesService', '131a693b-a821-4e58-a44e-ddef529ca634', 'UserPreferencesServiceDAO', 'DecrypterAuthorizationId', '4ae056eb-5ec6-4dae-9f84-453b4dd9ea3e');
