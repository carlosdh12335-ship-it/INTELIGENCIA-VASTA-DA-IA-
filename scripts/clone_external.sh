#!/usr/bin/env bash
set -euo pipefail

# Script para clonar repositórios autorizados em external_sources/
# Não faz commit automático. Execute localmente ou em um ambiente de CI com permissões adequadas.

BASE_DIR="$(pwd)"
DEST_DIR="${BASE_DIR}/external_sources"
mkdir -p "${DEST_DIR}"
cd "${DEST_DIR}"

clone_if_missing() {
  local url="$1"
  local dest="$2"
  if [ -d "$dest" ]; then
    echo "Já existe: $dest — pulando"
  else
    echo "Clonando $url -> $dest"
    git clone "$url" "$dest"
  fi
}

# Agentes e orquestração
clone_if_missing https://github.com/langchain-ai/langchain.git langchain
clone_if_missing https://github.com/langchain-ai/langgraph.git langgraph
clone_if_missing https://github.com/crewAIInc/crewAI.git crewai
clone_if_missing https://github.com/microsoft/agent-framework.git microsoft-agent-framework
clone_if_missing https://github.com/microsoft/autogen.git autogen
clone_if_missing https://github.com/OpenHands/OpenHands.git openhands

# RAG, busca e conhecimento
clone_if_missing https://github.com/run-llama/llama_index.git llama_index
clone_if_missing https://github.com/deepset-ai/haystack.git haystack

# Memória de IA
clone_if_missing https://github.com/mem0ai/mem0.git mem0

# Interface e uso local
clone_if_missing https://github.com/open-webui/open-webui.git open-webui

# Navegação e automação web
clone_if_missing https://github.com/browser-use/browser-use.git browser-use

# MCP
clone_if_missing https://github.com/modelcontextprotocol/servers.git mcp-servers
clone_if_missing https://github.com/modelcontextprotocol/python-sdk.git mcp-python-sdk
clone_if_missing https://github.com/github/github-mcp-server.git github-mcp-server

echo "Clonagem concluída (ou verifique /external_sources para itens já existentes)."
