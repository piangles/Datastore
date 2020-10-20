USE Central;
DELETE FROM Discovery;

#Tier 1

INSERT INTO Discovery (Environment, ServiceName, Name, Value) VALUES
('DEV', 'SessionManagementService', 'ControllerClassName', 'org.piangles.core.services.remoting.rabbit.ReqRespController'),
('DEV', 'SessionManagementService', 'HandlerClassName', 'org.piangles.core.services.remoting.rabbit.ReqRespHandler'),
('DEV', 'SessionManagementService', 'RequestCreatorClassName', 'org.piangles.core.services.remoting.handlers.DefaultRequestCreator'),
('DEV', 'SessionManagementService', 'ControllerDecrypterClassName', 'org.piangles.core.util.central.CentralDecrypter'),
('DEV', 'SessionManagementService', 'ControllerDecrypterAuthorizationId', '477e0c1b-d057-40df-9c56-e7c52ddb875d'),
('DEV', 'SessionManagementService', 'HandlerDecrypterClassName', 'org.piangles.core.util.central.CentralDecrypter'),
('DEV', 'SessionManagementService', 'HandlerDecrypterAuthorizationId', '3ba7c57e-0747-4da7-a85d-14daa39d3932'),
('DEV', 'SessionManagementService', 'DecoderClassName', 'org.piangles.core.util.coding.JavaDecoder'),
('DEV', 'SessionManagementService', 'EncoderClassName', 'org.piangles.core.util.coding.JavaEncoder'),
('DEV', 'SessionManagementService', 'SessionValidatorClassName', 'org.piangles.backbone.services.session.PassThruSessionValidator'),
('DEV', 'SessionManagementService', 'PredeterminedSessionId', 'TODOSessionId'),
('DEV', 'SessionManagementService', 'RMQHostName', 'ec2-100-25-191-222.compute-1.amazonaws.com'),
('DEV', 'SessionManagementService', 'RMQPort', '5672'),
('DEV', 'SessionManagementService', 'RMQLoginId', 'TdmVTwllpL3hE+HyDz1ScA=='),
('DEV', 'SessionManagementService', 'RMQPassword', 'Fh9b3EQmSW4uIzXDNqSNYw=='),
('DEV', 'SessionManagementService', 'Topic', 'SessionManagementServiceReqRespTopic'),
('DEV', 'SessionManagementService', 'TimeOut', '5000');

#Tier 1
INSERT INTO Discovery (Environment, ServiceName, Name, Value) VALUES
('DEV', 'ConfigService', 'ControllerClassName', 'org.piangles.core.services.remoting.rabbit.ReqRespController'),
('DEV', 'ConfigService', 'HandlerClassName', 'org.piangles.core.services.remoting.rabbit.ReqRespHandler'),
('DEV', 'ConfigService', 'RequestCreatorClassName', 'org.piangles.core.services.remoting.handlers.AuditableRequestCreator'),
('DEV', 'ConfigService', 'ControllerDecrypterClassName', 'org.piangles.core.util.central.CentralDecrypter'),
('DEV', 'ConfigService', 'ControllerDecrypterAuthorizationId', '496b2226-a927-4cbc-812d-c116d0eb5902'),
('DEV', 'ConfigService', 'HandlerDecrypterClassName', 'org.piangles.core.util.central.CentralDecrypter'),
('DEV', 'ConfigService', 'HandlerDecrypterAuthorizationId', '6e3c9a60-4404-43a1-9702-1f3344bd06f1'),
('DEV', 'ConfigService', 'DecoderClassName', 'org.piangles.core.util.coding.JavaDecoder'),
('DEV', 'ConfigService', 'EncoderClassName', 'org.piangles.core.util.coding.JavaEncoder'),
('DEV', 'ConfigService', 'SessionValidatorClassName', 'org.piangles.backbone.services.session.DefaultSessionValidator'),
('DEV', 'ConfigService', 'PredeterminedSessionId', 'TODOSessionId'),
('DEV', 'ConfigService', 'RMQHostName', 'ec2-100-25-191-222.compute-1.amazonaws.com'),
('DEV', 'ConfigService', 'RMQPort', '5672'),
('DEV', 'ConfigService', 'RMQLoginId', 'TdmVTwllpL3hE+HyDz1ScA=='),
('DEV', 'ConfigService', 'RMQPassword', 'Fh9b3EQmSW4uIzXDNqSNYw=='),
('DEV', 'ConfigService', 'Topic', 'ConfigServiceReqRespTopic'),
('DEV', 'ConfigService', 'TimeOut', '5000');

