USE Central;
DELETE FROM Tier1Configuration;

INSERT INTO Tier1Configuration (Environment, ServiceName, Name, Value) VALUES
('DEV', 'ConfigService', 'DriverClassName', 'com.mysql.jdbc.Driver'),
('DEV', 'ConfigService', 'LoginId', 'kj5IPCk6oWkmxezE9yWh3Q=='),
('DEV', 'ConfigService', 'Password', 'bSU2ekVvuinOQTa/ywH7kg=='),
('DEV', 'ConfigService', 'URL', 'jdbc:mysql://elektos.cty8sfgs1evu.us-east-1.rds.amazonaws.com:3306/'),
('DEV', 'ConfigService', 'DecrypterClassName', 'org.piangles.core.util.central.CentralDecrypter'),
('DEV', 'ConfigService', 'DecrypterAuthorizationId', 'cd2671a9-209e-4f2f-830a-f365421c8368'),

('DEV', 'CryptoService', 'DriverClassName', 'com.mysql.jdbc.Driver'),
('DEV', 'CryptoService', 'LoginId', 'kj5IPCk6oWkmxezE9yWh3Q=='),
('DEV', 'CryptoService', 'Password', 'bSU2ekVvuinOQTa/ywH7kg=='),
('DEV', 'CryptoService', 'URL', 'jdbc:mysql://elektos.cty8sfgs1evu.us-east-1.rds.amazonaws.com:3306/'),
('DEV', 'CryptoService', 'DecrypterClassName', 'org.piangles.core.util.central.CentralDecrypter'),
('DEV', 'CryptoService', 'DecrypterAuthorizationId', 'a9e422d3-a2b8-4ae8-9f7d-e266bd3b9637'),

('DEV', 'SessionManagementService', 'SessionTimeout', '300'),
('DEV', 'SessionManagementService', 'AllowMultipleSessions', 'true'),
('DEV', 'SessionManagementService', 'MaxSessionCount', '2'),
('DEV', 'SessionManagementService', 'ManagedService0', 'LoggingService'),
('DEV', 'SessionManagementService', 'ManagedService1', 'UserPreferenceService'),
('DEV', 'SessionManagementService', 'ManagedService2', 'GatewayService'),
('DEV', 'SessionManagementService', 'ManagedService3', 'AuthenticationService'),
('DEV', 'SessionManagementService', 'ManagedService4', 'MessagingService'),
('DEV', 'SessionManagementService', 'ManagedService5', 'IdService'),
('DEV', 'SessionManagementService', 'ManagedService6', 'UserProfileService'),
('DEV', 'SessionManagementService', 'ManagedService7', 'NewsReporter'),
('DEV', 'SessionManagementService', 'ManagedService8', 'PricingService');
