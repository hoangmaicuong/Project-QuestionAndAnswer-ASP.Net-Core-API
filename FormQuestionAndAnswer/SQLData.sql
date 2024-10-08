USE [master]
GO
/****** Object:  Database [FormQuestionAndAnswer]    Script Date: 22/09/2024 21:05:27 PM ******/
CREATE DATABASE [FormQuestionAndAnswer]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FormQuestionAndAnswer', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\FormQuestionAndAnswer.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FormQuestionAndAnswer_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\FormQuestionAndAnswer_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [FormQuestionAndAnswer] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FormQuestionAndAnswer].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FormQuestionAndAnswer] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FormQuestionAndAnswer] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FormQuestionAndAnswer] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FormQuestionAndAnswer] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FormQuestionAndAnswer] SET ARITHABORT OFF 
GO
ALTER DATABASE [FormQuestionAndAnswer] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FormQuestionAndAnswer] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FormQuestionAndAnswer] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FormQuestionAndAnswer] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FormQuestionAndAnswer] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FormQuestionAndAnswer] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FormQuestionAndAnswer] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FormQuestionAndAnswer] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FormQuestionAndAnswer] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FormQuestionAndAnswer] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FormQuestionAndAnswer] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FormQuestionAndAnswer] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FormQuestionAndAnswer] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FormQuestionAndAnswer] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FormQuestionAndAnswer] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FormQuestionAndAnswer] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FormQuestionAndAnswer] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FormQuestionAndAnswer] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FormQuestionAndAnswer] SET  MULTI_USER 
GO
ALTER DATABASE [FormQuestionAndAnswer] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FormQuestionAndAnswer] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FormQuestionAndAnswer] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FormQuestionAndAnswer] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FormQuestionAndAnswer] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FormQuestionAndAnswer] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [FormQuestionAndAnswer] SET QUERY_STORE = ON
GO
ALTER DATABASE [FormQuestionAndAnswer] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [FormQuestionAndAnswer]
GO
/****** Object:  Table [dbo].[Answer]    Script Date: 22/09/2024 21:05:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[question_id] [int] NULL,
	[answer_option_id] [int] NULL,
 CONSTRAINT [PK_Answer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AnswerOption]    Script Date: 22/09/2024 21:05:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnswerOption](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[option_answer_content] [nvarchar](225) NULL,
	[question_id] [int] NULL,
 CONSTRAINT [PK_AnswerOption] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AnswerType]    Script Date: 22/09/2024 21:05:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnswerType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [nchar](10) NULL,
	[name] [nvarchar](204) NULL,
 CONSTRAINT [PK_AnswerType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Questions]    Script Date: 22/09/2024 21:05:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[question_content] [nvarchar](500) NULL,
	[answer_type_id] [int] NULL,
	[answer_content] [nvarchar](225) NULL,
	[question_title_id] [int] NULL,
	[is_required] [bit] NULL,
 CONSTRAINT [PK_Questions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestionTitle]    Script Date: 22/09/2024 21:05:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionTitle](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[question_title_content] [nvarchar](225) NULL,
 CONSTRAINT [PK_QuestionTitle] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AnswerType] ON 

INSERT [dbo].[AnswerType] ([id], [code], [name]) VALUES (1, N'ReplyText ', N'reply text')
INSERT [dbo].[AnswerType] ([id], [code], [name]) VALUES (4, N'ChooseAS  ', N'choose answer')
SET IDENTITY_INSERT [dbo].[AnswerType] OFF
GO
ALTER TABLE [dbo].[Answer]  WITH CHECK ADD  CONSTRAINT [FK_Answer_AnswerOption] FOREIGN KEY([answer_option_id])
REFERENCES [dbo].[AnswerOption] ([id])
GO
ALTER TABLE [dbo].[Answer] CHECK CONSTRAINT [FK_Answer_AnswerOption]
GO
ALTER TABLE [dbo].[Answer]  WITH CHECK ADD  CONSTRAINT [FK_Answer_Questions] FOREIGN KEY([question_id])
REFERENCES [dbo].[Questions] ([id])
GO
ALTER TABLE [dbo].[Answer] CHECK CONSTRAINT [FK_Answer_Questions]
GO
ALTER TABLE [dbo].[AnswerOption]  WITH CHECK ADD  CONSTRAINT [FK_AnswerOption_Questions] FOREIGN KEY([question_id])
REFERENCES [dbo].[Questions] ([id])
GO
ALTER TABLE [dbo].[AnswerOption] CHECK CONSTRAINT [FK_AnswerOption_Questions]
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK_Questions_AnswerType] FOREIGN KEY([answer_type_id])
REFERENCES [dbo].[AnswerType] ([id])
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK_Questions_AnswerType]
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK_Questions_QuestionTitle] FOREIGN KEY([question_title_id])
REFERENCES [dbo].[QuestionTitle] ([id])
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK_Questions_QuestionTitle]
GO
/****** Object:  StoredProcedure [dbo].[GetAllQuestionTitle]    Script Date: 22/09/2024 21:05:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAllQuestionTitle] 
AS
BEGIN
SELECT  id as questionTitleId
,question_title_content as questionTitleContent
FROM QuestionTitle
ORDER BY id
END
GO
/****** Object:  StoredProcedure [dbo].[GetQuestion]    Script Date: 22/09/2024 21:05:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetQuestion] 
(
   @ID as int
)
AS
BEGIN
SELECT Questions.id AS question_id,
Questions.question_content,
Questions.answer_content,

Questions.answer_type_id as answer_type_id,
AnswerType.code as answer_type_code,

AnswerOption.id as answer_option_id,
AnswerOption.option_answer_content

FROM Questions
LEFT JOIN AnswerType ON AnswerType.id = Questions.answer_type_id
LEFT JOIN AnswerOption ON AnswerOption.question_id = Questions.id
WHERE Questions.id = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[GetQuestionTitle]    Script Date: 22/09/2024 21:05:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetQuestionTitle] 
(
   @ID as int
)
AS
BEGIN
-- Lấy theo Option để hiển thị
SELECT QuestionTitle.id as questionTitleId
,QuestionTitle.question_title_content as questionTitleContent
,Questions.id as questionsId
,Questions.question_content as questionContent
,Questions.is_required as isRequired
,Questions.answer_content as answerContent

,Questions.answer_type_id as answerTypeId
,AnswerType.code as answerTypeCode
,AnswerType.name as answerTypeName

,AnswerOption.id as answerOptionId
,AnswerOption.option_answer_content as optionAnswerContent
FROM QuestionTitle
LEFT JOIN Questions ON Questions.question_title_id = QuestionTitle.id
LEFT JOIN AnswerType ON AnswerType.id = Questions.answer_type_id
Left JOIN AnswerOption ON AnswerOption.question_id = Questions.id
WHERE QuestionTitle.id = @ID
ORDER BY Questions.id

-- Lấy answer lấy đáp án
SELECT Questions.id as questionsId
,Questions.question_content as questionContent

,Answer.id as answerId
,AnswerOption.id as answerOptionId
,AnswerOption.option_answer_content as optionAnswerContent
FROM QuestionTitle
LEFT JOIN Questions ON Questions.question_title_id = QuestionTitle.id
Left JOIN Answer ON Answer.question_id = Questions.id
Left JOIN AnswerOption ON AnswerOption.id = Answer.answer_option_id
WHERE QuestionTitle.id = @ID AND AnswerOption.id IS NOT NULL
END
GO
USE [master]
GO
ALTER DATABASE [FormQuestionAndAnswer] SET  READ_WRITE 
GO
