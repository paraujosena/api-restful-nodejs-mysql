CREATE DATABASE node_mysql_crud_db;

use node_mysql_crud_db;

CREATE  TABLE IF NOT EXISTS `funcionarios` (
  `id` BIGINT UNSIGNED AUTO_INCREMENT,
  `primeiro_nome` VARCHAR(255) NOT NULL,
  `ultimo_nome` VARCHAR(255) NOT NULL,
  `email` CHAR(255) NOT NULL,
  `telefone` VARCHAR(50) NOT NULL,
  `empresa` VARCHAR(255) NOT NULL,
  `funcao` VARCHAR(100) NOT NULL,
  `salario` DECIMAL(11,2) UNSIGNED DEFAULT 0.00,
  `status` TINYINT UNSIGNED DEFAULT 0,
  `is_deleted` TINYINT UNSIGNED DEFAULT 0,
  `data_criacao` DATETIME NOT NULL,
  `data_atualizacao` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)) 
  
  CREATE  TABLE IF NOT EXISTS `employees` (
    `id` BIGINT UNSIGNED AUTO_INCREMENT,
    `first_name` VARCHAR(255) NOT NULL,
    `last_name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `phone` VARCHAR(50) NOT NULL,
    `organization` VARCHAR(255) NOT NULL,
    `designation` VARCHAR(100) NOT NULL,
    `salary` DECIMAL(11,2) UNSIGNED DEFAULT 0.00,
    `status` TINYINT UNSIGNED DEFAULT 0,
    `is_deleted` TINYINT UNSIGNED DEFAULT 0,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)) 
  
  ENGINE = InnoDB;

INSERT INTO `node_mysql_crud_db`.`employees` (`first_name`, `last_name`, `email`, `phone`, `organization`, `designation`, `salary`, `status`, `is_deleted`, `created_at`) 
VALUES ('John', 'Doe', 'johndoe@gmail.com', '1234567890', 'BR Softech Pvt Ltd', 'Full Stack Developer', '500.00', '1', '0', '2019-11-19 03:30:30');

INSERT INTO node_mysql_crud_db.employees (`first_name`, `last_name`, `email`, `phone`, `organization`, `designation`, `salary`, `status`, `is_deleted`, `created_at`) 
VALUES ('Jane', 'Doe', 'janedoe@gmail.com', '9876543210', 'RG Infotech Jaipur', 'PHP Developer', '450.00', '1', '0', '2019-11-19 03:35:30');

select * from employees

Adicionar uma coluna à tabela:

ALTER TABLE nome_tabela ADD nome_coluna tipo_dados;

Excluir uma coluna de uma tabela:

ALTER TABLE nome_tabela DROP COLUMN nome_coluna;

Alterar o tipo de dados de uma coluna:

ALTER TABLE nome_tabela MODIFY COLUMN nome_coluna tipo_dados;

Adicionar uma constraint do tipo NOT NULL a uma coluna:

ALTER TABLE nome_tabela MODIFY nome_coluna tipo_dados NOT NULL;

Alterar uma tabela para adicionar uma constraint de chave primária a uma coluna:

ALTER TABLE nome_tabela ADD CONSTRAINT nome_constraint PRIMARY KEY (coluna1, coluna2, ...); 

Excluir uma constraint de uma tabela:

ALTER TABLE nome_tabela DROP CONSTRAINT nome_constraint;

Exemplos

1 – Excluir a coluna ID_Autor da tabela tbl_livros:

ALTER TABLE tbl_livros
DROP COLUMN ID_Autor;

2 – Adicionar a coluna ID_Autor à tabela tbl_livros e configurá-la como chave estrangeira da coluna ID_Autor da tabela tbl_autores:

ALTER TABLE tbl_livros
ADD ID_Autor SMALLINT NOT NULL
CONSTRAINT fk_ID_Autor FOREIGN KEY (ID_Autor) REFERENCES tbl_autores (ID_autor);

3 – Adicionar a coluna ID_editora à tabela tbl_livros e configurá-la como chave estrangeira da coluna ID_editora da tabela tbl_editoras:

ALTER TABLE tbl_livros
ADD ID_editora SMALLINT NOT NULL
CONSTRAINT fk_id_editora FOREIGN KEY (ID_editora) REFERENCES tbl_editoras (ID_editora) ON DELETE CASCADE;

4 – Alterando o tipo de dados da coluna ID_Autor para SMALLINT:

ALTER TABLE tbl_livros
ALTER COLUMN ID_Autor SMALLINT;

5 – Adicionando a constraint PRIMARY KEY á coluna ID_Cliente (já existente) da tabela Clientes:

ALTER TABLE Clientes
ADD CONSTRAINT pk_id_cliente PRIMARY KEY (ID_Cliente);

Comando DROP TABLE

Usamos o comando DROP TABLE para excluir uma tabela do banco de dados, incluindo todos os seus dados.

Sintaxe:

DROP TABLE nome_tabela;

Exemplo:

DROP TABLE Clientes;

Exercício para Fixação

Tente fazer o seguinte exercício sozinho. A resolução sugerida está na sequência:

1. Criar uma nova tabela no banco de dados db_Biblioteca, para armazenar gêneros dos livros. Sugestão de nome: tbl_generos

2. Criar uma nova coluna na tabela de livros para realizar o relacionamento com a tabela de gêneros.

3. Inserir um novo registro de livro no banco. Atenção: inserir antes quaisquer editoras, autores e gêneros necessários. Pesquise um livro que você gosta para realizar esse cadastro.

4. Verifique se os dados foram inseridos com sucesso usando o comando:
SELECT * FROM nome_tabela;
RESOLUÇÃO

CREATE TABLE tbl_generos (
ID_Genero Tinyint IDENTITY,
Genero VARCHAR(25)
CONSTRAINT pk_id_genero PRIMARY KEY (ID_Genero)
);

ALTER TABLE tbl_livros
ADD ID_Genero Tinyint
CONSTRAINT fk_id_genero FOREIGN KEY (ID_Genero)
REFERENCES tbl_generos (ID_Genero) ON DELETE CASCADE;

INSERT INTO tbl_generos (Genero)
VALUES 
('Ficção'),
('Romance'),
('Aventura'),
('Técnico'),
('Suspense');

INSERT INTO tbl_autores (ID_Autor, Nome_Autor)
VALUES (6, 'Daniel Defoe');

INSERT INTO tbl_editoras (Nome_Editora)
VALUES
('Penguin Classics');

INSERT INTO tbl_Livros (Nome_Livro, ISBN, Data_Pub,
Preco_Livro, ID_Autor, ID_editora, ID_Genero)
VALUES
('As Aventuras de Robinson Crusoé','98653696912','18700509', 32.50, 6, 10,3);

SELECT * FROM tbl_livros;

Exercício de SQL Server - comando ALTER TABLE