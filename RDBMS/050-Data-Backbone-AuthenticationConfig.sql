USE Backbone;
DELETE FROM Config WHERE ComponentId IN ('2f07e92e-8edf-4fed-897c-2df2bd2ae72d');

INSERT INTO Config (ApplicationId, ComponentId, ComponentDescription, Name, Value) VALUES
('AuthenticationService', '2f07e92e-8edf-4fed-897c-2df2bd2ae72d', 'AuthenticationServiceDAO', 'DriverClassName', 'com.mysql.jdbc.Driver'),
('AuthenticationService', '2f07e92e-8edf-4fed-897c-2df2bd2ae72d', 'AuthenticationServiceDAO', 'LoginId', 'kj5IPCk6oWkmxezE9yWh3Q=='),
('AuthenticationService', '2f07e92e-8edf-4fed-897c-2df2bd2ae72d', 'AuthenticationServiceDAO', 'Password', 'bSU2ekVvuinOQTa/ywH7kg=='),
('AuthenticationService', '2f07e92e-8edf-4fed-897c-2df2bd2ae72d', 'AuthenticationServiceDAO', 'URL', 'jdbc:mysql://elektos.cty8sfgs1evu.us-east-1.rds.amazonaws.com:3306/'),
('AuthenticationService', '2f07e92e-8edf-4fed-897c-2df2bd2ae72d', 'AuthenticationServiceDAO', 'DecrypterClassName', 'org.piangles.backbone.services.crypto.DefaultDecrypter'),
('AuthenticationService', '2f07e92e-8edf-4fed-897c-2df2bd2ae72d', 'AuthenticationServiceDAO', 'DecrypterAuthorizationId', 'e04202bc-a88e-48be-8b38-b94399d3086a'),

('AuthenticationService', '2f07e92e-8edf-4fed-897c-2df2bd2ae72d', 'AuthenticationService', 'MaxNumOfAttempts', '5');
