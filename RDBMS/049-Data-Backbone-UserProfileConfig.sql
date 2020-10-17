USE Backbone;
DELETE FROM Config WHERE ComponentId IN ('c4c1c234-4cd4-45df-b610-3239be4803af');

INSERT INTO Config (ApplicationId, ComponentId, ComponentDescription, Name, Value) VALUES
('UserProfileService', 'c4c1c234-4cd4-45df-b610-3239be4803af', 'UserProfileServiceDAO', 'DriverClassName', 'com.mysql.jdbc.Driver'),
('UserProfileService', 'c4c1c234-4cd4-45df-b610-3239be4803af', 'UserProfileServiceDAO', 'LoginId', 'kj5IPCk6oWkmxezE9yWh3Q=='),
('UserProfileService', 'c4c1c234-4cd4-45df-b610-3239be4803af', 'UserProfileServiceDAO', 'Password', 'bSU2ekVvuinOQTa/ywH7kg=='),
('UserProfileService', 'c4c1c234-4cd4-45df-b610-3239be4803af', 'UserProfileServiceDAO', 'URL', 'jdbc:mysql://elektos.cty8sfgs1evu.us-east-1.rds.amazonaws.com:3306/'),
('UserProfileService', 'c4c1c234-4cd4-45df-b610-3239be4803af', 'UserProfileServiceDAO', 'DecrypterClassName', 'org.piangles.backbone.services.crypto.DefaultDecrypter'),
('UserProfileService', 'c4c1c234-4cd4-45df-b610-3239be4803af', 'UserProfileServiceDAO', 'DecrypterAuthorizationId', 'e04202bc-a88e-48be-8b38-b94399d3086a');
