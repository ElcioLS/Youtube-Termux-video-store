#!/bin/bash

# Caminho do arquivo com a lista de vídeos
ARQUIVO="./listavideos.txt"

# Verifica se o arquivo existe antes de rodar
if [ ! -f "$ARQUIVO" ]; then
    echo "Erro: O arquivo $ARQUIVO não foi encontrado."
    exit 1
fi

echo "Iniciando a fila de vídeos..."

# Lê o arquivo linha por linha
while IFS= read -r url || [ -n "$url" ]; do
    # Ignora linhas em branco
    if [ -z "$url" ]; then
        continue
    fi
    
    echo "Abrindo: $url"
    termux-open "$url"
    
    # Aguarda 15 minutos (15m = 900 segundos)
    echo "Aguardando 15 minutos para o próximo..."
    sleep 15m
    
done < "$ARQUIVO"

echo "Todos os vídeos da lista foram abertos!"
