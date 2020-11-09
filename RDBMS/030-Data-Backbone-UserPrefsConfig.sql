USE Backbone;

DELETE FROM Config WHERE ComponentId IN ('131a693b-a821-4e58-a44e-ddef529ca634');

INSERT INTO Config (ApplicationId, ComponentId, ComponentDescription, Name, Value) VALUES
('UserPreferenceService', '131a693b-a821-4e58-a44e-ddef529ca634', 'UserPreferenceServiceDAO', 'DriverClassName', 'com.mysql.jdbc.Driver'),
('UserPreferenceService', '131a693b-a821-4e58-a44e-ddef529ca634', 'UserPreferenceServiceDAO', 'LoginId', 'kj5IPCk6oWkmxezE9yWh3Q=='),
('UserPreferenceService', '131a693b-a821-4e58-a44e-ddef529ca634', 'UserPreferenceServiceDAO', 'Password', 'bSU2ekVvuinOQTa/ywH7kg=='),
('UserPreferenceService', '131a693b-a821-4e58-a44e-ddef529ca634', 'UserPreferenceServiceDAO', 'URL', 'jdbc:mysql://elektos.cty8sfgs1evu.us-east-1.rds.amazonaws.com:3306/'),
('UserPreferenceService', '131a693b-a821-4e58-a44e-ddef529ca634', 'UserPreferenceServiceDAO', 'DecrypterClassName', 'org.piangles.backbone.services.crypto.DefaultDecrypter'),
('UserPreferenceService', '131a693b-a821-4e58-a44e-ddef529ca634', 'UserPreferenceServiceDAO', 'DecrypterAuthorizationId', '4ae056eb-5ec6-4dae-9f84-453b4dd9ea3e');
