-------------------------------------------------------------------------------------------
-- Gustavo Lima, Isadora Viana e Pedro Almeida.

-- 2.3.1.1 (WHERE)

-------------------------------------------------------------------------------------------

-- Retorna todos os indicadores de uma Startup especificada no WHERE (nesse caso a Salus)
SELECT *
FROM Startup
INNER JOIN Gestao g
ON g.Codigo = Startup.Codigo
INNER JOIN Tecnologia t
ON t.Codigo = Startup.Codigo
INNER JOIN Mercado m
ON m.Codigo = Startup.Codigo
INNER JOIN Capital c
ON c.Codigo = Startup.Codigo
INNER JOIN Solucao s
ON s.Codigo = Startup.Codigo
INNER JOIN Empreendedor e
ON e.Codigo = Startup.Codigo
WHERE Startup.Nome = "Salus";

-------------------------------------------------------------------------------------------

--2.3.1.2 (JUNÇÕES, INNER JOIN, LEFT OUTER JOIN, RIGHT OUTER JOIN, FULL OUTER JOIN)

-------------------------------------------------------------------------------------------

-- Retorna os indicadores da categoria Gestão de cada Startup
SELECT s.Nome, Gestao.Reg_fisc_jur, Gestao.Proj_cres, Gestao.Proc_e_flux_int 
FROM Gestao
LEFT OUTER JOIN Startup s ON Gestao.Codigo = s.Codigo;

-- Retorna os indicadores da categoria Mercado de cada Startup
SELECT s.Nome, Mercado.Mat_com, Mercado.Comp_merc, Mercado.Val_prob 
FROM Mercado
INNER JOIN Startup s ON Mercado.Codigo = s.Codigo;

-- Retorna os indicadores da categoria Empreendedor de cada Startup
SELECT s.Nome, e.Capac_invest, e.Relac_time, e.Qualificacao
FROM Startup s
RIGHT OUTER JOIN Empreendedor e ON e.Codigo = s.Codigo;

-------------------------------------------------------------------------------------------

--3.3.1.9 e 2.3.1.2 (UNION) e (FULL OUTER JOIN)

-------------------------------------------------------------------------------------------

-- O MySQL não possui o operador FULL OUTER JOIN

-- Select * 
-- From Tecnologia t FULL OUTER JOIN Startup s
-- ON t.Codigo = s.Codigo;

-- Utiliza-se o UNION do LEFT com o RIGHT OUTER JOIN
-- Listar todos os dados do indicador tecnologia de todas as startups, independente deles estarem relacionados.
Select *
From Tecnologia t
LEFT OUTER JOIN Startup s ON t.Codigo = s.Codigo
UNION
Select *
From Tecnologia t RIGHT OUTER JOIN Startup s ON t.Codigo = s.Codigo;


-- Listar todos os dados do indicador Capital de todas as startups, independente deles estarem relacionados.
Select *
From Capital c 
LEFT OUTER JOIN Startup s ON c.Codigo = s.Codigo
UNION
Select *
From Capital c RIGHT OUTER JOIN Startup s ON c.Codigo = s.Codigo;

-- Listar todos os dados do indicador Empreendedor de todas as startups, independente deles estarem relacionados.
Select *
From Empreendedor e 
LEFT OUTER JOIN Startup s ON e.Codigo = s.Codigo
UNION
Select *
From Empreendedor e RIGHT OUTER JOIN Startup s ON e.Codigo = s.Codigo;

-- Listar todos os dados do indicador Gestao de todas as startups, independente deles estarem relacionados.
Select *
From Gestao g
LEFT OUTER JOIN Startup s ON g.Codigo = s.Codigo
UNION
Select *
From Gestao g RIGHT OUTER JOIN Startup s ON g.Codigo = s.Codigo;

-- Listar todos os dados do indicador Mercado de todas as startups, independente deles estarem relacionados.
Select *
From Mercado m
LEFT OUTER JOIN Startup s ON m.Codigo = s.Codigo
UNION
Select *
From Mercado m RIGHT OUTER JOIN Startup s ON m.Codigo = s.Codigo;

-- Listar todos os dados do indicador Solucao de todas as startups, independente deles estarem relacionados.
Select *
From Solucao so
LEFT OUTER JOIN Startup s ON so.Codigo = s.Codigo
UNION
Select *
From Solucao so RIGHT OUTER JOIN Startup s ON so.Codigo = s.Codigo;

-- Lista todos os indicadores de Solucao de cada Startup
SELECT *
FROM Startup
CROSS JOIN Solucao
WHERE Startup.Codigo = Solucao.Codigo;


-------------------------------------------------------------------------------------------

-- 3.3.1.5 (ORDER BY)

-------------------------------------------------------------------------------------------

-- Seleciona os indicadores FINANCEIROS das Startups em ordem alfabética
SELECT *
FROM Startup
INNER JOIN Mercado m
ON m.Codigo = Startup.Codigo
INNER JOIN Capital c
ON c.Codigo = Startup.Codigo
INNER JOIN Solucao s
ON s.Codigo = Startup.Codigo
ORDER BY Startup.Codigo;