INSERT INTO Discovery (Environment, ServiceName, Name, Value) VALUES
('DEV', 'CryptoService', 'ControllerClassName', 'org.piangles.core.services.remoting.rabbit.ReqRespController'),
('DEV', 'CryptoService', 'HandlerClassName', 'org.piangles.core.services.remoting.rabbit.ReqRespHandler'),
('DEV', 'CryptoService', 'RequestCreatorClassName', 'org.piangles.backbone.services.crypto.CryptoServiceRequestCreator'),
('DEV', 'CryptoService', 'ControllerDecrypterClassName', 'org.piangles.core.util.central.CentralDecrypter'),
('DEV', 'CryptoService', 'ControllerDecrypterAuthorizationId', '1c044b37-9388-4e6b-baf2-9fe09dea4281'),
('DEV', 'CryptoService', 'HandlerDecrypterClassName', 'org.piangles.core.util.central.CentralDecrypter'),
('DEV', 'CryptoService', 'HandlerDecrypterAuthorizationId', '3466d438-4830-4d1a-847c-1a1e87612e9e'),
('DEV', 'CryptoService', 'DecoderClassName', 'org.piangles.core.util.coding.JavaDecoder'),
('DEV', 'CryptoService', 'EncoderClassName', 'org.piangles.core.util.coding.JavaEncoder'),
('DEV', 'CryptoService', 'SessionValidatorClassName', 'org.piangles.backbone.services.session.DefaultSessionValidator'),
('DEV', 'CryptoService', 'PredeterminedSessionId', 'TODOSessionId'),
('DEV', 'CryptoService', 'RMQHostName', 'ec2-100-25-191-222.compute-1.amazonaws.com'),
('DEV', 'CryptoService', 'RMQPort', '5672'),
('DEV', 'CryptoService', 'RMQLoginId', 'TdmVTwllpL3hE+HyDz1ScA=='),
('DEV', 'CryptoService', 'RMQPassword', 'Fh9b3EQmSW4uIzXDNqSNYw=='),
('DEV', 'CryptoService', 'Topic', 'CryptoServiceReqRespTopic'),
('DEV', 'CryptoService', 'TimeOut', '5000');

#Tier 2
INSERT INTO Discovery (Environment, ServiceName, Name, Value) VALUES
('DEV', 'LoggingService', 'ControllerClassName', 'org.piangles.core.services.remoting.rabbit.FireAndForgetController'),
('DEV', 'LoggingService', 'HandlerClassName', 'org.piangles.core.services.remoting.rabbit.FireAndForgetHandler'),
('DEV', 'LoggingService', 'RequestCreatorClassName', 'org.piangles.backbone.services.logging.LoggingRequestCreator'),
('DEV', 'LoggingService', 'ControllerDecrypterClassName', 'org.piangles.core.util.central.CentralDecrypter'),
('DEV', 'LoggingService', 'ControllerDecrypterAuthorizationId', '25b51747-62b7-4da3-b4f6-75d51c944a90'),
('DEV', 'LoggingService', 'HandlerDecrypterClassName', 'org.piangles.core.util.central.CentralDecrypter'),
('DEV', 'LoggingService', 'HandlerDecrypterAuthorizationId', '6e3c9a60-4404-43a1-9702-1f3344bd06f1'),
('DEV', 'LoggingService', 'DecoderClassName', 'org.piangles.core.util.coding.JavaDecoder'),
('DEV', 'LoggingService', 'EncoderClassName', 'org.piangles.core.util.coding.JavaEncoder'),
('DEV', 'LoggingService', 'SessionValidatorClassName', 'org.piangles.backbone.services.session.PassThruSessionValidator'),
('DEV', 'LoggingService', 'PredeterminedSessionId', 'TODOSessionId'),
('DEV', 'LoggingService', 'RMQHostName', 'ec2-100-25-191-222.compute-1.amazonaws.com'),
('DEV', 'LoggingService', 'RMQPort', '5672'),
('DEV', 'LoggingService', 'RMQLoginId', 'TdmVTwllpL3hE+HyDz1ScA=='),
('DEV', 'LoggingService', 'RMQPassword', 'Fh9b3EQmSW4uIzXDNqSNYw=='),
('DEV', 'LoggingService', 'Topic', 'LoggingServiceFireAndForgetTopic'),
('DEV', 'LoggingService', 'TimeOut', '5000');

