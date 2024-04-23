CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;
-------------------------------------------------
-- Table `mydb`.`telefoneEmpresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`telefoneEmpresa` (
  `ddd` INT NULL,
  `telefoneEmpresacol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`telefoneEmpresacol`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Empresa` (
  `cpnj` VARCHAR(45) NOT NULL,
  `logradouro` VARCHAR(45) NULL,
  `bairro` VARCHAR(45) NULL,
  `cidade` VARCHAR(45) NULL,
  `nomeEmpresa` VARCHAR(45) NULL,
  `telefoneEmpresa_telefoneEmpresacol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cpnj`, `telefoneEmpresa_telefoneEmpresacol`),
  INDEX `fk_Empresa_telefoneEmpresa1_idx` (`telefoneEmpresa_telefoneEmpresacol` ASC) ,
  CONSTRAINT `fk_Empresa_telefoneEmpresa1`
    FOREIGN KEY (`telefoneEmpresa_telefoneEmpresacol`)
    REFERENCES `mydb`.`telefoneEmpresa` (`telefoneEmpresacol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Evento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Evento` (
  `idEvento` INT NOT NULL,
  `nomeEvento` VARCHAR(45) NULL,
  `dataEvento` DATE NULL,
  `localEvento` VARCHAR(45) NULL,
  `valorBase` VARCHAR(45) NULL,
  PRIMARY KEY (`idEvento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `cpf` VARCHAR(50) NOT NULL,
  `nome` VARCHAR(45) NULL,
  `sobrenome` VARCHAR(45) NULL,
  `dataNascimento` DATE NULL,
  `ddd` VARCHAR(45) NULL,
  `numero` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `logradouro` VARCHAR(45) NULL,
  `bairro` VARCHAR(45) NULL,
  `cidade` VARCHAR(45) NULL,
  PRIMARY KEY (`cpf`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Ingresso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Ingresso` (
  `codIngresso` INT NOT NULL AUTO_INCREMENT,
  `dataCompra` DATE NULL,
  `valorPago` VARCHAR(45) NULL,
  `Cliente_cpf` VARCHAR(30) NULL,
  `Evento_idEvento` INT NOT NULL,
  `quantidadeMax` INT NULL,
  PRIMARY KEY (`codIngresso`),
  INDEX `fk_Ingresso_Cliente1_idx` (`Cliente_cpf` ASC),
  INDEX `fk_Ingresso_Evento1_idx` (`Evento_idEvento` ASC),
  CONSTRAINT `fk_Ingresso_Cliente1`
    FOREIGN KEY (`Cliente_cpf`)
    REFERENCES `mydb`.`Cliente` (`cpf`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Ingresso_Evento1`
    FOREIGN KEY (`Evento_idEvento`)
    REFERENCES `mydb`.`Evento` (`idEvento`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Relacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Relacao` (
  `Empresa_cpnj` VARCHAR(45) NOT NULL,
  `Evento_idEvento` INT NOT NULL,
  PRIMARY KEY (`Empresa_cpnj`, `Evento_idEvento`),
  INDEX `fk_Relação_Evento1_idx` (`Evento_idEvento` ASC),
  CONSTRAINT `fk_Relação_Empresa1`
    FOREIGN KEY (`Empresa_cpnj`)
    REFERENCES `mydb`.`Empresa` (`cpnj`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Relação_Evento1`
    FOREIGN KEY (`Evento_idEvento`)
    REFERENCES `mydb`.`Evento` (`idEvento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

 insert into cliente values 
    ('923.892.673-56', 'Isabela',  'Solange', '2000-02-21', '(31)','91246-9872','isabelasolange@gmail.com', 'Ruas das Glórias, 83','Itabira', 'Itaraquié'),
    ('990.422.633-46', 'Carlos', 'Almeida', '1990-05-30','(71)','91523-9512', 'carlosalmeida@gmail.com','Rua da Paciência, 98', 'Salvador', 'Itapuã'),
    ('782.222.123-98', 'Lorenzo', 'Cabrito', '2003-01-23','(18)','98267-9087', 'lorenzocabrito@outlook.com', 'Parque Vila Coutos, 72', 'Andradina', 'Aracatuba'),
    ('023.232.123-90', 'Olivia', 'Fatos', '1940-08-30', '(68)','98765-0123', 'oliviafatospsiquicos@gmail.com', 'Caminho 09, Fazenda Caju X', 'Acrelandia', 'Utumaru'),
    ('823.162.163-89', 'Kaue', 'Santos Da Silva', '1940-08-30','(11)','99934-9876', 'kauemilitanteemdia@hotmail.com', 'Fazenda Militos', 'Aluminio', 'Ferro'),
    ('718.245.424-12', 'Maria', 'Antonieta Gloria', '1983-04-24', '(18)','98865-6543', 'antonietazerosanidade@gmail.com', 'Internato Lagos Cantos, 23', 'Birigui', 'Biriguelado'),
    ('213.882.643-72', 'Lauro', 'Constantino', '1937-06-04', '(77)','99525-1456', 'Legião Ulisses Morais, 12', 'lauroconstantino@gmail.com', 'Boa Nova', 'Boa Velha'),
    ('678.082.223-90', 'Yasmin', 'Santos', '2001-05-14', '(71)','98635-3453', 'YasminProfissional@gmail.com', 'Jardim Careca, 62', 'Candeias', 'Esquecida'),
    ('312.245.524-21', 'Tom','Clevis', '1989-09-26', '(75)','98973-2345','tomzinhojogador@gmail.com','Tancredo Neves, 55', 'Canudos', 'Copo'),
    ('771.345.231-90', 'Enzo', 'Jair', '1993-01-31', '(74)','9999-7654','enzojairlindo@gmail.com','Liberdade das pessoas, 90', 'Xique-Xique','Buraco da Rua'),
    ('453.123.523-45', 'Talita', 'Souza', '1999-12-17', '(71)','99812-4567','talitasouza34@gmail.com','Rua da paixão, 32','Salvador', 'Paripe');
    
    insert into telefoneEmpresa values
    ('14','97412-8782'),
    ('11','98712-2394'),
    ('1','93252-1111'),
    ('19','98452-0769');
    
    insert into empresa values 
    ('78.454.333/5412-78','Canarinho doce','Parque Santo Amaro', '154', 'Dolly Guanará LTDA', '97412-8782'),
    ('24.487.425/9242-21','Montanha da Mãe',' Agradecida', '1030', 'Brinquedos e Doces BD', '98712-2394'),
    ('11.767.323/2157-20','Ladeira da paixão',' Caminho da paz', '453', 'Heineken', '93252-1111'),
    ('34.135.215/6543-25','Parque', 'Do Colega Brown', '997', 'Techno Interprise', '98452-0769');
    
    insert into evento values 
    ('1','Comunidade em União: Contra as drogas', '2024-08-03', 'Parque de Exposições', '5000'),
    ('2','Parquinho ao ar livro', '2024-10-10', 'Parque Vila Lobos', '40000'),
    ('3','Yaki-Yaki: Dia do Yakisoba', '2024-07-10', 'Restaurante Japonês Yaki-Yaki', '7500'),
    ('4','Para fora já o Bullying !', '2024-05-07', 'Espaço lazer, 106', '4500'),
    ('5','Comic-Con 2024', '2024-08-09', 'São Paulo Expo', '900000'),
    ('6','BGS - Brasil Game Show', '2024-08-03', 'Expo Center Norte', '750000'),
    ('7','Culiniária e Curiosidades', '2024-05-03', 'UNEP', '100000'),
    ('8','Técnicas de Pesca', '2024-07-01', 'Lago das Aranhas', '70000'),
    ('9','Agricultura no Brasi: Investindo', '2024-12-02', 'Atacaré Exposion', '50000'),
    ('10','Roupas da Atualidade', '2024-09-17', 'Fábrica Fanshion-ion', '100000');
    
    insert into relacao values 
    ('78.454.333/5412-78','1'),
    ( '24.487.425/9242-21','2'),
    ( '78.454.333/5412-78','3'),
    ( '78.454.333/5412-78','4');
    



