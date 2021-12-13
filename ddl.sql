-- Tabela Empreendedor
CREATE TABLE IF NOT EXISTS Empreendedor (
	Codigo	INT NOT NULL,
 	Capac_invest	FLOAT NOT NULL,
  	Relac_time	INT NOT NULL,
  	Qualificacao INT NOT NULL,
  	PRIMARY KEY (Codigo));

-- Tabela Tecnologia
CREATE TABLE IF NOT EXISTS Tecnologia (
	Codigo	INT NOT NULL,
 	Tamanho_time	INT NOT NULL,
  	Difer_mercado	INT NOT NULL,
  	Inov_tecno INT NOT NULL,
   	Usabilidade INT NOT NULL,
  	PRIMARY KEY (Codigo));
  
-- Tabela Solução
CREATE TABLE IF NOT EXISTS Solucao (
	Codigo	INT NOT NULL,
	Capac_dev	INT NOT NULL,
 	Capac_esc	INT NOT NULL,
  	Precificacao	INT NOT NULL,
  	PRIMARY KEY (Codigo));

 -- Tabela Capital
CREATE TABLE IF NOT EXISTS Capital (
	Codigo	INT NOT NULL,
	Rec_prop	FLOAT NOT NULL,
 	Capital_inv	INT NOT NULL,
  	Capta_inv	FLOAT NOT NULL,
  	Ret_inv	FLOAT NOT NULL,
  	Acs_merc_int	INT NOT NULL,
  	Fat_merc	INT NOT NULL,
  	PRIMARY KEY (Codigo));
 
-- Tabela Mercado
CREATE TABLE IF NOT EXISTS Mercado (
	Codigo	INT NOT NULL,
	Mat_com	INT NOT NULL,
 	Comp_merc	INT NOT NULL,
  	Val_prob	INT NOT NULL,
  	PRIMARY KEY (Codigo));

  -- Tabela Gestão
CREATE TABLE IF NOT EXISTS Gestao ( 
	Codigo INT NOT NULL, 
	Reg_fisc_jur INT NOT NULL, 
	Proj_cres INT NOT NULL, 
	Proc_e_flux_int INT NOT NULL, 
	PRIMARY KEY (Codigo)); 
  
-- Tabela Startup
CREATE TABLE IF NOT EXISTS Startup (
	 Codigo INT NOT NULL,
	 CNPJ 	INT NOT NULL,
	 Nome 	VARCHAR(20) NOT NULL,
   Data_reg DATE NOT NULL,
	 PRIMARY KEY (Codigo));

-- Tabela Dono
CREATE TABLE IF NOT EXISTS Dono (
	 CPF VARCHAR(20) NOT NULL,
	 Genero VARCHAR(20) NOT NULL,
	 Nome 	VARCHAR(20) NOT NULL,
	 PRIMARY KEY (CPF));

-- Tabela Funcionario
CREATE TABLE IF NOT EXISTS Funcionario (
	 CPF VARCHAR(20) NOT NULL,
	 Genero VARCHAR(20) NOT NULL,
	 Nome 	VARCHAR(20) NOT NULL,
   NIS    VARCHAR(20) NOT NULL,
   Codigo INT NOT NULL,
   Data_Cont DATE NOT NULL,
	 PRIMARY KEY (CPF));

-- Tabela Dono
CREATE TABLE IF NOT EXISTS Dono_Startup (
	 Codigo INT NOT NULL,
   CPF VARCHAR(20) NOT NULL,
	 PRIMARY KEY (Codigo, CPF));