#Tier 3
INSERT INTO Discovery (Environment, ServiceName, Name, Value) VALUES
('DEV', 'IdService', 'ControllerClassName', 'org.piangles.core.services.remoting.rabbit.ReqRespController'),
('DEV', 'IdService', 'HandlerClassName', 'org.piangles.core.services.remoting.rabbit.ReqRespHandler'),
('DEV', 'IdService', 'RequestCreatorClassName', 'org.piangles.core.services.remoting.handlers.DefaultRequestCreator'),
('DEV', 'IdService', 'ControllerDecrypterClassName', 'org.piangles.core.util.central.CentralDecrypter'),
('DEV', 'IdService', 'ControllerDecrypterAuthorizationId', 'd7ab2e33-467c-43c8-8df1-9d9194a04306'),
('DEV', 'IdService', 'HandlerDecrypterClassName', 'org.piangles.core.util.central.CentralDecrypter'),
('DEV', 'IdService', 'HandlerDecrypterAuthorizationId', '8e33bdae-a526-4d50-bf07-8f7c6c298c23'),
('DEV', 'IdService', 'DecoderClassName', 'org.piangles.core.util.coding.JavaDecoder'),
('DEV', 'IdService', 'EncoderClassName', 'org.piangles.core.util.coding.JavaEncoder'),
('DEV', 'IdService', 'SessionValidatorClassName', 'org.piangles.backbone.services.session.DefaultSessionValidator'),
('DEV', 'IdService', 'PredeterminedSessionId', 'TODOSessionId'),
('DEV', 'IdService', 'RMQHostName', 'ec2-100-25-191-222.compute-1.amazonaws.com'),
('DEV', 'IdService', 'RMQPort', '5672'),
('DEV', 'IdService', 'RMQLoginId', 'TdmVTwllpL3hE+HyDz1ScA=='),
('DEV', 'IdService', 'RMQPassword', 'Fh9b3EQmSW4uIzXDNqSNYw=='),
('DEV', 'IdService', 'Topic', 'IdServiceReqRespTopic'),
('DEV', 'IdService', 'TimeOut', '5000');

