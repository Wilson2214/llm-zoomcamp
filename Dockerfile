FROM ollama/ollama

COPY /ollama_files/models/blobs/. /root/.ollama/models/blobs/
COPY /ollama_files/models/manifests/registry.ollama.ai/library/gemma/2b /root/.ollama/models/manifests/registry.ollama.ai/library/gemma/2b