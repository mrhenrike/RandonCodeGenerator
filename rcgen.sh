#!/bin/bash

# Script para gerar sequencias aleatórias de caracteres, para serem utilizados nos certificados
# dos cursos do União Geek.
# Deve ser temporário até estrutura melhor para viabilizar sua geração automática.

function modoUso() {
clear
echo "Random Code Generator - Gerador de Códigos de Validação para Certificados do União Geek
Copyright (c) 2018, União Geek, Henrique Santos <henrique.santos@uniaogeek.com.br>

Opções gerais:
  -h           Exibe uma lista de opções.
  -a           Exibe o Copyright e repositório oficial.

Argumentos obrigatórios:
  -t <tipo>    Deve ser especificado o tipo de dado que irá retornar. Vide abaixo.
     --number  Retorna apenas números
     --strup   Retorna apenas strings de A-Z Uppercase
     --strlw   Retorna apenas strings de a-z Lowercase
     --alfa    Retornar strings alfanuméricas: a-z, A-Z, 0-9

Argumentos opcionais (se utilizado é obrigatório o argumento -t):
  -s           Especifica a quantidade de caracteres para a string a ser gerada.
               Quando não utilizado o padrão é 10 caracteres.

  -q           Especifica quantas strings serão geradas.
               Quando não utilizado o padrão é retornar apenas 1 resultado.

  -o <nomedoarquivo>
               Exporta os dados gerados para um arquivo. Uso: -o <nomedoarquivo>

Exemplo de uso: 
  ./`basename $0` -t --alfa -s 10 -q 2
     lm9wxwlNk8
     NdZtpwDNa0
"   
   exit 1
}

#####################################################################################
function typeNumber(){
	clear
	echo "# Total: ${2:-1} número(s) com ${1:-10} caracteres"
	cat /dev/urandom | tr -dc '0-9' | fold -w ${1:-10} | head -n ${2:-1}
}

#####################################################################################
function typeStringUpper(){
	clear
	echo "# Total: ${2:-1} string(s) com ${1:-10} caracteres"
	cat /dev/urandom | tr -dc 'A-Z' | fold -w ${1:-10} | head -n ${2:-1}
}

#####################################################################################
function typeStringLower(){
	clear
	echo "# Total: ${2:-1} string(s) com ${1:-10} caracteres"
	cat /dev/urandom | tr -dc 'a-z' | fold -w ${1:-10} | head -n ${2:-1}
}

#####################################################################################
function typeAlfanumerico(){
	clear
	echo "# Total: ${2:-1} string(s) com ${1:-10} caracteres"
	cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w ${1:-10} | head -n ${2:-1}
}

#####################################################################################
function exibeAutor(){
clear
echo
echo "Random Code Generator v1.0
Copyright (c) 2018, União Geek, Henrique Santos <henrique.santos@uniaogeek.com.br>

Gerador de Códigos de Validação para Certificados do União Geek

Script `basename $0`

Criado por André Henrique

Repositório no GITHUB: https://github.com/mrhenrike/RandonCodeGenerator/
"
}

#####################################################################################
function geraString(){
	case $DO_TYPE in
		"--number"  ) typeNumber "$DO_SIZE" "$DO_TOTAL"
			;;
		"--strup"   ) typeStringUpper "$DO_SIZE" "$DO_TOTAL"
			;;
		"--strlw"   ) typeStringLower "$DO_SIZE" "$DO_TOTAL"
			;;
		"--alfa"    ) typeAlfanumerico "$DO_SIZE" "$DO_TOTAL"
			;;
	esac
}

#####################################################################################
while getopts "hao:s:q:t:" OPTION
do
   case $OPTION in
      h) modoUso
         ;;
      a) exibeAutor
         exit 1
         ;;
      o) ARQUIVO_LISTA=$OPTARG
         ;;
      s) DO_SIZE=$OPTARG
         ;;
      q) DO_TOTAL=$OPTARG
         ;;
      t) DO_TYPE="$OPTARG"
         ;;
      \?) modoUso
         ;;
      :) echo "Argumento ou opção inválida"   
   esac
done

shift $((OPTIND-1))
 
if [ -z "$DO_SIZE" ] && [ -z "$DO_TOTAL" ] && [ -z "$DO_TYPE" ]; then
   modoUso
fi
 
if [ "$ARQUIVO_LISTA" ]; then
	echo "Execução iniciada em `date`." >> $ARQUIVO_LISTA
	geraString >> $ARQUIVO_LISTA
else
	geraString	
fi



