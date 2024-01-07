CREATE DATABASE CLINICA 

  

CREATE TABLE PACIENTE ( 
num_Beneficiario	int	not null, 
nome	varchar(100) not null, 
logradouro varchar(200) not null, 
numero	int	not null, 
cep	char(8)	not null, 
complemento	varchar(255) not null, 
telefone varchar(11) not null 
PRIMARY KEY (num_Beneficiario) 
) 
Go 
CREATE TABLE ESPECIALIDADE( 
id_especialidade	int	not null, 
especialidade	varchar(100) not null 
PRIMARY KEY(id_especialidade) 
)
GO
CREATE TABLE MEDICO(
codigo_medico	int	not null,
nome	varchar(100) not null,
logradouro varchar(200) not null, 
numero	int	not null, 
cep	char(8)	not null, 
complemento	varchar(255) not null, 
contato varchar(11) not null,
id_especialidade int not null
PRIMARY KEY(codigo_medico)
FOREIGN KEY(id_especialidade) REFERENCES ESPECIALIDADE(id_especialidade)
)
CREATE TABLE CONSULTA(
num_Beneficiario int not null,
codigo_medico int not null,
data_hora datetime not null,
observacao	varchar(255) not null
PRIMARY KEY(num_Beneficiario, codigo_medico, data_hora)
FOREIGN KEY(num_Beneficiario) REFERENCES PACIENTE(num_Beneficiario),
FOREIGN KEY(codigo_medico) REFERENCES MEDICO(codigo_medico)
)
GO

--Inserindo Pacientes
INSERT INTO PACIENTE VALUES
(99901, 'Washington Silva', 'R. Anhaia', 150, '02345000', 'Casa', '922229999'),
(99902, 'Luis Ricardo', 'R. Voluntários da Pátria', 2251, '03254010', 'Bloco B. Apto 25', '923450987'),
(99903, 'Maria Elisa', 'Av. Aguia de Haia', 1188, '06987020', 'Apto 1208', '912348765'),
(99904, 'José Araujo', 'R. XV de Novembro', 18, '03678000', 'Casa', '945674312'),
(99905, 'Joana Paula', 'R. 7 de Abril' , 97, '01214000', 'Conjunto 3 - Apto 801', '912095674')

--Inserindo as Especialidade
INSERT INTO ESPECIALIDADE VALUES
(1, 'Otorrinolaringologista'),
(2, 'Urologista'),
(3, 'Geriatra'),
(4, 'Pediatra')

--Inserindo Medicos
INSERT INTO MEDICO VALUES
(100001, 'Ana Paula', 'R. 7 de Setembro', 256, '03698000', 'Casa', '915689456', 1),
(100002, 'Maria Aparecida', 'Av. Brasil', 32, '02145070', 'Casa', '923235454', 1),
(100003, 'Lucas Borges' , 'Av. do Estado', 3210, '05241000', 'Apto 205', '963698585', 2),
(100004, 'Gabriel Oliveira', 'Av. Dom Helder Camara', 350, '03145000', 'Apto 602', '932458745', 3)

-- Inserindo Consultas
INSERT INTO CONSULTA VALUES
(99901, 100002, '2021-09-04 13:20', 'Infecção Urina'),
(99902, 100003, '2021-09-04 13:15', 'Gripe'),
(99901, 100001, '2021-09-04 12:30', 'Infecção Garganta')

-- Adicionando nova coluna
ALTER TABLE MEDICO
ADD dia_atendimento varchar(20) 


--Atualizando dia dos medicos
UPDATE MEDICO
SET dia_atendimento = '2º feira'
Where codigo_medico = 100001

UPDATE MEDICO
SET dia_atendimento = '4º feira'
Where codigo_medico = 100002

UPDATE MEDICO
SET dia_atendimento = '2º feira'
Where codigo_medico = 100003

UPDATE MEDICO
SET dia_atendimento = '5º feira'
Where codigo_medico = 100004

--Excluindo especialidade pediatra
Delete ESPECIALIDADE
WHERE id_especialidade=4

Select *
from MEDICO

--Atualizar nome da coluna = não e possivel

-- Atualizando medico lucas
UPDATE MEDICO
SET logradouro= 'Av. Bras Leme', numero=876, complemento = 'Apto 504', cep='02122000'
Where codigo_medico = 100003

-- alterando tipo de dado observação da consulta
ALTER TABLE CONSULTA
ALTER COLUMN observacao varchar(200) not null