#Tier 4
INSERT INTO Discovery (Environment, ServiceName, Name, Value) VALUES
('DEV', 'AuthenticationService', 'ControllerClassName', 'org.piangles.core.services.remoting.rabbit.ReqRespController'),
('DEV', 'AuthenticationService', 'HandlerClassName', 'org.piangles.core.services.remoting.rabbit.ReqRespHandler'),
('DEV', 'AuthenticationService', 'RequestCreatorClassName', 'org.piangles.core.services.remoting.handlers.DefaultRequestCreator'),
('DEV', 'AuthenticationService', 'ControllerDecrypterClassName', 'org.piangles.core.util.central.CentralDecrypter'),
('DEV', 'AuthenticationService', 'ControllerDecrypterAuthorizationId', 'ab3f32af-d778-4098-86f9-bfb7ab933770'),
('DEV', 'AuthenticationService', 'HandlerDecrypterClassName', 'org.piangles.core.util.central.CentralDecrypter'),
('DEV', 'AuthenticationService', 'HandlerDecrypterAuthorizationId', 'fceeaacd-a8c4-4d4a-be4e-9ed025d55e0e'),
('DEV', 'AuthenticationService', 'DecoderClassName', 'org.piangles.core.util.coding.JavaDecoder'),
('DEV', 'AuthenticationService', 'EncoderClassName', 'org.piangles.core.util.coding.JavaEncoder'),
('DEV', 'AuthenticationService', 'SessionValidatorClassName', 'org.piangles.backbone.services.session.PassThruSessionValidator'),
('DEV', 'AuthenticationService', 'PredeterminedSessionId', 'TODOSessionId'),
('DEV', 'AuthenticationService', 'RMQHostName', 'ec2-100-25-191-222.compute-1.amazonaws.com'),
('DEV', 'AuthenticationService', 'RMQPort', '5672'),
('DEV', 'AuthenticationService', 'RMQLoginId', 'TdmVTwllpL3hE+HyDz1ScA=='),
('DEV', 'AuthenticationService', 'RMQPassword', 'Fh9b3EQmSW4uIzXDNqSNYw=='),
('DEV', 'AuthenticationService', 'Topic', 'AuthenticationServiceReqRespTopic'),
('DEV', 'AuthenticationService', 'TimeOut', '5000');

INSERT INTO Discovery (Environment, ServiceName, Name, Value) VALUES
('DEV', 'UserPreferenceService', 'ControllerClassName', 'org.piangles.core.services.remoting.rabbit.ReqRespController'),
('DEV', 'UserPreferenceService', 'HandlerClassName', 'org.piangles.core.services.remoting.rabbit.ReqRespHandler'),
('DEV', 'UserPreferenceService', 'RequestCreatorClassName', 'org.piangles.core.services.remoting.handlers.DefaultRequestCreator'),
('DEV', 'UserPreferenceService', 'ControllerDecrypterClassName', 'org.piangles.core.util.central.CentralDecrypter'),
('DEV', 'UserPreferenceService', 'ControllerDecrypterAuthorizationId', '1d89530c-50b4-4f5a-af91-5f5ebb45ef47'),
('DEV', 'UserPreferenceService', 'HandlerDecrypterClassName', 'org.piangles.core.util.central.CentralDecrypter'),
('DEV', 'UserPreferenceService', 'HandlerDecrypterAuthorizationId', 'ba0b6173-b7ca-43e7-aee0-163233282403'),
('DEV', 'UserPreferenceService', 'DecoderClassName', 'org.piangles.core.util.coding.JavaDecoder'),
('DEV', 'UserPreferenceService', 'EncoderClassName', 'org.piangles.core.util.coding.JavaEncoder'),
('DEV', 'UserPreferenceService', 'SessionValidatorClassName', 'org.piangles.backbone.services.session.DefaultSessionValidator'),
('DEV', 'UserPreferenceService', 'PredeterminedSessionId', 'TODOSessionId'),
('DEV', 'UserPreferenceService', 'RMQHostName', 'ec2-100-25-191-222.compute-1.amazonaws.com'),
('DEV', 'UserPreferenceService', 'RMQPort', '5672'),
('DEV', 'UserPreferenceService', 'RMQLoginId', 'TdmVTwllpL3hE+HyDz1ScA=='),
('DEV', 'UserPreferenceService', 'RMQPassword', 'Fh9b3EQmSW4uIzXDNqSNYw=='),
('DEV', 'UserPreferenceService', 'Topic', 'UserPreferenceServiceReqRespTopic'),
('DEV', 'UserPreferenceService', 'TimeOut', '5000');

