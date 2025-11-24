# Architecture (prototype)

Client -> Frontend Service (stub/main) -> Pipeline
Pipeline modules:
 - CandidateGenerator (follow-graph / discovery)
 - FeatureStore (in-memory, per-item features)
 - Scorer (linear weights)
 - Reranker (sort + business rules)
 - Cache (placeholder)

Background (future):
 - Event Stream (Kafka/redpanda) -> Stream Processor -> Online Feature Store
 - ANN index for embeddings
 - Low-latency inference runtime (Treelite/ONNX)

Design decisions and tradeoffs:
 - Prototype uses simple in-memory data structures to keep iteration fast.
 - Interfaces are pluggable so mocks can be swapped for real infra later.
