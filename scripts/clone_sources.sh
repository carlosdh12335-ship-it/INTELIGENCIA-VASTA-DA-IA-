#!/usr/bin/env bash

set -e

BASE_DIR="external_sources"
mkdir -p "$BASE_DIR"

clone_or_update() {
  NAME="$1"
  URL="$2"
  DEST="$BASE_DIR/$NAME"

  if [ -d "$DEST/.git" ]; then
    echo "Atualizando $NAME..."
    git -C "$DEST" pull --ff-only || true
  else
    echo "Clonando $NAME..."
    git clone --depth 1 "$URL" "$DEST"
  fi
}

clone_or_update "langchain" "https://github.com/langchain-ai/langchain.git"
clone_or_update "langgraph" "https://github.com/langchain-ai/langgraph.git"
clone_or_update "crewai" "https://github.com/crewAIInc/crewAI.git"
clone_or_update "microsoft-agent-framework" "https://github.com/microsoft/agent-framework.git"
clone_or_update "autogen" "https://github.com/microsoft/autogen.git"
clone_or_update "openhands" "https://github.com/OpenHands/OpenHands.git"

clone_or_update "llama_index" "https://github.com/run-llama/llama_index.git"
clone_or_update "haystack" "https://github.com/deepset-ai/haystack.git"

clone_or_update "mem0" "https://github.com/mem0ai/mem0.git"
clone_or_update "open-webui" "https://github.com/open-webui/open-webui.git"
clone_or_update "browser-use" "https://github.com/browser-use/browser-use.git"

clone_or_update "mcp-servers" "https://github.com/modelcontextprotocol/servers.git"
clone_or_update "mcp-python-sdk" "https://github.com/modelcontextprotocol/python-sdk.git"
clone_or_update "github-mcp-server" "https://github.com/github/github-mcp-server.git"

echo "Fontes clonadas ou atualizadas em external_sources/."
echo "Nao comite essa pasta no Git."
