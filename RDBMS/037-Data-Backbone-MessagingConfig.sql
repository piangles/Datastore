USE Backbone;

DELETE FROM Config WHERE ComponentId IN ('5d435fe2-7e54-43c3-84d2-8f4addf2dac9', 'fd5f51bc-5a14-4675-9df4-982808bb106b');

INSERT INTO Config (ApplicationId, ComponentId, ComponentDescription, Name, Value) VALUES
('MessagingService', '5d435fe2-7e54-43c3-84d2-8f4addf2dac9', 'MessagingServiceDAO', 'DriverClassName', 'com.mysql.jdbc.Driver'),
('MessagingService', '5d435fe2-7e54-43c3-84d2-8f4addf2dac9', 'MessagingServiceDAO', 'LoginId', 'kj5IPCk6oWkmxezE9yWh3Q=='),
('MessagingService', '5d435fe2-7e54-43c3-84d2-8f4addf2dac9', 'MessagingServiceDAO', 'Password', 'bSU2ekVvuinOQTa/ywH7kg=='),
('MessagingService', '5d435fe2-7e54-43c3-84d2-8f4addf2dac9', 'MessagingServiceDAO', 'URL', 'jdbc:mysql://elektos.cty8sfgs1evu.us-east-1.rds.amazonaws.com:3306/'),
('MessagingService', '5d435fe2-7e54-43c3-84d2-8f4addf2dac9', 'MessagingServiceDAO', 'DecrypterClassName', 'org.piangles.backbone.services.crypto.DefaultDecrypter'),
('MessagingService', '5d435fe2-7e54-43c3-84d2-8f4addf2dac9', 'MessagingServiceDAO', 'DecrypterAuthorizationId', '4ae056eb-5ec6-4dae-9f84-453b4dd9ea3e'),

('MessagingService', 'fd5f51bc-5a14-4675-9df4-982808bb106b', 'KafkaProducer', 'bootstrap.servers', 'ec2-54-85-92-154.compute-1.amazonaws.com:9093,ip-172-31-12-27.ec2.internal:9092'),
('MessagingService', 'fd5f51bc-5a14-4675-9df4-982808bb106b', 'KafkaProducer', 'session.timeout.ms', '30000'),
('MessagingService', 'fd5f51bc-5a14-4675-9df4-982808bb106b', 'KafkaProducer', 'acks', 'all'),
('MessagingService', 'fd5f51bc-5a14-4675-9df4-982808bb106b', 'KafkaProducer', 'retries', '0'),
('MessagingService', 'fd5f51bc-5a14-4675-9df4-982808bb106b', 'KafkaProducer', 'batch.size', '16384'),
('MessagingService', 'fd5f51bc-5a14-4675-9df4-982808bb106b', 'KafkaProducer', 'linger.ms', '1'),
('MessagingService', 'fd5f51bc-5a14-4675-9df4-982808bb106b', 'KafkaProducer', 'buffer.memory', '33554432'),
('MessagingService', 'fd5f51bc-5a14-4675-9df4-982808bb106b', 'KafkaProducer', 'key.serializer', 'org.apache.kafka.common.serialization.StringSerializer'),
('MessagingService', 'fd5f51bc-5a14-4675-9df4-982808bb106b', 'KafkaProducer', 'value.serializer', 'org.apache.kafka.common.serialization.StringSerializer'),
('MessagingService', 'fd5f51bc-5a14-4675-9df4-982808bb106b', 'KafkaConsumer', 'auto.offset.reset', 'earliest'),
('MessagingService', 'fd5f51bc-5a14-4675-9df4-982808bb106b', 'KafkaProducer', 'key.deserializer', 'org.apache.kafka.common.serialization.StringDeserializer'),
('MessagingService', 'fd5f51bc-5a14-4675-9df4-982808bb106b', 'KafkaProducer', 'value.deserializer', 'org.apache.kafka.common.serialization.StringDeserializer');


#('MessagingService', 'fd5f51bc-5a14-4675-9df4-982808bb106b', 'KafkaProducer', 'partitioner.class', 'org.piangles.playground.kafka.CustomPartitioner')
