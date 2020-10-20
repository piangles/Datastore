USE Central;
DELETE FROM Discovery where ServiceName in ('GatewayService', 'NewsReporter', 'PricingEngine');

#GatewayService
INSERT INTO Discovery (Environment, ServiceName, Name, Value) VALUES
('DEV', 'GatewayService', 'PredeterminedSessionId', 'TODOSessionId');

#NewsReporter
INSERT INTO Discovery (Environment, ServiceName, Name, Value) VALUES
('DEV', 'NewsReporter', 'PredeterminedSessionId', 'TODOSessionId');

#PricingEngine
INSERT INTO Discovery (Environment, ServiceName, Name, Value) VALUES
('DEV', 'PricingEngine', 'PredeterminedSessionId', 'TODOSessionId');
