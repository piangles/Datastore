USE Backbone;

DELETE FROM Config WHERE ComponentId IN ('1a465968-c647-4fac-9d25-fbd70fa86fee');

INSERT INTO Config (ApplicationId, ComponentId, ComponentDescription, Name, Value) VALUES
('GatewayService', '1a465968-c647-4fac-9d25-fbd70fa86fee', 'KafkaProducer', 'bootstrap.servers', 'ec2-54-85-92-154.compute-1.amazonaws.com:9093,ip-172-31-12-27.ec2.internal:9092'),
('GatewayService', '1a465968-c647-4fac-9d25-fbd70fa86fee', 'KafkaProducer', 'session.timeout.ms', '30000'),
('GatewayService', '1a465968-c647-4fac-9d25-fbd70fa86fee', 'KafkaProducer', 'acks', 'all'),
('GatewayService', '1a465968-c647-4fac-9d25-fbd70fa86fee', 'KafkaProducer', 'retries', '0'),
('GatewayService', '1a465968-c647-4fac-9d25-fbd70fa86fee', 'KafkaProducer', 'batch.size', '16384'),
('GatewayService', '1a465968-c647-4fac-9d25-fbd70fa86fee', 'KafkaProducer', 'linger.ms', '1'),
('GatewayService', '1a465968-c647-4fac-9d25-fbd70fa86fee', 'KafkaProducer', 'buffer.memory', '33554432'),
('GatewayService', '1a465968-c647-4fac-9d25-fbd70fa86fee', 'KafkaProducer', 'key.serializer', 'org.apache.kafka.common.serialization.StringSerializer'),
('GatewayService', '1a465968-c647-4fac-9d25-fbd70fa86fee', 'KafkaProducer', 'value.serializer', 'org.apache.kafka.common.serialization.StringSerializer'),
('GatewayService', '1a465968-c647-4fac-9d25-fbd70fa86fee', 'KafkaConsumer', 'auto.offset.reset', 'earliest'),
('GatewayService', '1a465968-c647-4fac-9d25-fbd70fa86fee', 'KafkaProducer', 'key.deserializer', 'org.apache.kafka.common.serialization.StringDeserializer'),
('GatewayService', '1a465968-c647-4fac-9d25-fbd70fa86fee', 'KafkaProducer', 'value.deserializer', 'org.apache.kafka.common.serialization.StringDeserializer');
