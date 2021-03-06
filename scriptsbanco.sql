USE [master]
GO
/****** Object:  Database [DBMercado]    Script Date: 05/09/2017 18:02:04 ******/
CREATE DATABASE [DBMercado]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBMercado', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\DBMercado.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBMercado_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\DBMercado_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DBMercado] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBMercado].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBMercado] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBMercado] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBMercado] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBMercado] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBMercado] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBMercado] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBMercado] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBMercado] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBMercado] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBMercado] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBMercado] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBMercado] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBMercado] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBMercado] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBMercado] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBMercado] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBMercado] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBMercado] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBMercado] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBMercado] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBMercado] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBMercado] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBMercado] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DBMercado] SET  MULTI_USER 
GO
ALTER DATABASE [DBMercado] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBMercado] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBMercado] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBMercado] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBMercado] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBMercado] SET QUERY_STORE = OFF
GO
USE [DBMercado]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [DBMercado]
GO
/****** Object:  Table [dbo].[DBDistribuidores]    Script Date: 05/09/2017 18:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DBDistribuidores](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](75) NULL,
 CONSTRAINT [PK_DBDistribuidores] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DBEstoque]    Script Date: 05/09/2017 18:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DBEstoque](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdProduto] [int] NOT NULL,
	[Quantidade] [decimal](8, 2) NOT NULL,
 CONSTRAINT [PK_DBEstoque] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DBFabricantes]    Script Date: 05/09/2017 18:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DBFabricantes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](75) NULL,
 CONSTRAINT [PK_DBFabricantes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DBLog]    Script Date: 05/09/2017 18:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DBLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[login] [varchar](50) NOT NULL,
	[usuario] [int] NOT NULL,
	[senha] [varchar](25) NOT NULL,
 CONSTRAINT [PK_DBLog_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DBProdutos]    Script Date: 05/09/2017 18:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DBProdutos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](50) NOT NULL,
	[Valor] [decimal](8, 2) NOT NULL,
	[Fabricante] [int] NOT NULL,
	[Distribuidor] [int] NOT NULL,
	[Imagem] [varchar](500) NULL,
 CONSTRAINT [PK_DBProdutos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DBUsuarios]    Script Date: 05/09/2017 18:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DBUsuarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](75) NOT NULL,
	[Nivel] [varchar](25) NOT NULL,
 CONSTRAINT [PK_DBUsuarios] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DBVendas]    Script Date: 05/09/2017 18:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DBVendas](
	[IdVenda] [int] IDENTITY(1,1) NOT NULL,
	[IdProduto] [int] NOT NULL,
	[Quantidade] [decimal](7, 2) NULL,
	[Funcionario] [int] NOT NULL,
	[Data] [varchar](58) NULL,
 CONSTRAINT [PK_DBVendas] PRIMARY KEY CLUSTERED 
(
	[IdVenda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DBEstoque]  WITH CHECK ADD  CONSTRAINT [FK__DBEstoque__IdPro__2A4B4B5E] FOREIGN KEY([IdProduto])
REFERENCES [dbo].[DBProdutos] ([Id])
GO
ALTER TABLE [dbo].[DBEstoque] CHECK CONSTRAINT [FK__DBEstoque__IdPro__2A4B4B5E]
GO
ALTER TABLE [dbo].[DBLog]  WITH CHECK ADD  CONSTRAINT [FK__DBLog__usuario__07C12930] FOREIGN KEY([usuario])
REFERENCES [dbo].[DBUsuarios] ([Id])
GO
ALTER TABLE [dbo].[DBLog] CHECK CONSTRAINT [FK__DBLog__usuario__07C12930]
GO
ALTER TABLE [dbo].[DBProdutos]  WITH CHECK ADD  CONSTRAINT [FK__DBProduto__Distr__29572725] FOREIGN KEY([Distribuidor])
REFERENCES [dbo].[DBDistribuidores] ([Id])
GO
ALTER TABLE [dbo].[DBProdutos] CHECK CONSTRAINT [FK__DBProduto__Distr__29572725]
GO
ALTER TABLE [dbo].[DBProdutos]  WITH CHECK ADD  CONSTRAINT [FK__DBProduto__Fabri__286302EC] FOREIGN KEY([Fabricante])
REFERENCES [dbo].[DBFabricantes] ([Id])
GO
ALTER TABLE [dbo].[DBProdutos] CHECK CONSTRAINT [FK__DBProduto__Fabri__286302EC]
GO
ALTER TABLE [dbo].[DBVendas]  WITH CHECK ADD  CONSTRAINT [FK__DBVendas__Funcio__3C69FB99] FOREIGN KEY([Funcionario])
REFERENCES [dbo].[DBUsuarios] ([Id])
GO
ALTER TABLE [dbo].[DBVendas] CHECK CONSTRAINT [FK__DBVendas__Funcio__3C69FB99]
GO
ALTER TABLE [dbo].[DBVendas]  WITH CHECK ADD  CONSTRAINT [FK__DBVendas__IdProd__3B75D760] FOREIGN KEY([IdProduto])
REFERENCES [dbo].[DBProdutos] ([Id])
GO
ALTER TABLE [dbo].[DBVendas] CHECK CONSTRAINT [FK__DBVendas__IdProd__3B75D760]
GO
/****** Object:  StoredProcedure [dbo].[AlteraDistribuidor]    Script Date: 05/09/2017 18:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AlteraDistribuidor]
	@Nome varchar(100),
	@Id int
AS 
BEGIN
	UPDATE 
		DBDistribuidores SET
			NOME = @Nome 
			WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[AlteraEstoque]    Script Date: 05/09/2017 18:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AlteraEstoque]
	@IdProduto int,
	@Quantidade decimal
AS
BEGIN
	UPDATE 
		DBEstoque
	SET
		IdProduto = @IdProduto,
		Quantidade = @Quantidade
	WHERE
		IdProduto = @IdProduto
END
GO
/****** Object:  StoredProcedure [dbo].[AlteraFabricante]    Script Date: 05/09/2017 18:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AlteraFabricante]
	@Nome varchar(100),
	@Id int
AS 
BEGIN
	UPDATE 
		DBFabricantes SET
			NOME = @Nome 
			WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[AlteraLogin]    Script Date: 05/09/2017 18:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AlteraLogin]
	@login varchar(100),
	@senha varchar(20),
	@funcionario int
AS
BEGIN
	UPDATE
		DBLog
	SET 
		login = @login,
		usuario = @funcionario,
		senha = @senha
	WHERE
		usuario = @funcionario
END
GO
/****** Object:  StoredProcedure [dbo].[AlteraProduto]    Script Date: 05/09/2017 18:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AlteraProduto]
	@Id int,
	@Nome varchar(100),
	@Valor decimal(6,2),
	@Fabricante int,
	@Distribuidor int,
	@Imagem varchar(500)
AS
BEGIN
	UPDATE 
		DBProdutos 
	SET
		Nome = @Nome,
		Valor = @Valor,
		Fabricante = @Fabricante,
		Distribuidor = @Distribuidor,
		Imagem = @Imagem
	WHERE
		Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[AlteraUsuario]    Script Date: 05/09/2017 18:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AlteraUsuario]
	@Id int,
	@Nome varchar(100),
	@Nivel varchar(100)
AS
BEGIN
	UPDATE 
		DBUsuarios 
	SET
		Nome = @Nome,
		Nivel = @Nivel
	WHERE
		Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[AlteraVenda]    Script Date: 05/09/2017 18:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AlteraVenda]
	@IdVenda int,
	@IdProduto int,
	@Quantidade decimal,
	@IdFuncionario int
AS
BEGIN
	UPDATE 
		DBVendas 
	SET
		IdProduto = @IdProduto,
		Quantidade = @Quantidade,
		Funcionario = @IdFuncionario
	WHERE
		IdVenda = @IdVenda
END
GO
/****** Object:  StoredProcedure [dbo].[BuscaQProduto]    Script Date: 05/09/2017 18:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BuscaQProduto]
	@IdProduto int
AS
BEGIN
	SELECT
		e.Id, e.Quantidade 
	FROM DBEstoque e
	INNER JOIN 
		DBProdutos p on p.Id = e.IdProduto
	WHERE IdProduto = @IdProduto
END
GO
/****** Object:  StoredProcedure [dbo].[ExcluiDistribuidor]    Script Date: 05/09/2017 18:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ExcluiDistribuidor]
	@Id int 
AS
BEGIN
	DELETE FROM DBDistribuidores WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[ExcluiFabricante]    Script Date: 05/09/2017 18:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ExcluiFabricante]
	@Id int 
AS
BEGIN
	DELETE FROM 
		DBFabricantes
    WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[ExcluiLogin]    Script Date: 05/09/2017 18:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ExcluiLogin]
	@Id int
AS
BEGIN
	DELETE FROM
		DBLog
	WHERE usuario = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[ExcluiProduto]    Script Date: 05/09/2017 18:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ExcluiProduto]
	@Id int
AS
BEGIN
	DELETE FROM
		DBProdutos
	WHERE 
		Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[ExcluirEstoque]    Script Date: 05/09/2017 18:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ExcluirEstoque]
	@IdProduto int
AS
BEGIN
	DELETE FROM
		DBEstoque
	WHERE IdProduto = @IdProduto
END
GO
/****** Object:  StoredProcedure [dbo].[ExcluirUsuario]    Script Date: 05/09/2017 18:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ExcluirUsuario]
	@Id	int
AS
BEGIN
	DELETE FROM DBLog
		WHERE usuario = @Id
	DELETE
		FROM DBUsuarios
		WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[ExcluirVenda]    Script Date: 05/09/2017 18:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ExcluirVenda]
@Id int
AS
BEGIN
	DELETE FROM 
		DBVendas
	WHERE 
		IdVenda = @Id 
END
GO
/****** Object:  StoredProcedure [dbo].[InsereDistribuidor]    Script Date: 05/09/2017 18:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsereDistribuidor]
	@Nome varchar(100)
AS
BEGIN
	INSERT INTO 
		DBDistribuidores
			(Nome) 
		VALUES
			(@Nome);
END
GO
/****** Object:  StoredProcedure [dbo].[InsereEstoque]    Script Date: 05/09/2017 18:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsereEstoque]
	@IdProduto int,
	@Quantidade decimal
AS 
BEGIN
	INSERT INTO
		DBEstoque(IdProduto,Quantidade)
	Values
		(@IdProduto,@Quantidade)
END
GO
/****** Object:  StoredProcedure [dbo].[InsereFabricante]    Script Date: 05/09/2017 18:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsereFabricante]
	@Nome varchar(100)
AS
BEGIN
	INSERT INTO 
		DBFabricantes
			(Nome) 
		VALUES
			(@Nome);
END
GO
/****** Object:  StoredProcedure [dbo].[InsereLogin]    Script Date: 05/09/2017 18:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsereLogin]
	@login varchar(100),
	@usuario int,
	@senha varchar(20)
AS
BEGIN
	INSERT INTO	
		DBLog(login,usuario,senha)
	VALUES
		(@login,@usuario,@senha)
END
GO
/****** Object:  StoredProcedure [dbo].[InsereProduto]    Script Date: 05/09/2017 18:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsereProduto]
	@Nome varchar(100),
	@Valor decimal(6,2),
	@Fabricante int,
	@Distribuidor int,
	@Imagem varchar(500)
AS
BEGIN
	INSERT INTO 
		DBProdutos(Nome,Valor,Fabricante,Distribuidor,Imagem)
	VALUES
		(@Nome,@Valor,@Fabricante,@Distribuidor,@Imagem)
END
GO
/****** Object:  StoredProcedure [dbo].[InsereUsuario]    Script Date: 05/09/2017 18:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsereUsuario]
	@Nome varchar(100),
	@Nivel varchar(100)
AS
BEGIN
	INSERT INTO 
		DBUsuarios
			(Nome,Nivel)
	VALUES
		(@Nome,@Nivel)
END
GO
/****** Object:  StoredProcedure [dbo].[InsereVenda]    Script Date: 05/09/2017 18:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsereVenda]
	@IdProduto int,
	@Quantidade decimal(8,2),
	@IdFuncionario int,
	@Data varchar(40)
AS
BEGIN
	INSERT
		INTO DBVendas(IdProduto,Quantidade,Funcionario,Data)
		VALUES(@IdProduto,@Quantidade,@IdFuncionario,@Data)
END
GO
/****** Object:  StoredProcedure [dbo].[ListaDistribuidores]    Script Date: 05/09/2017 18:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ListaDistribuidores]
AS
BEGIN
	SELECT * FROM DBDistribuidores
END	
GO
/****** Object:  StoredProcedure [dbo].[ListaDistribuidorPorId]    Script Date: 05/09/2017 18:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ListaDistribuidorPorId]
	@Id int
AS
BEGIN
	SELECT * FROM DBDistribuidores WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[ListaFabricantePorId]    Script Date: 05/09/2017 18:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ListaFabricantePorId]
	@Id int
AS
BEGIN
	SELECT * FROM 
		DBFabricantes
	WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[ListaFabricantes]    Script Date: 05/09/2017 18:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ListaFabricantes]
AS
BEGIN
	SELECT * FROM 
		DBFabricantes
END	
GO
/****** Object:  StoredProcedure [dbo].[ListaProdutoPorId]    Script Date: 05/09/2017 18:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ListaProdutoPorId]
	@Id int
AS
BEGIN
	SELECT 
		p.Id, p.Nome, p.Valor, p.Fabricante, p.Distribuidor, p.Valor, f.Nome AS 'NomeFabricante', d.Nome  AS 'NomeDistribuidor', p.Imagem as 'Imagem' 
	FROM 
		DBProdutos p
	inner join 
		DBFabricantes f on f.Id = p.Fabricante
	inner join 
		DBDistribuidores d on d.Id = p.Distribuidor
	where 
		p.Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[ListaProdutos]    Script Date: 05/09/2017 18:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ListaProdutos]
AS
BEGIN
	SELECT 
		p.Id, p.Nome, p.Valor, f.Nome AS 'nFabricante', d.Nome AS 'nDistribuidor' 
	FROM DBProdutos p
	inner join DBFabricantes f on f.Id = p.Fabricante
	inner join DBDistribuidores d on d.Id = p.Distribuidor
END
GO
/****** Object:  StoredProcedure [dbo].[listaProdutosForaEstoque]    Script Date: 05/09/2017 18:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[listaProdutosForaEstoque]
AS
BEGIN
	SELECT p.Id, 
	   p.Nome 
	FROM DBProdutos p
		LEFT JOIN DBEstoque e 
			ON e.IdProduto = p.Id
	WHERE e.Id IS NULL 
END
GO
/****** Object:  StoredProcedure [dbo].[ListarEstoque]    Script Date: 05/09/2017 18:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ListarEstoque]
AS
BEGIN
	SELECT 
		p.id as 'IdProduto', p.Nome as 'Nome', d.Nome as 'Distribuidor', f.Nome as 'Fabricante', e.Quantidade 
	FROM 
		DBProdutos p
	inner join DBEstoque e on e.IdProduto = p.Id
	inner join DBFabricantes f on f.Id = p.Fabricante
	inner join DBDistribuidores d on d.Id = p.Distribuidor
END
GO
/****** Object:  StoredProcedure [dbo].[ListarEstoquePorIdProduto]    Script Date: 05/09/2017 18:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ListarEstoquePorIdProduto]
	@IdProduto int 
AS
BEGIN
	SELECT* FROM DBEstoque WHERE IdProduto = @IdProduto
END
GO
/****** Object:  StoredProcedure [dbo].[ListarLogins]    Script Date: 05/09/2017 18:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ListarLogins]
AS
BEGIN
	SELECT 
		l.Id,l.login,l.usuario,u.Nome,u.Nivel, l.senha
	FROM DBLog l
	INNER JOIN 
		DBUsuarios u on u.Id = l.usuario
END
GO
/****** Object:  StoredProcedure [dbo].[ListaUsuarioPorId]    Script Date: 05/09/2017 18:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ListaUsuarioPorId]
	@Id int
AS
BEGIN
	SELECT * FROM
		DBUsuarios
	WHERE 
		Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[ListaUsuarios]    Script Date: 05/09/2017 18:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ListaUsuarios]
AS
BEGIN
	SELECT * FROM
		DBUsuarios
END
GO
/****** Object:  StoredProcedure [dbo].[ListaUsuariosSemLogin]    Script Date: 05/09/2017 18:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ListaUsuariosSemLogin]
AS
BEGIN
	SELECT * 
		FROM DBUsuarios u
			LEFT JOIN DBLog l on u.Id = l.usuario
		WHERE l.Id IS NULL
END
GO
/****** Object:  StoredProcedure [dbo].[ListaVendaPorId]    Script Date: 05/09/2017 18:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ListaVendaPorId]
	@Id int
AS
BEGIN
	SELECT 
		v.IdVenda, v.Data, v.IdProduto, p.Nome, v.Quantidade, v.Funcionario 
	FROM 
		DBVendas v
	inner join 
		DBProdutos p ON p.Id = v.IdProduto
	WHERE 
		IdVenda = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[ListaVendas]    Script Date: 05/09/2017 18:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ListaVendas]
AS
BEGIN
	SELECT 
		v.IdVenda, v.Data, p.Id AS 'IdProduto', p.Nome AS 'Produto', v.Quantidade, v.Funcionario, u.Nome AS 'FuncionarioNome' 
	FROM 
		DBVendas v
	inner join 
		DBProdutos p on p.Id  = v.IdProduto
	inner join 
		DBUsuarios u on u.Id = v.Funcionario
END
GO
/****** Object:  StoredProcedure [dbo].[LoginFuncionario]    Script Date: 05/09/2017 18:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LoginFuncionario]
	@Id int
AS
BEGIN
	SELECT 
		l.Id,l.login,l.usuario,u.Nome,u.Nivel, l.senha
	FROM 
		DBLog l
	INNER JOIN 
		DBUsuarios u on u.Id = l.usuario
	WHERE 
		usuario = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[RetornaIdEstoquePeloProduto]    Script Date: 05/09/2017 18:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RetornaIdEstoquePeloProduto]
	@IdProduto int
AS
BEGIN
	SELECT 
		e.Id 
	FROM 
		DBEstoque e
	INNER JOIN 
		DBProdutos p on p.Id = e.IdProduto
	WHERE 
		IdProduto = @IdProduto
END
GO
/****** Object:  StoredProcedure [dbo].[VerificaDistribuidor]    Script Date: 05/09/2017 18:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VerificaDistribuidor]
	@IdDistribuidor int
AS
BEGIN
SELECT TOP 1 1 
	FROM DBProdutos
	WHERE Distribuidor = @IdDistribuidor
END
GO
/****** Object:  StoredProcedure [dbo].[VerificaDistribuidorIgual]    Script Date: 05/09/2017 18:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VerificaDistribuidorIgual]
	@nome varchar(75)
AS
BEGIN
	SELECT TOP 1 1 FROM DBDistribuidores
	WHERE Nome = @nome
END
GO
/****** Object:  StoredProcedure [dbo].[VerificaExistenciaSimilar]    Script Date: 05/09/2017 18:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VerificaExistenciaSimilar]
	@login varchar(50),
	@Id int
AS
BEGIN
	SELECT TOP 1 1
		FROM DBLog
		WHERE login = @login AND usuario <> @Id
END
GO
/****** Object:  StoredProcedure [dbo].[VerificaFabricante]    Script Date: 05/09/2017 18:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VerificaFabricante]
	@IdFabricante int
AS
BEGIN
SELECT TOP 1 1 
	FROM DBProdutos
	WHERE Fabricante = @IdFabricante
END
GO
/****** Object:  StoredProcedure [dbo].[VerificaFabricanteIgual]    Script Date: 05/09/2017 18:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VerificaFabricanteIgual]
	@nome varchar(75)
AS
BEGIN
	SELECT TOP 1 1 FROM DBFabricantes
	WHERE Nome = @nome
END
GO
/****** Object:  StoredProcedure [dbo].[VerificaLogin]    Script Date: 05/09/2017 18:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VerificaLogin]
	@login varchar(50),
	@senha varchar(25)
AS
BEGIN
	SELECT l.usuario
		FROM DBLog l
		WHERE login = @login AND senha = @senha
END
GO
/****** Object:  StoredProcedure [dbo].[VerificaNivel]    Script Date: 05/09/2017 18:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VerificaNivel]
	@Id int
AS
BEGIN
	SELECT u.Nivel 
		FROM DBUsuarios u
	WHERE u.Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[VerificaProdutoIgual]    Script Date: 05/09/2017 18:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VerificaProdutoIgual]
	@nome varchar(50),
	@idFabricante int,
	@idProduto int = null
AS
BEGIN
	SELECT top 1  1 from DBProdutos p
		inner join DBFabricantes f on p.Fabricante = f.Id
	WHERE 
		f.Id = @idFabricante AND p.Nome = @nome AND (@idProduto = null OR @idProduto <> p.Id)
END
GO
/****** Object:  StoredProcedure [dbo].[VerificaUsuarioIgual]    Script Date: 05/09/2017 18:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VerificaUsuarioIgual]
	@nome varchar(75),
	@nivel varchar(1),
	@Id int
AS
BEGIN
	SELECT TOP 1 1 
		FROM DBUsuarios
		WHERE Nome = @nome AND Nivel = @nivel AND Id <> @Id 
END
GO
/****** Object:  StoredProcedure [dbo].[VerificaVenda]    Script Date: 05/09/2017 18:02:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VerificaVenda]
	@IdFuncionario int
AS
BEGIN
	SELECT TOP 1 1
		FROM DBVendas v
		WHERE v.Funcionario = @IdFuncionario
END
GO
USE [master]
GO
ALTER DATABASE [DBMercado] SET  READ_WRITE 
GO
