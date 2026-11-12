USE DB_T05072C_Thais_Vieira;

SELECT 
    nome AS nome_original,
    UPPER(nome) AS nome_maiusculo,
    LOWER(nome) AS nome_minusculo,
    CHAR_LENGTH(nome) AS quantidade_letras,
    LEFT(nome, 3) AS primeiras_3_letras,
    preco AS preco_original,
    ROUND(preco, 1) AS preco_arredondado,
    CURDATE() AS data_atual
FROM padaria_produto;