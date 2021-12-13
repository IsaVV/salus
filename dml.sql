-- Insere dados na tabela Startup
INSERT INTO Startup (Codigo, CNPJ, Nome, Data_reg)
VALUES 	(1, 111, 'Salus', '2021-05-25'),       
(2, 222, 'Cesar', '2020-04-09'),	   
(3, 333, 'Bubbles', '2021-05-08');
            
-- Insere dados na tabela Empreendedor
INSERT INTO Empreendedor(Codigo, Capac_invest, Relac_time, Qualificacao)
VALUES (1, 12345.67, 3, 4),        
(2, 45678.79, 2, 5),       
(3, 567423.99, 5, 0);

-- Insere dados na tabela Tecnologia
INSERT INTO Tecnologia(Codigo, Tamanho_time, Difer_mercado, Inov_tecno, Usabilidade)
VALUES (1, 12, 3, 4, 5),        
(2, 20, 2, 5, 4),       
(3, 25, 5, 5, 4);

-- Insere dados na tabela Mercado
INSERT INTO Mercado(Codigo, Mat_com, Comp_merc, Val_prob)
VALUES (1, 5, 2, 5),
(2, 3, 4, 4), 
(3, 4, 5, 5); 

-- Insere dados na tabela Gestao
INSERT INTO Gestao(Codigo, Reg_fisc_jur, Proj_cres, Proc_e_flux_int) 
VALUES (1, 5, 3, 5), 
(2, 3, 5, 5), 
(3, 2, 3, 3); 

-- Insere dados na tabela Capital
INSERT INTO Capital(Codigo, Rec_Prop, Capital_inv, Capta_inv, Ret_inv, Acs_merc_int, Fat_merc) 
VALUES (1, 200000, 3, 20000, 50000, 4, 2), 
(2, 100000, 4, 10000, 40000, 3, 3), 
(3, 20000, 3, 100000, 500000, 5, 4); 

-- Insere dados na tabela Solucao
INSERT INTO Solucao(Codigo, Capac_dev, Capac_esc, Precificacao)
VALUES (1, 4, 4, 200000),
(2, 5, 4, 100000), 
(3, 4, 5, 300000); 

INSERT INTO Dono(CPF, Genero, Nome)
VALUES ('07576895537', 'Masculino', 'Felipe'),
('07576895897', 'Feminino', 'Luiza'), 
('02342345537', 'Masculino', 'Douglas'); 

INSERT INTO Funcionario(CPF, Genero, Nome, NIS, Codigo, Data_Cont)
VALUES ('07123455537', 'Masculino', 'Marco', 124454564643, 1, '2021-05-25'),
('12346895897', 'Feminino', 'Inês', 74320957928452, 2, '2021-07-22'), 
('02342345678', 'Masculino', 'Dante', 1244598172983741, 3, '2021-09-27'); 

INSERT INTO Dono_Startup(CPF, Codigo)
VALUES ('07576895537', 1),
('07576895897', 2),
('07576895897', 3),  
('02342345537', 3);


commit;
