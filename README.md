# Randon Code Generator
Gerador de Códigos de Validação para Certificados do União Geek

Copyright (c) 2018, União Geek, Henrique Santos <henrique.santos@uniaogeek.com.br>

## Opções gerais:
  -h    Exibe uma lista de opções.
  -a    Exibe o Copyright e repositório oficial.
## Argumentos obrigatórios:
  -t <tipo>    Deve ser especificado o tipo de dado que irá retornar. Vide abaixo.
     --number  Retorna apenas números
     --strup   Retorna apenas strings de A-Z Uppercase
     --strlw   Retorna apenas strings de a-z Lowercase
     --alfa    Retornar strings alfanuméricas: a-z, A-Z, 0-9

## Argumentos opcionais (se utilizado é obrigatório o argumento -t):
  -s    Especifica a quantidade de caracteres para a string a ser gerada.
        Quando não utilizado o padrão é 10 caracteres.
  -q    Especifica quantas strings serão geradas.
        Quando não utilizado o padrão é retornar apenas 1 resultado.
  -o <nomedoarquivo>
        Exporta os dados gerados para um arquivo. Uso: -o <nomedoarquivo>
  
## Exemplo de uso: 
  ./`basename $0` -t --alfa -s 10 -q 2
     lm9wxwlNk8
     NdZtpwDNa0