-- Seleciona os indicadores HUMANOS das Startups em ordem alfabética
SELECT *
FROM Startup
INNER JOIN Gestao g
ON g.Codigo = Startup.Codigo
INNER JOIN Tecnologia t
ON t.Codigo = Startup.Codigo
INNER JOIN Empreendedor e
ON e.Codigo = Startup.Codigo
ORDER BY Startup.Codigo;

-------------------------------------------------------------------------------------------

-- 3.3.1.3 (GROUP BY)

-------------------------------------------------------------------------------------------

-- Retorna a soma de captação de investimentos das Startups por ano
SELECT EXTRACT(YEAR FROM Data_reg), SUM(c.Capta_inv)
FROM Startup s
RIGHT OUTER JOIN Capital c ON s.Codigo = c.Codigo 
GROUP BY EXTRACT(YEAR FROM Data_reg);

-- Retorna a soma de retorno de investimento das Startups por ano
SELECT EXTRACT(YEAR FROM Data_reg), SUM(c.Ret_inv)
FROM Startup s
RIGHT OUTER JOIN Capital c ON s.Codigo = c.Codigo 
GROUP BY EXTRACT(YEAR FROM Data_reg);

-- Retorna a soma de recurso próprio das Startups por ano
SELECT EXTRACT(YEAR FROM Data_reg), SUM(c.Rec_prop)
FROM Startup s
RIGHT OUTER JOIN Capital c ON s.Codigo = c.Codigo 
GROUP BY EXTRACT(YEAR FROM Data_reg);

-------------------------------------------------------------------------------------------

-- 3.3.1.3 (GROUP BY HAVING)

-------------------------------------------------------------------------------------------

-- Mostra os anos que tiveram pelo menos 2 empresas registradas
SELECT COUNT(s.Codigo), EXTRACT(YEAR FROM Data_reg)
FROM Startup s 
GROUP BY EXTRACT(YEAR FROM Data_reg)
HAVING COUNT(s.Codigo) >= 2;

-- Mostra quantas empresas foram registradas por ano
SELECT COUNT(s.Codigo), EXTRACT(YEAR FROM Data_reg)
FROM Startup s 
GROUP BY EXTRACT(YEAR FROM Data_reg)
HAVING COUNT(s.Codigo) >= 1;

-------------------------------------------------------------------------------------------

-- 3.3.1.6 (NUMÉRICA)

-------------------------------------------------------------------------------------------

-- Retorna as startups cujo indicador selecionado for 0 (e necessita de atenção), neste caso utilizamos o indicador de qualificação

SELECT SIGN(e.Qualificacao), Startup.Nome
FROM Startup
INNER JOIN Empreendedor e
ON e.Codigo = Startup.Codigo
WHERE SIGN(e.Qualificacao) = 0;

-- Retorna as startups cujo indicador selecionado for 0 (e necessita de atenção), neste caso utilizamos o indicador de relacionamento com o time


SELECT SIGN(e.Relac_time), Startup.Nome
FROM Startup
INNER JOIN Empreendedor e
ON e.Codigo = Startup.Codigo
WHERE SIGN(e.Relac_time) = 0;

-------------------------------------------------------------------------------------------

-- 3.3.1.7 (LITERAL)

-------------------------------------------------------------------------------------------
-- Como nosso banco de dados só tem o Nome da startup de String decidimos concatenar com o CNPJ pra ficar similar a uma razão social

-- Seleciona a concatenação do nome com o CNPJ das Startup
SELECT CONCAT(s.Nome, " - ", s.CNPJ)
FROM Startup s;

-------------------------------------------------------------------------------------------

-- 3.3.1.8 (DATA)

-------------------------------------------------------------------------------------------

-- Seleciona as Startups registradas em 2021 
SELECT *
FROM Startup
WHERE EXTRACT(YEAR FROM Data_reg) = 2021;

-- Seleciona as Startups registradas em anos passados
SELECT *
FROM Startup
WHERE EXTRACT(YEAR FROM Data_reg) <= 2020;

-------------------------------------------------------------------------------------------

-- FINAL --

-- Mostra os anos que tiveram pelo menos 1 funcionario novo registrado
SELECT COUNT(f.CPF), EXTRACT(YEAR FROM Data_cont)
FROM Funcionario f 
GROUP BY EXTRACT(YEAR FROM Data_cont)
HAVING COUNT(f.CPF) >= 1;

-- Seleciona os nomes dos donos e as Startups que eles possuem
SELECT d.Nome, s.Nome
FROM Dono_Startup ds
INNER JOIN Startup s
ON ds.Codigo = s.Codigo
INNER JOIN Dono d
ON ds.CPF = d.CPF;

-- Seleciona os nomes, CPF dos Funcionarios e as Startups que eles trabalham
SELECT f.CPF, f.Nome, s.Nome
FROM Funcionario f
LEFT OUTER JOIN Startup s
ON s.Codigo = s.Codigo;

