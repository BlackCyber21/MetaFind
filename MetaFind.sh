#!/bin/bash
echo '
		 __  __       _          _____ _             _
		|  \/  |  ___| |_  __ _ |  ___(_) _ __    __| |
		| |\/| | / _ \ __|/ _  || |_  | ||  _ \  / _  |
		| |  | ||  __/ |_| (_| ||  _| | || | | || (_| |
		|_|  |_| \___|\__|\__,_||_|   |_||_| |_| \__,_|
            		Version 1.1    Author @BlackCyber
			https://github.com/BlackCyber21/
'
SEARCH="lynx --dump"
ALVO="$1"
TIPO="$2"

if [ "$1" == "" ]
then
echo
echo "                Modo de uso: $0 testphp.vulnweb.com/ xml"
echo
else
echo
echo "                Arquivos $TIPO encontrados!"
$SEARCH "https://google.com/search?&q=site:$ALVO+ext:$TIPO" | grep "$TIPO" | cut -d "=" -f2 | egrep -v "site|google" | sed 's/...$//' > outfile
echo
echo "                Baixando Arquivos $TIPO"
echo
for url in $(cat outfile);do wget -q $url | sleep 2;done
echo "              Detalhes Extraidos dos Metadados: "
exiftool *$TIPO #| egrep "Title|Producer|=="
fi
