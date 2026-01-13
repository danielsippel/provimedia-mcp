FROM python:3.12-slim

ENV CHAINGUARD_MEMORY_ENABLED=false

WORKDIR /app

# Root-Requirements
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# MCP-Server-Requirements
COPY src/mcp-server/requirements.txt mcp-requirements.txt
RUN pip install --no-cache-dir -r mcp-requirements.txt

# kompletter Code
COPY . .

WORKDIR /app/src/mcp-server

# STDIO-Server, kein Port nötig
CMD ["python", "chainguard_mcp.py"]