INSERT INTO Discovery (Environment, ServiceName, Name, Value) VALUES
('DEV', 'MessagingService', 'ControllerClassName', 'org.piangles.core.services.remoting.rabbit.ReqRespController'),
('DEV', 'MessagingService', 'HandlerClassName', 'org.piangles.core.services.remoting.rabbit.ReqRespHandler'),
('DEV', 'MessagingService', 'RequestCreatorClassName', 'org.piangles.backbone.services.msg.MessagingRequestCreator'),
('DEV', 'MessagingService', 'ControllerDecrypterClassName', 'org.piangles.core.util.central.CentralDecrypter'),
('DEV', 'MessagingService', 'ControllerDecrypterAuthorizationId', '1d89530c-50b4-4f5a-af91-5f5ebb45ef47'),
('DEV', 'MessagingService', 'HandlerDecrypterClassName', 'org.piangles.core.util.central.CentralDecrypter'),
('DEV', 'MessagingService', 'HandlerDecrypterAuthorizationId', 'ba0b6173-b7ca-43e7-aee0-163233282403'),
('DEV', 'MessagingService', 'DecoderClassName', 'org.piangles.core.util.coding.JavaDecoder'),
('DEV', 'MessagingService', 'EncoderClassName', 'org.piangles.core.util.coding.JavaEncoder'),
('DEV', 'MessagingService', 'SessionValidatorClassName', 'org.piangles.backbone.services.session.DefaultSessionValidator'),
('DEV', 'MessagingService', 'PredeterminedSessionId', 'TODOSessionId'),
('DEV', 'MessagingService', 'RMQHostName', 'ec2-100-25-191-222.compute-1.amazonaws.com'),
('DEV', 'MessagingService', 'RMQPort', '5672'),
('DEV', 'MessagingService', 'RMQLoginId', 'TdmVTwllpL3hE+HyDz1ScA=='),
('DEV', 'MessagingService', 'RMQPassword', 'Fh9b3EQmSW4uIzXDNqSNYw=='),
('DEV', 'MessagingService', 'Topic', 'MessagingServiceReqRespTopic'),
('DEV', 'MessagingService', 'TimeOut', '5000');

INSERT INTO Discovery (Environment, ServiceName, Name, Value) VALUES
('DEV', 'UserProfileService', 'ControllerClassName', 'org.piangles.core.services.remoting.rabbit.ReqRespController'),
('DEV', 'UserProfileService', 'HandlerClassName', 'org.piangles.core.services.remoting.rabbit.ReqRespHandler'),
('DEV', 'UserProfileService', 'RequestCreatorClassName', 'org.piangles.core.services.remoting.handlers.DefaultRequestCreator'),
('DEV', 'UserProfileService', 'ControllerDecrypterClassName', 'org.piangles.core.util.central.CentralDecrypter'),
('DEV', 'UserProfileService', 'ControllerDecrypterAuthorizationId', '1d89530c-50b4-4f5a-af91-5f5ebb45ef47'),
('DEV', 'UserProfileService', 'HandlerDecrypterClassName', 'org.piangles.core.util.central.CentralDecrypter'),
('DEV', 'UserProfileService', 'HandlerDecrypterAuthorizationId', 'ba0b6173-b7ca-43e7-aee0-163233282403'),
('DEV', 'UserProfileService', 'DecoderClassName', 'org.piangles.core.util.coding.JavaDecoder'),
('DEV', 'UserProfileService', 'EncoderClassName', 'org.piangles.core.util.coding.JavaEncoder'),
('DEV', 'UserProfileService', 'SessionValidatorClassName', 'org.piangles.backbone.services.session.DefaultSessionValidator'),
('DEV', 'UserProfileService', 'PredeterminedSessionId', 'TODOSessionId'),
('DEV', 'UserProfileService', 'RMQHostName', 'ec2-100-25-191-222.compute-1.amazonaws.com'),
('DEV', 'UserProfileService', 'RMQPort', '5672'),
('DEV', 'UserProfileService', 'RMQLoginId', 'TdmVTwllpL3hE+HyDz1ScA=='),
('DEV', 'UserProfileService', 'RMQPassword', 'Fh9b3EQmSW4uIzXDNqSNYw=='),
('DEV', 'UserProfileService', 'Topic', 'UserProfileServiceReqRespTopic'),
('DEV', 'UserProfileService', 'TimeOut', '5000');


#GatewayService
INSERT INTO Discovery (Environment, ServiceName, Name, Value) VALUES
('DEV', 'GatewayService', 'PredeterminedSessionId', 'TODOSessionId');
