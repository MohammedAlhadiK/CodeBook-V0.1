USE [master]
GO
/****** Object:  Database [CodeBook_V8]    Script Date: 10/13/2022 12:46:20 AM ******/
CREATE DATABASE [CodeBook_V8]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CodeBook02', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CodeBook02.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CodeBook02_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CodeBook02_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CodeBook_V8] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CodeBook_V8].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CodeBook_V8] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CodeBook_V8] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CodeBook_V8] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CodeBook_V8] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CodeBook_V8] SET ARITHABORT OFF 
GO
ALTER DATABASE [CodeBook_V8] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CodeBook_V8] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CodeBook_V8] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CodeBook_V8] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CodeBook_V8] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CodeBook_V8] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CodeBook_V8] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CodeBook_V8] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CodeBook_V8] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CodeBook_V8] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CodeBook_V8] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CodeBook_V8] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CodeBook_V8] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CodeBook_V8] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CodeBook_V8] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CodeBook_V8] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CodeBook_V8] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CodeBook_V8] SET RECOVERY FULL 
GO
ALTER DATABASE [CodeBook_V8] SET  MULTI_USER 
GO
ALTER DATABASE [CodeBook_V8] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CodeBook_V8] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CodeBook_V8] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CodeBook_V8] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CodeBook_V8] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CodeBook_V8] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CodeBook_V8', N'ON'
GO
ALTER DATABASE [CodeBook_V8] SET QUERY_STORE = OFF
GO
USE [CodeBook_V8]
GO
/****** Object:  Table [dbo].[cmsContentNu]    Script Date: 10/13/2022 12:46:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentNu](
	[nodeId] [int] NOT NULL,
	[published] [bit] NOT NULL,
	[data] [ntext] NULL,
	[rv] [bigint] NOT NULL,
	[dataRaw] [varbinary](max) NULL,
 CONSTRAINT [PK_cmsContentNu] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC,
	[published] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsContentType]    Script Date: 10/13/2022 12:46:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentType](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[alias] [nvarchar](255) NULL,
	[icon] [nvarchar](255) NULL,
	[thumbnail] [nvarchar](255) NOT NULL,
	[description] [nvarchar](1500) NULL,
	[isContainer] [bit] NOT NULL,
	[isElement] [bit] NOT NULL,
	[allowAtRoot] [bit] NOT NULL,
	[variations] [int] NOT NULL,
 CONSTRAINT [PK_cmsContentType] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsContentType2ContentType]    Script Date: 10/13/2022 12:46:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentType2ContentType](
	[parentContentTypeId] [int] NOT NULL,
	[childContentTypeId] [int] NOT NULL,
 CONSTRAINT [PK_cmsContentType2ContentType] PRIMARY KEY CLUSTERED 
(
	[parentContentTypeId] ASC,
	[childContentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsContentTypeAllowedContentType]    Script Date: 10/13/2022 12:46:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentTypeAllowedContentType](
	[Id] [int] NOT NULL,
	[AllowedId] [int] NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_cmsContentTypeAllowedContentType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[AllowedId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsDictionary]    Script Date: 10/13/2022 12:46:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsDictionary](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[parent] [uniqueidentifier] NULL,
	[key] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_cmsDictionary] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsDocumentType]    Script Date: 10/13/2022 12:46:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsDocumentType](
	[contentTypeNodeId] [int] NOT NULL,
	[templateNodeId] [int] NOT NULL,
	[IsDefault] [bit] NOT NULL,
 CONSTRAINT [PK_cmsDocumentType] PRIMARY KEY CLUSTERED 
(
	[contentTypeNodeId] ASC,
	[templateNodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsLanguageText]    Script Date: 10/13/2022 12:46:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsLanguageText](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[languageId] [int] NOT NULL,
	[UniqueId] [uniqueidentifier] NOT NULL,
	[value] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_cmsLanguageText] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsMacro]    Script Date: 10/13/2022 12:46:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMacro](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[uniqueId] [uniqueidentifier] NOT NULL,
	[macroUseInEditor] [bit] NOT NULL,
	[macroRefreshRate] [int] NOT NULL,
	[macroAlias] [nvarchar](255) NOT NULL,
	[macroName] [nvarchar](255) NULL,
	[macroCacheByPage] [bit] NOT NULL,
	[macroCachePersonalized] [bit] NOT NULL,
	[macroDontRender] [bit] NOT NULL,
	[macroSource] [nvarchar](255) NOT NULL,
	[macroType] [int] NOT NULL,
 CONSTRAINT [PK_cmsMacro] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsMacroProperty]    Script Date: 10/13/2022 12:46:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMacroProperty](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[uniquePropertyId] [uniqueidentifier] NOT NULL,
	[editorAlias] [nvarchar](255) NOT NULL,
	[macro] [int] NOT NULL,
	[macroPropertySortOrder] [int] NOT NULL,
	[macroPropertyAlias] [nvarchar](50) NOT NULL,
	[macroPropertyName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_cmsMacroProperty] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsMember]    Script Date: 10/13/2022 12:46:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMember](
	[nodeId] [int] NOT NULL,
	[Email] [nvarchar](1000) NOT NULL,
	[LoginName] [nvarchar](1000) NOT NULL,
	[Password] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_cmsMember] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsMember2MemberGroup]    Script Date: 10/13/2022 12:46:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMember2MemberGroup](
	[Member] [int] NOT NULL,
	[MemberGroup] [int] NOT NULL,
 CONSTRAINT [PK_cmsMember2MemberGroup] PRIMARY KEY CLUSTERED 
(
	[Member] ASC,
	[MemberGroup] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsMemberType]    Script Date: 10/13/2022 12:46:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMemberType](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[NodeId] [int] NOT NULL,
	[propertytypeId] [int] NOT NULL,
	[memberCanEdit] [bit] NOT NULL,
	[viewOnProfile] [bit] NOT NULL,
	[isSensitive] [bit] NOT NULL,
 CONSTRAINT [PK_cmsMemberType] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsPropertyType]    Script Date: 10/13/2022 12:46:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsPropertyType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dataTypeId] [int] NOT NULL,
	[contentTypeId] [int] NOT NULL,
	[propertyTypeGroupId] [int] NULL,
	[Alias] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[sortOrder] [int] NOT NULL,
	[mandatory] [bit] NOT NULL,
	[mandatoryMessage] [nvarchar](500) NULL,
	[validationRegExp] [nvarchar](255) NULL,
	[validationRegExpMessage] [nvarchar](500) NULL,
	[Description] [nvarchar](2000) NULL,
	[labelOnTop] [bit] NOT NULL,
	[variations] [int] NOT NULL,
	[UniqueID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_cmsPropertyType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsPropertyTypeGroup]    Script Date: 10/13/2022 12:46:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsPropertyTypeGroup](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[uniqueID] [uniqueidentifier] NOT NULL,
	[contenttypeNodeId] [int] NOT NULL,
	[type] [int] NOT NULL,
	[text] [nvarchar](255) NOT NULL,
	[alias] [nvarchar](255) NOT NULL,
	[sortorder] [int] NOT NULL,
 CONSTRAINT [PK_cmsPropertyTypeGroup] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsTagRelationship]    Script Date: 10/13/2022 12:46:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTagRelationship](
	[nodeId] [int] NOT NULL,
	[tagId] [int] NOT NULL,
	[propertyTypeId] [int] NOT NULL,
 CONSTRAINT [PK_cmsTagRelationship] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC,
	[propertyTypeId] ASC,
	[tagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsTags]    Script Date: 10/13/2022 12:46:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTags](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[group] [nvarchar](100) NOT NULL,
	[languageId] [int] NULL,
	[tag] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_cmsTags] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsTemplate]    Script Date: 10/13/2022 12:46:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTemplate](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[alias] [nvarchar](100) NULL,
 CONSTRAINT [PK_cmsTemplate] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoAccess]    Script Date: 10/13/2022 12:46:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoAccess](
	[id] [uniqueidentifier] NOT NULL,
	[nodeId] [int] NOT NULL,
	[loginNodeId] [int] NOT NULL,
	[noAccessNodeId] [int] NOT NULL,
	[createDate] [datetime] NOT NULL,
	[updateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_umbracoAccess] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoAccessRule]    Script Date: 10/13/2022 12:46:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoAccessRule](
	[id] [uniqueidentifier] NOT NULL,
	[accessId] [uniqueidentifier] NOT NULL,
	[ruleValue] [nvarchar](255) NOT NULL,
	[ruleType] [nvarchar](255) NOT NULL,
	[createDate] [datetime] NOT NULL,
	[updateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_umbracoAccessRule] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoAudit]    Script Date: 10/13/2022 12:46:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoAudit](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[performingUserId] [int] NOT NULL,
	[performingDetails] [nvarchar](1024) NULL,
	[performingIp] [nvarchar](64) NULL,
	[eventDateUtc] [datetime] NOT NULL,
	[affectedUserId] [int] NOT NULL,
	[affectedDetails] [nvarchar](1024) NULL,
	[eventType] [nvarchar](256) NOT NULL,
	[eventDetails] [nvarchar](1024) NULL,
 CONSTRAINT [PK_umbracoAudit] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoCacheInstruction]    Script Date: 10/13/2022 12:46:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoCacheInstruction](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[utcStamp] [datetime] NOT NULL,
	[jsonInstruction] [ntext] NOT NULL,
	[originated] [nvarchar](500) NOT NULL,
	[instructionCount] [int] NOT NULL,
 CONSTRAINT [PK_umbracoCacheInstruction] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoConsent]    Script Date: 10/13/2022 12:46:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoConsent](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[current] [bit] NOT NULL,
	[source] [nvarchar](512) NOT NULL,
	[context] [nvarchar](128) NOT NULL,
	[action] [nvarchar](512) NOT NULL,
	[createDate] [datetime] NOT NULL,
	[state] [int] NOT NULL,
	[comment] [nvarchar](255) NULL,
 CONSTRAINT [PK_umbracoConsent] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoContent]    Script Date: 10/13/2022 12:46:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoContent](
	[nodeId] [int] NOT NULL,
	[contentTypeId] [int] NOT NULL,
 CONSTRAINT [PK_umbracoContent] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoContentSchedule]    Script Date: 10/13/2022 12:46:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoContentSchedule](
	[id] [uniqueidentifier] NOT NULL,
	[nodeId] [int] NOT NULL,
	[languageId] [int] NULL,
	[date] [datetime] NOT NULL,
	[action] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_umbracoContentSchedule] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoContentVersion]    Script Date: 10/13/2022 12:46:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoContentVersion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[versionDate] [datetime] NOT NULL,
	[userId] [int] NULL,
	[current] [bit] NOT NULL,
	[text] [nvarchar](255) NULL,
	[preventCleanup] [bit] NOT NULL,
 CONSTRAINT [PK_umbracoContentVersion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoContentVersionCleanupPolicy]    Script Date: 10/13/2022 12:46:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoContentVersionCleanupPolicy](
	[contentTypeId] [int] NOT NULL,
	[keepAllVersionsNewerThanDays] [int] NULL,
	[keepLatestVersionPerDayForDays] [int] NULL,
	[preventCleanup] [bit] NOT NULL,
	[updated] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoContentVersionCultureVariation]    Script Date: 10/13/2022 12:46:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoContentVersionCultureVariation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[versionId] [int] NOT NULL,
	[languageId] [int] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[date] [datetime] NOT NULL,
	[availableUserId] [int] NULL,
 CONSTRAINT [PK_umbracoContentVersionCultureVariation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoDataType]    Script Date: 10/13/2022 12:46:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoDataType](
	[nodeId] [int] NOT NULL,
	[propertyEditorAlias] [nvarchar](255) NOT NULL,
	[dbType] [nvarchar](50) NOT NULL,
	[config] [ntext] NULL,
 CONSTRAINT [PK_umbracoDataType] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoDocument]    Script Date: 10/13/2022 12:46:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoDocument](
	[nodeId] [int] NOT NULL,
	[published] [bit] NOT NULL,
	[edited] [bit] NOT NULL,
 CONSTRAINT [PK_umbracoDocument] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoDocumentCultureVariation]    Script Date: 10/13/2022 12:46:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoDocumentCultureVariation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[languageId] [int] NOT NULL,
	[edited] [bit] NOT NULL,
	[available] [bit] NOT NULL,
	[published] [bit] NOT NULL,
	[name] [nvarchar](255) NULL,
 CONSTRAINT [PK_umbracoDocumentCultureVariation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoDocumentVersion]    Script Date: 10/13/2022 12:46:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoDocumentVersion](
	[id] [int] NOT NULL,
	[templateId] [int] NULL,
	[published] [bit] NOT NULL,
 CONSTRAINT [PK_umbracoDocumentVersion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoDomain]    Script Date: 10/13/2022 12:46:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoDomain](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[domainDefaultLanguage] [int] NULL,
	[domainRootStructureID] [int] NULL,
	[domainName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_umbracoDomain] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoExternalLogin]    Script Date: 10/13/2022 12:46:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoExternalLogin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[loginProvider] [nvarchar](4000) NOT NULL,
	[providerKey] [nvarchar](4000) NOT NULL,
	[createDate] [datetime] NOT NULL,
	[userData] [ntext] NULL,
 CONSTRAINT [PK_umbracoExternalLogin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoKeyValue]    Script Date: 10/13/2022 12:46:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoKeyValue](
	[key] [nvarchar](256) NOT NULL,
	[value] [nvarchar](255) NULL,
	[updated] [datetime] NOT NULL,
 CONSTRAINT [PK_umbracoKeyValue] PRIMARY KEY CLUSTERED 
(
	[key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoLanguage]    Script Date: 10/13/2022 12:46:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoLanguage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[languageISOCode] [nvarchar](14) NULL,
	[languageCultureName] [nvarchar](100) NULL,
	[isDefaultVariantLang] [bit] NOT NULL,
	[mandatory] [bit] NOT NULL,
	[fallbackLanguageId] [int] NULL,
 CONSTRAINT [PK_umbracoLanguage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoLock]    Script Date: 10/13/2022 12:46:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoLock](
	[id] [int] NOT NULL,
	[value] [int] NOT NULL,
	[name] [nvarchar](64) NOT NULL,
 CONSTRAINT [PK_umbracoLock] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoLog]    Script Date: 10/13/2022 12:46:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoLog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[NodeId] [int] NOT NULL,
	[entityType] [nvarchar](50) NULL,
	[Datestamp] [datetime] NOT NULL,
	[logHeader] [nvarchar](50) NOT NULL,
	[logComment] [nvarchar](4000) NULL,
	[parameters] [nvarchar](500) NULL,
 CONSTRAINT [PK_umbracoLog] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoMediaVersion]    Script Date: 10/13/2022 12:46:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoMediaVersion](
	[id] [int] NOT NULL,
	[path] [nvarchar](255) NULL,
 CONSTRAINT [PK_umbracoMediaVersion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoNode]    Script Date: 10/13/2022 12:46:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoNode](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[uniqueId] [uniqueidentifier] NOT NULL,
	[parentId] [int] NOT NULL,
	[level] [int] NOT NULL,
	[path] [nvarchar](150) NOT NULL,
	[sortOrder] [int] NOT NULL,
	[trashed] [bit] NOT NULL,
	[nodeUser] [int] NULL,
	[text] [nvarchar](255) NULL,
	[nodeObjectType] [uniqueidentifier] NULL,
	[createDate] [datetime] NOT NULL,
 CONSTRAINT [PK_umbracoNode] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoPropertyData]    Script Date: 10/13/2022 12:46:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoPropertyData](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[versionId] [int] NOT NULL,
	[propertyTypeId] [int] NOT NULL,
	[languageId] [int] NULL,
	[segment] [nvarchar](256) NULL,
	[intValue] [int] NULL,
	[decimalValue] [decimal](38, 6) NULL,
	[dateValue] [datetime] NULL,
	[varcharValue] [nvarchar](512) NULL,
	[textValue] [ntext] NULL,
 CONSTRAINT [PK_umbracoPropertyData] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoRedirectUrl]    Script Date: 10/13/2022 12:46:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoRedirectUrl](
	[id] [uniqueidentifier] NOT NULL,
	[contentKey] [uniqueidentifier] NOT NULL,
	[createDateUtc] [datetime] NOT NULL,
	[url] [nvarchar](255) NOT NULL,
	[culture] [nvarchar](255) NULL,
	[urlHash] [nvarchar](40) NOT NULL,
 CONSTRAINT [PK_umbracoRedirectUrl] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoRelation]    Script Date: 10/13/2022 12:46:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoRelation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[parentId] [int] NOT NULL,
	[childId] [int] NOT NULL,
	[relType] [int] NOT NULL,
	[datetime] [datetime] NOT NULL,
	[comment] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_umbracoRelation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoRelationType]    Script Date: 10/13/2022 12:46:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoRelationType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[typeUniqueId] [uniqueidentifier] NOT NULL,
	[dual] [bit] NOT NULL,
	[parentObjectType] [uniqueidentifier] NULL,
	[childObjectType] [uniqueidentifier] NULL,
	[name] [nvarchar](255) NOT NULL,
	[alias] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_umbracoRelationType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoServer]    Script Date: 10/13/2022 12:46:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoServer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[address] [nvarchar](500) NOT NULL,
	[computerName] [nvarchar](255) NOT NULL,
	[registeredDate] [datetime] NOT NULL,
	[lastNotifiedDate] [datetime] NOT NULL,
	[isActive] [bit] NOT NULL,
	[isMaster] [bit] NOT NULL,
 CONSTRAINT [PK_umbracoServer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoUser]    Script Date: 10/13/2022 12:46:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUser](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userDisabled] [bit] NOT NULL,
	[userNoConsole] [bit] NOT NULL,
	[userName] [nvarchar](255) NOT NULL,
	[userLogin] [nvarchar](125) NOT NULL,
	[userPassword] [nvarchar](500) NOT NULL,
	[passwordConfig] [nvarchar](500) NULL,
	[userEmail] [nvarchar](255) NOT NULL,
	[userLanguage] [nvarchar](10) NULL,
	[securityStampToken] [nvarchar](255) NULL,
	[failedLoginAttempts] [int] NULL,
	[lastLockoutDate] [datetime] NULL,
	[lastPasswordChangeDate] [datetime] NULL,
	[lastLoginDate] [datetime] NULL,
	[emailConfirmedDate] [datetime] NULL,
	[invitedDate] [datetime] NULL,
	[createDate] [datetime] NOT NULL,
	[updateDate] [datetime] NOT NULL,
	[avatar] [nvarchar](500) NULL,
	[tourData] [ntext] NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoUser2NodeNotify]    Script Date: 10/13/2022 12:46:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUser2NodeNotify](
	[userId] [int] NOT NULL,
	[nodeId] [int] NOT NULL,
	[action] [nchar](1) NOT NULL,
 CONSTRAINT [PK_umbracoUser2NodeNotify] PRIMARY KEY CLUSTERED 
(
	[userId] ASC,
	[nodeId] ASC,
	[action] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoUser2UserGroup]    Script Date: 10/13/2022 12:46:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUser2UserGroup](
	[userId] [int] NOT NULL,
	[userGroupId] [int] NOT NULL,
 CONSTRAINT [PK_user2userGroup] PRIMARY KEY CLUSTERED 
(
	[userId] ASC,
	[userGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoUserGroup]    Script Date: 10/13/2022 12:46:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUserGroup](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userGroupAlias] [nvarchar](200) NOT NULL,
	[userGroupName] [nvarchar](200) NOT NULL,
	[userGroupDefaultPermissions] [nvarchar](50) NULL,
	[createDate] [datetime] NOT NULL,
	[updateDate] [datetime] NOT NULL,
	[icon] [nvarchar](255) NULL,
	[startContentId] [int] NULL,
	[startMediaId] [int] NULL,
 CONSTRAINT [PK_umbracoUserGroup] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoUserGroup2App]    Script Date: 10/13/2022 12:46:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUserGroup2App](
	[userGroupId] [int] NOT NULL,
	[app] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_userGroup2App] PRIMARY KEY CLUSTERED 
(
	[userGroupId] ASC,
	[app] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoUserGroup2NodePermission]    Script Date: 10/13/2022 12:46:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUserGroup2NodePermission](
	[userGroupId] [int] NOT NULL,
	[nodeId] [int] NOT NULL,
	[permission] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_umbracoUserGroup2NodePermission] PRIMARY KEY CLUSTERED 
(
	[userGroupId] ASC,
	[nodeId] ASC,
	[permission] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoUserLogin]    Script Date: 10/13/2022 12:46:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUserLogin](
	[sessionId] [uniqueidentifier] NOT NULL,
	[userId] [int] NOT NULL,
	[loggedInUtc] [datetime] NOT NULL,
	[lastValidatedUtc] [datetime] NOT NULL,
	[loggedOutUtc] [datetime] NULL,
	[ipAddress] [nvarchar](255) NULL,
 CONSTRAINT [PK_umbracoUserLogin] PRIMARY KEY CLUSTERED 
(
	[sessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoUserStartNode]    Script Date: 10/13/2022 12:46:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUserStartNode](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[startNode] [int] NOT NULL,
	[startNodeType] [int] NOT NULL,
 CONSTRAINT [PK_userStartNode] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1062, 0, NULL, 2, 0x93C70662CD0583CD0B40C6000003D7F52B93DE0010A9706167655469746C659193A5656E2D7573A0A9436F646520426F6F6BAE756D627261636F55726C4E616D6590A86D61696E4C6F676F2C00F129D9625B7B226B6579223A2238663932376365392D333237622D343139332D613961642D333862366136653039653364222C226D656469614B3200F62066656135646366312D316661612D346661342D623635302D646265316631343630383333227D5DA7746F704D656E757500F543EA5B7B226E616D65223A225363686F6C61727368697073222C22756469223A22756D623A2F2F646F63756D656E742F3631396162363838323036363433346138653165353862633131613331313864227D2C50009F5265736561726368654E0006F006653235336639396635643365343432356163326332EA0078613633346466384E005F4E6F7469634B0007F91B3831613630333532393563303432633461323963616237623766386538333963227D5DAA6E6176426172000136DA020A01014F486F6D65F90005F8113965306536613337666561373462333938306561356665646237326134643465AB005F41626F7574420105F811373534353738653731636531346431343862393435373737376132333430663949005F436F757273F40007F81161363930343038363161633134373338386132373830316436333731343761614B005F4576656E74890106F811666437623963653162323464343430613930636631336664316565343435313789014F426C6F67490006903733386634366662341701F903356332396634626361633831306661316465D2017F546561636865724C0006F9103966343635613833363163373432326362383962613861656235653266393795009F436F6E7461637420554E0007F61865323563313230633764353462353562306563343435343462616266316364227D5DA463616C6C1B03163A1A02F0012B343420333030203330332030323636DD0150726C223A223200C1746F3A2B34343330303330331D00337D5DB9EE03F603496E7465726E616C526564697265637449645F001B2F5B030F62020DD5AC7375627363726962654E6F77470034AF20531700A5204E6F7720A46A6F696E1E0070A44A6F696EAA65860046456D6169DD0020AF4514005120796F7520190085A7616464726573733A00F532D9383233363231203135204D696C652052642023433130342C20436C696E746F6E204D492C2034383033352C204E657720596F726B2C20555341A670686F6E65310405F201AF2B3120283229203334352036373839200015326A000C200029A565AA0022B463DB015040436F64654A05A52E656475AA666F6F7465CB03506E2D7573A0C600000513FA59DA06F35B7B226B6579223A2262353634353039612D393131362D346463662D613732382D653837633734393534666132222C226E616D65223A22434F4D50414E59222C226E63436F6E74656E7454797065416C696173223A226D656E75222C226D656E755469746C3200001600B14974656D73223A225B7B5C5300F1035C223A5C2241626F75745C222C5C227564691200F824756D623A2F2F646F63756D656E742F37353435373865373163653134643134386239343537373737613233343066395C227D2C51008F5465616368657273540009FC113966343635613833363163373432326362383962613861656235653266393737540000EE005F616374205556000BFC106532356331323063376435346235356230656334343534346261626631636456004F426C6F6751000AF01537333866343666623437326134356332396634626361633831306661316465385C227D5DFE0003CE01F61566303265363436662D656263312D343439652D393736372D656161663865633764663338CE01504C494E4B530F001063DE000FCC010F0430000FCA01066F436F75727365D1000AFC11613639303430383631616331343733383861323738303164363337313437616122015F4576656E7452000AFD1066643762396365316232346434343061393063663133666431656534343531CA017F47616C6C6172791D0209FC113530623464383131323136653433623062383932336462636463353965346336A5004F4641515350002C08C601F01534623038303036382D323630312D343533372D393730362D346635323861626531616665B70102940370535550504F525411000FC801140632000FCA01065F466F75726D77010A0F24011D1344CE035F6174696F6E2D012C09EE038F4C616E6775616765540039DF52656C6561736520537461747507012D08DB01F01536353432303238372D303732642D343561652D396262622D623933336235663666333661CA0102DB01905245434F4D4D454E4413000FDD01140834000FDF01067F556D627261636F3301398F576F7264507265732E012D09DC018F65436F6D6D657263DD012DF40E5D227D5DAB736F6369616C4D656469619193A5656E2D7573A0DA04015B3D05F01531366161383034322D323737302D346331362D613563642D6234333261316166643534308901029C018046616365426F6F6B12000F9B01019264657461696C65644D14075D6974656D4E3A00001600F20049636F6E223A2274692D666163656253000019003C55524C2B07C468747470733A2F2F7777772E2E00512E636F6D2FCA01617461726765744207615F626C616E6B16003175726C13000F3C000809A302F01538663931613366652D373630352D346138312D623938612D656262636366636335303862F50002CD00705477697474657211000F06011B06390000EC0006050112745100432D616C741C000F080108032D000F03011D0A370009FE00F81433636339353430652D356333622D343262662D616561342D623365353236356233316542077F696E6B6564696EFF001F073A000A00011A6C19000FFD0008447777772E2E000602010FEF01010B260009F100F71461386663663130622D353263392D343033322D383235652D6236656435333961393934EF018F496E73746772616DF1001F073A000AF10053696E7374615400001A000FF2000C052F0006F3000FF802170C3D00000A01225D810C04F00294A9436F646520426F6F6BA9636F64652D8B03F006D7FFA2DD0AC062CC46E3C2A9636F64652D626F6F6B)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1062, 1, NULL, 1, 0x93C70662CD0583CD0B40C6000003D7F52B93DE0010A9706167655469746C659193A5656E2D7573A0A9436F646520426F6F6BAE756D627261636F55726C4E616D6590A86D61696E4C6F676F2C00F129D9625B7B226B6579223A2238663932376365392D333237622D343139332D613961642D333862366136653039653364222C226D656469614B3200F62066656135646366312D316661612D346661342D623635302D646265316631343630383333227D5DA7746F704D656E757500F543EA5B7B226E616D65223A225363686F6C61727368697073222C22756469223A22756D623A2F2F646F63756D656E742F3631396162363838323036363433346138653165353862633131613331313864227D2C50009F5265736561726368654E0006F006653235336639396635643365343432356163326332EA0078613633346466384E005F4E6F7469634B0007F91B3831613630333532393563303432633461323963616237623766386538333963227D5DAA6E6176426172000136DA020A01014F486F6D65F90005F8113965306536613337666561373462333938306561356665646237326134643465AB005F41626F7574420105F811373534353738653731636531346431343862393435373737376132333430663949005F436F757273F40007F81161363930343038363161633134373338386132373830316436333731343761614B005F4576656E74890106F811666437623963653162323464343430613930636631336664316565343435313789014F426C6F67490006903733386634366662341701F903356332396634626361633831306661316465D2017F546561636865724C0006F9103966343635613833363163373432326362383962613861656235653266393795009F436F6E7461637420554E0007F61865323563313230633764353462353562306563343435343462616266316364227D5DA463616C6C1B03163A1A02F0012B343420333030203330332030323636DD0150726C223A223200C1746F3A2B34343330303330331D00337D5DB9EE03F603496E7465726E616C526564697265637449645F001B2F5B030F62020DD5AC7375627363726962654E6F77470034AF20531700A5204E6F7720A46A6F696E1E0070A44A6F696EAA65860046456D6169DD0020AF4514005120796F7520190085A7616464726573733A00F532D9383233363231203135204D696C652052642023433130342C20436C696E746F6E204D492C2034383033352C204E657720596F726B2C20555341A670686F6E65310405F201AF2B3120283229203334352036373839200015326A000C200029A565AA0022B463DB015040436F64654A05A52E656475AA666F6F7465CB03506E2D7573A0C600000513FA59DA06F35B7B226B6579223A2262353634353039612D393131362D346463662D613732382D653837633734393534666132222C226E616D65223A22434F4D50414E59222C226E63436F6E74656E7454797065416C696173223A226D656E75222C226D656E755469746C3200001600B14974656D73223A225B7B5C5300F1035C223A5C2241626F75745C222C5C227564691200F824756D623A2F2F646F63756D656E742F37353435373865373163653134643134386239343537373737613233343066395C227D2C51008F5465616368657273540009FC113966343635613833363163373432326362383962613861656235653266393737540000EE005F616374205556000BFC106532356331323063376435346235356230656334343534346261626631636456004F426C6F6751000AF01537333866343666623437326134356332396634626361633831306661316465385C227D5DFE0003CE01F61566303265363436662D656263312D343439652D393736372D656161663865633764663338CE01504C494E4B530F001063DE000FCC010F0430000FCA01066F436F75727365D1000AFC11613639303430383631616331343733383861323738303164363337313437616122015F4576656E7452000AFD1066643762396365316232346434343061393063663133666431656534343531CA017F47616C6C6172791D0209FC113530623464383131323136653433623062383932336462636463353965346336A5004F4641515350002C08C601F01534623038303036382D323630312D343533372D393730362D346635323861626531616665B70102940370535550504F525411000FC801140632000FCA01065F466F75726D77010A0F24011D1344CE035F6174696F6E2D012C09EE038F4C616E6775616765540039DF52656C6561736520537461747507012D08DB01F01536353432303238372D303732642D343561652D396262622D623933336235663666333661CA0102DB01905245434F4D4D454E4413000FDD01140834000FDF01067F556D627261636F3301398F576F7264507265732E012D09DC018F65436F6D6D657263DD012DF40E5D227D5DAB736F6369616C4D656469619193A5656E2D7573A0DA04015B3D05F01531366161383034322D323737302D346331362D613563642D6234333261316166643534308901029C018046616365426F6F6B12000F9B01019264657461696C65644D14075D6974656D4E3A00001600F20049636F6E223A2274692D666163656253000019003C55524C2B07C468747470733A2F2F7777772E2E00512E636F6D2FCA01617461726765744207615F626C616E6B16003175726C13000F3C000809A302F01538663931613366652D373630352D346138312D623938612D656262636366636335303862F50002CD00705477697474657211000F06011B06390000EC0006050112745100432D616C741C000F080108032D000F03011D0A370009FE00F81433636339353430652D356333622D343262662D616561342D623365353236356233316542077F696E6B6564696EFF001F073A000A00011A6C19000FFD0008447777772E2E000602010FEF01010B260009F100F71461386663663130622D353263392D343033322D383235652D6236656435333961393934EF018F496E73746772616DF1001F073A000AF10053696E7374615400001A000FF2000C052F0006F3000FF802170C3D00000A01225D810C04F00294A9436F646520426F6F6BA9636F64652D8B03F006D7FFA2DD0AC062CC46E3C2A9636F64652D626F6F6B)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1066, 0, NULL, 0, 0x92D4620AC60000000BA0938080A6696D61676573)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1067, 0, NULL, 0, 0x92D562CCA1C60000008BF32C9385AB756D627261636F46696C659193A0A0D9267B22737263223A222F6D656469612F65637465346C6D752F61626F75742D75732E6A7067227DAC3800505769647468390063D200000330AD16006348656967687417002401F82D00504279746573160073A53633333634B02E0090457874656E73696F6E1B00E0A36A706780A861626F75742D7573)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1068, 0, NULL, 0, 0x92D562CCA1C60000008AF32C9385AB756D627261636F46696C659193A0A0D9267B22737263223A222F6D656469612F616D696E716776692F636F757273652D312E6A7067227DAC3800505769647468390063D200000173AD160064486569676874170014342D00504279746573160073A53339333430B02E0090457874656E73696F6E1B00E0A36A706780A8636F757273652D31)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1069, 0, NULL, 0, 0x92D562CCA1C60000008AF32C9385AB756D627261636F46696C659193A0A0D9267B22737263223A222F6D656469612F74656867716D696A2F636F757273652D322E6A7067227DAC3800505769647468390063D200000173AD160064486569676874170014342D00504279746573160073A53138323036B02E0090457874656E73696F6E1B00E0A36A706780A8636F757273652D32)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1070, 0, NULL, 0, 0x92D562CCA1C60000008AF32C9385AB756D627261636F46696C659193A0A0D9267B22737263223A222F6D656469612F723366707963746E2F636F757273652D332E6A7067227DAC3800505769647468390063D200000173AD160064486569676874170014342D00504279746573160073A53234363930B02E0090457874656E73696F6E1B00E0A36A706780A8636F757273652D33)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1071, 0, NULL, 0, 0x92D562CC9FC600000088F32B9385AB756D627261636F46696C659193A0A0D9257B22737263223A222F6D656469612F6A6E7962697871322F6576656E742D312E6A7067227DAC3700505769647468380063D200000174AD1600644865696768741700143E2D00504279746573160073A53332333332B02E0090457874656E73696F6E1B00D0A36A706780A76576656E742D31)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1072, 0, NULL, 0, 0x92D562CC9FC600000088F32B9385AB756D627261636F46696C659193A0A0D9257B22737263223A222F6D656469612F31636E6C657533322F6576656E742D322E6A7067227DAC3700505769647468380063D200000174AD1600644865696768741700143E2D00504279746573160073A53433313734B02E0090457874656E73696F6E1B00D0A36A706780A76576656E742D32)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1073, 0, NULL, 0, 0x92D562CC9FC600000088F32B9385AB756D627261636F46696C659193A0A0D9257B22737263223A222F6D656469612F646D706A6C75796A2F6576656E742D332E6A7067227DAC3700505769647468380063D200000174AD1600644865696768741700143E2D00504279746573160073A53238383835B02E0090457874656E73696F6E1B00D0A36A706780A76576656E742D33)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1074, 0, NULL, 0, 0x92D562CC9EC600000087F32B9385AB756D627261636F46696C659193A0A0D9257B22737263223A222F6D656469612F6876626B637631772F66617669636F6E2E706E67227DAC3700505769647468380063D20000003CAD160064486569676874170014442D00504279746573160063A432313231B02D0090457874656E73696F6E1A00D0A3706E6780A766617669636F6E)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1075, 0, NULL, 0, 0x92D562CC98C600000081F3289385AB756D627261636F46696C659193A0A0D9227B22737263223A222F6D656469612F34356F6B6C35766B2F6C6F676F2E706E67227DAC3400505769647468350063D2000000C8AD160064486569676874170014442D00504279746573160063A434363639B02D0090457874656E73696F6E1A00A0A3706E6780A46C6F676F)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1076, 0, NULL, 0, 0x92D562CCA3C60000008DF32D9385AB756D627261636F46696C659193A0A0D9277B22737263223A222F6D656469612F6B34646C356E356A2F7072656C6F616465722E676966227DAC39005057696474683A0063D200000190AD1600644865696768741700142C2D00504279746573160073A53230393336B02E0090457874656E73696F6E1B00F000A367696680A97072656C6F61646572)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1077, 0, NULL, 0, 0x92D562CC9EC600000086F32B9385AB756D627261636F46696C659193A0A0D9257B22737263223A222F6D656469612F78646F70326234682F746561636865722E6A7067227DAC3700505769647468380063D200000055AD1600654865696768741700042D00504279746573160063A433353736B02D0090457874656E73696F6E1A00D0A36A706780A774656163686572)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1078, 0, NULL, 0, 0x92D4620FC600000011F000938080AB6261636B67726F756E6473)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1079, 0, NULL, 0, 0x92D562CCA5C600000090F32E9385AB756D627261636F46696C659193A0A0D9287B22737263223A222F6D656469612F697A696E6B6A35762F706167652D7469746C652E6A7067227DAC3A005057696474683B0063D200000640AD16006348656967687417002401FC2D00504279746573160073A53432373237B02E0090457874656E73696F6E1B00F001A36A706780AA706167652D7469746C65)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1080, 0, NULL, 0, 0x92D562CCACC600000092F3319385AB756D627261636F46696C659193A0A0D92B7B22737263223A222F6D656469612F6E623562636963702F737563636573732D73746F72792E6A7067227DAC3D005057696474683E0063D200000500AD160063486569676874170033049FAC1700504279746573160083A6323437383039B0180090457874656E73696F6E1C0064A36A706780AD73005073746F7279)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1081, 0, NULL, 0, 0x92D4620AC60000000BA0938080A662616E6E6572)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1082, 0, NULL, 0, 0x92D562CCA2C60000008CF32C9385AB756D627261636F46696C659193A0A0D9267B22737263223A222F6D656469612F726B6566796775612F62616E6E65722D312E6A7067227DAC3800505769647468390063D200000640AD16006348656967687417002403422D00504279746573160083A6323431343838B02F0090457874656E73696F6E1C00E0A36A706780A862616E6E65722D31)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1083, 0, NULL, 0, 0x92D562CCAEC600000091F3329385AB756D627261636F46696C659193A0A0D92C7B22737263223A222F6D656469612F7774716B336F71302F62616E6E65722D666561747572652E706E67227DAC3E005057696474683F0063D20000024FAD540064486569676874170014BC2D00504279746573160083A6353031313731B02F0090457874656E73696F6E1C0065A3706E6780AE7400506174757265)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1084, 0, NULL, 0, 0x92D46208C60000000980938080A4626C6F67)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1085, 0, NULL, 0, 0x92D562CCA7C600000094F32F9385AB756D627261636F46696C659193A0A0D9297B22737263223A222F6D656469612F7032616E76646E312F626C6F672D73696E676C652E6A7067227DAC3B00F30057696474689193A0A0D200000494AD16006348656967687417002402882D00504279746573160073A53436363230B02E0090457874656E73696F6E1B00F002A36A706780AB626C6F672D73696E676C65)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1086, 0, NULL, 0, 0x92D562CC9CC600000086F32A9385AB756D627261636F46696C659193A0A0D9247B22737263223A222F6D656469612F33706566663534782F706F73742D312E6A7067227DAC3600505769647468370063D200000175AD16006348656967687417002400FC2D00504279746573160063A437303035B02D0090457874656E73696F6E1A00C0A36A706780A6706F73742D31)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1087, 0, NULL, 0, 0x92D562CC9CC600000086F32A9385AB756D627261636F46696C659193A0A0D9247B22737263223A222F6D656469612F756C306E6E7530352F706F73742D322E6A7067227DAC3600505769647468370063D200000175AD16006348656967687417002400FE2D00504279746573160063A438363736B02D0090457874656E73696F6E1A00C0A36A706780A6706F73742D32)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1088, 0, NULL, 0, 0x92D562CC9CC600000086F32A9385AB756D627261636F46696C659193A0A0D9247B22737263223A222F6D656469612F686863657A6E31742F706F73742D332E6A7067227DAC3600505769647468370063D200000175AD16006348656967687417002400FB2D00504279746573160063A437373236B02D0090457874656E73696F6E1A00C0A36A706780A6706F73742D33)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1089, 0, NULL, 0, 0x92D4620BC60000000CB0938080A7636F7572736573)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1090, 0, NULL, 0, 0x92D562CCA2C60000008CF32C9385AB756D627261636F46696C659193A0A0D9267B22737263223A222F6D656469612F7775616E357372622F636F757273652D312E6A7067227DAC3800505769647468390063D20000048DAD16006348656967687417002402472D00504279746573160083A6313231343136B02F0090457874656E73696F6E1C00E0A36A706780A8636F757273652D31)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1091, 0, NULL, 0, 0x92D562CCA0C600000089F32C9385AB756D627261636F46696C659193A0A0D9267B22737263223A222F6D656469612F6D796166666971762F636F757273652D322E6A7067227DAC3800505769647468390063D200000173AD160064486569676874170014342D00504279746573160063A437323530B02D0090457874656E73696F6E1A00E0A36A706780A8636F757273652D32)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1092, 0, NULL, 0, 0x92D562CCA0C600000089F32C9385AB756D627261636F46696C659193A0A0D9267B22737263223A222F6D656469612F63626C6E6E7969302F636F757273652D332E6A7067227DAC3800505769647468390063D200000173AD160064486569676874170014342D00504279746573160063A439313731B02D0090457874656E73696F6E1A00E0A36A706780A8636F757273652D33)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1093, 0, NULL, 0, 0x92D562CCA1C60000008AF32C9385AB756D627261636F46696C659193A0A0D9267B22737263223A222F6D656469612F306B6270796F68742F636F757273652D342E6A7067227DAC3800505769647468390063D200000173AD1600644865696768741700142F2D00504279746573160073A53232393438B02E0090457874656E73696F6E1B00E0A36A706780A8636F757273652D34)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1094, 0, NULL, 0, 0x92D562CCA1C60000008AF32C9385AB756D627261636F46696C659193A0A0D9267B22737263223A222F6D656469612F6F6379663135326B2F636F757273652D352E6A7067227DAC3800505769647468390063D200000173AD1600644865696768741700142F2D00504279746573160073A53236343133B02E0090457874656E73696F6E1B00E0A36A706780A8636F757273652D35)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1095, 0, NULL, 0, 0x92D562CCA1C60000008AF32C9385AB756D627261636F46696C659193A0A0D9267B22737263223A222F6D656469612F6172716F733573342F636F757273652D362E6A7067227DAC3800505769647468390063D200000173AD1600644865696768741700142F2D00504279746573160073A53330323238B02E0090457874656E73696F6E1B00E0A36A706780A8636F757273652D36)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1096, 0, NULL, 0, 0x92D562CCABC600000091F3319385AB756D627261636F46696C659193A0A0D92B7B22737263223A222F6D656469612F6F627168633173742F636F757273652D73696E676C652E6A7067227DAC3D005057696474683E0063D20000048DAD1600634865696768741700330247AC1700504279746573160073A53430393936B0170090457874656E73696F6E1B0064A36A706780AD720050696E676C65)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1097, 0, NULL, 0, 0x92D4620AC60000000BA0938080A66576656E7473)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1098, 0, NULL, 0, 0x92D562CC9EC600000087F32B9385AB756D627261636F46696C659193A0A0D9257B22737263223A222F6D656469612F7166786832686B702F6576656E742D312E6A7067227DAC3700505769647468380063D200000174AD1600644865696768741700143E2D00504279746573160063A439313037B02D0090457874656E73696F6E1A00D0A36A706780A76576656E742D31)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1099, 0, NULL, 0, 0x92D562CC9FC600000088F32B9385AB756D627261636F46696C659193A0A0D9257B22737263223A222F6D656469612F67357870326A73662F6576656E742D322E6A7067227DAC3700505769647468380063D200000174AD1600644865696768741700143E2D00504279746573160073A53130313630B02E0090457874656E73696F6E1B00D0A36A706780A76576656E742D32)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1100, 0, NULL, 0, 0x92D562CC9EC600000087F32B9385AB756D627261636F46696C659193A0A0D9257B22737263223A222F6D656469612F70336A61666662782F6576656E742D332E6A7067227DAC3700505769647468380063D200000174AD1600644865696768741700143E2D00504279746573160063A439363534B02D0090457874656E73696F6E1A00D0A36A706780A76576656E742D33)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1101, 0, NULL, 0, 0x92D562CCAAC600000095F3309385AB756D627261636F46696C659193A0A0D92A7B22737263223A222F6D656469612F706E6B66747A30302F6576656E742D73696E676C652E6A7067227DAC3C005057696474683D0063D20000048DAD52006348656967687417002402472D00504279746573160083A6313231343136B02F0090457874656E73696F6E1C00F003A36A706780AC6576656E742D73696E676C65)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1102, 0, NULL, 0, 0x92D46209C60000000A90938080A561626F7574)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1103, 0, NULL, 0, 0x92D562CCA6C600000091F32E9385AB756D627261636F46696C659193A0A0D9287B22737263223A222F6D656469612F70696E6768756C612F61626F75742D706167652E6A7067227DAC3A005057696474683B0063D200000365AD16006348656967687417002401CD2D00504279746573160083A6313035323935B02F0090457874656E73696F6E1C00F001A36A706780AA61626F75742D70616765)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1104, 0, NULL, 0, 0x92D562CCA1C60000008BF32C9385AB756D627261636F46696C659193A0A0D9267B22737263223A222F6D656469612F6C707066786B78342F61626F75742D75732E6A7067227DAC3800505769647468390063D200000330AD16006348656967687417002401F82D00504279746573160073A53633333634B02E0090457874656E73696F6E1B00E0A36A706780A861626F75742D7573)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1105, 0, NULL, 0, 0x92D562CCA7C600000092F32F9385AB756D627261636F46696C659193A0A0D9297B22737263223A222F6D656469612F356B6870703034642F766964656F2D7468756D622E6A7067227DAC3B005057696474683C0063D20000021CAD16006348656967687417002401E02D00504279746573160073A53134383837B02E0090457874656E73696F6E1B00F002A36A706780AB766964656F2D7468756D62)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1106, 0, NULL, 0, 0x92D4620CC60000000DC0938080A87465616368657273)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1107, 0, NULL, 0, 0x92D562CCA3C60000008DF32D9385AB756D627261636F46696C659193A0A0D9277B22737263223A222F6D656469612F62693066647474622F746561636865722D312E6A7067227DAC39005057696474683A0063D200000173AD160064486569676874170014A22D00504279746573160073A53330363135B02E0090457874656E73696F6E1B00F000A36A706780A9746561636865722D31)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1108, 0, NULL, 0, 0x92D562CCA3C60000008DF32D9385AB756D627261636F46696C659193A0A0D9277B22737263223A222F6D656469612F7864736662676E732F746561636865722D322E6A7067227DAC39005057696474683A0063D200000173AD160064486569676874170014A22D00504279746573160073A53239303536B02E0090457874656E73696F6E1B00F000A36A706780A9746561636865722D32)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1109, 0, NULL, 0, 0x92D562CCA3C60000008DF32D9385AB756D627261636F46696C659193A0A0D9277B22737263223A222F6D656469612F707A73707765686B2F746561636865722D332E6A7067227DAC39005057696474683A0063D200000173AD160064486569676874170014A22D00504279746573160073A53333313930B02E0090457874656E73696F6E1B00F000A36A706780A9746561636865722D33)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1110, 0, NULL, 0, 0x92D46212C600000014F003938080AE6576656E742D737065616B657273)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1111, 0, NULL, 0, 0x92D562CCA2C60000008BF32D9385AB756D627261636F46696C659193A0A0D9277B22737263223A222F6D656469612F357366687A696F632F737065616B65722D312E6A7067227DAC39005057696474683A0063D200000055AD1600654865696768741700042D00504279746573160063A431383536B02D0090457874656E73696F6E1A00F000A36A706780A9737065616B65722D31)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1112, 0, NULL, 0, 0x92D562CCA2C60000008BF32D9385AB756D627261636F46696C659193A0A0D9277B22737263223A222F6D656469612F7A7A6F6D726F346C2F737065616B65722D322E6A7067227DAC39005057696474683A0063D200000055AD1600654865696768741700042D00504279746573160063A431363938B02D0090457874656E73696F6E1A00F000A36A706780A9737065616B65722D32)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1113, 0, NULL, 0, 0x92D562CCA2C60000008BF32D9385AB756D627261636F46696C659193A0A0D9277B22737263223A222F6D656469612F726C686A696A336E2F737065616B65722D332E6A7067227DAC39005057696474683A0063D200000055AD1600654865696768741700042D00504279746573160063A431373539B02D0090457874656E73696F6E1A00F000A36A706780A9737065616B65722D33)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1114, 0, NULL, 0, 0x92D562CCA2C60000008BF32D9385AB756D627261636F46696C659193A0A0D9277B22737263223A222F6D656469612F71647870656130312F737065616B65722D342E6A7067227DAC39005057696474683A0063D200000055AD1600654865696768741700042D00504279746573160063A431363931B02D0090457874656E73696F6E1A00F000A36A706780A9737065616B65722D34)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1115, 0, NULL, 0, 0x92D4620FC600000011F000938080AB7363686F6C617273686970)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1116, 0, NULL, 0, 0x92D562CCB5C600000095F3369385AB756D627261636F46696C659193A0A0D9307B22737263223A222F6D656469612F6E68727072656C622F7363686F6C6172736869702D6974656D2D312E6A7067227DAC4200505769647468430063D200000236AD58006348656967687417002401A82D00504279746573160073A53136383832B02E0090457874656E73696F6E1B0069A36A706780B277005074656D2D31)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1117, 0, NULL, 0, 0x92D562CCB5C600000095F3369385AB756D627261636F46696C659193A0A0D9307B22737263223A222F6D656469612F32753170326E75792F7363686F6C6172736869702D6974656D2D322E6A7067227DAC4200505769647468430063D200000274AD58006348656967687417002401D72D00504279746573160073A53133363732B02E0090457874656E73696F6E1B0069A36A706780B277005074656D2D32)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1118, 0, NULL, 0, 0x92D562CCB5C600000095F3369385AB756D627261636F46696C659193A0A0D9307B22737263223A222F6D656469612F63356D6A66696B6A2F7363686F6C6172736869702D6974656D2D332E6A7067227DAC4200505769647468430063D200000238AD58006348656967687417002401AA2D00504279746573160073A53132333238B02E0090457874656E73696F6E1B0069A36A706780B277005074656D2D33)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1119, 0, NULL, 0, 0x92D562CCA7C600000092F32F9385AB756D627261636F46696C659193A0A0D9297B22737263223A222F6D656469612F7A3366626A6F74682F7363686F6C6172736869702E6A7067227DAC3B005057696474683C0063D200000500AD16006348656967687417002403552D00504279746573160073A53334393837B02E0090457874656E73696F6E1B00F002A36A706780AB7363686F6C617273686970)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1120, 0, NULL, 0, 0x92D4620CC60000000DC0938080A87265736561726368)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1121, 0, NULL, 0, 0x92D562CCA5C600000090F32E9385AB756D627261636F46696C659193A0A0D9287B22737263223A222F6D656469612F6C35686230706D772F72657365617263682D312E6A7067227DAC3A005057696474683B0063D200000280AD16006348656967687417002401902D00504279746573160073A53132363830B02E0090457874656E73696F6E1B00F001A36A706780AA72657365617263682D31)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1122, 0, NULL, 0, 0x92D562CCA5C600000090F32E9385AB756D627261636F46696C659193A0A0D9287B22737263223A222F6D656469612F693279703030756D2F72657365617263682D322E6A7067227DAC3A005057696474683B0063D200000280AD16006348656967687417002401902D00504279746573160073A53132323836B02E0090457874656E73696F6E1B00F001A36A706780AA72657365617263682D32)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1123, 0, NULL, 0, 0x92D562CCA5C600000090F32E9385AB756D627261636F46696C659193A0A0D9287B22737263223A222F6D656469612F6532746E6E7265352F72657365617263682D332E6A7067227DAC3A005057696474683B0063D200000244AD160063486569676874170024016A2D00504279746573160073A53131363239B02E0090457874656E73696F6E1B00F001A36A706780AA72657365617263682D33)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1124, 0, NULL, 0, 0x92D562CCA4C60000008FF32E9385AB756D627261636F46696C659193A0A0D9287B22737263223A222F6D656469612F74336763646864722F72657365617263682D342E6A7067227DAC3A005057696474683B0063D200000240AD16006348656967687417002401682D00504279746573160063A437323030B02D0090457874656E73696F6E1A00F001A36A706780AA72657365617263682D34)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1125, 0, NULL, 0, 0x92D562CCA4C60000008FF32E9385AB756D627261636F46696C659193A0A0D9287B22737263223A222F6D656469612F6C356C63656464352F72657365617263682D352E6A7067227DAC3A005057696474683B0063D200000200AD16006348656967687417002401402D00504279746573160063A437313236B02D0090457874656E73696F6E1A00F001A36A706780AA72657365617263682D35)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1126, 0, NULL, 0, 0x92D562CCA5C600000090F32E9385AB756D627261636F46696C659193A0A0D9287B22737263223A222F6D656469612F6F307067326B346D2F72657365617263682D362E6A7067227DAC3A005057696474683B0063D200000280AD16006348656967687417002401902D00504279746573160073A53134363436B02E0090457874656E73696F6E1B00F001A36A706780AA72657365617263682D36)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1186, 0, NULL, 0, 0x92C70362CD08A3C600000538F00E938DA9706167655469746C659193A5656E2D7573A0A541626F7574A5741500F00D90AA6261636B67726F756E6490AB6465736372697074696F6E90AA61260046496D61673A00F129D9625B7B226B6579223A2263383261303436642D353233612D343733322D616432392D316363346563373839656163222C226D656469614B3200F01C32643466613632362D353539342D343334342D393864642D363936396134346139653436227D5DAC73656381000AB400F103B041424F5554204F5552204A4F55524E59AF9F00A54F75724A6F75726E6579DE00F016DA036D3C703E4C6F72656D20697073756D20646F6C6F722073697420616D65742C20636F6E6400F13665747572206164697069736963696E6720656C69742C2073656420646F20656975736D6F642074656D706F7220696E6369646964756E74207574206C61626F72652065742E5C00F00E65206D61676E6120616C697175612E20557420656E696D206164206D690900FF0776656E69616D2C2071756973206E6F73747275642E20A4000708A3001D2CA400F1122E205361657065206970736120696C6C6F2071756F64207665726974617469732C8F00F201692064656269746973206675676961740701F0006520766F6C757074617465732120430A0132717561670000BE001F6998000A0F3C010BF00D2E205175616572617420706572666572656E6469732073696E74206F5402502073696D69650042652E20458D0103AA0070666163696C6973C300A06F20636F72706F726973D600F100732E3C2F703E0A3C703E6578657263E000A26F6E20756C6C616D636F8801005301306973699801018101F000697020657820656120636F6D6D6F64510003E600F2022E204475697320617574652069727572651401D020696E20726570726568656E644501001100052701F4012076656C697420657373652063696C6C510244652065755B01106E91005020706172694B0109DA01132C6400047F0208DB010FDA01001149B20291612C206661636572656100F40D74206572726F72206163637573616D757320657374206F6666696369350133696E2C5902136D1601406F73616D4C01F0087275707469206578706C696361626F2C2063756D717565F200F002756469616E6461652064656C656E697469B9015073706963694702592071756165AF0000D502302E204CFD02015F00F507213C2F703EB073545375636365737353746F726965738A0313AF1800132019002FAE732800033FDA0236B20357028F010FB203221F2084029A8045786365707465757B0200820380636361656361742EB4010051030F7E04070FE6030B0F22051C0F70014500C700F500AE73746F7279566964656F4C696E6B7902F016D9395B7B226E616D65223A22596F7574756265222C2275726C223A2268747470733A2F2F791800F3042E62652F6E4131417170307350516F227D5DB17E061542160706560006FD06FB1562393536383632612D346133382D346138662D626563352D623166623336353262323338FD06FA23303031376636652D393734662D346334362D383761632D336432643632316165373935227D5DB06F75725465616368657273010764AD204F7572201C0017AB280005D807FB23D98F756D623A2F2F646F63756D656E742F33666461396433613962386334616164626532656265326161323631646235622C3000FC1163383564343537323363626634323865393230346637656661363538396463353000F21266616537636161343036333734383166393235636435323035353638643863618171083094A5414B0811A5B207F002D7FF5EA6F50062CC3C65C2A561626F7574)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1186, 1, NULL, 0, 0x92C70362CD08A3C600000538F00E938DA9706167655469746C659193A5656E2D7573A0A541626F7574A5741500F00D90AA6261636B67726F756E6490AB6465736372697074696F6E90AA61260046496D61673A00F129D9625B7B226B6579223A2263383261303436642D353233612D343733322D616432392D316363346563373839656163222C226D656469614B3200F01C32643466613632362D353539342D343334342D393864642D363936396134346139653436227D5DAC73656381000AB400F103B041424F5554204F5552204A4F55524E59AF9F00A54F75724A6F75726E6579DE00F016DA036D3C703E4C6F72656D20697073756D20646F6C6F722073697420616D65742C20636F6E6400F13665747572206164697069736963696E6720656C69742C2073656420646F20656975736D6F642074656D706F7220696E6369646964756E74207574206C61626F72652065742E5C00F00E65206D61676E6120616C697175612E20557420656E696D206164206D690900FF0776656E69616D2C2071756973206E6F73747275642E20A4000708A3001D2CA400F1122E205361657065206970736120696C6C6F2071756F64207665726974617469732C8F00F201692064656269746973206675676961740701F0006520766F6C757074617465732120430A0132717561670000BE001F6998000A0F3C010BF00D2E205175616572617420706572666572656E6469732073696E74206F5402502073696D69650042652E20458D0103AA0070666163696C6973C300A06F20636F72706F726973D600F100732E3C2F703E0A3C703E6578657263E000A26F6E20756C6C616D636F8801005301306973699801018101F000697020657820656120636F6D6D6F64510003E600F2022E204475697320617574652069727572651401D020696E20726570726568656E644501001100052701F4012076656C697420657373652063696C6C510244652065755B01106E91005020706172694B0109DA01132C6400047F0208DB010FDA01001149B20291612C206661636572656100F40D74206572726F72206163637573616D757320657374206F6666696369350133696E2C5902136D1601406F73616D4C01F0087275707469206578706C696361626F2C2063756D717565F200F002756469616E6461652064656C656E697469B9015073706963694702592071756165AF0000D502302E204CFD02015F00F507213C2F703EB073545375636365737353746F726965738A0313AF1800132019002FAE732800033FDA0236B20357028F010FB203221F2084029A8045786365707465757B0200820380636361656361742EB4010051030F7E04070FE6030B0F22051C0F70014500C700F500AE73746F7279566964656F4C696E6B7902F016D9395B7B226E616D65223A22596F7574756265222C2275726C223A2268747470733A2F2F791800F3042E62652F6E4131417170307350516F227D5DB17E061542160706560006FD06FB1562393536383632612D346133382D346138662D626563352D623166623336353262323338FD06FA23303031376636652D393734662D346334362D383761632D336432643632316165373935227D5DB06F75725465616368657273010764AD204F7572201C0017AB280005D807FB23D98F756D623A2F2F646F63756D656E742F33666461396433613962386334616164626532656265326161323631646235622C3000FC1163383564343537323363626634323865393230346637656661363538396463353000F21266616537636161343036333734383166393235636435323035353638643863618171083094A5414B0811A5B207F002D7FF5EA6F50062CC3C65C2A561626F7574)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1187, 0, NULL, 0, 0x92D46260C60000005BF00E9384A9706167655469746C659193A5656E2D7573A0A5426C6F6773A5741500F20C90AA6261636B67726F756E6490AB6465736372697074696F6E90812E0013942E0010623400F002D7FFB387790062CB4B7DC2A5626C6F6773)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1187, 1, NULL, 0, 0x92D46260C60000005BF00E9384A9706167655469746C659193A5656E2D7573A0A5426C6F6773A5741500F20C90AA6261636B67726F756E6490AB6465736372697074696F6E90812E0013942E0010623400F002D7FFB387790062CB4B7DC2A5626C6F6773)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1188, 0, NULL, 0, 0x92D46258C600000057F1009384A9706167655469746C6590A5740700F21CAA6261636B67726F756E6490AB6465736372697074696F6E9081A5656E2D757394A7436F7572736573A7630800F004D7FF0A40830062CB4B89C2A7636F7572736573)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1188, 1, NULL, 0, 0x92D46258C600000057F1009384A9706167655469746C6590A5740700F21CAA6261636B67726F756E6490AB6465736372697074696F6E9081A5656E2D757394A7436F7572736573A7630800F004D7FF0A40830062CB4B89C2A7636F7572736573)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1189, 0, NULL, 0, 0x92D4627CC600000064F0159384A9706167655469746C659193A5656E2D7573A0AC5363686F6C61727368697073A5741C00F20C90AA6261636B67726F756E6490AB6465736372697074696F6E908135001994350027AC734200B4D7FFDE71CD0062CB5885C21800507368697073)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1189, 1, NULL, 0, 0x92D4627CC600000064F0159384A9706167655469746C659193A5656E2D7573A0AC5363686F6C61727368697073A5741C00F20C90AA6261636B67726F756E6490AB6465736372697074696F6E908135001994350027AC734200B4D7FFDE71CD0062CB5885C21800507368697073)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1191, 0, NULL, 1, 0x92D562CCACC600000094F0249386A57469746C6590AA6261636B67726F756E649193A5656E2D7573A0A25B5DAB6465736372697074696F6E90A970616765542F00052300F515A85465616368657273AE756D627261636F55726C4E616D6590AA63617465676F726965732D00B1B0636174310D0A63617432060022338169001594460023A8744F00F005D7FF51F154E062CC4422C2A87465616368657273)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1191, 1, NULL, 1, 0x92D562CCACC600000094F0249386A57469746C6590AA6261636B67726F756E649193A5656E2D7573A0A25B5DAB6465736372697074696F6E90A970616765542F00052300F515A85465616368657273AE756D627261636F55726C4E616D6590AA63617465676F726965732D00B1B0636174310D0A63617432060022338169001594460023A8744F00F005D7FF51F154E062CC4422C2A87465616368657273)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1192, 0, NULL, 0, 0x92D46274C600000069F0199384A57469746C6590AA6261636B67726F756E6490AB6465736372697074696F6E90A970616765542400F2069193A5656E2D7573A0AA436F6E746163742055738113001794130022AA631E00F00A2D7573D7FF568BC30062CB4BF6C2AA636F6E746163742D7573)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1192, 1, NULL, 0, 0x92D46274C600000069F0199384A57469746C6590AA6261636B67726F756E6490AB6465736372697074696F6E90A970616765542400F2069193A5656E2D7573A0AA436F6E746163742055738113001794130022AA631E00F00A2D7573D7FF568BC30062CB4BF6C2AA636F6E746163742D7573)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1193, 0, NULL, 0, 0x92D46264C60000005EF00F9384A9706167655469746C659193A5656E2D7573A0A64576656E7473A5741600F20C90AA6261636B67726F756E6490AB6465736372697074696F6E90812F0013942F0021A6653600F003D7FFD8F5FE0062CB4C02C2A66576656E7473)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1193, 1, NULL, 0, 0x92D46264C60000005EF00F9384A9706167655469746C659193A5656E2D7573A0A64576656E7473A5741600F20C90AA6261636B67726F756E6490AB6465736372697074696F6E90812F0013942F0021A6653600F003D7FFD8F5FE0062CB4C02C2A66576656E7473)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1194, 0, NULL, 0, 0x92D46268C600000060F0109384A9706167655469746C659193A5656E2D7573A0A74E6F7469636573A5741700F20C90AA6261636B67726F756E6490AB6465736372697074696F6E908130001494300022A76E3800F004D7FF71B9C50062CB4C0EC2A76E6F7469636573)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1194, 1, NULL, 0, 0x92D46268C600000060F0109384A9706167655469746C659193A5656E2D7573A0A74E6F7469636573A5741700F20C90AA6261636B67726F756E6490AB6465736372697074696F6E908130001494300022A76E3800F004D7FF71B9C50062CB4C0EC2A76E6F7469636573)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1195, 0, NULL, 0, 0x92D46274C600000066F0139384A9706167655469746C659193A5656E2D7573A0AA52657365617263686573A5741A00F20C90AA6261636B67726F756E6490AB6465736372697074696F6E908133001794330025AA723E00F007D7FF872EEF0062CB4C1DC2AA72657365617263686573)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1195, 1, NULL, 0, 0x92D46274C600000066F0139384A9706167655469746C659193A5656E2D7573A0AA52657365617263686573A5741A00F20C90AA6261636B67726F756E6490AB6465736372697074696F6E908133001794330025AA723E00F007D7FF872EEF0062CB4C1DC2AA72657365617263686573)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1199, 0, NULL, 2, 0x93D6622ACD0AFCC60000002CF01B938AA9706167655469746C659193A5656E2D7573A0A4486F6D65A6736C696465729193A5656E2D7573A0C6000005C9F041DA05C25B7B226B6579223A2237346438636239642D343033312D346534622D616537622D633862353231323262613465222C226E616D65223A22596F75722062726967687420667574757265206973201500706D697373696F6E2B00FF1063436F6E74656E7454797065416C696173223A22736C6964222C227469746C4800158064657363726970745600F25D3A223C703E4C6F72656D20697073756D20646F6C6F722073697420616D65742C20636F6E7365637465747572206164697069736963696E6720656C69742C2073656420646F20656975736D6F642074656D706F7220696E6369646964756E74207574206C61626F72652065745C00F00E65206D61676E6120616C697175612E20557420656E696D206164206D690900F11A76656E69616D2C2071756973206E6F737472756420657865723C2F703E222C226170706C7942757474BF0010410E0043204E6F771A0030696361D90070526564697265630B0061223A225B7B5C6901F1055C223A5C22436F75727365735C222C5C227564691400F427756D623A2F2F646F63756D656E742F61363930343038363161633134373338386132373830316436333731343761615C227D5D227D2CEB01F01562303237643063372D313661382D343531662D613432662D666561653139363236623862C0010FEB01FFB1FF1539643563373665362D356539302D346563342D393264662D383932336339666630666630EB01FFAC205DB05305F40965724261636B47726F756E649193A5656E2D7573A0D9625BF303F11E65343532323132342D656433302D343135632D393362372D316439343539386437386232222C226D656469614B1006F52232376435353034302D313766352D343566332D396630362D316565313065653731353764227D5DA961626F757455735354770020AF411300B22045647563656E746572AA2300455344657324003FDA020BC9059731636974A5058220756C6C616D636F230600EE05626973692075741C06F201697020657820656120636F6D6D6F646F8B0670717561742E20441C06A2617574652069727572655A06F00220696E20726570726568656E64657269741100F20C766F6C7570746174652076656C697420657373652063696C6C756D3600D06520657520667567696174206E9100F0042070617269617475722E2045786365707465751107B06E74206F636361656361748906B00A3C703E637570696461743900A06F6E2070726F6964656E160700FA06F00B696E2063756C706120717569206F6666696369612064657365721E00306D6F6C8E001061F10662696420657374050170756D2E2053656405015070657273703600F30E74697320756E6465206F6D6E69732069737465206E6174757320657272AD0705E700106D9D0020AB61320265557350616765230244D94A5B7B6F0801520220222C00072C223AFE06F2153735343537386537316365313464313438623934353737373761323334306639227D5DAC61003953496D6200062003FB1563613863643239342D353636302D346333632D383836632D3765303031316239653561332003F31F643466613632362D353539342D343334342D393864642D363936396134346139653436227D5DAE72656C61746564C60706DE001B8FC407FB1239303463626462623137346534636132613862376532326335336664353135612C3000FC1132653965393231346237336334663239393230363139646232623134343365623000B036323635663266626635383000F00F3762646361646439306564396633636364B06F75725465616368657273549E0905470464AD204F7572201C0044AB746F700C000523000DCE00FC1163383564343537323363626634323865393230346637656661363538396463359E00FD1066616537636161343036333734383166393235636435323035353638643863FE00F2123366646139643361396238633461616462653265626532616132363164623562810305F00C94A4486F6D65A4686F6D65D7FF7E2FCF0062CC406AC2A4686F6D65)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1199, 1, NULL, 2, 0x93D6622ACD0AFCC60000002CF01B938AA9706167655469746C659193A5656E2D7573A0A4486F6D65A6736C696465729193A5656E2D7573A0C6000005C9F041DA05C25B7B226B6579223A2237346438636239642D343033312D346534622D616537622D633862353231323262613465222C226E616D65223A22596F75722062726967687420667574757265206973201500706D697373696F6E2B00FF1063436F6E74656E7454797065416C696173223A22736C6964222C227469746C4800158064657363726970745600F25D3A223C703E4C6F72656D20697073756D20646F6C6F722073697420616D65742C20636F6E7365637465747572206164697069736963696E6720656C69742C2073656420646F20656975736D6F642074656D706F7220696E6369646964756E74207574206C61626F72652065745C00F00E65206D61676E6120616C697175612E20557420656E696D206164206D690900F11A76656E69616D2C2071756973206E6F737472756420657865723C2F703E222C226170706C7942757474BF0010410E0043204E6F771A0030696361D90070526564697265630B0061223A225B7B5C6901F1055C223A5C22436F75727365735C222C5C227564691400F427756D623A2F2F646F63756D656E742F61363930343038363161633134373338386132373830316436333731343761615C227D5D227D2CEB01F01562303237643063372D313661382D343531662D613432662D666561653139363236623862C0010FEB01FFB1FF1539643563373665362D356539302D346563342D393264662D383932336339666630666630EB01FFAC205DB05305F40965724261636B47726F756E649193A5656E2D7573A0D9625BF303F11E65343532323132342D656433302D343135632D393362372D316439343539386437386232222C226D656469614B1006F52232376435353034302D313766352D343566332D396630362D316565313065653731353764227D5DA961626F757455735354770020AF411300B22045647563656E746572AA2300455344657324003FDA020BC9059731636974A5058220756C6C616D636F230600EE05626973692075741C06F201697020657820656120636F6D6D6F646F8B0670717561742E20441C06A2617574652069727572655A06F00220696E20726570726568656E64657269741100F20C766F6C7570746174652076656C697420657373652063696C6C756D3600D06520657520667567696174206E9100F0042070617269617475722E2045786365707465751107B06E74206F636361656361748906B00A3C703E637570696461743900A06F6E2070726F6964656E160700FA06F00B696E2063756C706120717569206F6666696369612064657365721E00306D6F6C8E001061F10662696420657374050170756D2E2053656405015070657273703600F30E74697320756E6465206F6D6E69732069737465206E6174757320657272AD0705E700106D9D0020AB61320265557350616765230244D94A5B7B6F0801520220222C00072C223AFE06F2153735343537386537316365313464313438623934353737373761323334306639227D5DAC61003953496D6200062003FB1563613863643239342D353636302D346333632D383836632D3765303031316239653561332003F31F643466613632362D353539342D343334342D393864642D363936396134346139653436227D5DAE72656C61746564C60706DE001B8FC407FB1239303463626462623137346534636132613862376532326335336664353135612C3000FC1132653965393231346237336334663239393230363139646232623134343365623000B036323635663266626635383000F00F3762646361646439306564396633636364B06F75725465616368657273549E0905470464AD204F7572201C0044AB746F700C000523000DCE00FC1163383564343537323363626634323865393230346637656661363538396463359E00FD1066616537636161343036333734383166393235636435323035353638643863FE00F2123366646139643361396238633461616462653265626532616132363164623562810305F00C94A4486F6D65A4686F6D65D7FF7E2FCF0062CC406AC2A4686F6D65)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1200, 0, NULL, 0, 0x92D46236C600000037F10C938081A5656E2D757394AA4E6577734C6574746572AA6E6577736C0B00F007D7FFA7FEDC4062CB506DC2AA6E6577736C6574746572)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1200, 1, NULL, 0, 0x92D46236C600000037F10C938081A5656E2D757394AA4E6577734C6574746572AA6E6577736C0B00F007D7FFA7FEDC4062CB506DC2AA6E6577736C6574746572)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1201, 0, NULL, 0, 0x92D46261C600000058F2259381AA737562736372696265729193A5656E2D7573A0BC6D6F68616D6D65642E732E616C686164696B40676D61696C2E636F6D8125003394A84D250014A82E00F005D7FFE387B93062CB5085C2A86D6F68616D6D6564)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1201, 1, NULL, 0, 0x92D46261C600000058F2259381AA737562736372696265729193A5656E2D7573A0BC6D6F68616D6D65642E732E616C686164696B40676D61696C2E636F6D8125003394A84D250014A82E00F005D7FFE387B93062CB5085C2A86D6F68616D6D6564)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1206, 0, NULL, 2, 0x92C70362CD05DDC6000004ECF52B938AA9706167655469746C659193A5656E2D7573A0A84A6F686E20446F65AE756D627261636F55726C4E616D6590AB6465736372697074696F6E2E00F144D9EC3C703E4C6F72656D20697073756D20646F6C6F722C2073697420616D657420636F6E7365637465747572206164697069736963696E6720656C69742E2043756D717565206163637573616D75732074656E2B00606561206861725000A2656C65637475732061624C00317175612100F00A78636570747572692C206F6469742071756920696E2071756F0B00F0026120766F6C757074617465206E616D206FB600E02C2063756C70612061737065726E4600F60C2E204572726F7220706C616365617420697573746F206F666669634300F9077320717561652E3C2F703EAE7370656369616C697A610601F005B0436F6D707574657220536369656E6365B3736F2800F60E4D65646961436F6E746163747390AE70726F66696C65506963747572654401F023625B7B226B6579223A2233393264636131652D396630312D343333362D623563652D326362363863663539346430222C226D5800114B3200F62F63653431333530632D313036312D343563642D623661362D353865633930353939366337227D5DB661637469766974696573416E64496E7465726573747384001542C300C54E6574776F726B696E670D0A1500F50153656375726974790D0A48756D616E201900014B00206661D401A5A962696F6772617068795700FE03DA02883C7020636C6173733D226D622D35222D02052C02122CE1010F2D0204F2202C2073656420646F20656975736D6F642074656D706F7220696E6369646964756E74207574206C61626F72652065748902F00E65206D61676E6120616C697175612E20557420656E696D206164206D6909007076656E69616D2C3402F10273206E6F73747275642065786572636974E4018220756C6C616D636F5A00706973206E6973696A00015300F201697020657820656120636F6D6D6F646FC20070717561742E20445300A2617574652069727572659100F00220696E20726570726568656E6465726974110006AC02F00076656C697420657373652063696C6C0003005003D06520657520667567696174206E9100532070617269C202010903F00A6575722073696E74206F6363616563617420637570696461743200E06F6E2070726F6964656E742C20732A0123696E0C0300370304F0025064657365721E00306D6F6C870010612101536964206573580170756D2E20536564FE00F10B70657273706963696174697320756E6465206F6D6E697320697372035174757320655B0300090405E000136DEA03356E7469DB00926D717565206C6175641600F1012C20746F74616D2072656D20617065729E01206561250030697073B1002061650C04B0696C6C6F20696E76656E74200110764C01018D00206574B003D27369206172636869746563746FBC03D772656C61746564436F75727365FA02FB228F756D623A2F2F646F63756D656E742F32653965393231346237336334663239393230363139646232623134343365622C3000FC1139303463626462623137346534636132613862376532326335336664353135613000B036323635663266626635386000F70B3762646361646439306564396633636364AA63617465676F7269A50062A46361743181A2051594A205F00EA86A6F686E2D646F65D7FFB6EB0D0062CC44B9C2A86A6F686E2D646F65)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1206, 1, NULL, 2, 0x92C70362CD05DDC6000004ECF52B938AA9706167655469746C659193A5656E2D7573A0A84A6F686E20446F65AE756D627261636F55726C4E616D6590AB6465736372697074696F6E2E00F144D9EC3C703E4C6F72656D20697073756D20646F6C6F722C2073697420616D657420636F6E7365637465747572206164697069736963696E6720656C69742E2043756D717565206163637573616D75732074656E2B00606561206861725000A2656C65637475732061624C00317175612100F00A78636570747572692C206F6469742071756920696E2071756F0B00F0026120766F6C757074617465206E616D206FB600E02C2063756C70612061737065726E4600F60C2E204572726F7220706C616365617420697573746F206F666669634300F9077320717561652E3C2F703EAE7370656369616C697A610601F005B0436F6D707574657220536369656E6365B3736F2800F60E4D65646961436F6E746163747390AE70726F66696C65506963747572654401F023625B7B226B6579223A2233393264636131652D396630312D343333362D623563652D326362363863663539346430222C226D5800114B3200F62F63653431333530632D313036312D343563642D623661362D353865633930353939366337227D5DB661637469766974696573416E64496E7465726573747384001542C300C54E6574776F726B696E670D0A1500F50153656375726974790D0A48756D616E201900014B00206661D401A5A962696F6772617068795700FE03DA02883C7020636C6173733D226D622D35222D02052C02122CE1010F2D0204F2202C2073656420646F20656975736D6F642074656D706F7220696E6369646964756E74207574206C61626F72652065748902F00E65206D61676E6120616C697175612E20557420656E696D206164206D6909007076656E69616D2C3402F10273206E6F73747275642065786572636974E4018220756C6C616D636F5A00706973206E6973696A00015300F201697020657820656120636F6D6D6F646FC20070717561742E20445300A2617574652069727572659100F00220696E20726570726568656E6465726974110006AC02F00076656C697420657373652063696C6C0003005003D06520657520667567696174206E9100532070617269C202010903F00A6575722073696E74206F6363616563617420637570696461743200E06F6E2070726F6964656E742C20732A0123696E0C0300370304F0025064657365721E00306D6F6C870010612101536964206573580170756D2E20536564FE00F10B70657273706963696174697320756E6465206F6D6E697320697372035174757320655B0300090405E000136DEA03356E7469DB00926D717565206C6175641600F1012C20746F74616D2072656D20617065729E01206561250030697073B1002061650C04B0696C6C6F20696E76656E74200110764C01018D00206574B003D27369206172636869746563746FBC03D772656C61746564436F75727365FA02FB228F756D623A2F2F646F63756D656E742F32653965393231346237336334663239393230363139646232623134343365622C3000FC1139303463626462623137346534636132613862376532326335336664353135613000B036323635663266626635386000F70B3762646361646439306564396633636364AA63617465676F7269A50062A46361743181A2051594A205F00EA86A6F686E2D646F65D7FFB6EB0D0062CC44B9C2A86A6F686E2D646F65)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1207, 0, NULL, 2, 0x92C70362CD05E9C6000004F6F52E938AA9706167655469746C659193A5656E2D7573A0AB436C61726B204D616C696BAE756D627261636F55726C4E616D6590AB6465736372697074696F6E3100F144D9EC3C703E4C6F72656D20697073756D20646F6C6F722C2073697420616D657420636F6E7365637465747572206164697069736963696E6720656C69742E2043756D717565206163637573616D75732074656E2B00606561206861725000A2656C65637475732061624C00317175612100F00A78636570747572692C206F6469742071756920696E2071756F0B00F0026120766F6C757074617465206E616D206FB600E02C2063756C70612061737065726E4600F60C2E204572726F7220706C616365617420697573746F206F666669634300F9077320717561652E3C2F703EAE7370656369616C697A610601F005B0436F6D707574657220536369656E6365B3736F2800F60E4D65646961436F6E746163747390AE70726F66696C65506963747572654401F023625B7B226B6579223A2233393264636131652D396630312D343333362D623563652D326362363863663539346430222C226D5800114B3200F52F39393430653562652D643062322D343963302D623365322D363462666232396236396166227D5DB661637469766974696573416E64496E74657265737473F90125D942C300C54E6574776F726B696E670D0A1500F50153656375726974790D0A48756D616E201900014B00206661D401A5A962696F6772617068795700FE03DA02883C7020636C6173733D226D622D35222D02052C02122CE1010F2D0204F2202C2073656420646F20656975736D6F642074656D706F7220696E6369646964756E74207574206C61626F72652065748902F00E65206D61676E6120616C697175612E20557420656E696D206164206D6909007076656E69616D2C3402F20F73206E6F737472756420657865726369746174696F6E20756C6C616D636F5A00706973206E6973696A00015300F201697020657820656120636F6D6D6F646FC20070717561742E20445300A2617574652069727572659100F00220696E20726570726568656E6465726974110006AC02F00076656C697420657373652063696C6C0003005003D06520657520667567696174206E9100532070617269C202010903F00A6575722073696E74206F6363616563617420637570696461743200E06F6E2070726F6964656E742C20732A0123696E0C0300370304F0025064657365721E00306D6F6C870010612101536964206573580170756D2E20536564FE00F10B70657273706963696174697320756E6465206F6D6E697320697372035174757320655B0300090405E000136DEA03356E7469DB00926D717565206C6175641600F1012C20746F74616D2072656D20617065729E01206561250030697073B1002061650C04B0696C6C6F20696E76656E74200110764C01018D00206574B003D27369206172636869746563746FBC03D772656C61746564436F75727365FA02FB228F756D623A2F2F646F63756D656E742F32653965393231346237336334663239393230363139646232623134343365622C3000FC1139303463626462623137346534636132613862376532326335336664353135613000B036323635663266626635386000F70B3762646361646439306564396633636364AA63617465676F7269A50062A46361743281AC031894A50520AB63B105202D6DB105F008D7FFC6773D2062CC44AAC2AB636C61726B2D6D616C696B)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1207, 1, NULL, 2, 0x92C70362CD05E9C6000004F6F52E938AA9706167655469746C659193A5656E2D7573A0AB436C61726B204D616C696BAE756D627261636F55726C4E616D6590AB6465736372697074696F6E3100F144D9EC3C703E4C6F72656D20697073756D20646F6C6F722C2073697420616D657420636F6E7365637465747572206164697069736963696E6720656C69742E2043756D717565206163637573616D75732074656E2B00606561206861725000A2656C65637475732061624C00317175612100F00A78636570747572692C206F6469742071756920696E2071756F0B00F0026120766F6C757074617465206E616D206FB600E02C2063756C70612061737065726E4600F60C2E204572726F7220706C616365617420697573746F206F666669634300F9077320717561652E3C2F703EAE7370656369616C697A610601F005B0436F6D707574657220536369656E6365B3736F2800F60E4D65646961436F6E746163747390AE70726F66696C65506963747572654401F023625B7B226B6579223A2233393264636131652D396630312D343333362D623563652D326362363863663539346430222C226D5800114B3200F52F39393430653562652D643062322D343963302D623365322D363462666232396236396166227D5DB661637469766974696573416E64496E74657265737473F90125D942C300C54E6574776F726B696E670D0A1500F50153656375726974790D0A48756D616E201900014B00206661D401A5A962696F6772617068795700FE03DA02883C7020636C6173733D226D622D35222D02052C02122CE1010F2D0204F2202C2073656420646F20656975736D6F642074656D706F7220696E6369646964756E74207574206C61626F72652065748902F00E65206D61676E6120616C697175612E20557420656E696D206164206D6909007076656E69616D2C3402F20F73206E6F737472756420657865726369746174696F6E20756C6C616D636F5A00706973206E6973696A00015300F201697020657820656120636F6D6D6F646FC20070717561742E20445300A2617574652069727572659100F00220696E20726570726568656E6465726974110006AC02F00076656C697420657373652063696C6C0003005003D06520657520667567696174206E9100532070617269C202010903F00A6575722073696E74206F6363616563617420637570696461743200E06F6E2070726F6964656E742C20732A0123696E0C0300370304F0025064657365721E00306D6F6C870010612101536964206573580170756D2E20536564FE00F10B70657273706963696174697320756E6465206F6D6E697320697372035174757320655B0300090405E000136DEA03356E7469DB00926D717565206C6175641600F1012C20746F74616D2072656D20617065729E01206561250030697073B1002061650C04B0696C6C6F20696E76656E74200110764C01018D00206574B003D27369206172636869746563746FBC03D772656C61746564436F75727365FA02FB228F756D623A2F2F646F63756D656E742F32653965393231346237336334663239393230363139646232623134343365622C3000FC1139303463626462623137346534636132613862376532326335336664353135613000B036323635663266626635386000F70B3762646361646439306564396633636364AA63617465676F7269A50062A46361743281AC031894A50520AB63B105202D6DB105F008D7FFC6773D2062CC44AAC2AB636C61726B2D6D616C696B)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1208, 0, NULL, 1, 0x92C70362CD05EDC6000004EFF52F938AA9706167655469746C659193A5656E2D7573A0AC4A61636B65204D617369746FAE756D627261636F55726C4E616D6590AB6465736372697074696F6E3200F144D9EC3C703E4C6F72656D20697073756D20646F6C6F722C2073697420616D657420636F6E7365637465747572206164697069736963696E6720656C69742E2043756D717565206163637573616D75732074656E2B00606561206861725000A2656C65637475732061624C00317175612100F00A78636570747572692C206F6469742071756920696E2071756F0B00F0026120766F6C757074617465206E616D206FB600E02C2063756C70612061737065726E4600F60C2E204572726F7220706C616365617420697573746F206F666669634300F9077320717561652E3C2F703EAE7370656369616C697A610601F005B0436F6D707574657220536369656E6365B3736F2800F60E4D65646961436F6E746163747390AE70726F66696C65506963747572654401F023625B7B226B6579223A2233393264636131652D396630312D343333362D623563652D326362363863663539346430222C226D5800114B3200F62F31306562363537382D346165612D343531642D383431322D616164666164316638646133227D5DB661637469766974696573416E64496E7465726573747384001542C300C54E6574776F726B696E670D0A1500F50153656375726974790D0A48756D616E201900014B00206661D401A5A962696F6772617068795700FE03DA02883C7020636C6173733D226D622D35222D02052C02122CE1010F2D0204F2202C2073656420646F20656975736D6F642074656D706F7220696E6369646964756E74207574206C61626F72652065748902F00E65206D61676E6120616C697175612E20557420656E696D206164206D6909007076656E69616D2C3402F10273206E6F73747275642065786572636974E4018220756C6C616D636F5A00706973206E6973696A00015300F201697020657820656120636F6D6D6F646FC20070717561742E20445300A2617574652069727572659100F00220696E20726570726568656E6465726974110006AC02F00076656C697420657373652063696C6C0003005003D06520657520667567696174206E9100532070617269C202010903F00A6575722073696E74206F6363616563617420637570696461743200E06F6E2070726F6964656E742C20732A0123696E0C0300370304F0025064657365721E00306D6F6C870010612101536964206573580170756D2E20536564FE00F10B70657273706963696174697320756E6465206F6D6E697320697372035174757320655B0300090405E000136DEA03356E7469DB00926D717565206C6175641600F1012C20746F74616D2072656D20617065729E01206561250030697073B1002061650C04B0696C6C6F20696E76656E74200110764C01018D00206574B003D27369206172636869746563746FBC03D772656C61746564436F75727365FA02FB228F756D623A2F2F646F63756D656E742F36323635663266626635386334663237626463616464393065643966336363642C3000B032653965393231346237333000FC0239393230363139646232623134343365623000F71A3930346362646262313734653463613261386237653232633533666435313561AA63617465676F7269A50062A46361743181A6051994A60520AC6A0D00212D6DB305B4D7FF3CFD098062CC4497C2180050617369746F)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1208, 1, NULL, 1, 0x92C70362CD05EDC6000004EFF52F938AA9706167655469746C659193A5656E2D7573A0AC4A61636B65204D617369746FAE756D627261636F55726C4E616D6590AB6465736372697074696F6E3200F144D9EC3C703E4C6F72656D20697073756D20646F6C6F722C2073697420616D657420636F6E7365637465747572206164697069736963696E6720656C69742E2043756D717565206163637573616D75732074656E2B00606561206861725000A2656C65637475732061624C00317175612100F00A78636570747572692C206F6469742071756920696E2071756F0B00F0026120766F6C757074617465206E616D206FB600E02C2063756C70612061737065726E4600F60C2E204572726F7220706C616365617420697573746F206F666669634300F9077320717561652E3C2F703EAE7370656369616C697A610601F005B0436F6D707574657220536369656E6365B3736F2800F60E4D65646961436F6E746163747390AE70726F66696C65506963747572654401F023625B7B226B6579223A2233393264636131652D396630312D343333362D623563652D326362363863663539346430222C226D5800114B3200F62F31306562363537382D346165612D343531642D383431322D616164666164316638646133227D5DB661637469766974696573416E64496E7465726573747384001542C300C54E6574776F726B696E670D0A1500F50153656375726974790D0A48756D616E201900014B00206661D401A5A962696F6772617068795700FE03DA02883C7020636C6173733D226D622D35222D02052C02122CE1010F2D0204F2202C2073656420646F20656975736D6F642074656D706F7220696E6369646964756E74207574206C61626F72652065748902F00E65206D61676E6120616C697175612E20557420656E696D206164206D6909007076656E69616D2C3402F10273206E6F73747275642065786572636974E4018220756C6C616D636F5A00706973206E6973696A00015300F201697020657820656120636F6D6D6F646FC20070717561742E20445300A2617574652069727572659100F00220696E20726570726568656E6465726974110006AC02F00076656C697420657373652063696C6C0003005003D06520657520667567696174206E9100532070617269C202010903F00A6575722073696E74206F6363616563617420637570696461743200E06F6E2070726F6964656E742C20732A0123696E0C0300370304F0025064657365721E00306D6F6C870010612101536964206573580170756D2E20536564FE00F10B70657273706963696174697320756E6465206F6D6E697320697372035174757320655B0300090405E000136DEA03356E7469DB00926D717565206C6175641600F1012C20746F74616D2072656D20617065729E01206561250030697073B1002061650C04B0696C6C6F20696E76656E74200110764C01018D00206574B003D27369206172636869746563746FBC03D772656C61746564436F75727365FA02FB228F756D623A2F2F646F63756D656E742F36323635663266626635386334663237626463616464393065643966336363642C3000B032653965393231346237333000FC0239393230363139646232623134343365623000F71A3930346362646262313734653463613261386237653232633533666435313561AA63617465676F7269A50062A46361743181A6051994A60520AC6A0D00212D6DB305B4D7FF3CFD098062CC4497C2180050617369746F)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1209, 0, NULL, 0, 0x93C70662CD0967CD0517C6000004C9F01693DE0010A9706167655469746C659193A5656E2D7573A0AB50686F746F677261706879A5741B00F61690AA6261636B67726F756E6490AB6465736372697074696F6E90AB636F75727365496D61674100F129D9625B7B226B6579223A2262316662316262332D626635622D343461342D623238362D396131663839333561663336222C226D656469614B3200F21931616438313030352D386661382D346537362D386237612D313766333632323431613064227D5DAE79008573436F756E746572BD00E0A83036204D6F6E7468A864757261A400071B0030332048AF0036A36665AD00F502AA46726F6D3A2024363939A561626F75743000F25EDA03FD3C703E4C6F72656D20697073756D20646F6C6F722073697420616D65742C20636F6E7365637465747572206164697069736963696E6720656C69742C2073656420646F20656975736D6F642074656D706F7220696E6369646964756E74207574206C61626F72652065745C00F00E65206D61676E6120616C697175612E20557420656E696D206164206D690900F10D76656E69616D2C2071756973206E6F73747275642065786572636974EE008220756C6C616D636F5A00002500306973696A00015300F201697020657820656120636F6D6D6F646FC20070717561742E20445300A361757465206972757265ED00F41E696E20726570726568656E646572697420696E20766F6C7570746174652076656C697420657373652063696C6C2301D06520657520667567696174206E9100F0042070617269617475722E2045786365707465754801F0046E74206F6363616563617420637570696461743200A06F6E2070726F6964656E460121756E7500F00863756C706120717569206F6666696369612064657365721E00306D6F6C870010612101536964206573580170756D2E20536564FE005070657273703600F30E74697320756E6465206F6D6E69732069737465206E6174757320657272DD0105E000B56D206163637573616E7469DB00926D717565206C6175641600F1012C20746F74616D2072656D20617065729E01206561250030697073B100F002616520616220696C6C6F20696E76656E74200110764C01018D00F00E6574207175617369206172636869746563746F2062656174616520766906005264696374610701F2006578706C696361626F2E204E656D6F1C02006700166D9401106D2401146110001273AE024073706572E600807220617574206F64C202217574A301006301226564350001D002407175756E2A00008A021269060260657320656F732400212072660214656000007000003300A069206E65736369756E749B0000FE0050706F72726F330050737175616D950101B60203510001B7001375AC000F570308132C58032263696C0207AD00726E6F6E206E756D5E0083697573206D6F6469660312616703001D0213750D020D6503136D66030085004861657261F801F5032E3C2F703EAC726571756972656D656E74731E053FDA01941304070242010F1204043F2E0D0A3A00FF48B6AA686F77546F4170706C79AB012F026D71012531205265F90362646165206F62A3041269390401D104213F205A00182C1906192E14000FEE01280F7D0030019E00089D000208040FA3020E0F7B00300FE602270F7D00ADF008AD666565416E6446756E64696E679193A5656E2D7573A0C600000425F25EDA03FD3C703E4C6F72656D20697073756D20646F6C6F722073697420616D65742C20636F6E7365637465747572206164697069736963696E6720656C69742C2073656420646F20656975736D6F642074656D706F7220696E6369646964756E74207574206C61626F72652065745C00F00E65206D61676E6120616C697175612E20557420656E696D206164206D690900F21A76656E69616D2C2071756973206E6F737472756420657865726369746174696F6E20756C6C616D636F5A00002500306973696A00015300F201697020657820656120636F6D6D6F646FC20070717561742E20445300A361757465206972757265ED00F41E696E20726570726568656E646572697420696E20766F6C7570746174652076656C697420657373652063696C6C2301D06520657520667567696174206E9100F0042070617269617475722E2045786365707465754801F0046E74206F6363616563617420637570696461743200A06F6E2070726F6964656E460121756E7500F00863756C706120717569206F6666696369612064657365721E00306D6F6C870010612101536964206573580170756D2E20536564FE005070657273703600F30E74697320756E6465206F6D6E69732069737465206E6174757320657272DD0105E000B56D206163637573616E7469DB00926D717565206C6175641600F1012C20746F74616D2072656D20617065729E01206561250030697073B100F002616520616220696C6C6F20696E76656E74200110764C01018D00F00E6574207175617369206172636869746563746F2062656174616520766906005264696374610701F2006578706C696361626F2E204E656D6F1C02006700166D9401106D2401146110001273AE024073706572E600807220617574206F64C202217574A301006301226564350001D002407175756E2A00008A021269060260657320656F732400212072660214656000007000003300A069206E65736369756E749B0000FE0050706F72726F330050737175616D950101B60203510001B7001375AC000F570308132C58032263696C0207AD00726E6F6E206E756D5E0083697573206D6F6469660312616703001D0213750D020D6503136D66030085004861657261F801F52C2E3C2F703EAE70726F66696C65506963747572659193A5656E2D7573A0A25B5DA962696F67726170687990AF72656C6174656454656163686572732700FB23D98F756D623A2F2F646F63756D656E742F33666461396433613962386334616164626532656265326161323631646235622C3000FC1163383564343537323363626634323865393230346637656661363538396463353000F3126661653763616134303633373438316639323563643532303535363864386361AEAA0092436F75727365739081D0006394AB50686F74CF0026AB700C00F008D7FF420ABD0062CC38C1C2AB70686F746F677261706879)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1209, 1, NULL, 0, 0x93C70662CD0967CD0517C6000004C9F01693DE0010A9706167655469746C659193A5656E2D7573A0AB50686F746F677261706879A5741B00F61690AA6261636B67726F756E6490AB6465736372697074696F6E90AB636F75727365496D61674100F129D9625B7B226B6579223A2262316662316262332D626635622D343461342D623238362D396131663839333561663336222C226D656469614B3200F21931616438313030352D386661382D346537362D386237612D313766333632323431613064227D5DAE79008573436F756E746572BD00E0A83036204D6F6E7468A864757261A400071B0030332048AF0036A36665AD00F502AA46726F6D3A2024363939A561626F75743000F25EDA03FD3C703E4C6F72656D20697073756D20646F6C6F722073697420616D65742C20636F6E7365637465747572206164697069736963696E6720656C69742C2073656420646F20656975736D6F642074656D706F7220696E6369646964756E74207574206C61626F72652065745C00F00E65206D61676E6120616C697175612E20557420656E696D206164206D690900F10D76656E69616D2C2071756973206E6F73747275642065786572636974EE008220756C6C616D636F5A00002500306973696A00015300F201697020657820656120636F6D6D6F646FC20070717561742E20445300A361757465206972757265ED00F41E696E20726570726568656E646572697420696E20766F6C7570746174652076656C697420657373652063696C6C2301D06520657520667567696174206E9100F0042070617269617475722E2045786365707465754801F0046E74206F6363616563617420637570696461743200A06F6E2070726F6964656E460121756E7500F00863756C706120717569206F6666696369612064657365721E00306D6F6C870010612101536964206573580170756D2E20536564FE005070657273703600F30E74697320756E6465206F6D6E69732069737465206E6174757320657272DD0105E000B56D206163637573616E7469DB00926D717565206C6175641600F1012C20746F74616D2072656D20617065729E01206561250030697073B100F002616520616220696C6C6F20696E76656E74200110764C01018D00F00E6574207175617369206172636869746563746F2062656174616520766906005264696374610701F2006578706C696361626F2E204E656D6F1C02006700166D9401106D2401146110001273AE024073706572E600807220617574206F64C202217574A301006301226564350001D002407175756E2A00008A021269060260657320656F732400212072660214656000007000003300A069206E65736369756E749B0000FE0050706F72726F330050737175616D950101B60203510001B7001375AC000F570308132C58032263696C0207AD00726E6F6E206E756D5E0083697573206D6F6469660312616703001D0213750D020D6503136D66030085004861657261F801F5032E3C2F703EAC726571756972656D656E74731E053FDA01941304070242010F1204043F2E0D0A3A00FF48B6AA686F77546F4170706C79AB012F026D71012531205265F90362646165206F62A3041269390401D104213F205A00182C1906192E14000FEE01280F7D0030019E00089D000208040FA3020E0F7B00300FE602270F7D00ADF008AD666565416E6446756E64696E679193A5656E2D7573A0C600000425F25EDA03FD3C703E4C6F72656D20697073756D20646F6C6F722073697420616D65742C20636F6E7365637465747572206164697069736963696E6720656C69742C2073656420646F20656975736D6F642074656D706F7220696E6369646964756E74207574206C61626F72652065745C00F00E65206D61676E6120616C697175612E20557420656E696D206164206D690900F21A76656E69616D2C2071756973206E6F737472756420657865726369746174696F6E20756C6C616D636F5A00002500306973696A00015300F201697020657820656120636F6D6D6F646FC20070717561742E20445300A361757465206972757265ED00F41E696E20726570726568656E646572697420696E20766F6C7570746174652076656C697420657373652063696C6C2301D06520657520667567696174206E9100F0042070617269617475722E2045786365707465754801F0046E74206F6363616563617420637570696461743200A06F6E2070726F6964656E460121756E7500F00863756C706120717569206F6666696369612064657365721E00306D6F6C870010612101536964206573580170756D2E20536564FE005070657273703600F30E74697320756E6465206F6D6E69732069737465206E6174757320657272DD0105E000B56D206163637573616E7469DB00926D717565206C6175641600F1012C20746F74616D2072656D20617065729E01206561250030697073B100F002616520616220696C6C6F20696E76656E74200110764C01018D00F00E6574207175617369206172636869746563746F2062656174616520766906005264696374610701F2006578706C696361626F2E204E656D6F1C02006700166D9401106D2401146110001273AE024073706572E600807220617574206F64C202217574A301006301226564350001D002407175756E2A00008A021269060260657320656F732400212072660214656000007000003300A069206E65736369756E749B0000FE0050706F72726F330050737175616D950101B60203510001B7001375AC000F570308132C58032263696C0207AD00726E6F6E206E756D5E0083697573206D6F6469660312616703001D0213750D020D6503136D66030085004861657261F801F52C2E3C2F703EAE70726F66696C65506963747572659193A5656E2D7573A0A25B5DA962696F67726170687990AF72656C6174656454656163686572732700FB23D98F756D623A2F2F646F63756D656E742F33666461396433613962386334616164626532656265326161323631646235622C3000FC1163383564343537323363626634323865393230346637656661363538396463353000F3126661653763616134303633373438316639323563643532303535363864386361AEAA0092436F75727365739081D0006394AB50686F74CF0026AB700C00F008D7FF420ABD0062CC38C1C2AB70686F746F677261706879)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1210, 0, NULL, 0, 0x93C70662CD0968CD0517C6000004CAF01793DE0010A9706167655469746C659193A5656E2D7573A0AC2050726F6772616D6D696E67A5741C00F61690AA6261636B67726F756E6490AB6465736372697074696F6E90AB636F75727365496D61674200F129D9625B7B226B6579223A2262316662316262332D626635622D343461342D623238362D396131663839333561663336222C226D656469614B3200F21931616438313030352D386661382D346537362D386237612D313766333632323431613064227D5DAE79008573436F756E746572BE00E0A83036204D6F6E7468A864757261A400071B0030332048AF0036A36665AD00F502AA46726F6D3A2024363939A561626F75743000F25EDA03FD3C703E4C6F72656D20697073756D20646F6C6F722073697420616D65742C20636F6E7365637465747572206164697069736963696E6720656C69742C2073656420646F20656975736D6F642074656D706F7220696E6369646964756E74207574206C61626F72652065745C00F00E65206D61676E6120616C697175612E20557420656E696D206164206D690900F10D76656E69616D2C2071756973206E6F73747275642065786572636974EE008220756C6C616D636F5A00002500306973696A00015300F201697020657820656120636F6D6D6F646FC20070717561742E20445300A361757465206972757265ED00F41E696E20726570726568656E646572697420696E20766F6C7570746174652076656C697420657373652063696C6C2301D06520657520667567696174206E9100F0042070617269617475722E2045786365707465754801F0046E74206F6363616563617420637570696461743200A06F6E2070726F6964656E460121756E7500F00863756C706120717569206F6666696369612064657365721E00306D6F6C870010612101536964206573580170756D2E20536564FE005070657273703600F30E74697320756E6465206F6D6E69732069737465206E6174757320657272DD0105E000B56D206163637573616E7469DB00926D717565206C6175641600F1012C20746F74616D2072656D20617065729E01206561250030697073B100F002616520616220696C6C6F20696E76656E74200110764C01018D00F00E6574207175617369206172636869746563746F2062656174616520766906005264696374610701F2006578706C696361626F2E204E656D6F1C02006700166D9401106D2401146110001273AE024073706572E600807220617574206F64C202217574A301006301226564350001D002407175756E2A00008A021269060260657320656F732400212072660214656000007000003300A069206E65736369756E749B0000FE0050706F72726F330050737175616D950101B60203510001B7001375AC000F570308132C58032263696C0207AD00726E6F6E206E756D5E0083697573206D6F6469660312616703001D0213750D020D6503136D66030085004861657261F801F5032E3C2F703EAC726571756972656D656E74731F053FDA01941304070242010F1204043F2E0D0A3A00FF48B6AA686F77546F4170706C79AB012F026D71012531205265F90362646165206F62A3041269390401D104213F205A00182C1906192E14000FEE01280F7D0030019E00089D000208040FA3020E0F7B00300FE602270F7D00ADF008AD666565416E6446756E64696E679193A5656E2D7573A0C600000428F25EDA03FD3C703E4C6F72656D20697073756D20646F6C6F722073697420616D65742C20636F6E7365637465747572206164697069736963696E6720656C69742C2073656420646F20656975736D6F642074656D706F7220696E6369646964756E74207574206C61626F72652065745C00F00E65206D61676E6120616C697175612E20557420656E696D206164206D690900F21A76656E69616D2C2071756973206E6F737472756420657865726369746174696F6E20756C6C616D636F5A00002500306973696A00015300F201697020657820656120636F6D6D6F646FC20070717561742E20445300A361757465206972757265ED00F41E696E20726570726568656E646572697420696E20766F6C7570746174652076656C697420657373652063696C6C2301D06520657520667567696174206E9100F0042070617269617475722E2045786365707465754801F0046E74206F6363616563617420637570696461743200A06F6E2070726F6964656E460121756E7500F00863756C706120717569206F6666696369612064657365721E00306D6F6C870010612101536964206573580170756D2E20536564FE005070657273703600F30E74697320756E6465206F6D6E69732069737465206E6174757320657272DD0105E000B56D206163637573616E7469DB00926D717565206C6175641600F1012C20746F74616D2072656D20617065729E01206561250030697073B100F002616520616220696C6C6F20696E76656E74200110764C01018D00F00E6574207175617369206172636869746563746F2062656174616520766906005264696374610701F2006578706C696361626F2E204E656D6F1C02006700166D9401106D2401146110001273AE024073706572E600807220617574206F64C202217574A301006301226564350001D002407175756E2A00008A021269060260657320656F732400212072660214656000007000003300A069206E65736369756E749B0000FE0050706F72726F330050737175616D950101B60203510001B7001375AC000F570308132C58032263696C0207AD00726E6F6E206E756D5E0083697573206D6F6469660312616703001D0213750D020D6503136D66030085004861657261F801F52C2E3C2F703EAE70726F66696C65506963747572659193A5656E2D7573A0A25B5DA962696F67726170687990AF72656C6174656454656163686572732700FB23D98F756D623A2F2F646F63756D656E742F33666461396433613962386334616164626532656265326161323631646235622C3000FC1163383564343537323363626634323865393230346637656661363538396463353000F3126661653763616134303633373438316639323563643532303535363864386361AEAA0092436F75727365739081D0004094AB5072CD00766D6D696E67AB700C00F008D7FF3D46090062CC38F3C2AB70726F6772616D6D696E67)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1210, 1, NULL, 0, 0x93C70662CD0968CD0517C6000004CAF01793DE0010A9706167655469746C659193A5656E2D7573A0AC2050726F6772616D6D696E67A5741C00F61690AA6261636B67726F756E6490AB6465736372697074696F6E90AB636F75727365496D61674200F129D9625B7B226B6579223A2262316662316262332D626635622D343461342D623238362D396131663839333561663336222C226D656469614B3200F21931616438313030352D386661382D346537362D386237612D313766333632323431613064227D5DAE79008573436F756E746572BE00E0A83036204D6F6E7468A864757261A400071B0030332048AF0036A36665AD00F502AA46726F6D3A2024363939A561626F75743000F25EDA03FD3C703E4C6F72656D20697073756D20646F6C6F722073697420616D65742C20636F6E7365637465747572206164697069736963696E6720656C69742C2073656420646F20656975736D6F642074656D706F7220696E6369646964756E74207574206C61626F72652065745C00F00E65206D61676E6120616C697175612E20557420656E696D206164206D690900F10D76656E69616D2C2071756973206E6F73747275642065786572636974EE008220756C6C616D636F5A00002500306973696A00015300F201697020657820656120636F6D6D6F646FC20070717561742E20445300A361757465206972757265ED00F41E696E20726570726568656E646572697420696E20766F6C7570746174652076656C697420657373652063696C6C2301D06520657520667567696174206E9100F0042070617269617475722E2045786365707465754801F0046E74206F6363616563617420637570696461743200A06F6E2070726F6964656E460121756E7500F00863756C706120717569206F6666696369612064657365721E00306D6F6C870010612101536964206573580170756D2E20536564FE005070657273703600F30E74697320756E6465206F6D6E69732069737465206E6174757320657272DD0105E000B56D206163637573616E7469DB00926D717565206C6175641600F1012C20746F74616D2072656D20617065729E01206561250030697073B100F002616520616220696C6C6F20696E76656E74200110764C01018D00F00E6574207175617369206172636869746563746F2062656174616520766906005264696374610701F2006578706C696361626F2E204E656D6F1C02006700166D9401106D2401146110001273AE024073706572E600807220617574206F64C202217574A301006301226564350001D002407175756E2A00008A021269060260657320656F732400212072660214656000007000003300A069206E65736369756E749B0000FE0050706F72726F330050737175616D950101B60203510001B7001375AC000F570308132C58032263696C0207AD00726E6F6E206E756D5E0083697573206D6F6469660312616703001D0213750D020D6503136D66030085004861657261F801F5032E3C2F703EAC726571756972656D656E74731F053FDA01941304070242010F1204043F2E0D0A3A00FF48B6AA686F77546F4170706C79AB012F026D71012531205265F90362646165206F62A3041269390401D104213F205A00182C1906192E14000FEE01280F7D0030019E00089D000208040FA3020E0F7B00300FE602270F7D00ADF008AD666565416E6446756E64696E679193A5656E2D7573A0C600000428F25EDA03FD3C703E4C6F72656D20697073756D20646F6C6F722073697420616D65742C20636F6E7365637465747572206164697069736963696E6720656C69742C2073656420646F20656975736D6F642074656D706F7220696E6369646964756E74207574206C61626F72652065745C00F00E65206D61676E6120616C697175612E20557420656E696D206164206D690900F21A76656E69616D2C2071756973206E6F737472756420657865726369746174696F6E20756C6C616D636F5A00002500306973696A00015300F201697020657820656120636F6D6D6F646FC20070717561742E20445300A361757465206972757265ED00F41E696E20726570726568656E646572697420696E20766F6C7570746174652076656C697420657373652063696C6C2301D06520657520667567696174206E9100F0042070617269617475722E2045786365707465754801F0046E74206F6363616563617420637570696461743200A06F6E2070726F6964656E460121756E7500F00863756C706120717569206F6666696369612064657365721E00306D6F6C870010612101536964206573580170756D2E20536564FE005070657273703600F30E74697320756E6465206F6D6E69732069737465206E6174757320657272DD0105E000B56D206163637573616E7469DB00926D717565206C6175641600F1012C20746F74616D2072656D20617065729E01206561250030697073B100F002616520616220696C6C6F20696E76656E74200110764C01018D00F00E6574207175617369206172636869746563746F2062656174616520766906005264696374610701F2006578706C696361626F2E204E656D6F1C02006700166D9401106D2401146110001273AE024073706572E600807220617574206F64C202217574A301006301226564350001D002407175756E2A00008A021269060260657320656F732400212072660214656000007000003300A069206E65736369756E749B0000FE0050706F72726F330050737175616D950101B60203510001B7001375AC000F570308132C58032263696C0207AD00726E6F6E206E756D5E0083697573206D6F6469660312616703001D0213750D020D6503136D66030085004861657261F801F52C2E3C2F703EAE70726F66696C65506963747572659193A5656E2D7573A0A25B5DA962696F67726170687990AF72656C6174656454656163686572732700FB23D98F756D623A2F2F646F63756D656E742F33666461396433613962386334616164626532656265326161323631646235622C3000FC1163383564343537323363626634323865393230346637656661363538396463353000F3126661653763616134303633373438316639323563643532303535363864386361AEAA0092436F75727365739081D0004094AB5072CD00766D6D696E67AB700C00F008D7FF3D46090062CC38F3C2AB70726F6772616D6D696E67)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1211, 0, NULL, 0, 0x93C70662CD096ECD05C5C6000004CFF01D93DE0010A9706167655469746C659193A5656E2D7573A0B24C6966657374796C65204172636869766573A5742200F61690AA6261636B67726F756E6490AB6465736372697074696F6E90AB636F75727365496D61674800F129D9625B7B226B6579223A2262316662316262332D626635622D343461342D623238362D396131663839333561663336222C226D656469614B3200F21931616438313030352D386661382D346537362D386237612D313766333632323431613064227D5DAE79008573436F756E746572C400E0A83036204D6F6E7468A864757261A400071B0030332048AF0036A36665AD00F502AA46726F6D3A2024363939A561626F75743000F25EDA03FD3C703E4C6F72656D20697073756D20646F6C6F722073697420616D65742C20636F6E7365637465747572206164697069736963696E6720656C69742C2073656420646F20656975736D6F642074656D706F7220696E6369646964756E74207574206C61626F72652065745C00F00E65206D61676E6120616C697175612E20557420656E696D206164206D690900F10D76656E69616D2C2071756973206E6F73747275642065786572636974EE008220756C6C616D636F5A00002500306973696A00015300F201697020657820656120636F6D6D6F646FC20070717561742E20445300A361757465206972757265ED00F41E696E20726570726568656E646572697420696E20766F6C7570746174652076656C697420657373652063696C6C2301D06520657520667567696174206E9100F0042070617269617475722E2045786365707465754801F0046E74206F6363616563617420637570696461743200A06F6E2070726F6964656E460121756E7500F00863756C706120717569206F6666696369612064657365721E00306D6F6C870010612101536964206573580170756D2E20536564FE005070657273703600F30E74697320756E6465206F6D6E69732069737465206E6174757320657272DD0105E000B56D206163637573616E7469DB00926D717565206C6175641600F1012C20746F74616D2072656D20617065729E01206561250030697073B100F002616520616220696C6C6F20696E76656E74200110764C01018D00A0657420717561736920617303F000746563746F2062656174616520766906005264696374610701F2006578706C696361626F2E204E656D6F1C02006700166D9401106D2401146110001273AE024073706572E600807220617574206F64C202217574A301006301226564350001D002407175756E2A00008A021269060260657320656F732400212072660214656000007000003300A069206E65736369756E749B0000FE0050706F72726F330050737175616D950101B60203510001B7001375AC000F570308132C58032263696C0207AD00726E6F6E206E756D5E0083697573206D6F6469660312616703001D0213750D020D6503136D66030085004861657261F801F5032E3C2F703EAC726571756972656D656E747325053FDA01941304070242010F1204043F2E0D0A3A00FF48B6AA686F77546F4170706C79AB012F026D71012531205265F90362646165206F62A3041269390401D104213F205A00182C1906192E14000FEE01280F7D0030019E00089D000208040FA3020E0F7B00300FE602270F7D00ADF008AD666565416E6446756E64696E679193A5656E2D7573A0C600000498F25EDA03FD3C703E4C6F72656D20697073756D20646F6C6F722073697420616D65742C20636F6E7365637465747572206164697069736963696E6720656C69742C2073656420646F20656975736D6F642074656D706F7220696E6369646964756E74207574206C61626F72652065745C00F00E65206D61676E6120616C697175612E20557420656E696D206164206D690900F21A76656E69616D2C2071756973206E6F737472756420657865726369746174696F6E20756C6C616D636F5A00002500306973696A00015300F201697020657820656120636F6D6D6F646FC20070717561742E20445300A361757465206972757265ED00F41E696E20726570726568656E646572697420696E20766F6C7570746174652076656C697420657373652063696C6C2301D06520657520667567696174206E9100F0042070617269617475722E2045786365707465754801F0046E74206F6363616563617420637570696461743200A06F6E2070726F6964656E460121756E7500F00863756C706120717569206F6666696369612064657365721E00306D6F6C870010612101536964206573580170756D2E20536564FE005070657273703600F30E74697320756E6465206F6D6E69732069737465206E6174757320657272DD0105E000B56D206163637573616E7469DB00926D717565206C6175641600F1012C20746F74616D2072656D20617065729E01206561250030697073B100F002616520616220696C6C6F20696E76656E74200110764C01018D00F00E6574207175617369206172636869746563746F2062656174616520766906005264696374610701F2006578706C696361626F2E204E656D6F1C02006700166D9401106D2401146110001273AE024073706572E600807220617574206F64C202217574A301006301226564350001D002407175756E2A00008A021269060260657320656F732400212072660214656000007000003300A069206E65736369756E749B0000FE0050706F72726F330050737175616D950101B60203510001B7001375AC000F570308132C58032263696C0207AD00726E6F6E206E756D5E0083697573206D6F6469660312616703001D0213750D020D6503136D66030085004861657261F801F52C2E3C2F703EAE70726F66696C65506963747572659193A5656E2D7573A0A25B5DA962696F67726170687990AF72656C6174656454656163686572732700FB23D98F756D623A2F2F646F63756D656E742F33666461396433613962386334616164626532656265326161323631646235622C3000FC1163383564343537323363626634323865393230346637656661363538396463353000F3126661653763616134303633373438316639323563643532303535363864386361AEAA006F436F75727365A90008FD1032653965393231346237336334663239393230363139646232623134343365A900FC113930346362646262313734653463613261386237653232633533666435313561A900B036323635663266626635386000F2033762646361646439306564396633636364816901D094B24C6966657374796C6520411D0354766573B26C1300232D611300BAD7FFD37A2F0062CC391EC21E00506869766573)
INSERT [dbo].[cmsContentNu] ([nodeId], [published], [data], [rv], [dataRaw]) VALUES (1211, 1, NULL, 0, 0x93C70662CD096ECD05C5C6000004CFF01D93DE0010A9706167655469746C659193A5656E2D7573A0B24C6966657374796C65204172636869766573A5742200F61690AA6261636B67726F756E6490AB6465736372697074696F6E90AB636F75727365496D61674800F129D9625B7B226B6579223A2262316662316262332D626635622D343461342D623238362D396131663839333561663336222C226D656469614B3200F21931616438313030352D386661382D346537362D386237612D313766333632323431613064227D5DAE79008573436F756E746572C400E0A83036204D6F6E7468A864757261A400071B0030332048AF0036A36665AD00F502AA46726F6D3A2024363939A561626F75743000F25EDA03FD3C703E4C6F72656D20697073756D20646F6C6F722073697420616D65742C20636F6E7365637465747572206164697069736963696E6720656C69742C2073656420646F20656975736D6F642074656D706F7220696E6369646964756E74207574206C61626F72652065745C00F00E65206D61676E6120616C697175612E20557420656E696D206164206D690900F10D76656E69616D2C2071756973206E6F73747275642065786572636974EE008220756C6C616D636F5A00002500306973696A00015300F201697020657820656120636F6D6D6F646FC20070717561742E20445300A361757465206972757265ED00F41E696E20726570726568656E646572697420696E20766F6C7570746174652076656C697420657373652063696C6C2301D06520657520667567696174206E9100F0042070617269617475722E2045786365707465754801F0046E74206F6363616563617420637570696461743200A06F6E2070726F6964656E460121756E7500F00863756C706120717569206F6666696369612064657365721E00306D6F6C870010612101536964206573580170756D2E20536564FE005070657273703600F30E74697320756E6465206F6D6E69732069737465206E6174757320657272DD0105E000B56D206163637573616E7469DB00926D717565206C6175641600F1012C20746F74616D2072656D20617065729E01206561250030697073B100F002616520616220696C6C6F20696E76656E74200110764C01018D00A0657420717561736920617303F000746563746F2062656174616520766906005264696374610701F2006578706C696361626F2E204E656D6F1C02006700166D9401106D2401146110001273AE024073706572E600807220617574206F64C202217574A301006301226564350001D002407175756E2A00008A021269060260657320656F732400212072660214656000007000003300A069206E65736369756E749B0000FE0050706F72726F330050737175616D950101B60203510001B7001375AC000F570308132C58032263696C0207AD00726E6F6E206E756D5E0083697573206D6F6469660312616703001D0213750D020D6503136D66030085004861657261F801F5032E3C2F703EAC726571756972656D656E747325053FDA01941304070242010F1204043F2E0D0A3A00FF48B6AA686F77546F4170706C79AB012F026D71012531205265F90362646165206F62A3041269390401D104213F205A00182C1906192E14000FEE01280F7D0030019E00089D000208040FA3020E0F7B00300FE602270F7D00ADF008AD666565416E6446756E64696E679193A5656E2D7573A0C600000498F25EDA03FD3C703E4C6F72656D20697073756D20646F6C6F722073697420616D65742C20636F6E7365637465747572206164697069736963696E6720656C69742C2073656420646F20656975736D6F642074656D706F7220696E6369646964756E74207574206C61626F72652065745C00F00E65206D61676E6120616C697175612E20557420656E696D206164206D690900F21A76656E69616D2C2071756973206E6F737472756420657865726369746174696F6E20756C6C616D636F5A00002500306973696A00015300F201697020657820656120636F6D6D6F646FC20070717561742E20445300A361757465206972757265ED00F41E696E20726570726568656E646572697420696E20766F6C7570746174652076656C697420657373652063696C6C2301D06520657520667567696174206E9100F0042070617269617475722E2045786365707465754801F0046E74206F6363616563617420637570696461743200A06F6E2070726F6964656E460121756E7500F00863756C706120717569206F6666696369612064657365721E00306D6F6C870010612101536964206573580170756D2E20536564FE005070657273703600F30E74697320756E6465206F6D6E69732069737465206E6174757320657272DD0105E000B56D206163637573616E7469DB00926D717565206C6175641600F1012C20746F74616D2072656D20617065729E01206561250030697073B100F002616520616220696C6C6F20696E76656E74200110764C01018D00F00E6574207175617369206172636869746563746F2062656174616520766906005264696374610701F2006578706C696361626F2E204E656D6F1C02006700166D9401106D2401146110001273AE024073706572E600807220617574206F64C202217574A301006301226564350001D002407175756E2A00008A021269060260657320656F732400212072660214656000007000003300A069206E65736369756E749B0000FE0050706F72726F330050737175616D950101B60203510001B7001375AC000F570308132C58032263696C0207AD00726E6F6E206E756D5E0083697573206D6F6469660312616703001D0213750D020D6503136D66030085004861657261F801F52C2E3C2F703EAE70726F66696C65506963747572659193A5656E2D7573A0A25B5DA962696F67726170687990AF72656C6174656454656163686572732700FB23D98F756D623A2F2F646F63756D656E742F33666461396433613962386334616164626532656265326161323631646235622C3000FC1163383564343537323363626634323865393230346637656661363538396463353000F3126661653763616134303633373438316639323563643532303535363864386361AEAA006F436F75727365A90008FD1032653965393231346237336334663239393230363139646232623134343365A900FC113930346362646262313734653463613261386237653232633533666435313561A900B036323635663266626635386000F2033762646361646439306564396633636364816901D094B24C6966657374796C6520411D0354766573B26C1300232D611300BAD7FFD37A2F0062CC391EC21E00506869766573)
GO
SET IDENTITY_INSERT [dbo].[cmsContentType] ON 

INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (531, 1044, N'Member', N'icon-user', N'icon-user', NULL, 0, 0, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (532, 1031, N'Folder', N'icon-folder', N'icon-folder', NULL, 0, 0, 1, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (533, 1032, N'Image', N'icon-picture', N'icon-picture', NULL, 0, 0, 1, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (534, 1033, N'File', N'icon-document', N'icon-document', NULL, 0, 0, 1, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (540, 1034, N'umbracoMediaVideo', N'icon-video', N'icon-video', NULL, 0, 0, 1, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (541, 1035, N'umbracoMediaAudio', N'icon-sound-waves', N'icon-sound-waves', NULL, 0, 0, 1, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (542, 1036, N'umbracoMediaArticle', N'icon-article', N'icon-article', NULL, 0, 0, 1, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (543, 1037, N'umbracoMediaVectorGraphics', N'icon-picture', N'icon-picture', NULL, 0, 0, 1, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (544, 1059, N'metaData', N'icon-application-window color-light-blue', N'folder.png', NULL, 0, 0, 0, 1)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (545, 1061, N'codeBook', N'icon-book color-pink', N'folder.png', NULL, 0, 0, 1, 1)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (546, 1137, N'about', N'icon-article color-pink', N'folder.png', NULL, 0, 0, 0, 1)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (547, 1139, N'blog', N'icon-article color-pink', N'folder.png', NULL, 0, 0, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (548, 1141, N'blogs', N'icon-notepad-alt color-pink', N'folder.png', NULL, 1, 0, 0, 1)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (549, 1143, N'contactUS', N'icon-old-phone color-pink', N'folder.png', NULL, 0, 0, 0, 1)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (550, 1145, N'courses', N'icon-art-easel color-pink', N'folder.png', NULL, 1, 0, 0, 1)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (552, 1150, N'course', N'icon-art-easel color-pink', N'folder.png', NULL, 0, 0, 0, 1)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (553, 1152, N'notice', N'icon-notepad color-pink', N'folder.png', NULL, 0, 0, 0, 1)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (554, 1154, N'research', N'icon-article color-pink', N'folder.png', NULL, 0, 0, 0, 1)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (555, 1156, N'scholarships', N'icon-bills-euro color-pink', N'folder.png', NULL, 1, 0, 0, 1)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (556, 1160, N'teachers', N'icon-users color-pink', N'folder.png', NULL, 1, 0, 0, 1)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (557, 1162, N'teacher', N'icon-user color-pink', N'folder.png', NULL, 0, 0, 0, 1)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (558, 1164, N'scholarship', N'icon-article color-pink', N'folder.png', NULL, 0, 0, 0, 1)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (559, 1165, N'redirection', N'icon-redo color-light-blue', N'folder.png', NULL, 0, 1, 0, 1)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (560, 1167, N'researches', N'icon-categories color-pink', N'folder.png', NULL, 1, 0, 0, 1)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (561, 1171, N'notices', N'icon-article color-pink', N'folder.png', NULL, 1, 0, 0, 1)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (562, 1174, N'events', N'icon-billboard color-pink', N'folder.png', NULL, 1, 0, 0, 1)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (563, 1177, N'event', N'icon-billboard color-pink', N'folder.png', NULL, 0, 0, 0, 1)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (564, 1179, N'newsLetter', N'icon-newspaper color-pink', N'folder.png', NULL, 1, 0, 0, 1)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (565, 1180, N'newsLetterSubscriber', N'icon-item-arrangement color-light-blue', N'folder.png', NULL, 0, 0, 0, 1)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (566, 1182, N'menu', N'icon-list color-deep-purple', N'folder.png', NULL, 0, 1, 0, 1)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (567, 1184, N'detailedMenu', N'icon-list color-deep-purple', N'folder.png', NULL, 0, 1, 0, 1)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (568, 1198, N'home', N'icon-home color-pink', N'folder.png', NULL, 0, 0, 0, 1)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (569, 1212, N'slid', N'icon-slideshow color-deep-purple', N'folder.png', NULL, 0, 1, 0, 1)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [isElement], [allowAtRoot], [variations]) VALUES (570, 1214, N'banner', N'icon-billboard color-light-blue', N'folder.png', NULL, 0, 0, 0, 1)
SET IDENTITY_INSERT [dbo].[cmsContentType] OFF
GO
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1059, 1061)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1059, 1137)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1059, 1139)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1059, 1141)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1059, 1143)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1059, 1145)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1059, 1150)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1059, 1152)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1059, 1154)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1059, 1156)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1059, 1160)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1059, 1162)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1059, 1164)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1059, 1167)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1059, 1171)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1059, 1174)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1059, 1177)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1059, 1198)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1214, 1137)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1214, 1139)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1214, 1141)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1214, 1143)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1214, 1145)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1214, 1150)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1214, 1152)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1214, 1154)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1214, 1156)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1214, 1160)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1214, 1164)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1214, 1167)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1214, 1171)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1214, 1174)
INSERT [dbo].[cmsContentType2ContentType] ([parentContentTypeId], [childContentTypeId]) VALUES (1214, 1177)
GO
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1031, 1031, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1031, 1032, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1031, 1033, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1031, 1034, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1031, 1035, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1031, 1036, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1031, 1037, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1061, 1137, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1061, 1141, 1)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1061, 1143, 5)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1061, 1145, 2)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1061, 1156, 3)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1061, 1160, 4)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1061, 1167, 8)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1061, 1171, 7)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1061, 1174, 6)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1061, 1179, 10)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1061, 1198, 9)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1141, 1139, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1145, 1150, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1156, 1164, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1160, 1162, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1167, 1154, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1171, 1152, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1174, 1177, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1179, 1180, 0)
GO
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1061, 1060, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1137, 1136, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1139, 1138, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1141, 1140, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1143, 1142, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1145, 1144, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1150, 1149, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1152, 1151, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1154, 1153, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1156, 1155, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1160, 1159, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1162, 1161, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1164, 1163, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1167, 1166, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1171, 1170, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1174, 1173, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1177, 1176, 1)
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1198, 1197, 1)
GO
SET IDENTITY_INSERT [dbo].[cmsPropertyType] ON 

INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (6, 1043, 1032, 3, N'umbracoFile', N'Image', 0, 1, NULL, NULL, NULL, NULL, 0, 0, N'00000006-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (7, -91, 1032, 3, N'umbracoWidth', N'Width', 0, 0, NULL, NULL, NULL, N'in pixels', 0, 0, N'00000007-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (8, -91, 1032, 3, N'umbracoHeight', N'Height', 0, 0, NULL, NULL, NULL, N'in pixels', 0, 0, N'00000008-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (9, -93, 1032, 3, N'umbracoBytes', N'Size', 0, 0, NULL, NULL, NULL, N'in bytes', 0, 0, N'00000009-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (10, -92, 1032, 3, N'umbracoExtension', N'Type', 0, 0, NULL, NULL, NULL, NULL, 0, 0, N'0000000a-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (24, -90, 1033, 4, N'umbracoFile', N'File', 0, 1, NULL, NULL, NULL, NULL, 0, 0, N'00000018-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (25, -92, 1033, 4, N'umbracoExtension', N'Type', 0, 0, NULL, NULL, NULL, NULL, 0, 0, N'00000019-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (26, -93, 1033, 4, N'umbracoBytes', N'Size', 0, 0, NULL, NULL, NULL, N'in bytes', 0, 0, N'0000001a-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (28, -89, 1044, 11, N'umbracoMemberComments', N'Comments', 0, 0, NULL, NULL, NULL, NULL, 0, 0, N'0000001c-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (29, -91, 1044, 11, N'umbracoMemberFailedPasswordAttempts', N'Failed Password Attempts', 1, 0, NULL, NULL, NULL, NULL, 0, 0, N'0000001d-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (30, -49, 1044, 11, N'umbracoMemberApproved', N'Is Approved', 2, 0, NULL, NULL, NULL, NULL, 0, 0, N'0000001e-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (31, -49, 1044, 11, N'umbracoMemberLockedOut', N'Is Locked Out', 3, 0, NULL, NULL, NULL, NULL, 0, 0, N'0000001f-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (32, -94, 1044, 11, N'umbracoMemberLastLockoutDate', N'Last Lockout Date', 4, 0, NULL, NULL, NULL, NULL, 0, 0, N'00000020-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (33, -94, 1044, 11, N'umbracoMemberLastLogin', N'Last Login Date', 5, 0, NULL, NULL, NULL, NULL, 0, 0, N'00000021-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (34, -94, 1044, 11, N'umbracoMemberLastPasswordChangeDate', N'Last Password Change Date', 6, 0, NULL, NULL, NULL, NULL, 0, 0, N'00000022-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (35, -94, 1044, 11, N'umbracoMemberPasswordRetrievalQuestion', N'Password Question', 7, 0, NULL, NULL, NULL, NULL, 0, 0, N'00000023-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (36, -94, 1044, 11, N'umbracoMemberPasswordRetrievalAnswer', N'Password Answer', 8, 0, NULL, NULL, NULL, NULL, 0, 0, N'00000024-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (40, -100, 1034, 52, N'umbracoFile', N'Video', 0, 1, NULL, NULL, NULL, NULL, 0, 0, N'00000028-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (41, -92, 1034, 52, N'umbracoExtension', N'Type', 0, 0, NULL, NULL, NULL, NULL, 0, 0, N'00000029-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (42, -93, 1034, 52, N'umbracoBytes', N'Size', 0, 0, NULL, NULL, NULL, N'in bytes', 0, 0, N'0000002a-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (43, -101, 1035, 53, N'umbracoFile', N'Audio', 0, 1, NULL, NULL, NULL, NULL, 0, 0, N'0000002b-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (44, -92, 1035, 53, N'umbracoExtension', N'Type', 0, 0, NULL, NULL, NULL, NULL, 0, 0, N'0000002c-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (45, -93, 1035, 53, N'umbracoBytes', N'Size', 0, 0, NULL, NULL, NULL, N'in bytes', 0, 0, N'0000002d-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (46, -102, 1036, 54, N'umbracoFile', N'Article', 0, 1, NULL, NULL, NULL, NULL, 0, 0, N'0000002e-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (47, -92, 1036, 54, N'umbracoExtension', N'Type', 0, 0, NULL, NULL, NULL, NULL, 0, 0, N'0000002f-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (48, -93, 1036, 54, N'umbracoBytes', N'Size', 0, 0, NULL, NULL, NULL, N'in bytes', 0, 0, N'00000030-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (49, -103, 1037, 55, N'umbracoFile', N'Vector Graphics', 0, 1, NULL, NULL, NULL, NULL, 0, 0, N'00000031-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (50, -92, 1037, 55, N'umbracoExtension', N'Type', 0, 0, NULL, NULL, NULL, NULL, 0, 0, N'00000032-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (51, -93, 1037, 55, N'umbracoBytes', N'Size', 0, 0, NULL, NULL, NULL, N'in bytes', 0, 0, N'00000033-0000-0000-0000-000000000000')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (52, -88, 1059, 56, N'pageTitle', N'Page Title', 0, 0, NULL, NULL, NULL, NULL, 0, 1, N'eb03bca6-52c6-4264-842e-4a4bcce4be29')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (53, 1063, 1061, 57, N'mainLogo', N'Main Logo', 0, 0, NULL, NULL, NULL, NULL, 0, 1, N'1fa8f52e-c41c-4b48-8a46-a7489ee82356')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (54, 1050, 1061, 57, N'topMenu', N'Top Menu', 1, 0, NULL, NULL, NULL, NULL, 0, 1, N'cb989d8f-0249-435c-b1ca-ae9e9c246792')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (55, 1050, 1061, 57, N'navBarMenu', N'Navigation Menu', 2, 0, NULL, NULL, NULL, NULL, 0, 1, N'2e936ecb-f5db-4f29-b8e1-fcc06943d3c4')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (59, 1185, 1061, 59, N'socialMedia', N'Social Media', 0, 0, NULL, NULL, NULL, NULL, 0, 1, N'd5a09bff-15e3-44eb-b4da-d6f67fa43fdb')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (60, 1064, 1061, 57, N'call', N'Call', 5, 0, NULL, NULL, NULL, NULL, 0, 1, N'3b088bf9-6cec-467b-85a8-7259d70518cb')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (61, -88, 1165, 60, N'redirectTo', N'Redirect To', 0, 0, NULL, NULL, NULL, NULL, 0, 0, N'4068f130-ccca-482f-8fae-c2220ca006a6')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (62, -88, 1180, 61, N'subscriber', N'Subscriber', 0, 0, NULL, NULL, NULL, NULL, 0, 1, N'13055d2e-59ff-44f8-bc80-8a7aa7e6b0bb')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (63, -88, 1061, 62, N'address', N'Address', 0, 0, NULL, NULL, NULL, NULL, 0, 1, N'4ddedc55-edc9-4da9-a008-9b06c856af73')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (64, -88, 1061, 62, N'phone1', N'First Phone', 1, 0, NULL, NULL, NULL, NULL, 0, 1, N'04615a42-dbf2-4891-a9d3-3618b7d87e54')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (65, -88, 1061, 62, N'phone2', N'Second Phone', 2, 0, NULL, NULL, NULL, NULL, 0, 1, N'6acef2d8-9760-4019-b854-0792527180a6')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (66, 1065, 1061, 62, N'email', N'E-mail', 3, 0, NULL, NULL, NULL, NULL, 0, 1, N'5a03663c-47ea-41a2-a49d-2dd65c1a4872')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (67, 1050, 1182, 63, N'menuItems', N'Menu', 1, 0, NULL, NULL, NULL, NULL, 0, 1, N'403c2815-8548-485f-a7f7-30850c5c4d41')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (68, 1183, 1061, 62, N'footerMenu', N'Footer Menu', 4, 0, NULL, NULL, NULL, NULL, 0, 1, N'5e6f2e69-a9b6-4191-aeaf-b8e03aad7621')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (69, -88, 1182, 63, N'menuTitle', N'Menu Title', 0, 0, NULL, NULL, NULL, NULL, 0, 1, N'a5953774-9f49-4c65-9d6d-63b47208c4c4')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (70, 1064, 1184, 64, N'itemURL', N'Item URL', 2, 0, NULL, NULL, NULL, NULL, 0, 1, N'927c6f75-6128-4da1-a957-230536943cc3')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (71, -88, 1184, 64, N'itemName', N'Item Name', 0, 0, NULL, NULL, NULL, NULL, 0, 1, N'056e08d8-5aee-4e1c-8f27-dc3ee8d40079')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (72, -88, 1184, 64, N'itemIcon', N'Item Icon', 1, 0, NULL, NULL, NULL, NULL, 0, 1, N'556c1213-b068-41f8-af4c-59116e01af98')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (73, 1051, 1137, 65, N'aboutImage', N'aboutImage', 0, 0, NULL, NULL, NULL, NULL, 0, 1, N'c4488da2-f89b-4aa4-843a-f318715de8ca')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (74, -88, 1137, 65, N'sectionTitle', N'sectionTitle', 1, 0, NULL, NULL, NULL, NULL, 0, 1, N'85144e80-8b99-434a-b3e5-9b2f6f65810d')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (75, 1203, 1137, 65, N'aboutOurJourney', N'aboutOurJourney', 2, 0, NULL, NULL, NULL, NULL, 0, 1, N'3ae7049f-b699-4673-b373-0e4aeec07f37')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (76, -88, 1137, 65, N'sTSuccessStories', N'sTSuccessStories', 3, 0, NULL, NULL, NULL, NULL, 0, 1, N'68433cf2-b2ec-466c-beb3-2348425c501b')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (77, 1203, 1137, 65, N'successStories', N'successStories', 4, 0, NULL, NULL, NULL, NULL, 0, 1, N'fa6f6717-12e6-4b43-978f-8c9fc27e1425')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (78, 1064, 1137, 65, N'storyVideoLink', N'storyVideoLink', 5, 0, NULL, NULL, NULL, NULL, 0, 1, N'3dbcb13a-691d-422b-8c41-8e3fa6a71e06')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (79, 1051, 1137, 65, N'sectionBackground', N'sectionBackground', 6, 0, NULL, NULL, NULL, NULL, 0, 1, N'378a26c9-7492-41dc-bc76-ca8fc6157264')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (80, -88, 1137, 65, N'ourTeachersTitle', N'ourTeachersTitle', 7, 0, NULL, NULL, NULL, NULL, 0, 1, N'161860e8-9940-4b1e-b021-a92eb0c301d5')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (81, 1202, 1137, 65, N'ourTeachers', N'ourTeachers', 8, 0, NULL, NULL, NULL, NULL, 0, 1, N'7b51e752-e696-4aa3-a0c1-09ec625ac342')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (82, 1203, 1162, 66, N'description', N'description', 0, 0, NULL, NULL, NULL, NULL, 0, 1, N'63a1bde5-95bf-4fcf-859f-69d5538ed198')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (83, -88, 1162, 66, N'specialization', N'specialization', 1, 0, NULL, NULL, NULL, NULL, 0, 1, N'26c88e34-b6dd-4485-bca3-ce5b9edd0a12')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (84, 1185, 1162, 66, N'socialMediaContacts', N'socialMediaContacts', 2, 0, NULL, NULL, NULL, NULL, 0, 1, N'bd60d01c-9f9c-4601-9e03-1a19befa7d7d')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (85, 1051, 1162, 66, N'profilePicture', N'profilePicture', 3, 0, NULL, NULL, NULL, NULL, 0, 1, N'b0e65917-7d86-4721-84de-a2fa1666d56b')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (86, 1204, 1162, 66, N'activitiesAndInterests', N'activitiesAndInterests', 4, 0, NULL, NULL, NULL, NULL, 0, 1, N'f3627121-3f99-4208-898d-ee1f426dc78b')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (87, 1203, 1162, 66, N'biography', N'biography', 5, 0, NULL, NULL, NULL, NULL, 0, 1, N'14861892-d094-4f79-90b6-7910eb03fb2e')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (88, 1205, 1162, 66, N'relatedCourses', N'relatedCourses', 6, 0, NULL, NULL, NULL, NULL, 0, 1, N'55471dd9-9b84-41ec-ac7f-af9ef6ff0d55')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (89, 1051, 1150, 67, N'courseImage', N'courseImage', 0, 0, NULL, NULL, NULL, NULL, 0, 1, N'2efc1827-5f86-4c98-a90a-17e1f0c4ef7c')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (90, -88, 1150, 67, N'coursesCounter', N'coursesCounter', 1, 0, NULL, NULL, NULL, NULL, 0, 1, N'18a1901f-fe79-4738-985c-1f091c93a50a')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (91, -88, 1150, 67, N'duration', N'duration', 2, 0, NULL, NULL, NULL, NULL, 0, 1, N'fc295fe3-1d07-4796-ae68-311682781a4c')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (92, -88, 1150, 67, N'fee', N'fee', 3, 0, NULL, NULL, NULL, NULL, 0, 1, N'b16bacee-30d1-4fd5-88a7-42fd48225e32')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (93, 1203, 1150, 67, N'about', N'about', 4, 0, NULL, NULL, NULL, NULL, 0, 1, N'7399b56e-d5f0-4c18-9440-533bc31cf03f')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (94, 1204, 1150, 67, N'requirements', N'requirements', 5, 0, NULL, NULL, NULL, NULL, 0, 1, N'd3c7f4b3-b984-4fed-a9be-ec848a46c904')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (95, 1204, 1150, 67, N'howToApply', N'howToApply', 6, 0, NULL, NULL, NULL, NULL, 0, 1, N'6ade6841-a227-4c64-ba5d-dfd829422ba7')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (96, 1203, 1150, 67, N'feeAndFunding', N'feeAndFunding', 7, 0, NULL, NULL, NULL, NULL, 0, 1, N'3560fd53-bae5-48c2-8aac-0b2c7ddd11d0')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (97, 1051, 1150, 67, N'profilePicture', N'profilePicture', 8, 0, NULL, NULL, NULL, NULL, 0, 1, N'0dc44fc3-1c96-4deb-a15e-96d31c41924e')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (98, 1203, 1150, 67, N'biography', N'biography', 9, 0, NULL, NULL, NULL, NULL, 0, 1, N'1148a88e-acca-46ea-900a-594c513c648b')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (99, 1202, 1150, 67, N'relatedTeachers', N'relatedTeachers', 10, 0, NULL, NULL, NULL, NULL, 0, 1, N'9b3a62a4-ca4c-4faa-8c64-dc118215fa73')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (100, 1205, 1150, 67, N'relatedCourses', N'relatedCourses', 11, 0, NULL, NULL, NULL, NULL, 0, 1, N'e4d6fe8e-f25c-44dd-be77-86c771ca9f5f')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (101, 1213, 1198, 69, N'slider', N'slider', 0, 0, NULL, NULL, NULL, NULL, 0, 1, N'9daef0c4-1a89-4b3c-b353-46957f40d72c')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (102, 1051, 1198, 69, N'sliderBackGround', N'sliderBackGround', 1, 0, NULL, NULL, NULL, NULL, 0, 1, N'e4878418-d20a-4ce8-acc3-9763f00e9c18')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (103, -88, 1212, 70, N'title', N'title', 0, 0, NULL, NULL, NULL, NULL, 0, 1, N'd2e954a1-e9d0-4a09-b8e7-beeec4924cc9')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (104, 1203, 1212, 70, N'description', N'description', 0, 0, NULL, NULL, NULL, NULL, 0, 1, N'0a0d6e2c-1f07-4b8d-a1da-1a6031c4d4ae')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (105, -88, 1212, 70, N'applyButton', N'applyButton', 0, 0, NULL, NULL, NULL, NULL, 0, 1, N'6db45ff5-1ee4-422c-a491-fcbe04a6c744')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (106, 1064, 1212, 70, N'applicationRedirection', N'applicationRedirection', 0, 0, NULL, NULL, NULL, NULL, 0, 1, N'1d931d7a-ef50-4c11-b3b3-aa5f7b209313')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (107, -88, 1198, 71, N'aboutUsST', N'aboutUsST', 0, 0, NULL, NULL, NULL, NULL, 0, 1, N'9f47aa50-ae74-4fcb-b631-1ed1f433ffa6')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (108, 1203, 1198, 71, N'aboutUSDes', N'aboutUSDes', 0, 0, NULL, NULL, NULL, NULL, 0, 1, N'99379a04-abd1-4efc-9ec5-0b70cafadc7d')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (109, 1064, 1198, 71, N'aboutUsPage', N'aboutUsPage', 0, 0, NULL, NULL, NULL, NULL, 0, 1, N'ff0a2755-cbc8-48e7-98a9-869dc6ac8463')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (110, 1051, 1198, 71, N'aboutUSImage', N'aboutUSImage', 0, 0, NULL, NULL, NULL, NULL, 0, 1, N'23684a0f-b15f-48e0-a383-87822ab45f5b')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (111, 1205, 1198, 72, N'relatedCourses', N'relatedCourses', 0, 0, NULL, NULL, NULL, NULL, 0, 1, N'921e1667-cb83-4830-9109-5fa478bca8d0')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (112, -88, 1198, 73, N'ourTeachersTitle', N'ourTeachersTitle', 0, 0, NULL, NULL, NULL, NULL, 0, 1, N'b6025843-1665-4b39-9ca8-5744c3093448')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (113, 1202, 1198, 73, N'topTeachers', N'topTeachers', 1, 0, NULL, NULL, NULL, NULL, 0, 1, N'04735caa-7035-48b5-8da3-8eccedb33381')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (114, -88, 1214, 74, N'title', N'title', 0, 0, NULL, NULL, NULL, NULL, 0, 1, N'10c61cbb-026b-4b0a-a5e3-ab463522d7e3')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (115, 1051, 1214, 74, N'background', N'background', 1, 0, NULL, NULL, NULL, NULL, 0, 1, N'a1408a66-e880-4ddc-819e-23bb80d1fe37')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (116, 1203, 1214, 74, N'description', N'description', 2, 0, NULL, NULL, NULL, NULL, 0, 1, N'6e11f0a1-8717-475b-a1d9-2c17f781a195')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (117, -88, 1059, 56, N'umbracoUrlName', N'Page Name in URL', 1, 0, NULL, NULL, NULL, NULL, 0, 1, N'19699635-9c09-48e2-858a-9ef5c0126024')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (118, 1046, 1061, 75, N'umbracoInternalRedirectId', N'Redirect To', 0, 0, NULL, NULL, NULL, NULL, 0, 1, N'ae9b6d4c-6721-45c1-820b-403eeb5301a4')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (119, 1204, 1160, 76, N'categories', N'categories', 0, 0, NULL, NULL, NULL, NULL, 0, 1, N'293bd617-ab5b-42c2-8b4b-9ac0fe3d3a65')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (120, 1204, 1162, 66, N'categories', N'categories', 7, 0, NULL, NULL, NULL, NULL, 0, 1, N'cf6d6095-671c-4028-8043-8caf5fda86a5')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (121, -88, 1061, 77, N'subscribeNow', N'subscribeNow', 0, 0, NULL, NULL, NULL, NULL, 0, 1, N'3a6322e5-c86b-4901-9706-a15592a36754')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (122, -88, 1061, 77, N'join', N'join', 0, 0, NULL, NULL, NULL, NULL, 0, 1, N'dac2dd96-2138-44d2-8de5-64bce5f43476')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [sortOrder], [mandatory], [mandatoryMessage], [validationRegExp], [validationRegExpMessage], [Description], [labelOnTop], [variations], [UniqueID]) VALUES (123, -88, 1061, 77, N'enterEmail', N'enterEmail', 0, 0, NULL, NULL, NULL, NULL, 0, 1, N'c6773431-3989-467a-9f8d-75d40e859298')
SET IDENTITY_INSERT [dbo].[cmsPropertyType] OFF
GO
SET IDENTITY_INSERT [dbo].[cmsPropertyTypeGroup] ON 

INSERT [dbo].[cmsPropertyTypeGroup] ([id], [uniqueID], [contenttypeNodeId], [type], [text], [alias], [sortorder]) VALUES (3, N'79ed4d07-254a-42cf-8fa9-ebe1c116a596', 1032, 0, N'Image', N'image', 1)
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [uniqueID], [contenttypeNodeId], [type], [text], [alias], [sortorder]) VALUES (4, N'50899f9c-023a-4466-b623-aba9049885fe', 1033, 0, N'File', N'file', 1)
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [uniqueID], [contenttypeNodeId], [type], [text], [alias], [sortorder]) VALUES (11, N'0756729d-d665-46e3-b84a-37aceaa614f8', 1044, 0, N'Membership', N'membership', 1)
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [uniqueID], [contenttypeNodeId], [type], [text], [alias], [sortorder]) VALUES (52, N'2f0a61b6-cf92-4ff4-b437-751ab35eb254', 1034, 0, N'Video', N'video', 1)
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [uniqueID], [contenttypeNodeId], [type], [text], [alias], [sortorder]) VALUES (53, N'335fb495-0a87-4e82-b902-30eb367b767c', 1035, 0, N'Audio', N'audio', 1)
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [uniqueID], [contenttypeNodeId], [type], [text], [alias], [sortorder]) VALUES (54, N'9af3bd65-f687-4453-9518-5f180d1898ec', 1036, 0, N'Article', N'article', 1)
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [uniqueID], [contenttypeNodeId], [type], [text], [alias], [sortorder]) VALUES (55, N'f199b4d7-9e84-439f-8531-f87d9af37711', 1037, 0, N'Vector Graphics', N'vectorGraphics', 1)
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [uniqueID], [contenttypeNodeId], [type], [text], [alias], [sortorder]) VALUES (56, N'90b337bf-f823-4e25-b06a-b65f241bdac5', 1059, 0, N'Meta Data', N'metaData', 0)
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [uniqueID], [contenttypeNodeId], [type], [text], [alias], [sortorder]) VALUES (57, N'7e3e92b8-1e56-4336-9e95-8486a4f95a9c', 1061, 1, N'Header', N'header', 0)
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [uniqueID], [contenttypeNodeId], [type], [text], [alias], [sortorder]) VALUES (59, N'28f9b604-c01f-458a-a9f9-baf8f8877450', 1061, 0, N'General Content', N'generalContent', 2)
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [uniqueID], [contenttypeNodeId], [type], [text], [alias], [sortorder]) VALUES (60, N'0f4efe35-be9b-4f43-9817-d0a4b32f7b06', 1165, 0, N'Redirection', N'redirection', 0)
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [uniqueID], [contenttypeNodeId], [type], [text], [alias], [sortorder]) VALUES (61, N'8d777bd8-1db6-4fd3-8934-cc7d07aff04a', 1180, 0, N'Subscriber', N'subscriber', 0)
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [uniqueID], [contenttypeNodeId], [type], [text], [alias], [sortorder]) VALUES (62, N'637187a8-ec36-4d44-b545-f8f6019b78b9', 1061, 1, N'Footer', N'footer', 1)
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [uniqueID], [contenttypeNodeId], [type], [text], [alias], [sortorder]) VALUES (63, N'9420a39c-a847-4070-8e08-113f06209409', 1182, 0, N'Menu', N'menu', 0)
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [uniqueID], [contenttypeNodeId], [type], [text], [alias], [sortorder]) VALUES (64, N'ad3dccd3-47b9-42e1-971e-e21de405846e', 1184, 0, N'Menu', N'menu', 0)
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [uniqueID], [contenttypeNodeId], [type], [text], [alias], [sortorder]) VALUES (65, N'7f4e9675-a7a4-4472-9613-7053761480ab', 1137, 1, N'Content', N'content', 0)
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [uniqueID], [contenttypeNodeId], [type], [text], [alias], [sortorder]) VALUES (66, N'e047c4b2-9616-4fb6-925b-40abf87e90be', 1162, 1, N'Content', N'content', 0)
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [uniqueID], [contenttypeNodeId], [type], [text], [alias], [sortorder]) VALUES (67, N'bb286e92-28f7-4101-9eb4-222ab064dd6b', 1150, 1, N'Content', N'content', 0)
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [uniqueID], [contenttypeNodeId], [type], [text], [alias], [sortorder]) VALUES (68, N'82f7c2d0-54bc-482a-8986-1115b4cc33e8', 1198, 1, N'Content', N'content', 0)
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [uniqueID], [contenttypeNodeId], [type], [text], [alias], [sortorder]) VALUES (69, N'1f50c9f8-b8e8-44cd-a558-f0f0ae213c64', 1198, 0, N'Slider', N'content/slider', 0)
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [uniqueID], [contenttypeNodeId], [type], [text], [alias], [sortorder]) VALUES (70, N'31b69c4f-13e3-4691-b2c5-0b074dd0a38d', 1212, 0, N'Slide', N'slide', 0)
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [uniqueID], [contenttypeNodeId], [type], [text], [alias], [sortorder]) VALUES (71, N'059ebfff-e8d8-4bf0-bf4e-0045c7a16a7a', 1198, 0, N'About Us', N'content/aboutUs', 1)
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [uniqueID], [contenttypeNodeId], [type], [text], [alias], [sortorder]) VALUES (72, N'9443715e-c6d8-4589-825e-9e4d28bd079a', 1198, 0, N'Our Courses', N'content/ourCourses', 2)
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [uniqueID], [contenttypeNodeId], [type], [text], [alias], [sortorder]) VALUES (73, N'f240ec9a-a236-43d8-81e1-2d02adda0da0', 1198, 0, N'Our Teachers', N'content/ourTeachers', 3)
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [uniqueID], [contenttypeNodeId], [type], [text], [alias], [sortorder]) VALUES (74, N'58eb430b-0d5d-4ecf-937f-665f6b9905fb', 1214, 0, N'Banner', N'banner', 0)
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [uniqueID], [contenttypeNodeId], [type], [text], [alias], [sortorder]) VALUES (75, N'3ec5e6c3-1122-4439-8977-68283f8e2f82', 1061, 0, N'Meta Data', N'metaData', 0)
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [uniqueID], [contenttypeNodeId], [type], [text], [alias], [sortorder]) VALUES (76, N'6a43dabc-4279-4ab3-94d9-d44267782554', 1160, 1, N'Content', N'content', 0)
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [uniqueID], [contenttypeNodeId], [type], [text], [alias], [sortorder]) VALUES (77, N'1cf74c4d-9ec2-40eb-b363-0e8d57e6e3ad', 1061, 0, N'Newsletter', N'footer/newsletter', 0)
SET IDENTITY_INSERT [dbo].[cmsPropertyTypeGroup] OFF
GO
SET IDENTITY_INSERT [dbo].[cmsTemplate] ON 

INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias]) VALUES (1, 1060, N'CodeBook')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias]) VALUES (2, 1136, N'About')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias]) VALUES (3, 1138, N'Blog')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias]) VALUES (4, 1140, N'Blogs')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias]) VALUES (5, 1142, N'ContactUS')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias]) VALUES (6, 1144, N'Courses')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias]) VALUES (7, 1147, N'Courses1')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias]) VALUES (8, 1149, N'Course')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias]) VALUES (9, 1151, N'Notice')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias]) VALUES (10, 1153, N'Research')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias]) VALUES (11, 1155, N'Scholarships')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias]) VALUES (12, 1159, N'Teachers')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias]) VALUES (13, 1161, N'Teacher')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias]) VALUES (14, 1163, N'Scholership')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias]) VALUES (15, 1166, N'Researches')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias]) VALUES (16, 1170, N'Notices')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias]) VALUES (17, 1173, N'Events')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias]) VALUES (18, 1176, N'Event')
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [alias]) VALUES (19, 1197, N'Home')
SET IDENTITY_INSERT [dbo].[cmsTemplate] OFF
GO
SET IDENTITY_INSERT [dbo].[umbracoAudit] ON 

INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (1, 0, N'User "SYSTEM" ', N'127.0.0.1', CAST(N'2022-07-10T00:36:43.287' AS DateTime), -1, N'User "Administrator" ', N'umbraco/user/save', N'updating RawPasswordValue, LastPasswordChangeDate, UpdateDate, SecurityStamp')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (2, 0, N'User "SYSTEM" ', N'127.0.0.1', CAST(N'2022-07-10T00:36:43.363' AS DateTime), -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'umbraco/user/save', N'updating Email, Name, Username, UpdateDate, SecurityStamp')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (3, 0, N'User "SYSTEM" ', N'127.0.0.1', CAST(N'2022-07-10T00:36:43.617' AS DateTime), -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (4, 0, N'User "SYSTEM" ', N'127.0.0.1', CAST(N'2022-07-10T00:41:30.590' AS DateTime), -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (5, 0, N'User "SYSTEM" ', N'127.0.0.1', CAST(N'2022-07-10T00:41:30.657' AS DateTime), -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (6, -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'127.0.0.1', CAST(N'2022-07-10T00:41:30.763' AS DateTime), -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'umbraco/user/save', N'updating TourData, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (7, -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'127.0.0.1', CAST(N'2022-07-10T00:41:35.043' AS DateTime), -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'umbraco/user/save', N'updating TourData, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (8, -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'127.0.0.1', CAST(N'2022-07-10T00:43:12.463' AS DateTime), 1, N'User "Writer" <Writer@CodeBook.edu>', N'umbraco/user/save', N'updating SessionTimeout, SecurityStamp, CreateDate, UpdateDate, Id')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (9, -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'127.0.0.1', CAST(N'2022-07-10T00:43:12.513' AS DateTime), 1, N'User "Writer" <Writer@CodeBook.edu>', N'umbraco/user/save', N'updating LastPasswordChangeDate, RawPasswordValue, SecurityStamp, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (10, -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'127.0.0.1', CAST(N'2022-07-10T00:43:12.563' AS DateTime), 1, N'User "Writer" <Writer@CodeBook.edu>', N'umbraco/user/save', N'updating Key, IsApproved, Groups, UpdateDate; groups assigned: writer')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (11, -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'127.0.0.1', CAST(N'2022-07-10T00:44:15.640' AS DateTime), 2, N'User "Center Admin" <Admin@CodeBook.edu>', N'umbraco/user/save', N'updating SessionTimeout, SecurityStamp, CreateDate, UpdateDate, Id')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (12, -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'127.0.0.1', CAST(N'2022-07-10T00:44:15.657' AS DateTime), 2, N'User "Center Admin" <Admin@CodeBook.edu>', N'umbraco/user/save', N'updating LastPasswordChangeDate, RawPasswordValue, SecurityStamp, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (13, -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'127.0.0.1', CAST(N'2022-07-10T00:44:15.683' AS DateTime), 2, N'User "Center Admin" <Admin@CodeBook.edu>', N'umbraco/user/save', N'updating Key, IsApproved, Groups, UpdateDate; groups assigned: admin')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (14, 0, N'User "SYSTEM" ', N'127.0.0.1', CAST(N'2022-07-10T01:08:39.040' AS DateTime), -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (15, 0, N'User "SYSTEM" ', N'127.0.0.1', CAST(N'2022-07-10T01:08:39.053' AS DateTime), -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (16, 0, N'User "SYSTEM" ', N'127.0.0.1', CAST(N'2022-07-10T17:03:59.850' AS DateTime), -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (17, 0, N'User "SYSTEM" ', N'127.0.0.1', CAST(N'2022-07-10T17:03:59.887' AS DateTime), -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (18, 0, N'User "SYSTEM" ', N'127.0.0.1', CAST(N'2022-07-10T18:23:45.257' AS DateTime), -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (19, 0, N'User "SYSTEM" ', N'127.0.0.1', CAST(N'2022-07-10T18:23:45.337' AS DateTime), -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (20, -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'127.0.0.1', CAST(N'2022-07-10T18:25:45.810' AS DateTime), -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (21, 0, N'User "SYSTEM" ', N'127.0.0.1', CAST(N'2022-07-10T18:25:45.820' AS DateTime), -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (22, 0, N'User "SYSTEM" ', N'127.0.0.1', CAST(N'2022-07-10T19:21:03.290' AS DateTime), -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (23, 0, N'User "SYSTEM" ', N'127.0.0.1', CAST(N'2022-07-10T19:21:03.307' AS DateTime), -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (24, -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'127.0.0.1', CAST(N'2022-07-10T19:21:13.223' AS DateTime), -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (25, 0, N'User "SYSTEM" ', N'127.0.0.1', CAST(N'2022-07-10T19:21:13.233' AS DateTime), -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (26, 0, N'User "SYSTEM" ', N'127.0.0.1', CAST(N'2022-07-10T20:53:25.730' AS DateTime), -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (27, 0, N'User "SYSTEM" ', N'127.0.0.1', CAST(N'2022-07-10T20:53:25.797' AS DateTime), -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (28, -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'127.0.0.1', CAST(N'2022-07-10T20:53:30.023' AS DateTime), -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (29, 0, N'User "SYSTEM" ', N'127.0.0.1', CAST(N'2022-07-10T20:53:30.027' AS DateTime), -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (30, -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'127.0.0.1', CAST(N'2022-07-10T20:53:32.373' AS DateTime), -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (31, 0, N'User "SYSTEM" ', N'127.0.0.1', CAST(N'2022-07-10T20:53:32.380' AS DateTime), -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (32, -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'127.0.0.1', CAST(N'2022-07-10T21:12:59.990' AS DateTime), -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (33, 0, N'User "SYSTEM" ', N'127.0.0.1', CAST(N'2022-07-10T21:13:00.003' AS DateTime), -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (34, -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'127.0.0.1', CAST(N'2022-07-10T21:13:01.670' AS DateTime), -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (35, 0, N'User "SYSTEM" ', N'127.0.0.1', CAST(N'2022-07-10T21:13:01.700' AS DateTime), -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (36, -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'127.0.0.1', CAST(N'2022-07-10T21:30:22.637' AS DateTime), -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (37, 0, N'User "SYSTEM" ', N'127.0.0.1', CAST(N'2022-07-10T21:30:22.693' AS DateTime), -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (38, -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'127.0.0.1', CAST(N'2022-07-10T21:33:05.050' AS DateTime), -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (39, 0, N'User "SYSTEM" ', N'127.0.0.1', CAST(N'2022-07-10T21:33:05.057' AS DateTime), -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (40, 0, N'User "SYSTEM" ', N'127.0.0.1', CAST(N'2022-07-10T21:54:27.633' AS DateTime), -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (41, 0, N'User "SYSTEM" ', N'127.0.0.1', CAST(N'2022-07-10T21:54:27.690' AS DateTime), -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (42, -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'127.0.0.1', CAST(N'2022-07-10T21:54:31.000' AS DateTime), -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (43, 0, N'User "SYSTEM" ', N'127.0.0.1', CAST(N'2022-07-10T21:54:31.003' AS DateTime), -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (44, -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'127.0.0.1', CAST(N'2022-07-10T22:18:23.817' AS DateTime), -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (45, 0, N'User "SYSTEM" ', N'127.0.0.1', CAST(N'2022-07-10T22:18:23.830' AS DateTime), -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (46, 0, N'User "SYSTEM" ', N'127.0.0.1', CAST(N'2022-07-11T12:15:41.143' AS DateTime), -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (47, 0, N'User "SYSTEM" ', N'127.0.0.1', CAST(N'2022-07-11T12:15:41.217' AS DateTime), -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (48, 0, N'User "SYSTEM" ', N'127.0.0.1', CAST(N'2022-07-11T15:03:43.610' AS DateTime), -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (49, 0, N'User "SYSTEM" ', N'127.0.0.1', CAST(N'2022-07-11T15:03:43.630' AS DateTime), -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (50, -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'127.0.0.1', CAST(N'2022-07-11T15:03:45.817' AS DateTime), -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (51, 0, N'User "SYSTEM" ', N'127.0.0.1', CAST(N'2022-07-11T15:03:45.833' AS DateTime), -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (52, 0, N'User "SYSTEM" ', N'127.0.0.1', CAST(N'2022-07-11T16:41:30.823' AS DateTime), -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (53, 0, N'User "SYSTEM" ', N'127.0.0.1', CAST(N'2022-07-11T16:41:30.823' AS DateTime), -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (54, 0, N'User "SYSTEM" ', N'127.0.0.1', CAST(N'2022-07-11T16:41:30.883' AS DateTime), -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (55, 0, N'User "SYSTEM" ', N'127.0.0.1', CAST(N'2022-07-11T16:41:30.887' AS DateTime), -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (56, 0, N'User "SYSTEM" ', N'127.0.0.1', CAST(N'2022-07-12T12:31:56.767' AS DateTime), -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (57, 0, N'User "SYSTEM" ', N'127.0.0.1', CAST(N'2022-07-12T12:34:04.267' AS DateTime), -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'umbraco/user/save', N'updating FailedPasswordAttempts, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (58, 0, N'User "SYSTEM" ', N'127.0.0.1', CAST(N'2022-07-12T12:34:18.550' AS DateTime), -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'umbraco/user/save', N'updating FailedPasswordAttempts, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (59, 0, N'User "SYSTEM" ', N'127.0.0.1', CAST(N'2022-07-12T12:34:18.580' AS DateTime), -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (60, 0, N'User "SYSTEM" ', N'127.0.0.1', CAST(N'2022-07-12T12:34:18.597' AS DateTime), -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (61, -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'127.0.0.1', CAST(N'2022-07-12T12:35:46.663' AS DateTime), 3, N'User "Center Admin" <CenterAdmin@CodeBook.edu>', N'umbraco/user/save', N'updating SessionTimeout, SecurityStamp, CreateDate, UpdateDate, Id')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (62, -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'127.0.0.1', CAST(N'2022-07-12T12:35:46.703' AS DateTime), 3, N'User "Center Admin" <CenterAdmin@CodeBook.edu>', N'umbraco/user/save', N'updating LastPasswordChangeDate, RawPasswordValue, SecurityStamp, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (63, -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'127.0.0.1', CAST(N'2022-07-12T12:35:46.730' AS DateTime), 3, N'User "Center Admin" <CenterAdmin@CodeBook.edu>', N'umbraco/user/save', N'updating Key, IsApproved, Groups, UpdateDate; groups assigned: admin, writer, editor, translator, sensitiveData')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (64, 0, N'User "SYSTEM" ', N'127.0.0.1', CAST(N'2022-10-12T19:41:07.650' AS DateTime), -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'umbraco/user/save', N'updating LastLoginDate, UpdateDate')
INSERT [dbo].[umbracoAudit] ([id], [performingUserId], [performingDetails], [performingIp], [eventDateUtc], [affectedUserId], [affectedDetails], [eventType], [eventDetails]) VALUES (65, 0, N'User "SYSTEM" ', N'127.0.0.1', CAST(N'2022-10-12T19:41:07.703' AS DateTime), -1, N'User "Mohammed Alhadik" <MohammedAlhadik@gmail.com>', N'umbraco/user/sign-in/login', N'login success')
SET IDENTITY_INSERT [dbo].[umbracoAudit] OFF
GO
SET IDENTITY_INSERT [dbo].[umbracoCacheInstruction] ON 

INSERT [dbo].[umbracoCacheInstruction] ([id], [utcStamp], [jsonInstruction], [originated], [instructionCount]) VALUES (332, CAST(N'2022-10-12T19:41:08.627' AS DateTime), N'[{"RefreshType":3,"RefresherId":"e057af6d-2ee6-41f4-8045-3694010f0aa6","GuidId":"00000000-0000-0000-0000-000000000000","IntId":0,"JsonIds":"[-1]","JsonIdCount":1,"JsonPayload":null}]', N'M-ALHADIK//LM/W3SVC/2/ROOT [P7928/D2] 8C12C8FA5A4645A88060F7CBB6CCB87B', 1)
SET IDENTITY_INSERT [dbo].[umbracoCacheInstruction] OFF
GO
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1062, 1061)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1066, 1031)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1067, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1068, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1069, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1070, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1071, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1072, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1073, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1074, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1075, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1076, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1077, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1078, 1031)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1079, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1080, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1081, 1031)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1082, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1083, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1084, 1031)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1085, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1086, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1087, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1088, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1089, 1031)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1090, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1091, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1092, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1093, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1094, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1095, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1096, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1097, 1031)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1098, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1099, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1100, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1101, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1102, 1031)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1103, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1104, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1105, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1106, 1031)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1107, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1108, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1109, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1110, 1031)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1111, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1112, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1113, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1114, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1115, 1031)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1116, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1117, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1118, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1119, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1120, 1031)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1121, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1122, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1123, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1124, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1125, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1126, 1032)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1186, 1137)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1187, 1141)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1188, 1145)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1189, 1156)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1191, 1160)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1192, 1143)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1193, 1174)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1194, 1171)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1195, 1167)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1199, 1198)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1200, 1179)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1201, 1180)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1206, 1162)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1207, 1162)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1208, 1162)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1209, 1150)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1210, 1150)
INSERT [dbo].[umbracoContent] ([nodeId], [contentTypeId]) VALUES (1211, 1150)
GO
SET IDENTITY_INSERT [dbo].[umbracoContentVersion] ON 

INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (1, 1062, CAST(N'2022-07-10T19:09:05.097' AS DateTime), -1, 0, N'Code Book', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (2, 1062, CAST(N'2022-07-10T19:33:26.137' AS DateTime), -1, 0, N'Code Book', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (3, 1066, CAST(N'2022-07-10T19:27:19.273' AS DateTime), NULL, 1, N'images', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (4, 1067, CAST(N'2022-07-10T19:27:19.630' AS DateTime), NULL, 1, N'About Us', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (5, 1068, CAST(N'2022-07-10T19:27:19.763' AS DateTime), NULL, 1, N'Course 1', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (6, 1069, CAST(N'2022-07-10T19:27:19.870' AS DateTime), NULL, 1, N'Course 2', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (7, 1070, CAST(N'2022-07-10T19:27:19.960' AS DateTime), NULL, 1, N'Course 3', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (8, 1071, CAST(N'2022-07-10T19:27:20.033' AS DateTime), NULL, 1, N'Event 1', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (9, 1072, CAST(N'2022-07-10T19:27:20.117' AS DateTime), NULL, 1, N'Event 2', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (10, 1073, CAST(N'2022-07-10T19:27:20.187' AS DateTime), NULL, 1, N'Event 3', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (11, 1074, CAST(N'2022-07-10T19:27:20.277' AS DateTime), NULL, 1, N'Favicon', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (12, 1075, CAST(N'2022-07-10T19:27:20.353' AS DateTime), NULL, 1, N'Logo', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (13, 1076, CAST(N'2022-07-10T19:27:20.437' AS DateTime), NULL, 1, N'Preloader', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (14, 1077, CAST(N'2022-07-10T19:27:20.507' AS DateTime), NULL, 1, N'Teacher', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (15, 1078, CAST(N'2022-07-10T19:27:20.587' AS DateTime), NULL, 1, N'backgrounds', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (16, 1079, CAST(N'2022-07-10T19:27:20.643' AS DateTime), NULL, 1, N'Page Title', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (17, 1080, CAST(N'2022-07-10T19:27:20.740' AS DateTime), NULL, 1, N'Success Story', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (18, 1081, CAST(N'2022-07-10T19:27:20.800' AS DateTime), NULL, 1, N'banner', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (19, 1082, CAST(N'2022-07-10T19:27:20.853' AS DateTime), NULL, 1, N'Banner 1', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (20, 1083, CAST(N'2022-07-10T19:27:20.957' AS DateTime), NULL, 1, N'Banner Feature', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (21, 1084, CAST(N'2022-07-10T19:27:21.013' AS DateTime), NULL, 1, N'blog', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (22, 1085, CAST(N'2022-07-10T19:27:21.060' AS DateTime), NULL, 1, N'Blog Single', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (23, 1086, CAST(N'2022-07-10T19:27:21.133' AS DateTime), NULL, 1, N'Post 1', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (24, 1087, CAST(N'2022-07-10T19:27:21.210' AS DateTime), NULL, 1, N'Post 2', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (25, 1088, CAST(N'2022-07-10T19:27:21.280' AS DateTime), NULL, 1, N'Post 3', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (26, 1089, CAST(N'2022-07-10T19:27:21.357' AS DateTime), NULL, 1, N'courses', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (27, 1090, CAST(N'2022-07-10T19:27:21.403' AS DateTime), NULL, 1, N'Course 1', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (28, 1091, CAST(N'2022-07-10T19:27:21.473' AS DateTime), NULL, 1, N'Course 2', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (29, 1092, CAST(N'2022-07-10T19:27:21.557' AS DateTime), NULL, 1, N'Course 3', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (30, 1093, CAST(N'2022-07-10T19:27:21.637' AS DateTime), NULL, 1, N'Course 4', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (31, 1094, CAST(N'2022-07-10T19:27:21.710' AS DateTime), NULL, 1, N'Course 5', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (32, 1095, CAST(N'2022-07-10T19:27:21.797' AS DateTime), NULL, 1, N'Course 6', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (33, 1096, CAST(N'2022-07-10T19:27:21.883' AS DateTime), NULL, 1, N'Course Single', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (34, 1097, CAST(N'2022-07-10T19:27:21.957' AS DateTime), NULL, 1, N'events', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (35, 1098, CAST(N'2022-07-10T19:27:22.017' AS DateTime), NULL, 1, N'Event 1', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (36, 1099, CAST(N'2022-07-10T19:27:22.127' AS DateTime), NULL, 1, N'Event 2', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (37, 1100, CAST(N'2022-07-10T19:27:22.230' AS DateTime), NULL, 1, N'Event 3', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (38, 1101, CAST(N'2022-07-10T19:27:22.333' AS DateTime), NULL, 1, N'Event Single', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (39, 1102, CAST(N'2022-07-10T19:27:22.393' AS DateTime), NULL, 1, N'about', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (40, 1103, CAST(N'2022-07-10T19:27:22.460' AS DateTime), NULL, 1, N'About Page', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (41, 1104, CAST(N'2022-07-10T19:27:22.537' AS DateTime), NULL, 1, N'About Us', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (42, 1105, CAST(N'2022-07-10T19:27:22.620' AS DateTime), NULL, 1, N'Video Thumb', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (43, 1106, CAST(N'2022-07-10T19:27:22.677' AS DateTime), NULL, 1, N'teachers', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (44, 1107, CAST(N'2022-07-10T19:27:22.757' AS DateTime), NULL, 1, N'Teacher 1', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (45, 1108, CAST(N'2022-07-10T19:27:22.847' AS DateTime), NULL, 1, N'Teacher 2', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (46, 1109, CAST(N'2022-07-10T19:27:22.967' AS DateTime), NULL, 1, N'Teacher 3', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (47, 1110, CAST(N'2022-07-10T19:27:23.030' AS DateTime), NULL, 1, N'event-speakers', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (48, 1111, CAST(N'2022-07-10T19:27:23.083' AS DateTime), NULL, 1, N'Speaker 1', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (49, 1112, CAST(N'2022-07-10T19:27:23.163' AS DateTime), NULL, 1, N'Speaker 2', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (50, 1113, CAST(N'2022-07-10T19:27:23.247' AS DateTime), NULL, 1, N'Speaker 3', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (51, 1114, CAST(N'2022-07-10T19:27:23.320' AS DateTime), NULL, 1, N'Speaker 4', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (52, 1115, CAST(N'2022-07-10T19:27:23.393' AS DateTime), NULL, 1, N'scholarship', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (53, 1116, CAST(N'2022-07-10T19:27:23.437' AS DateTime), NULL, 1, N'Scholarship Item 1', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (54, 1117, CAST(N'2022-07-10T19:27:23.533' AS DateTime), NULL, 1, N'Scholarship Item 2', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (55, 1118, CAST(N'2022-07-10T19:27:23.807' AS DateTime), NULL, 1, N'Scholarship Item 3', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (56, 1119, CAST(N'2022-07-10T19:27:23.887' AS DateTime), NULL, 1, N'Scholarship', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (57, 1120, CAST(N'2022-07-10T19:27:23.940' AS DateTime), NULL, 1, N'research', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (58, 1121, CAST(N'2022-07-10T19:27:23.980' AS DateTime), NULL, 1, N'Research 1', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (59, 1122, CAST(N'2022-07-10T19:27:24.053' AS DateTime), NULL, 1, N'Research 2', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (60, 1123, CAST(N'2022-07-10T19:27:24.137' AS DateTime), NULL, 1, N'Research 3', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (61, 1124, CAST(N'2022-07-10T19:27:24.213' AS DateTime), NULL, 1, N'Research 4', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (62, 1125, CAST(N'2022-07-10T19:27:24.313' AS DateTime), NULL, 1, N'Research 5', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (63, 1126, CAST(N'2022-07-10T19:27:24.390' AS DateTime), NULL, 1, N'Research 6', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (64, 1062, CAST(N'2022-07-10T19:33:57.097' AS DateTime), -1, 0, N'Code Book', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (65, 1062, CAST(N'2022-07-10T20:55:55.353' AS DateTime), -1, 0, N'Code Book', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (66, 1062, CAST(N'2022-07-10T21:41:35.320' AS DateTime), -1, 0, N'Code Book', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (67, 1062, CAST(N'2022-07-10T21:42:07.390' AS DateTime), -1, 0, N'Code Book', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (68, 1062, CAST(N'2022-07-10T22:03:01.757' AS DateTime), -1, 0, N'Code Book', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (69, 1186, CAST(N'2022-07-10T21:58:00.473' AS DateTime), -1, 0, N'About', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (70, 1186, CAST(N'2022-07-10T22:55:30.713' AS DateTime), -1, 0, N'About', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (71, 1187, CAST(N'2022-07-10T21:58:21.753' AS DateTime), -1, 0, N'Blogs', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (72, 1187, CAST(N'2022-07-11T14:16:51.430' AS DateTime), -1, 1, N'Blogs', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (73, 1188, CAST(N'2022-07-10T21:58:33.043' AS DateTime), -1, 0, N'Courses', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (74, 1188, CAST(N'2022-07-10T21:58:33.043' AS DateTime), -1, 1, N'Courses', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (75, 1189, CAST(N'2022-07-10T21:58:58.780' AS DateTime), -1, 0, N'Scholarships', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (76, 1189, CAST(N'2022-07-10T22:53:57.933' AS DateTime), -1, 0, N'Scholarships', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (77, 1191, CAST(N'2022-07-10T22:00:10.780' AS DateTime), -1, 0, N'Teachers', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (78, 1191, CAST(N'2022-07-11T17:39:14.343' AS DateTime), -1, 0, N'Teachers', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (79, 1192, CAST(N'2022-07-10T22:00:22.363' AS DateTime), -1, 0, N'Contact Us', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (80, 1192, CAST(N'2022-07-11T14:16:51.470' AS DateTime), -1, 1, N'Contact Us', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (81, 1193, CAST(N'2022-07-10T22:00:34.910' AS DateTime), -1, 0, N'Events', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (82, 1193, CAST(N'2022-07-11T14:16:51.407' AS DateTime), -1, 1, N'Events', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (83, 1194, CAST(N'2022-07-10T22:00:46.477' AS DateTime), -1, 0, N'Notices', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (84, 1194, CAST(N'2022-07-11T14:16:51.507' AS DateTime), -1, 1, N'Notices', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (85, 1195, CAST(N'2022-07-10T22:01:01.567' AS DateTime), -1, 0, N'Researches', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (86, 1195, CAST(N'2022-07-10T22:01:01.567' AS DateTime), -1, 1, N'Researches', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (87, 1062, CAST(N'2022-07-10T22:05:53.940' AS DateTime), -1, 0, N'Code Book', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (88, 1062, CAST(N'2022-07-10T22:54:58.857' AS DateTime), -1, 0, N'Code Book', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (89, 1189, CAST(N'2022-07-11T14:16:51.487' AS DateTime), -1, 1, N'Scholarships', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (90, 1062, CAST(N'2022-07-10T22:57:10.167' AS DateTime), -1, 0, N'Code Book', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (91, 1186, CAST(N'2022-07-11T14:29:56.287' AS DateTime), -1, 0, N'About', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (92, 1062, CAST(N'2022-07-10T22:57:46.193' AS DateTime), -1, 0, N'Code Book', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (93, 1062, CAST(N'2022-07-10T23:01:40.240' AS DateTime), -1, 0, N'Code Book', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (94, 1199, CAST(N'2022-07-10T23:01:12.613' AS DateTime), -1, 0, N'Home', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (95, 1199, CAST(N'2022-07-11T17:13:47.473' AS DateTime), -1, 0, N'Home', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (96, 1062, CAST(N'2022-07-10T23:34:05.133' AS DateTime), -1, 0, N'Code Book', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (97, 1062, CAST(N'2022-07-11T00:05:48.013' AS DateTime), -1, 0, N'Code Book', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (98, 1062, CAST(N'2022-07-11T00:06:47.443' AS DateTime), -1, 0, N'Code Book', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (99, 1062, CAST(N'2022-07-11T00:07:50.047' AS DateTime), -1, 0, N'Code Book', 0)
GO
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (100, 1062, CAST(N'2022-07-11T00:09:00.870' AS DateTime), -1, 0, N'Code Book', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (101, 1062, CAST(N'2022-07-11T17:35:25.103' AS DateTime), -1, 0, N'Code Book', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (102, 1200, CAST(N'2022-07-11T00:19:25.703' AS DateTime), -1, 0, N'NewsLetter', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (103, 1200, CAST(N'2022-07-11T00:19:25.703' AS DateTime), -1, 1, N'NewsLetter', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (104, 1201, CAST(N'2022-07-11T00:19:49.953' AS DateTime), -1, 0, N'Mohammed', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (105, 1201, CAST(N'2022-07-11T00:19:49.953' AS DateTime), -1, 1, N'Mohammed', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (106, 1186, CAST(N'2022-07-11T14:39:21.830' AS DateTime), -1, 0, N'About', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (107, 1186, CAST(N'2022-07-11T14:52:58.697' AS DateTime), -1, 0, N'About', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (108, 1206, CAST(N'2022-07-11T14:44:14.900' AS DateTime), -1, 0, N'John Doe', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (109, 1206, CAST(N'2022-07-11T17:40:35.600' AS DateTime), -1, 0, N'John Doe', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (110, 1207, CAST(N'2022-07-11T14:45:43.890' AS DateTime), -1, 0, N'Clark Malik', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (111, 1208, CAST(N'2022-07-11T14:46:22.293' AS DateTime), -1, 0, N'Jacke Masito', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (112, 1207, CAST(N'2022-07-11T17:40:53.987' AS DateTime), -1, 0, N'Clark Malik', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (113, 1208, CAST(N'2022-07-11T17:41:11.257' AS DateTime), -1, 0, N'Jacke Masito', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (114, 1209, CAST(N'2022-07-11T14:50:41.277' AS DateTime), -1, 0, N'Photography', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (115, 1209, CAST(N'2022-07-11T14:50:41.277' AS DateTime), -1, 1, N'Photography', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (116, 1210, CAST(N'2022-07-11T14:51:31.257' AS DateTime), -1, 0, N'Programming', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (117, 1211, CAST(N'2022-07-11T14:51:52.337' AS DateTime), -1, 0, N'Lifestyle Archives', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (118, 1210, CAST(N'2022-07-11T14:51:31.257' AS DateTime), -1, 1, N'Programming', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (119, 1211, CAST(N'2022-07-11T14:52:14.887' AS DateTime), -1, 0, N'Lifestyle Archives', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (120, 1211, CAST(N'2022-07-11T14:52:14.887' AS DateTime), -1, 1, N'Lifestyle Archives', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (121, 1186, CAST(N'2022-07-11T15:05:07.023' AS DateTime), -1, 0, N'About', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (122, 1186, CAST(N'2022-07-11T15:06:13.397' AS DateTime), -1, 0, N'About', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (123, 1186, CAST(N'2022-07-11T15:06:13.397' AS DateTime), -1, 1, N'About', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (124, 1199, CAST(N'2022-07-11T17:14:22.153' AS DateTime), -1, 0, N'Home', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (125, 1199, CAST(N'2022-07-11T17:17:02.770' AS DateTime), -1, 0, N'Home', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (126, 1199, CAST(N'2022-07-11T17:18:10.060' AS DateTime), -1, 0, N'Home', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (127, 1199, CAST(N'2022-07-11T17:18:43.750' AS DateTime), -1, 0, N'Home', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (128, 1199, CAST(N'2022-07-11T17:23:14.287' AS DateTime), -1, 0, N'Home', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (129, 1199, CAST(N'2022-07-11T17:23:22.530' AS DateTime), -1, 0, N'Home', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (130, 1199, CAST(N'2022-07-11T17:23:22.530' AS DateTime), -1, 1, N'Home', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (131, 1062, CAST(N'2022-07-11T17:50:59.683' AS DateTime), -1, 0, N'Code Book', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (132, 1191, CAST(N'2022-07-11T17:39:14.343' AS DateTime), -1, 1, N'Teachers', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (133, 1206, CAST(N'2022-07-11T17:41:45.767' AS DateTime), -1, 0, N'John Doe', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (134, 1207, CAST(N'2022-07-11T17:41:30.833' AS DateTime), -1, 0, N'Clark Malik', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (135, 1208, CAST(N'2022-07-11T17:41:11.257' AS DateTime), -1, 1, N'Jacke Masito', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (136, 1207, CAST(N'2022-07-11T17:41:30.833' AS DateTime), -1, 1, N'Clark Malik', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (137, 1206, CAST(N'2022-07-11T17:41:45.767' AS DateTime), -1, 1, N'John Doe', 0)
INSERT [dbo].[umbracoContentVersion] ([id], [nodeId], [versionDate], [userId], [current], [text], [preventCleanup]) VALUES (138, 1062, CAST(N'2022-07-11T17:50:59.683' AS DateTime), -1, 1, N'Code Book', 0)
SET IDENTITY_INSERT [dbo].[umbracoContentVersion] OFF
GO
INSERT [dbo].[umbracoContentVersionCleanupPolicy] ([contentTypeId], [keepAllVersionsNewerThanDays], [keepLatestVersionPerDayForDays], [preventCleanup], [updated]) VALUES (1059, NULL, NULL, 0, CAST(N'2022-07-11T17:37:06.870' AS DateTime))
INSERT [dbo].[umbracoContentVersionCleanupPolicy] ([contentTypeId], [keepAllVersionsNewerThanDays], [keepLatestVersionPerDayForDays], [preventCleanup], [updated]) VALUES (1061, NULL, NULL, 0, CAST(N'2022-07-11T17:49:41.760' AS DateTime))
INSERT [dbo].[umbracoContentVersionCleanupPolicy] ([contentTypeId], [keepAllVersionsNewerThanDays], [keepLatestVersionPerDayForDays], [preventCleanup], [updated]) VALUES (1137, NULL, NULL, 0, CAST(N'2022-07-11T17:26:43.860' AS DateTime))
INSERT [dbo].[umbracoContentVersionCleanupPolicy] ([contentTypeId], [keepAllVersionsNewerThanDays], [keepLatestVersionPerDayForDays], [preventCleanup], [updated]) VALUES (1139, NULL, NULL, 0, CAST(N'2022-07-11T17:26:52.463' AS DateTime))
INSERT [dbo].[umbracoContentVersionCleanupPolicy] ([contentTypeId], [keepAllVersionsNewerThanDays], [keepLatestVersionPerDayForDays], [preventCleanup], [updated]) VALUES (1145, NULL, NULL, 0, CAST(N'2022-07-11T17:27:41.223' AS DateTime))
INSERT [dbo].[umbracoContentVersionCleanupPolicy] ([contentTypeId], [keepAllVersionsNewerThanDays], [keepLatestVersionPerDayForDays], [preventCleanup], [updated]) VALUES (1154, NULL, NULL, 0, CAST(N'2022-07-11T17:28:24.570' AS DateTime))
INSERT [dbo].[umbracoContentVersionCleanupPolicy] ([contentTypeId], [keepAllVersionsNewerThanDays], [keepLatestVersionPerDayForDays], [preventCleanup], [updated]) VALUES (1156, NULL, NULL, 0, CAST(N'2022-07-11T17:28:38.877' AS DateTime))
INSERT [dbo].[umbracoContentVersionCleanupPolicy] ([contentTypeId], [keepAllVersionsNewerThanDays], [keepLatestVersionPerDayForDays], [preventCleanup], [updated]) VALUES (1160, NULL, NULL, 0, CAST(N'2022-07-11T17:38:39.240' AS DateTime))
INSERT [dbo].[umbracoContentVersionCleanupPolicy] ([contentTypeId], [keepAllVersionsNewerThanDays], [keepLatestVersionPerDayForDays], [preventCleanup], [updated]) VALUES (1167, NULL, NULL, 0, CAST(N'2022-07-11T17:28:32.207' AS DateTime))
INSERT [dbo].[umbracoContentVersionCleanupPolicy] ([contentTypeId], [keepAllVersionsNewerThanDays], [keepLatestVersionPerDayForDays], [preventCleanup], [updated]) VALUES (1174, NULL, NULL, 0, CAST(N'2022-07-11T17:27:59.027' AS DateTime))
INSERT [dbo].[umbracoContentVersionCleanupPolicy] ([contentTypeId], [keepAllVersionsNewerThanDays], [keepLatestVersionPerDayForDays], [preventCleanup], [updated]) VALUES (1179, NULL, NULL, 0, CAST(N'2022-07-10T20:53:49.393' AS DateTime))
INSERT [dbo].[umbracoContentVersionCleanupPolicy] ([contentTypeId], [keepAllVersionsNewerThanDays], [keepLatestVersionPerDayForDays], [preventCleanup], [updated]) VALUES (1180, NULL, NULL, 0, CAST(N'2022-07-10T20:44:57.913' AS DateTime))
INSERT [dbo].[umbracoContentVersionCleanupPolicy] ([contentTypeId], [keepAllVersionsNewerThanDays], [keepLatestVersionPerDayForDays], [preventCleanup], [updated]) VALUES (1182, NULL, NULL, 0, CAST(N'2022-07-10T21:39:31.947' AS DateTime))
INSERT [dbo].[umbracoContentVersionCleanupPolicy] ([contentTypeId], [keepAllVersionsNewerThanDays], [keepLatestVersionPerDayForDays], [preventCleanup], [updated]) VALUES (1184, NULL, NULL, 0, CAST(N'2022-07-10T21:54:44.153' AS DateTime))
INSERT [dbo].[umbracoContentVersionCleanupPolicy] ([contentTypeId], [keepAllVersionsNewerThanDays], [keepLatestVersionPerDayForDays], [preventCleanup], [updated]) VALUES (1212, NULL, NULL, 0, CAST(N'2022-07-11T17:10:59.493' AS DateTime))
INSERT [dbo].[umbracoContentVersionCleanupPolicy] ([contentTypeId], [keepAllVersionsNewerThanDays], [keepLatestVersionPerDayForDays], [preventCleanup], [updated]) VALUES (1214, NULL, NULL, 0, CAST(N'2022-07-11T17:26:25.520' AS DateTime))
INSERT [dbo].[umbracoContentVersionCleanupPolicy] ([contentTypeId], [keepAllVersionsNewerThanDays], [keepLatestVersionPerDayForDays], [preventCleanup], [updated]) VALUES (1141, NULL, NULL, 0, CAST(N'2022-07-11T17:27:07.847' AS DateTime))
INSERT [dbo].[umbracoContentVersionCleanupPolicy] ([contentTypeId], [keepAllVersionsNewerThanDays], [keepLatestVersionPerDayForDays], [preventCleanup], [updated]) VALUES (1143, NULL, NULL, 0, CAST(N'2022-07-11T17:27:19.733' AS DateTime))
INSERT [dbo].[umbracoContentVersionCleanupPolicy] ([contentTypeId], [keepAllVersionsNewerThanDays], [keepLatestVersionPerDayForDays], [preventCleanup], [updated]) VALUES (1177, NULL, NULL, 0, CAST(N'2022-07-11T17:27:49.380' AS DateTime))
INSERT [dbo].[umbracoContentVersionCleanupPolicy] ([contentTypeId], [keepAllVersionsNewerThanDays], [keepLatestVersionPerDayForDays], [preventCleanup], [updated]) VALUES (1150, NULL, NULL, 0, CAST(N'2022-07-11T17:27:34.740' AS DateTime))
INSERT [dbo].[umbracoContentVersionCleanupPolicy] ([contentTypeId], [keepAllVersionsNewerThanDays], [keepLatestVersionPerDayForDays], [preventCleanup], [updated]) VALUES (1152, NULL, NULL, 0, CAST(N'2022-07-11T17:28:06.763' AS DateTime))
INSERT [dbo].[umbracoContentVersionCleanupPolicy] ([contentTypeId], [keepAllVersionsNewerThanDays], [keepLatestVersionPerDayForDays], [preventCleanup], [updated]) VALUES (1162, NULL, NULL, 0, CAST(N'2022-07-11T17:40:09.877' AS DateTime))
INSERT [dbo].[umbracoContentVersionCleanupPolicy] ([contentTypeId], [keepAllVersionsNewerThanDays], [keepLatestVersionPerDayForDays], [preventCleanup], [updated]) VALUES (1164, NULL, NULL, 0, CAST(N'2022-07-11T17:28:45.633' AS DateTime))
INSERT [dbo].[umbracoContentVersionCleanupPolicy] ([contentTypeId], [keepAllVersionsNewerThanDays], [keepLatestVersionPerDayForDays], [preventCleanup], [updated]) VALUES (1165, NULL, NULL, 0, CAST(N'2022-07-10T20:31:12.227' AS DateTime))
INSERT [dbo].[umbracoContentVersionCleanupPolicy] ([contentTypeId], [keepAllVersionsNewerThanDays], [keepLatestVersionPerDayForDays], [preventCleanup], [updated]) VALUES (1171, NULL, NULL, 0, CAST(N'2022-07-11T17:28:13.407' AS DateTime))
INSERT [dbo].[umbracoContentVersionCleanupPolicy] ([contentTypeId], [keepAllVersionsNewerThanDays], [keepLatestVersionPerDayForDays], [preventCleanup], [updated]) VALUES (1198, NULL, NULL, 0, CAST(N'2022-07-11T17:21:26.573' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[umbracoContentVersionCultureVariation] ON 

INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (2, 1, 1, N'Code Book', CAST(N'2022-07-10T19:09:05.097' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (4, 2, 1, N'Code Book', CAST(N'2022-07-10T19:33:26.137' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (6, 64, 1, N'Code Book', CAST(N'2022-07-10T19:33:57.097' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (8, 65, 1, N'Code Book', CAST(N'2022-07-10T20:55:55.353' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (10, 66, 1, N'Code Book', CAST(N'2022-07-10T21:41:35.320' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (12, 67, 1, N'Code Book', CAST(N'2022-07-10T21:42:07.390' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (13, 74, 1, N'Courses', CAST(N'2022-07-10T21:58:33.043' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (14, 73, 1, N'Courses', CAST(N'2022-07-10T21:58:33.043' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (16, 75, 1, N'Scholarships', CAST(N'2022-07-10T21:58:58.780' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (18, 77, 1, N'Teachers', CAST(N'2022-07-10T22:00:10.780' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (20, 81, 1, N'Events', CAST(N'2022-07-10T22:00:34.910' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (22, 83, 1, N'Notices', CAST(N'2022-07-10T22:00:46.477' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (23, 86, 1, N'Researches', CAST(N'2022-07-10T22:01:01.567' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (24, 85, 1, N'Researches', CAST(N'2022-07-10T22:01:01.567' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (26, 68, 1, N'Code Book', CAST(N'2022-07-10T22:03:01.757' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (28, 87, 1, N'Code Book', CAST(N'2022-07-10T22:05:53.940' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (30, 76, 1, N'Scholarships', CAST(N'2022-07-10T22:53:57.933' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (32, 88, 1, N'Code Book', CAST(N'2022-07-10T22:54:58.857' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (33, 71, 1, N'Blogs', CAST(N'2022-07-10T21:58:21.753' AS DateTime), -1)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (35, 69, 1, N'About', CAST(N'2022-07-10T21:58:00.473' AS DateTime), -1)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (36, 70, 1, N'About', CAST(N'2022-07-10T22:55:30.713' AS DateTime), -1)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (39, 90, 1, N'Code Book', CAST(N'2022-07-10T22:57:10.167' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (40, 79, 1, N'Contact Us', CAST(N'2022-07-10T22:00:22.363' AS DateTime), -1)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (43, 92, 1, N'Code Book', CAST(N'2022-07-10T22:57:46.193' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (45, 94, 1, N'Home', CAST(N'2022-07-10T23:01:12.613' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (47, 93, 1, N'Code Book', CAST(N'2022-07-10T23:01:40.240' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (49, 96, 1, N'Code Book', CAST(N'2022-07-10T23:34:05.133' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (51, 97, 1, N'Code Book', CAST(N'2022-07-11T00:05:48.013' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (53, 98, 1, N'Code Book', CAST(N'2022-07-11T00:06:47.443' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (55, 99, 1, N'Code Book', CAST(N'2022-07-11T00:07:50.047' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (57, 100, 1, N'Code Book', CAST(N'2022-07-11T00:09:00.870' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (58, 103, 1, N'NewsLetter', CAST(N'2022-07-11T00:19:25.703' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (59, 102, 1, N'NewsLetter', CAST(N'2022-07-11T00:19:25.703' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (60, 105, 1, N'Mohammed', CAST(N'2022-07-11T00:19:49.953' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (61, 104, 1, N'Mohammed', CAST(N'2022-07-11T00:19:49.953' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (64, 82, 1, N'Events', CAST(N'2022-07-10T22:00:34.910' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (65, 72, 1, N'Blogs', CAST(N'2022-07-10T21:58:21.753' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (67, 80, 1, N'Contact Us', CAST(N'2022-07-10T22:00:22.363' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (68, 89, 1, N'Scholarships', CAST(N'2022-07-10T22:53:57.933' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (69, 84, 1, N'Notices', CAST(N'2022-07-10T22:00:46.477' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (71, 91, 1, N'About', CAST(N'2022-07-11T14:29:56.287' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (73, 106, 1, N'About', CAST(N'2022-07-11T14:39:21.830' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (75, 108, 1, N'John Doe', CAST(N'2022-07-11T14:44:14.900' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (79, 110, 1, N'Clark Malik', CAST(N'2022-07-11T14:45:43.890' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (81, 111, 1, N'Jacke Masito', CAST(N'2022-07-11T14:46:22.293' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (82, 115, 1, N'Photography', CAST(N'2022-07-11T14:50:41.277' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (83, 114, 1, N'Photography', CAST(N'2022-07-11T14:50:41.277' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (86, 118, 1, N'Programming', CAST(N'2022-07-11T14:51:31.257' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (87, 116, 1, N'Programming', CAST(N'2022-07-11T14:51:31.257' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (89, 117, 1, N'Lifestyle Archives', CAST(N'2022-07-11T14:51:52.337' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (90, 120, 1, N'Lifestyle Archives', CAST(N'2022-07-11T14:52:14.887' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (91, 119, 1, N'Lifestyle Archives', CAST(N'2022-07-11T14:52:14.887' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (93, 107, 1, N'About', CAST(N'2022-07-11T14:52:58.697' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (95, 121, 1, N'About', CAST(N'2022-07-11T15:05:07.023' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (96, 123, 1, N'About', CAST(N'2022-07-11T15:06:13.397' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (97, 122, 1, N'About', CAST(N'2022-07-11T15:06:13.397' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (99, 95, 1, N'Home', CAST(N'2022-07-11T17:13:47.473' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (101, 124, 1, N'Home', CAST(N'2022-07-11T17:14:22.153' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (103, 125, 1, N'Home', CAST(N'2022-07-11T17:17:02.770' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (105, 126, 1, N'Home', CAST(N'2022-07-11T17:18:10.060' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (107, 127, 1, N'Home', CAST(N'2022-07-11T17:18:43.750' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (109, 128, 1, N'Home', CAST(N'2022-07-11T17:23:14.287' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (110, 130, 1, N'Home', CAST(N'2022-07-11T17:23:22.530' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (111, 129, 1, N'Home', CAST(N'2022-07-11T17:23:22.530' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (113, 101, 1, N'Code Book', CAST(N'2022-07-11T17:35:25.103' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (114, 132, 1, N'Teachers', CAST(N'2022-07-11T17:39:14.343' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (115, 78, 1, N'Teachers', CAST(N'2022-07-11T17:39:14.343' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (117, 109, 1, N'John Doe', CAST(N'2022-07-11T17:40:35.600' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (119, 112, 1, N'Clark Malik', CAST(N'2022-07-11T17:40:53.987' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (120, 135, 1, N'Jacke Masito', CAST(N'2022-07-11T17:41:11.257' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (121, 113, 1, N'Jacke Masito', CAST(N'2022-07-11T17:41:11.257' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (122, 136, 1, N'Clark Malik', CAST(N'2022-07-11T17:41:30.833' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (123, 134, 1, N'Clark Malik', CAST(N'2022-07-11T17:41:30.833' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (124, 137, 1, N'John Doe', CAST(N'2022-07-11T17:41:45.767' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (125, 133, 1, N'John Doe', CAST(N'2022-07-11T17:41:45.767' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (127, 138, 1, N'Code Book', CAST(N'2022-07-11T17:50:59.683' AS DateTime), NULL)
INSERT [dbo].[umbracoContentVersionCultureVariation] ([id], [versionId], [languageId], [name], [date], [availableUserId]) VALUES (128, 131, 1, N'Code Book', CAST(N'2022-07-11T17:50:59.683' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[umbracoContentVersionCultureVariation] OFF
GO
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-103, N'Umbraco.UploadField', N'Nvarchar', N'{"fileExtensions":[{"id":0, "value":"svg"}]}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-102, N'Umbraco.UploadField', N'Nvarchar', N'{"fileExtensions":[{"id":0, "value":"pdf"}, {"id":1, "value":"docx"}, {"id":2, "value":"doc"}]}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-101, N'Umbraco.UploadField', N'Nvarchar', N'{"fileExtensions":[{"id":0, "value":"mp3"}, {"id":1, "value":"weba"}, {"id":2, "value":"oga"}, {"id":3, "value":"opus"}]}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-100, N'Umbraco.UploadField', N'Nvarchar', N'{"fileExtensions":[{"id":0, "value":"mp4"}, {"id":1, "value":"webm"}, {"id":2, "value":"ogv"}]}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-99, N'Umbraco.Label', N'Decimal', N'{"umbracoDataValueType":"DECIMAL"}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-98, N'Umbraco.Label', N'Date', N'{"umbracoDataValueType":"TIME"}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-97, N'Umbraco.ListView', N'Nvarchar', N'{"pageSize":10, "orderBy":"username", "orderDirection":"asc", "includeProperties":[{"alias":"username","isSystem":1},{"alias":"email","isSystem":1},{"alias":"updateDate","header":"Last edited","isSystem":1}]}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-96, N'Umbraco.ListView', N'Nvarchar', N'{"pageSize":100, "orderBy":"updateDate", "orderDirection":"desc", "layouts":[{"name": "Grid","path": "views/propertyeditors/listview/layouts/grid/grid.html", "icon": "icon-thumbnails-small", "isSystem": 1, "selected": true},{"name": "List","path": "views/propertyeditors/listview/layouts/list/list.html","icon": "icon-list", "isSystem": 1,"selected": true}], "includeProperties":[{"alias":"updateDate","header":"Last edited","isSystem":1},{"alias":"owner","header":"Updated by","isSystem":1}]}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-95, N'Umbraco.ListView', N'Nvarchar', N'{"pageSize":100, "orderBy":"updateDate", "orderDirection":"desc", "layouts":[{"name": "Grid","path": "views/propertyeditors/listview/layouts/grid/grid.html", "icon": "icon-thumbnails-small", "isSystem": 1, "selected": true},{"name": "List","path": "views/propertyeditors/listview/layouts/list/list.html","icon": "icon-list", "isSystem": 1,"selected": true}], "includeProperties":[{"alias":"updateDate","header":"Last edited","isSystem":1},{"alias":"owner","header":"Updated by","isSystem":1}]}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-94, N'Umbraco.Label', N'Date', N'{"umbracoDataValueType":"DATETIME"}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-93, N'Umbraco.Label', N'Nvarchar', N'{"umbracoDataValueType":"BIGINT"}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-92, N'Umbraco.Label', N'Nvarchar', N'{"umbracoDataValueType":"STRING"}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-91, N'Umbraco.Label', N'Integer', N'{"umbracoDataValueType":"INT"}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-90, N'Umbraco.UploadField', N'Nvarchar', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-89, N'Umbraco.TextArea', N'Ntext', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-88, N'Umbraco.TextBox', N'Nvarchar', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-87, N'Umbraco.TinyMCE', N'Ntext', N'{"value":",code,undo,redo,cut,copy,mcepasteword,stylepicker,bold,italic,bullist,numlist,outdent,indent,mcelink,unlink,mceinsertanchor,mceimage,umbracomacro,mceinserttable,umbracoembed,mcecharmap,|1|1,2,3,|0|500,400|1049,|true|"}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-51, N'Umbraco.Integer', N'Integer', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-49, N'Umbraco.TrueFalse', N'Integer', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-43, N'Umbraco.CheckBoxList', N'Nvarchar', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-42, N'Umbraco.DropDown.Flexible', N'Nvarchar', N'{"multiple":true}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-41, N'Umbraco.DateTime', N'Date', N'{"format":"YYYY-MM-DD"}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-40, N'Umbraco.RadioButtonList', N'Nvarchar', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-39, N'Umbraco.DropDown.Flexible', N'Nvarchar', N'{"multiple":false}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-37, N'Umbraco.ColorPicker', N'Nvarchar', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (-36, N'Umbraco.DateTime', N'Date', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1041, N'Umbraco.Tags', N'Ntext', N'{"group":"default", "storageType":"Json"}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1043, N'Umbraco.ImageCropper', N'Ntext', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1046, N'Umbraco.ContentPicker', N'Nvarchar', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1047, N'Umbraco.MemberPicker', N'Nvarchar', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1048, N'Umbraco.MediaPicker', N'Ntext', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1049, N'Umbraco.MediaPicker', N'Ntext', N'{"multiPicker":1}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1050, N'Umbraco.MultiUrlPicker', N'Ntext', NULL)
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1051, N'Umbraco.MediaPicker3', N'Ntext', N'{"multiple": false, "validationLimit":{"min":0,"max":1}}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1052, N'Umbraco.MediaPicker3', N'Ntext', N'{"multiple": true}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1053, N'Umbraco.MediaPicker3', N'Ntext', N'{"filter":"Image", "multiple": false, "validationLimit":{"min":0,"max":1}}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1054, N'Umbraco.MediaPicker3', N'Ntext', N'{"filter":"Image", "multiple": true}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1063, N'Umbraco.MediaPicker3', N'Ntext', N'{"filter":"Image,umbracoMediaVectorGraphics,umbracoMediaVideo,Folder,File,umbracoMediaAudio,umbracoMediaArticle","multiple":false,"validationLimit":{},"ignoreUserStartNodes":false,"enableLocalFocalPoint":false,"crops":[]}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1064, N'Umbraco.MultiUrlPicker', N'Ntext', N'{"minNumber":1,"maxNumber":1,"overlaySize":"small","ignoreUserStartNodes":false,"hideAnchor":false}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1065, N'Umbraco.EmailAddress', N'Nvarchar', N'{"IsRequired":false}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1157, N'Umbraco.ListView', N'Nvarchar', N'{"pageSize":9,"orderBy":"sortOrder","orderDirection":"asc","includeProperties":[{"alias":"sortOrder","header":"Sort order","isSystem":1},{"alias":"updateDate","header":"Last edited","isSystem":1},{"alias":"owner","header":"Created by","isSystem":1}],"layouts":[{"name":"List","path":"views/propertyeditors/listview/layouts/list/list.html","icon":"icon-list","isSystem":1,"selected":true},{"name":"Grid","path":"views/propertyeditors/listview/layouts/grid/grid.html","icon":"icon-thumbnails-small","isSystem":1,"selected":true}],"bulkActionPermissions":{"allowBulkPublish":true,"allowBulkUnpublish":true,"allowBulkCopy":true,"allowBulkMove":true,"allowBulkDelete":true},"icon":"icon-article color-pink","tabName":"Scholership","showContentFirst":false,"useInfiniteEditor":false}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1158, N'Umbraco.ListView', N'Nvarchar', N'{"pageSize":9,"orderBy":"sortOrder","orderDirection":"asc","includeProperties":[{"alias":"sortOrder","header":"Sort order","isSystem":1},{"alias":"updateDate","header":"Last edited","isSystem":1},{"alias":"owner","header":"Created by","isSystem":1}],"layouts":[{"name":"List","path":"views/propertyeditors/listview/layouts/list/list.html","icon":"icon-list","isSystem":1,"selected":true},{"name":"Grid","path":"views/propertyeditors/listview/layouts/grid/grid.html","icon":"icon-thumbnails-small","isSystem":1,"selected":true}],"bulkActionPermissions":{"allowBulkPublish":true,"allowBulkUnpublish":true,"allowBulkCopy":true,"allowBulkMove":true,"allowBulkDelete":true},"icon":"icon-users color-pink","tabName":"Teachers","showContentFirst":false,"useInfiniteEditor":false}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1168, N'Umbraco.ListView', N'Nvarchar', N'{"pageSize":9,"orderBy":"sortOrder","orderDirection":"asc","includeProperties":[{"alias":"sortOrder","header":"Sort order","isSystem":1},{"alias":"updateDate","header":"Last edited","isSystem":1},{"alias":"owner","header":"Created by","isSystem":1}],"layouts":[{"name":"List","path":"views/propertyeditors/listview/layouts/list/list.html","icon":"icon-list","isSystem":1,"selected":true},{"name":"Grid","path":"views/propertyeditors/listview/layouts/grid/grid.html","icon":"icon-thumbnails-small","isSystem":1,"selected":true}],"bulkActionPermissions":{"allowBulkPublish":true,"allowBulkUnpublish":true,"allowBulkCopy":true,"allowBulkMove":true,"allowBulkDelete":true},"icon":"icon-list color-pink","tabName":"Researches","showContentFirst":false,"useInfiniteEditor":false}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1169, N'Umbraco.ListView', N'Nvarchar', N'{"pageSize":9,"orderBy":"sortOrder","orderDirection":"asc","includeProperties":[{"alias":"sortOrder","header":"Sort order","isSystem":1},{"alias":"updateDate","header":"Last edited","isSystem":1},{"alias":"owner","header":"Created by","isSystem":1}],"layouts":[{"name":"List","path":"views/propertyeditors/listview/layouts/list/list.html","icon":"icon-list","isSystem":1,"selected":true},{"name":"Grid","path":"views/propertyeditors/listview/layouts/grid/grid.html","icon":"icon-thumbnails-small","isSystem":1,"selected":true}],"bulkActionPermissions":{"allowBulkPublish":true,"allowBulkUnpublish":true,"allowBulkCopy":true,"allowBulkMove":true,"allowBulkDelete":true},"icon":"icon-ordered-list color-pink","tabName":"Notices","showContentFirst":false,"useInfiniteEditor":false}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1172, N'Umbraco.ListView', N'Nvarchar', N'{"pageSize":9,"orderBy":"sortOrder","orderDirection":"asc","includeProperties":[{"alias":"sortOrder","header":"Sort order","isSystem":1},{"alias":"updateDate","header":"Last edited","isSystem":1},{"alias":"owner","header":"Created by","isSystem":1}],"layouts":[{"name":"List","path":"views/propertyeditors/listview/layouts/list/list.html","icon":"icon-list","isSystem":1,"selected":true},{"name":"Grid","path":"views/propertyeditors/listview/layouts/grid/grid.html","icon":"icon-thumbnails-small","isSystem":1,"selected":true}],"bulkActionPermissions":{"allowBulkPublish":true,"allowBulkUnpublish":true,"allowBulkCopy":true,"allowBulkMove":true,"allowBulkDelete":true},"icon":"icon-art-easel color-pink","tabName":"Courses","showContentFirst":false,"useInfiniteEditor":false}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1175, N'Umbraco.ListView', N'Nvarchar', N'{"pageSize":9,"orderBy":"sortOrder","orderDirection":"asc","includeProperties":[{"alias":"sortOrder","header":"Sort order","isSystem":1},{"alias":"updateDate","header":"Last edited","isSystem":1},{"alias":"owner","header":"Created by","isSystem":1}],"layouts":[{"name":"List","path":"views/propertyeditors/listview/layouts/list/list.html","icon":"icon-list","isSystem":1,"selected":true},{"name":"Grid","path":"views/propertyeditors/listview/layouts/grid/grid.html","icon":"icon-thumbnails-small","isSystem":1,"selected":true}],"bulkActionPermissions":{"allowBulkPublish":true,"allowBulkUnpublish":true,"allowBulkCopy":true,"allowBulkMove":true,"allowBulkDelete":true},"icon":"icon-list color-pink","tabName":"Events","showContentFirst":false,"useInfiniteEditor":false}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1178, N'Umbraco.ListView', N'Nvarchar', N'{"pageSize":9,"orderBy":"sortOrder","orderDirection":"asc","includeProperties":[{"alias":"sortOrder","header":"Sort order","isSystem":1},{"alias":"updateDate","header":"Last edited","isSystem":1},{"alias":"owner","header":"Created by","isSystem":1}],"layouts":[{"name":"List","path":"views/propertyeditors/listview/layouts/list/list.html","icon":"icon-list","isSystem":1,"selected":true},{"name":"Grid","path":"views/propertyeditors/listview/layouts/grid/grid.html","icon":"icon-thumbnails-small","isSystem":1,"selected":true}],"bulkActionPermissions":{"allowBulkPublish":true,"allowBulkUnpublish":true,"allowBulkCopy":true,"allowBulkMove":true,"allowBulkDelete":true},"icon":"icon-users-alt color-pink","tabName":"Subscribers","showContentFirst":false,"useInfiniteEditor":false}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1181, N'Umbraco.ListView', N'Nvarchar', N'{"pageSize":9,"orderBy":"sortOrder","orderDirection":"asc","includeProperties":[{"alias":"sortOrder","header":"Sort order","isSystem":1},{"alias":"updateDate","header":"Last edited","isSystem":1},{"alias":"owner","header":"Created by","isSystem":1}],"layouts":[{"name":"List","path":"views/propertyeditors/listview/layouts/list/list.html","icon":"icon-list","isSystem":1,"selected":true},{"name":"Grid","path":"views/propertyeditors/listview/layouts/grid/grid.html","icon":"icon-thumbnails-small","isSystem":1,"selected":true}],"bulkActionPermissions":{"allowBulkPublish":true,"allowBulkUnpublish":true,"allowBulkCopy":true,"allowBulkMove":true,"allowBulkDelete":true},"icon":"icon-users color-pink","showContentFirst":false,"useInfiniteEditor":false}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1183, N'Umbraco.NestedContent', N'Ntext', N'{"contentTypes":[{"ncAlias":"menu","ncTabAlias":"Menu","nameTemplate":"{{menuTitle}}"}],"confirmDeletes":true,"showIcons":true,"hideLabel":false}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1185, N'Umbraco.NestedContent', N'Ntext', N'{"contentTypes":[{"ncAlias":"detailedMenu","ncTabAlias":"Menu","nameTemplate":"{{itemName}}"}],"confirmDeletes":true,"showIcons":true,"hideLabel":false}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1190, N'Umbraco.ListView', N'Nvarchar', N'{"pageSize":9,"orderBy":"sortOrder","orderDirection":"asc","includeProperties":[{"alias":"sortOrder","header":"Sort order","isSystem":1},{"alias":"updateDate","header":"Last edited","isSystem":1},{"alias":"owner","header":"Created by","isSystem":1}],"layouts":[{"name":"List","path":"views/propertyeditors/listview/layouts/list/list.html","icon":"icon-list","isSystem":1,"selected":true},{"name":"Grid","path":"views/propertyeditors/listview/layouts/grid/grid.html","icon":"icon-thumbnails-small","isSystem":1,"selected":true}],"bulkActionPermissions":{"allowBulkPublish":true,"allowBulkUnpublish":true,"allowBulkCopy":true,"allowBulkMove":true,"allowBulkDelete":true},"icon":"icon-browser-window color-indigo","showContentFirst":false,"useInfiniteEditor":false}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1202, N'Umbraco.MultiNodeTreePicker', N'Ntext', N'{"startNode":{"type":"content","id":"umb://document/9f465a8361c7422cb89ba8aeb5e2f977"},"filter":"teacher","minNumber":0,"maxNumber":0,"showOpenButton":false,"ignoreUserStartNodes":false}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1203, N'Umbraco.TinyMCE', N'Ntext', N'{"editor":{"toolbar":["ace","removeformat","undo","redo","cut","copy","paste","styleselect","bold","italic","underline","strikethrough","alignleft","aligncenter","alignright","alignjustify","bullist","numlist","outdent","indent","link","unlink","anchor","umbmediapicker","umbmacro","table","umbembeddialog","hr","subscript","superscript","charmap","rtl","ltr","fullscreen"],"stylesheets":[],"maxImageSize":500,"mode":"classic"},"overlaySize":"small","hideLabel":false,"ignoreUserStartNodes":false}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1204, N'Umbraco.MultipleTextstring', N'Ntext', N'{"Minimum":0,"Maximum":0}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1205, N'Umbraco.MultiNodeTreePicker', N'Ntext', N'{"startNode":{"type":"content","id":"umb://document/a69040861ac147388a27801d637147aa"},"filter":"course","minNumber":0,"maxNumber":0,"showOpenButton":false,"ignoreUserStartNodes":false}')
INSERT [dbo].[umbracoDataType] ([nodeId], [propertyEditorAlias], [dbType], [config]) VALUES (1213, N'Umbraco.NestedContent', N'Ntext', N'{"contentTypes":[{"ncAlias":"slid","ncTabAlias":"Slide","nameTemplate":"{{title}}"}],"confirmDeletes":true,"showIcons":true,"hideLabel":false}')
GO
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1062, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1186, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1187, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1188, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1189, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1191, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1192, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1193, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1194, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1195, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1199, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1200, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1201, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1206, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1207, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1208, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1209, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1210, 1, 0)
INSERT [dbo].[umbracoDocument] ([nodeId], [published], [edited]) VALUES (1211, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[umbracoDocumentCultureVariation] ON 

INSERT [dbo].[umbracoDocumentCultureVariation] ([id], [nodeId], [languageId], [edited], [available], [published], [name]) VALUES (7, 1188, 1, 0, 1, 1, N'Courses')
INSERT [dbo].[umbracoDocumentCultureVariation] ([id], [nodeId], [languageId], [edited], [available], [published], [name]) VALUES (12, 1195, 1, 0, 1, 1, N'Researches')
INSERT [dbo].[umbracoDocumentCultureVariation] ([id], [nodeId], [languageId], [edited], [available], [published], [name]) VALUES (29, 1200, 1, 0, 1, 1, N'NewsLetter')
INSERT [dbo].[umbracoDocumentCultureVariation] ([id], [nodeId], [languageId], [edited], [available], [published], [name]) VALUES (30, 1201, 1, 0, 1, 1, N'Mohammed')
INSERT [dbo].[umbracoDocumentCultureVariation] ([id], [nodeId], [languageId], [edited], [available], [published], [name]) VALUES (33, 1193, 1, 0, 1, 1, N'Events')
INSERT [dbo].[umbracoDocumentCultureVariation] ([id], [nodeId], [languageId], [edited], [available], [published], [name]) VALUES (34, 1187, 1, 0, 1, 1, N'Blogs')
INSERT [dbo].[umbracoDocumentCultureVariation] ([id], [nodeId], [languageId], [edited], [available], [published], [name]) VALUES (36, 1192, 1, 0, 1, 1, N'Contact Us')
INSERT [dbo].[umbracoDocumentCultureVariation] ([id], [nodeId], [languageId], [edited], [available], [published], [name]) VALUES (37, 1189, 1, 0, 1, 1, N'Scholarships')
INSERT [dbo].[umbracoDocumentCultureVariation] ([id], [nodeId], [languageId], [edited], [available], [published], [name]) VALUES (38, 1194, 1, 0, 1, 1, N'Notices')
INSERT [dbo].[umbracoDocumentCultureVariation] ([id], [nodeId], [languageId], [edited], [available], [published], [name]) VALUES (46, 1209, 1, 0, 1, 1, N'Photography')
INSERT [dbo].[umbracoDocumentCultureVariation] ([id], [nodeId], [languageId], [edited], [available], [published], [name]) VALUES (49, 1210, 1, 0, 1, 1, N'Programming')
INSERT [dbo].[umbracoDocumentCultureVariation] ([id], [nodeId], [languageId], [edited], [available], [published], [name]) VALUES (51, 1211, 1, 0, 1, 1, N'Lifestyle Archives')
INSERT [dbo].[umbracoDocumentCultureVariation] ([id], [nodeId], [languageId], [edited], [available], [published], [name]) VALUES (54, 1186, 1, 0, 1, 1, N'About')
INSERT [dbo].[umbracoDocumentCultureVariation] ([id], [nodeId], [languageId], [edited], [available], [published], [name]) VALUES (61, 1199, 1, 0, 1, 1, N'Home')
INSERT [dbo].[umbracoDocumentCultureVariation] ([id], [nodeId], [languageId], [edited], [available], [published], [name]) VALUES (63, 1191, 1, 0, 1, 1, N'Teachers')
INSERT [dbo].[umbracoDocumentCultureVariation] ([id], [nodeId], [languageId], [edited], [available], [published], [name]) VALUES (66, 1208, 1, 0, 1, 1, N'Jacke Masito')
INSERT [dbo].[umbracoDocumentCultureVariation] ([id], [nodeId], [languageId], [edited], [available], [published], [name]) VALUES (67, 1207, 1, 0, 1, 1, N'Clark Malik')
INSERT [dbo].[umbracoDocumentCultureVariation] ([id], [nodeId], [languageId], [edited], [available], [published], [name]) VALUES (68, 1206, 1, 0, 1, 1, N'John Doe')
INSERT [dbo].[umbracoDocumentCultureVariation] ([id], [nodeId], [languageId], [edited], [available], [published], [name]) VALUES (70, 1062, 1, 0, 1, 1, N'Code Book')
SET IDENTITY_INSERT [dbo].[umbracoDocumentCultureVariation] OFF
GO
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (1, 1060, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (2, 1060, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (64, 1060, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (65, 1060, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (66, 1060, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (67, 1060, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (68, 1060, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (69, 1136, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (70, 1136, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (71, 1140, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (72, 1140, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (73, 1144, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (74, 1144, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (75, 1155, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (76, 1155, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (77, 1159, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (78, 1159, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (79, 1142, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (80, 1142, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (81, 1173, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (82, 1173, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (83, 1170, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (84, 1170, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (85, 1166, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (86, 1166, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (87, 1060, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (88, 1060, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (89, 1155, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (90, 1060, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (91, 1136, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (92, 1060, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (93, 1060, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (94, 1197, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (95, 1197, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (96, 1060, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (97, 1060, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (98, 1060, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (99, 1060, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (100, 1060, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (101, 1060, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (102, NULL, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (103, NULL, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (104, NULL, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (105, NULL, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (106, 1136, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (107, 1136, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (108, 1161, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (109, 1161, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (110, 1161, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (111, 1161, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (112, 1161, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (113, 1161, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (114, 1149, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (115, 1149, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (116, 1149, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (117, 1149, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (118, 1149, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (119, 1149, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (120, 1149, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (121, 1136, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (122, 1136, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (123, 1136, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (124, 1197, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (125, 1197, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (126, 1197, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (127, 1197, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (128, 1197, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (129, 1197, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (130, 1197, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (131, 1060, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (132, 1159, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (133, 1161, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (134, 1161, 1)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (135, 1161, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (136, 1161, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (137, 1161, 0)
INSERT [dbo].[umbracoDocumentVersion] ([id], [templateId], [published]) VALUES (138, 1060, 0)
GO
SET IDENTITY_INSERT [dbo].[umbracoDomain] ON 

INSERT [dbo].[umbracoDomain] ([id], [domainDefaultLanguage], [domainRootStructureID], [domainName]) VALUES (4, 1, 1062, N'/en')
INSERT [dbo].[umbracoDomain] ([id], [domainDefaultLanguage], [domainRootStructureID], [domainName]) VALUES (5, 3, 1062, N'/ar')
INSERT [dbo].[umbracoDomain] ([id], [domainDefaultLanguage], [domainRootStructureID], [domainName]) VALUES (6, 2, 1062, N'/dk')
SET IDENTITY_INSERT [dbo].[umbracoDomain] OFF
GO
INSERT [dbo].[umbracoKeyValue] ([key], [value], [updated]) VALUES (N'Umbraco.Core.Upgrader.State+Umbraco.Core', N'{03482BB0-CF13-475C-845E-ECB8319DBE3C}', CAST(N'2022-07-10T02:36:42.137' AS DateTime))
INSERT [dbo].[umbracoKeyValue] ([key], [value], [updated]) VALUES (N'Umbraco.Web.PublishedCache.NuCache.Serializer', N'MsgPack', CAST(N'2022-07-10T02:36:53.627' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[umbracoLanguage] ON 

INSERT [dbo].[umbracoLanguage] ([id], [languageISOCode], [languageCultureName], [isDefaultVariantLang], [mandatory], [fallbackLanguageId]) VALUES (1, N'en-US', N'English (United States)', 1, 0, NULL)
INSERT [dbo].[umbracoLanguage] ([id], [languageISOCode], [languageCultureName], [isDefaultVariantLang], [mandatory], [fallbackLanguageId]) VALUES (2, N'da', N'Danish', 0, 0, NULL)
INSERT [dbo].[umbracoLanguage] ([id], [languageISOCode], [languageCultureName], [isDefaultVariantLang], [mandatory], [fallbackLanguageId]) VALUES (3, N'ar-EG', N'Arabic (Egypt)', 0, 0, NULL)
SET IDENTITY_INSERT [dbo].[umbracoLanguage] OFF
GO
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-1000, 1, N'MainDom')
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-340, 1, N'Languages')
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-339, -1, N'KeyValues')
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-338, 1, N'Domains')
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-337, 1, N'MemberTypes')
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-336, 1, N'MediaTypes')
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-335, 1, N'MemberTree')
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-334, -1, N'MediaTree')
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-333, 1, N'ContentTree')
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-332, 1, N'ContentTypes')
INSERT [dbo].[umbracoLock] ([id], [value], [name]) VALUES (-331, 1, N'Servers')
GO
SET IDENTITY_INSERT [dbo].[umbracoLog] ON 

INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (1, -1, 1059, N'DocumentType', CAST(N'2022-07-10T19:06:30.463' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (2, -1, 1059, N'DocumentType', CAST(N'2022-07-10T19:06:41.613' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (3, -1, 1059, N'DocumentType', CAST(N'2022-07-10T19:07:24.633' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (4, -1, 1060, N'Template', CAST(N'2022-07-10T19:08:20.510' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (5, -1, 1061, N'DocumentType', CAST(N'2022-07-10T19:08:20.633' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (6, -1, 1061, N'DocumentType', CAST(N'2022-07-10T19:08:27.437' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (7, -1, 1061, N'DocumentType', CAST(N'2022-07-10T19:08:39.170' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (8, -1, 1062, N'Document', CAST(N'2022-07-10T19:09:05.713' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (9, -1, 1063, N'DataType', CAST(N'2022-07-10T19:18:26.297' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (10, -1, 1061, N'DocumentType', CAST(N'2022-07-10T19:19:44.583' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (11, -1, 1064, N'DataType', CAST(N'2022-07-10T19:21:20.490' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (12, -1, 1065, N'DataType', CAST(N'2022-07-10T19:21:46.647' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (13, -1, 1061, N'DocumentType', CAST(N'2022-07-10T19:21:48.543' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (14, -1, 1061, N'DocumentType', CAST(N'2022-07-10T19:23:37.393' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (15, -1, 1061, N'DocumentType', CAST(N'2022-07-10T19:24:21.517' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (16, -1, 1066, N'Media', CAST(N'2022-07-10T19:27:19.397' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (17, -1, 1067, N'Media', CAST(N'2022-07-10T19:27:19.673' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (18, -1, 1068, N'Media', CAST(N'2022-07-10T19:27:19.777' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (19, -1, 1069, N'Media', CAST(N'2022-07-10T19:27:19.877' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (20, -1, 1070, N'Media', CAST(N'2022-07-10T19:27:19.967' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (21, -1, 1071, N'Media', CAST(N'2022-07-10T19:27:20.047' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (22, -1, 1072, N'Media', CAST(N'2022-07-10T19:27:20.123' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (23, -1, 1073, N'Media', CAST(N'2022-07-10T19:27:20.193' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (24, -1, 1074, N'Media', CAST(N'2022-07-10T19:27:20.287' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (25, -1, 1075, N'Media', CAST(N'2022-07-10T19:27:20.363' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (26, -1, 1076, N'Media', CAST(N'2022-07-10T19:27:20.447' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (27, -1, 1077, N'Media', CAST(N'2022-07-10T19:27:20.517' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (28, -1, 1078, N'Media', CAST(N'2022-07-10T19:27:20.597' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (29, -1, 1079, N'Media', CAST(N'2022-07-10T19:27:20.653' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (30, -1, 1080, N'Media', CAST(N'2022-07-10T19:27:20.750' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (31, -1, 1081, N'Media', CAST(N'2022-07-10T19:27:20.803' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (32, -1, 1082, N'Media', CAST(N'2022-07-10T19:27:20.863' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (33, -1, 1083, N'Media', CAST(N'2022-07-10T19:27:20.963' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (34, -1, 1084, N'Media', CAST(N'2022-07-10T19:27:21.020' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (35, -1, 1085, N'Media', CAST(N'2022-07-10T19:27:21.070' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (36, -1, 1086, N'Media', CAST(N'2022-07-10T19:27:21.140' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (37, -1, 1087, N'Media', CAST(N'2022-07-10T19:27:21.220' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (38, -1, 1088, N'Media', CAST(N'2022-07-10T19:27:21.290' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (39, -1, 1089, N'Media', CAST(N'2022-07-10T19:27:21.363' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (40, -1, 1090, N'Media', CAST(N'2022-07-10T19:27:21.410' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (41, -1, 1091, N'Media', CAST(N'2022-07-10T19:27:21.483' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (42, -1, 1092, N'Media', CAST(N'2022-07-10T19:27:21.563' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (43, -1, 1093, N'Media', CAST(N'2022-07-10T19:27:21.647' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (44, -1, 1094, N'Media', CAST(N'2022-07-10T19:27:21.720' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (45, -1, 1095, N'Media', CAST(N'2022-07-10T19:27:21.803' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (46, -1, 1096, N'Media', CAST(N'2022-07-10T19:27:21.893' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (47, -1, 1097, N'Media', CAST(N'2022-07-10T19:27:21.963' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (48, -1, 1098, N'Media', CAST(N'2022-07-10T19:27:22.027' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (49, -1, 1099, N'Media', CAST(N'2022-07-10T19:27:22.137' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (50, -1, 1100, N'Media', CAST(N'2022-07-10T19:27:22.240' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (51, -1, 1101, N'Media', CAST(N'2022-07-10T19:27:22.343' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (52, -1, 1102, N'Media', CAST(N'2022-07-10T19:27:22.403' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (53, -1, 1103, N'Media', CAST(N'2022-07-10T19:27:22.467' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (54, -1, 1104, N'Media', CAST(N'2022-07-10T19:27:22.547' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (55, -1, 1105, N'Media', CAST(N'2022-07-10T19:27:22.627' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (56, -1, 1106, N'Media', CAST(N'2022-07-10T19:27:22.690' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (57, -1, 1107, N'Media', CAST(N'2022-07-10T19:27:22.763' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (58, -1, 1108, N'Media', CAST(N'2022-07-10T19:27:22.860' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (59, -1, 1109, N'Media', CAST(N'2022-07-10T19:27:22.977' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (60, -1, 1110, N'Media', CAST(N'2022-07-10T19:27:23.043' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (61, -1, 1111, N'Media', CAST(N'2022-07-10T19:27:23.093' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (62, -1, 1112, N'Media', CAST(N'2022-07-10T19:27:23.173' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (63, -1, 1113, N'Media', CAST(N'2022-07-10T19:27:23.257' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (64, -1, 1114, N'Media', CAST(N'2022-07-10T19:27:23.330' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (65, -1, 1115, N'Media', CAST(N'2022-07-10T19:27:23.400' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (66, -1, 1116, N'Media', CAST(N'2022-07-10T19:27:23.443' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (67, -1, 1117, N'Media', CAST(N'2022-07-10T19:27:23.597' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (68, -1, 1118, N'Media', CAST(N'2022-07-10T19:27:23.813' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (69, -1, 1119, N'Media', CAST(N'2022-07-10T19:27:23.893' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (70, -1, 1120, N'Media', CAST(N'2022-07-10T19:27:23.947' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (71, -1, 1121, N'Media', CAST(N'2022-07-10T19:27:23.987' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (72, -1, 1122, N'Media', CAST(N'2022-07-10T19:27:24.063' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (73, -1, 1123, N'Media', CAST(N'2022-07-10T19:27:24.143' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (74, -1, 1124, N'Media', CAST(N'2022-07-10T19:27:24.227' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (75, -1, 1125, N'Media', CAST(N'2022-07-10T19:27:24.327' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (76, -1, 1126, N'Media', CAST(N'2022-07-10T19:27:24.397' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (77, -1, 1061, N'DocumentType', CAST(N'2022-07-10T19:30:55.403' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (78, -1, 1062, N'Document', CAST(N'2022-07-10T19:33:26.383' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (79, -1, 1062, N'Document', CAST(N'2022-07-10T19:33:57.203' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (80, -1, 1136, N'Template', CAST(N'2022-07-10T19:38:39.057' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (81, -1, 1137, N'DocumentType', CAST(N'2022-07-10T19:38:39.107' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (82, -1, 1138, N'Template', CAST(N'2022-07-10T19:39:05.287' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (83, -1, 1139, N'DocumentType', CAST(N'2022-07-10T19:39:05.297' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (84, -1, 1140, N'Template', CAST(N'2022-07-10T19:39:41.887' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (85, -1, 1141, N'DocumentType', CAST(N'2022-07-10T19:39:41.927' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (86, -1, 1142, N'Template', CAST(N'2022-07-10T19:41:06.570' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (87, -1, 1143, N'DocumentType', CAST(N'2022-07-10T19:41:06.613' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (88, -1, 1144, N'Template', CAST(N'2022-07-10T19:42:07.203' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (89, -1, 1145, N'DocumentType', CAST(N'2022-07-10T19:42:07.253' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (90, -1, 1146, N'DataType', CAST(N'2022-07-10T19:42:56.830' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (91, -1, 1146, N'DataType', CAST(N'2022-07-10T19:43:26.677' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (92, -1, 1146, N'DataType', CAST(N'2022-07-10T19:43:40.110' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (93, -1, 1147, N'Template', CAST(N'2022-07-10T19:44:54.310' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (94, -1, 1148, N'DocumentType', CAST(N'2022-07-10T19:44:54.353' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (95, -1, 1149, N'Template', CAST(N'2022-07-10T19:45:21.533' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (96, -1, 1150, N'DocumentType', CAST(N'2022-07-10T19:45:21.547' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (97, -1, 1150, N'DocumentType', CAST(N'2022-07-10T19:45:31.417' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (98, -1, 1148, N'DocumentType', CAST(N'2022-07-10T19:45:57.830' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (99, -1, 1151, N'Template', CAST(N'2022-07-10T19:46:25.197' AS DateTime), N'Save', NULL, NULL)
GO
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (100, -1, 1152, N'DocumentType', CAST(N'2022-07-10T19:46:25.223' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (101, -1, 1152, N'DocumentType', CAST(N'2022-07-10T19:46:37.990' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (102, -1, 1152, N'DocumentType', CAST(N'2022-07-10T19:46:43.160' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (103, -1, 1153, N'Template', CAST(N'2022-07-10T19:47:16.100' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (104, -1, 1154, N'DocumentType', CAST(N'2022-07-10T19:47:16.137' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (105, -1, 1154, N'DocumentType', CAST(N'2022-07-10T19:47:21.713' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (106, -1, 1154, N'DocumentType', CAST(N'2022-07-10T19:47:25.407' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (107, -1, 1155, N'Template', CAST(N'2022-07-10T19:48:48.230' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (108, -1, 1156, N'DocumentType', CAST(N'2022-07-10T19:48:48.273' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (109, -1, 1156, N'DocumentType', CAST(N'2022-07-10T19:48:54.200' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (110, -1, 1157, N'DataType', CAST(N'2022-07-10T19:49:16.550' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (111, -1, 1157, N'DataType', CAST(N'2022-07-10T19:49:42.707' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (112, -1, 1156, N'DocumentType', CAST(N'2022-07-10T19:49:43.437' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (113, -1, 1158, N'DataType', CAST(N'2022-07-10T19:50:08.177' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (114, -1, 1158, N'DataType', CAST(N'2022-07-10T19:50:31.700' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (115, -1, 1159, N'Template', CAST(N'2022-07-10T19:50:37.720' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (116, -1, 1160, N'DocumentType', CAST(N'2022-07-10T19:50:37.743' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (117, -1, 1160, N'DocumentType', CAST(N'2022-07-10T19:50:43.480' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (118, -1, 1161, N'Template', CAST(N'2022-07-10T19:51:17.470' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (119, -1, 1162, N'DocumentType', CAST(N'2022-07-10T19:51:17.520' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (120, -1, 1162, N'DocumentType', CAST(N'2022-07-10T19:51:25.197' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (121, -1, 1163, N'Template', CAST(N'2022-07-10T19:51:51.027' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (122, -1, 1164, N'DocumentType', CAST(N'2022-07-10T19:51:51.043' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (123, -1, 1164, N'DocumentType', CAST(N'2022-07-10T19:51:55.310' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (124, -1, 2, N'Language', CAST(N'2022-07-10T20:24:10.053' AS DateTime), N'Save', N'Save Language', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (125, -1, 3, N'Language', CAST(N'2022-07-10T20:24:23.260' AS DateTime), N'Save', N'Save Language', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (126, -1, 1061, N'DocumentType', CAST(N'2022-07-10T20:26:33.340' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (127, -1, 1061, N'DocumentType', CAST(N'2022-07-10T20:27:34.340' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (128, -1, 1061, N'DocumentType', CAST(N'2022-07-10T20:27:48.317' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (129, -1, 1165, N'DocumentType', CAST(N'2022-07-10T20:31:12.230' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (130, -1, 1059, N'DocumentType', CAST(N'2022-07-10T20:31:25.563' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (131, -1, 1061, N'DocumentType', CAST(N'2022-07-10T20:32:39.767' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (132, -1, 1166, N'Template', CAST(N'2022-07-10T20:33:19.577' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (133, -1, 1167, N'DocumentType', CAST(N'2022-07-10T20:33:19.617' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (134, -1, 1168, N'DataType', CAST(N'2022-07-10T20:33:30.970' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (135, -1, 1168, N'DataType', CAST(N'2022-07-10T20:33:48.223' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (136, -1, 1167, N'DocumentType', CAST(N'2022-07-10T20:33:49.117' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (137, -1, 1167, N'DocumentType', CAST(N'2022-07-10T20:34:24.793' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (138, -1, 1169, N'DataType', CAST(N'2022-07-10T20:35:15.263' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (139, -1, 1169, N'DataType', CAST(N'2022-07-10T20:35:52.773' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (140, -1, 1170, N'Template', CAST(N'2022-07-10T20:35:53.777' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (141, -1, 1171, N'DocumentType', CAST(N'2022-07-10T20:35:53.800' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (142, -1, 1171, N'DocumentType', CAST(N'2022-07-10T20:36:03.083' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (143, -1, 1171, N'DocumentType', CAST(N'2022-07-10T20:36:07.853' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (144, -1, 1171, N'DocumentType', CAST(N'2022-07-10T20:36:21.783' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (145, -1, -1, N'Document', CAST(N'2022-07-10T20:36:56.067' AS DateTime), N'Delete', N'Delete content of type 1148', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (146, -1, 1148, N'DocumentType', CAST(N'2022-07-10T20:36:56.217' AS DateTime), N'Delete', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (147, -1, 1146, N'DataType', CAST(N'2022-07-10T20:37:33.340' AS DateTime), N'Delete', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (148, -1, 1172, N'DataType', CAST(N'2022-07-10T20:37:34.257' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (149, -1, 1172, N'DataType', CAST(N'2022-07-10T20:37:55.003' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (150, -1, 1145, N'DocumentType', CAST(N'2022-07-10T20:37:57.007' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (151, -1, 1145, N'DocumentType', CAST(N'2022-07-10T20:38:01.507' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (152, -1, 1173, N'Template', CAST(N'2022-07-10T20:38:43.690' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (153, -1, 1174, N'DocumentType', CAST(N'2022-07-10T20:38:43.727' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (154, -1, 1175, N'DataType', CAST(N'2022-07-10T20:38:46.837' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (155, -1, 1175, N'DataType', CAST(N'2022-07-10T20:39:01.923' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (156, -1, 1174, N'DocumentType', CAST(N'2022-07-10T20:39:13.870' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (157, -1, 1176, N'Template', CAST(N'2022-07-10T20:39:34.253' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (158, -1, 1177, N'DocumentType', CAST(N'2022-07-10T20:39:34.310' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (159, -1, 1177, N'DocumentType', CAST(N'2022-07-10T20:39:39.743' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (160, -1, 1061, N'DocumentType', CAST(N'2022-07-10T20:40:28.640' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (161, -1, 1178, N'DataType', CAST(N'2022-07-10T20:41:53.753' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (162, -1, 1178, N'DataType', CAST(N'2022-07-10T20:42:29.740' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (163, -1, 1179, N'DocumentType', CAST(N'2022-07-10T20:42:30.497' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (164, -1, 1180, N'DocumentType', CAST(N'2022-07-10T20:44:33.740' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (165, -1, 1180, N'DocumentType', CAST(N'2022-07-10T20:44:45.640' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (166, -1, 1180, N'DocumentType', CAST(N'2022-07-10T20:44:58.000' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (167, -1, 1179, N'DocumentType', CAST(N'2022-07-10T20:45:14.583' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (168, -1, 1179, N'DocumentType', CAST(N'2022-07-10T20:45:28.103' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (169, -1, 1181, N'DataType', CAST(N'2022-07-10T20:48:12.433' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (170, -1, 1181, N'DataType', CAST(N'2022-07-10T20:48:27.260' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (171, -1, 1061, N'DocumentType', CAST(N'2022-07-10T20:51:14.423' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (172, -1, 1179, N'DocumentType', CAST(N'2022-07-10T20:53:49.487' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (173, -1, 1061, N'DocumentType', CAST(N'2022-07-10T20:54:42.537' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (174, -1, 1062, N'Document', CAST(N'2022-07-10T20:55:55.640' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (175, -1, 1182, N'DocumentType', CAST(N'2022-07-10T21:37:29.070' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (176, -1, 1182, N'DocumentType', CAST(N'2022-07-10T21:37:38.203' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (177, -1, 1182, N'DocumentType', CAST(N'2022-07-10T21:37:51.710' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (178, -1, 1183, N'DataType', CAST(N'2022-07-10T21:39:03.320' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (179, -1, 1061, N'DocumentType', CAST(N'2022-07-10T21:39:05.793' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (180, -1, 1182, N'DocumentType', CAST(N'2022-07-10T21:39:31.967' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (181, -1, 1183, N'DataType', CAST(N'2022-07-10T21:39:56.070' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (182, -1, 1061, N'DocumentType', CAST(N'2022-07-10T21:39:57.917' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (183, -1, 1062, N'Document', CAST(N'2022-07-10T21:41:35.597' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (184, -1, 1183, N'DataType', CAST(N'2022-07-10T21:41:59.957' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (185, -1, 1061, N'DocumentType', CAST(N'2022-07-10T21:42:01.523' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (186, -1, 1062, N'Document', CAST(N'2022-07-10T21:42:07.447' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (187, -1, 1184, N'DocumentType', CAST(N'2022-07-10T21:50:55.913' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (188, -1, 1184, N'DocumentType', CAST(N'2022-07-10T21:51:57.297' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (189, -1, 1184, N'DocumentType', CAST(N'2022-07-10T21:53:14.523' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (190, -1, 1184, N'DocumentType', CAST(N'2022-07-10T21:53:23.340' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (191, -1, 1184, N'DocumentType', CAST(N'2022-07-10T21:54:28.707' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (192, -1, 1184, N'DocumentType', CAST(N'2022-07-10T21:54:44.177' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (193, -1, 1185, N'DataType', CAST(N'2022-07-10T21:55:30.697' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (194, -1, 1061, N'DocumentType', CAST(N'2022-07-10T21:55:32.717' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (195, -1, 1061, N'DocumentType', CAST(N'2022-07-10T21:56:24.143' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (196, -1, 1186, N'Document', CAST(N'2022-07-10T21:58:00.533' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (197, -1, 1187, N'Document', CAST(N'2022-07-10T21:58:21.820' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (198, -1, 1188, N'Document', CAST(N'2022-07-10T21:58:33.197' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (199, -1, 1189, N'Document', CAST(N'2022-07-10T21:58:58.813' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
GO
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (200, -1, 1190, N'DataType', CAST(N'2022-07-10T21:59:19.190' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (201, -1, 1190, N'DataType', CAST(N'2022-07-10T21:59:51.033' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (202, -1, 1141, N'DocumentType', CAST(N'2022-07-10T21:59:51.870' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (203, -1, 1191, N'Document', CAST(N'2022-07-10T22:00:10.847' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (204, -1, 1192, N'Document', CAST(N'2022-07-10T22:00:22.380' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (205, -1, 1193, N'Document', CAST(N'2022-07-10T22:00:35.157' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (206, -1, 1194, N'Document', CAST(N'2022-07-10T22:00:46.700' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (207, -1, 1195, N'Document', CAST(N'2022-07-10T22:01:01.600' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (208, -1, 1062, N'Document', CAST(N'2022-07-10T22:03:02.037' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (209, -1, 1062, N'Document', CAST(N'2022-07-10T22:05:54.210' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (210, -1, 1189, N'Document', CAST(N'2022-07-10T22:53:58.497' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (211, -1, 1062, N'Document', CAST(N'2022-07-10T22:54:59.087' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (212, -1, 1186, N'Document', CAST(N'2022-07-10T22:55:30.760' AS DateTime), N'Publish', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (213, -1, 1141, N'DocumentType', CAST(N'2022-07-10T22:55:54.257' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (214, -1, 1137, N'DocumentType', CAST(N'2022-07-10T22:56:01.650' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (215, -1, 1062, N'Document', CAST(N'2022-07-10T22:57:10.430' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (216, -1, 1143, N'DocumentType', CAST(N'2022-07-10T22:57:22.453' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (217, -1, 1062, N'Document', CAST(N'2022-07-10T22:57:46.413' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (218, -1, 1197, N'Template', CAST(N'2022-07-10T23:00:10.247' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (219, -1, 1198, N'DocumentType', CAST(N'2022-07-10T23:00:10.303' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (220, -1, 1061, N'DocumentType', CAST(N'2022-07-10T23:00:53.140' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (221, -1, 1199, N'Document', CAST(N'2022-07-10T23:01:12.930' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (222, -1, 1062, N'Document', CAST(N'2022-07-10T23:01:40.380' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (223, -1, 1062, N'Document', CAST(N'2022-07-10T23:34:05.780' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (224, -1, 1062, N'Document', CAST(N'2022-07-11T00:05:48.693' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (225, -1, 1062, N'Document', CAST(N'2022-07-11T00:06:47.887' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (226, -1, 1062, N'Document', CAST(N'2022-07-11T00:07:50.283' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (227, -1, 1062, N'Document', CAST(N'2022-07-11T00:09:01.073' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (228, -1, 1061, N'DocumentType', CAST(N'2022-07-11T00:18:57.070' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (229, -1, 1200, N'Document', CAST(N'2022-07-11T00:19:25.823' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (230, -1, 1201, N'Document', CAST(N'2022-07-11T00:19:49.987' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (231, -1, 0, N'Document', CAST(N'2022-07-11T14:16:51.527' AS DateTime), N'Sort', N'Sorting content performed by user', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (232, -1, 1137, N'DocumentType', CAST(N'2022-07-11T14:17:48.877' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (233, -1, 1202, N'DataType', CAST(N'2022-07-11T14:21:12.703' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (234, -1, 1137, N'DocumentType', CAST(N'2022-07-11T14:21:14.820' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (235, -1, 1137, N'DocumentType', CAST(N'2022-07-11T14:21:52.993' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (236, -1, 1203, N'DataType', CAST(N'2022-07-11T14:24:24.990' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (237, -1, 1137, N'DocumentType', CAST(N'2022-07-11T14:25:18.637' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (238, -1, 1186, N'Document', CAST(N'2022-07-11T14:29:56.477' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (239, -1, 1162, N'DocumentType', CAST(N'2022-07-11T14:32:08.970' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (240, -1, 1204, N'DataType', CAST(N'2022-07-11T14:33:02.147' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (241, -1, 1162, N'DocumentType', CAST(N'2022-07-11T14:33:07.210' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (242, -1, 1162, N'DocumentType', CAST(N'2022-07-11T14:33:24.760' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (243, -1, 1205, N'DataType', CAST(N'2022-07-11T14:34:18.523' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (244, -1, 1162, N'DocumentType', CAST(N'2022-07-11T14:34:20.817' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (245, -1, 1150, N'DocumentType', CAST(N'2022-07-11T14:36:23.543' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (246, -1, 1150, N'DocumentType', CAST(N'2022-07-11T14:36:37.780' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (247, -1, 1150, N'DocumentType', CAST(N'2022-07-11T14:37:42.127' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (248, -1, 1150, N'DocumentType', CAST(N'2022-07-11T14:38:19.217' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (249, -1, 1150, N'DocumentType', CAST(N'2022-07-11T14:38:50.753' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (250, -1, 1186, N'Document', CAST(N'2022-07-11T14:39:22.043' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (251, -1, 1150, N'DocumentType', CAST(N'2022-07-11T14:39:53.043' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (252, -1, 1160, N'DocumentType', CAST(N'2022-07-11T14:40:04.080' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (253, -1, 1156, N'DocumentType', CAST(N'2022-07-11T14:40:19.823' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (254, -1, 1164, N'DocumentType', CAST(N'2022-07-11T14:40:31.653' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (255, -1, 1156, N'DocumentType', CAST(N'2022-07-11T14:40:52.293' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (256, -1, 1156, N'DocumentType', CAST(N'2022-07-11T14:41:27.880' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (257, -1, 1174, N'DocumentType', CAST(N'2022-07-11T14:41:52.730' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (258, -1, 1141, N'DocumentType', CAST(N'2022-07-11T14:42:11.133' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (259, -1, 1206, N'Document', CAST(N'2022-07-11T14:44:15.190' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (260, -1, 1206, N'Document', CAST(N'2022-07-11T14:44:41.043' AS DateTime), N'Copy', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (261, -1, 1207, N'Document', CAST(N'2022-07-11T14:44:41.160' AS DateTime), N'Copy', N'Copied content with Id: ''1207'' related to original content with Id: ''1206''', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (262, -1, 1206, N'Document', CAST(N'2022-07-11T14:44:47.863' AS DateTime), N'Copy', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (263, -1, 1208, N'Document', CAST(N'2022-07-11T14:44:47.903' AS DateTime), N'Copy', N'Copied content with Id: ''1208'' related to original content with Id: ''1206''', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (264, -1, 1207, N'Document', CAST(N'2022-07-11T14:45:44.127' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (265, -1, 1208, N'Document', CAST(N'2022-07-11T14:46:22.550' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (266, -1, 1141, N'DocumentType', CAST(N'2022-07-11T14:46:34.163' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (267, -1, 1209, N'Document', CAST(N'2022-07-11T14:50:41.510' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (268, -1, 1209, N'Document', CAST(N'2022-07-11T14:50:54.990' AS DateTime), N'Copy', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (269, -1, 1210, N'Document', CAST(N'2022-07-11T14:50:55.060' AS DateTime), N'Copy', N'Copied content with Id: ''1210'' related to original content with Id: ''1209''', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (270, -1, 1209, N'Document', CAST(N'2022-07-11T14:51:01.547' AS DateTime), N'Copy', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (271, -1, 1211, N'Document', CAST(N'2022-07-11T14:51:01.573' AS DateTime), N'Copy', N'Copied content with Id: ''1211'' related to original content with Id: ''1209''', NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (272, -1, 1210, N'Document', CAST(N'2022-07-11T14:51:31.513' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (273, -1, 1211, N'Document', CAST(N'2022-07-11T14:51:52.387' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (274, -1, 1211, N'Document', CAST(N'2022-07-11T14:52:14.953' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (275, -1, 1186, N'Document', CAST(N'2022-07-11T14:52:58.987' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (276, -1, 1186, N'Document', CAST(N'2022-07-11T15:05:07.213' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (277, -1, 1137, N'DocumentType', CAST(N'2022-07-11T15:05:38.577' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (278, -1, 1186, N'Document', CAST(N'2022-07-11T15:06:13.517' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (279, -1, 1198, N'DocumentType', CAST(N'2022-07-11T17:08:41.323' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (280, -1, 1212, N'DocumentType', CAST(N'2022-07-11T17:09:56.067' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (281, -1, 1212, N'DocumentType', CAST(N'2022-07-11T17:10:45.517' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (282, -1, 1212, N'DocumentType', CAST(N'2022-07-11T17:10:59.517' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (283, -1, 1213, N'DataType', CAST(N'2022-07-11T17:11:40.457' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (284, -1, 1198, N'DocumentType', CAST(N'2022-07-11T17:11:42.303' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (285, -1, 1199, N'Document', CAST(N'2022-07-11T17:13:47.607' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (286, -1, 1199, N'Document', CAST(N'2022-07-11T17:14:22.230' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (287, -1, 1198, N'DocumentType', CAST(N'2022-07-11T17:15:40.887' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (288, -1, 1198, N'DocumentType', CAST(N'2022-07-11T17:16:19.203' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (289, -1, 1199, N'Document', CAST(N'2022-07-11T17:17:02.847' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (290, -1, 1199, N'Document', CAST(N'2022-07-11T17:18:10.123' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (291, -1, 1198, N'DocumentType', CAST(N'2022-07-11T17:18:21.573' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (292, -1, 1199, N'Document', CAST(N'2022-07-11T17:18:43.903' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (293, -1, 1198, N'DocumentType', CAST(N'2022-07-11T17:20:36.700' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (294, -1, 1198, N'DocumentType', CAST(N'2022-07-11T17:21:26.603' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (295, -1, 1199, N'Document', CAST(N'2022-07-11T17:23:14.393' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (296, -1, 1199, N'Document', CAST(N'2022-07-11T17:23:22.680' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (297, -1, 1214, N'DocumentType', CAST(N'2022-07-11T17:25:51.570' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (298, -1, 1214, N'DocumentType', CAST(N'2022-07-11T17:26:13.960' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (299, -1, 1214, N'DocumentType', CAST(N'2022-07-11T17:26:25.550' AS DateTime), N'Save', NULL, NULL)
GO
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (300, -1, 1137, N'DocumentType', CAST(N'2022-07-11T17:26:43.910' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (301, -1, 1139, N'DocumentType', CAST(N'2022-07-11T17:26:52.490' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (302, -1, 1141, N'DocumentType', CAST(N'2022-07-11T17:27:07.880' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (303, -1, 1143, N'DocumentType', CAST(N'2022-07-11T17:27:19.780' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (304, -1, 1150, N'DocumentType', CAST(N'2022-07-11T17:27:34.793' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (305, -1, 1145, N'DocumentType', CAST(N'2022-07-11T17:27:41.267' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (306, -1, 1177, N'DocumentType', CAST(N'2022-07-11T17:27:49.403' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (307, -1, 1174, N'DocumentType', CAST(N'2022-07-11T17:27:59.067' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (308, -1, 1152, N'DocumentType', CAST(N'2022-07-11T17:28:06.790' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (309, -1, 1171, N'DocumentType', CAST(N'2022-07-11T17:28:13.440' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (310, -1, 1154, N'DocumentType', CAST(N'2022-07-11T17:28:24.597' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (311, -1, 1167, N'DocumentType', CAST(N'2022-07-11T17:28:32.247' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (312, -1, 1156, N'DocumentType', CAST(N'2022-07-11T17:28:38.910' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (313, -1, 1164, N'DocumentType', CAST(N'2022-07-11T17:28:45.657' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (314, -1, 1160, N'DocumentType', CAST(N'2022-07-11T17:29:36.757' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (315, -1, 1160, N'DocumentType', CAST(N'2022-07-11T17:30:17.807' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (316, -1, 1059, N'DocumentType', CAST(N'2022-07-11T17:31:58.410' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (317, -1, 1061, N'DocumentType', CAST(N'2022-07-11T17:34:40.357' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (318, -1, 1062, N'Document', CAST(N'2022-07-11T17:35:25.627' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (319, -1, 1061, N'DocumentType', CAST(N'2022-07-11T17:35:52.957' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (320, -1, 1059, N'DocumentType', CAST(N'2022-07-11T17:36:47.537' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (321, -1, 1059, N'DocumentType', CAST(N'2022-07-11T17:36:55.597' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (322, -1, 1059, N'DocumentType', CAST(N'2022-07-11T17:37:06.897' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (323, -1, 1160, N'DocumentType', CAST(N'2022-07-11T17:38:39.350' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (324, -1, 1191, N'Document', CAST(N'2022-07-11T17:39:14.557' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (325, -1, 1162, N'DocumentType', CAST(N'2022-07-11T17:40:10.010' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (326, -1, 1206, N'Document', CAST(N'2022-07-11T17:40:35.767' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (327, -1, 1207, N'Document', CAST(N'2022-07-11T17:40:54.103' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (328, -1, 1208, N'Document', CAST(N'2022-07-11T17:41:11.310' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (329, -1, 1207, N'Document', CAST(N'2022-07-11T17:41:31.077' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (330, -1, 1206, N'Document', CAST(N'2022-07-11T17:41:45.887' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (331, -1, 1061, N'DocumentType', CAST(N'2022-07-11T17:48:53.527' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (332, -1, 1061, N'DocumentType', CAST(N'2022-07-11T17:49:25.720' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (333, -1, 1061, N'DocumentType', CAST(N'2022-07-11T17:49:41.790' AS DateTime), N'Save', NULL, NULL)
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (334, -1, 1062, N'Document', CAST(N'2022-07-11T17:50:41.910' AS DateTime), N'SaveVariant', N'Saved languages: English (United States)', N'English (United States)')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [entityType], [Datestamp], [logHeader], [logComment], [parameters]) VALUES (335, -1, 1062, N'Document', CAST(N'2022-07-11T17:50:59.883' AS DateTime), N'PublishVariant', N'Published languages: English (United States)', N'English (United States)')
SET IDENTITY_INSERT [dbo].[umbracoLog] OFF
GO
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (3, NULL)
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (4, N'/media/ecte4lmu/about-us.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (5, N'/media/aminqgvi/course-1.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (6, N'/media/tehgqmij/course-2.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (7, N'/media/r3fpyctn/course-3.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (8, N'/media/jnybixq2/event-1.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (9, N'/media/1cnleu32/event-2.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (10, N'/media/dmpjluyj/event-3.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (11, N'/media/hvbkcv1w/favicon.png')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (12, N'/media/45okl5vk/logo.png')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (13, N'/media/k4dl5n5j/preloader.gif')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (14, N'/media/xdop2b4h/teacher.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (15, NULL)
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (16, N'/media/izinkj5v/page-title.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (17, N'/media/nb5bcicp/success-story.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (18, NULL)
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (19, N'/media/rkefygua/banner-1.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (20, N'/media/wtqk3oq0/banner-feature.png')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (21, NULL)
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (22, N'/media/p2anvdn1/blog-single.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (23, N'/media/3peff54x/post-1.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (24, N'/media/ul0nnu05/post-2.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (25, N'/media/hhcezn1t/post-3.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (26, NULL)
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (27, N'/media/wuan5srb/course-1.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (28, N'/media/myaffiqv/course-2.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (29, N'/media/cblnnyi0/course-3.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (30, N'/media/0kbpyoht/course-4.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (31, N'/media/ocyf152k/course-5.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (32, N'/media/arqos5s4/course-6.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (33, N'/media/obqhc1st/course-single.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (34, NULL)
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (35, N'/media/qfxh2hkp/event-1.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (36, N'/media/g5xp2jsf/event-2.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (37, N'/media/p3jaffbx/event-3.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (38, N'/media/pnkftz00/event-single.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (39, NULL)
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (40, N'/media/pinghula/about-page.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (41, N'/media/lppfxkx4/about-us.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (42, N'/media/5khpp04d/video-thumb.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (43, NULL)
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (44, N'/media/bi0fdttb/teacher-1.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (45, N'/media/xdsfbgns/teacher-2.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (46, N'/media/pzspwehk/teacher-3.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (47, NULL)
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (48, N'/media/5sfhzioc/speaker-1.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (49, N'/media/zzomro4l/speaker-2.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (50, N'/media/rlhjij3n/speaker-3.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (51, N'/media/qdxpea01/speaker-4.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (52, NULL)
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (53, N'/media/nhrprelb/scholarship-item-1.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (54, N'/media/2u1p2nuy/scholarship-item-2.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (55, N'/media/c5mjfikj/scholarship-item-3.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (56, N'/media/z3fbjoth/scholarship.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (57, NULL)
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (58, N'/media/l5hb0pmw/research-1.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (59, N'/media/i2yp00um/research-2.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (60, N'/media/e2tnnre5/research-3.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (61, N'/media/t3gcdhdr/research-4.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (62, N'/media/l5lcedd5/research-5.jpg')
INSERT [dbo].[umbracoMediaVersion] ([id], [path]) VALUES (63, N'/media/o0pg2k4m/research-6.jpg')
GO
SET IDENTITY_INSERT [dbo].[umbracoNode] ON 

INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-103, N'215cb418-2153-4429-9aef-8c0f0041191b', -1, 1, N'-1,-103', 38, 0, -1, N'Upload Vector Graphics', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-07-10T02:36:41.150' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-102, N'bc1e266c-dac4-4164-bf08-8a1ec6a7143d', -1, 1, N'-1,-102', 37, 0, -1, N'Upload Article', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-07-10T02:36:41.150' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-101, N'8f430dd6-4e96-447e-9dc0-cb552c8cd1f3', -1, 1, N'-1,-101', 36, 0, -1, N'Upload Audio', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-07-10T02:36:41.150' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-100, N'70575fe7-9812-4396-bbe1-c81a76db71b5', -1, 1, N'-1,-100', 35, 0, -1, N'Upload Video', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-07-10T02:36:41.147' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-99, N'8f1ef1e1-9de4-40d3-a072-6673f631ca64', -1, 1, N'-1,-99', 39, 0, -1, N'Label (decimal)', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-07-10T02:36:41.147' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-98, N'a97cec69-9b71-4c30-8b12-ec398860d7e8', -1, 1, N'-1,-98', 38, 0, -1, N'Label (time)', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-07-10T02:36:41.143' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-97, N'aa2c52a0-ce87-4e65-a47c-7df09358585d', -1, 1, N'-1,-97', 2, 0, -1, N'List View - Members', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-07-10T02:36:41.160' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-96, N'3a0156c4-3b8c-4803-bdc1-6871faa83fff', -1, 1, N'-1,-96', 2, 0, -1, N'List View - Media', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-07-10T02:36:41.160' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-95, N'c0808dd3-8133-4e4b-8ce8-e2bea84a96a4', -1, 1, N'-1,-95', 2, 0, -1, N'List View - Content', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-07-10T02:36:41.157' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-94, N'0e9794eb-f9b5-4f20-a788-93acd233a7e4', -1, 1, N'-1,-94', 37, 0, -1, N'Label (datetime)', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-07-10T02:36:41.143' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-93, N'930861bf-e262-4ead-a704-f99453565708', -1, 1, N'-1,-93', 36, 0, -1, N'Label (bigint)', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-07-10T02:36:41.143' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-92, N'f0bc4bfb-b499-40d6-ba86-058885a5178c', -1, 1, N'-1,-92', 35, 0, -1, N'Label (string)', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-07-10T02:36:41.143' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-91, N'8e7f995c-bd81-4627-9932-c40e568ec788', -1, 1, N'-1,-91', 36, 0, -1, N'Label (integer)', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-07-10T02:36:41.143' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-90, N'84c6b441-31df-4ffe-b67e-67d5bc3ae65a', -1, 1, N'-1,-90', 34, 0, -1, N'Upload File', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-07-10T02:36:41.147' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-89, N'c6bac0dd-4ab9-45b1-8e30-e4b619ee5da3', -1, 1, N'-1,-89', 33, 0, -1, N'Textarea', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-07-10T02:36:41.150' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-88, N'0cc0eba1-9960-42c9-bf9b-60e150b429ae', -1, 1, N'-1,-88', 32, 0, -1, N'Textstring', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-07-10T02:36:41.150' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-87, N'ca90c950-0aff-4e72-b976-a30b1ac57dad', -1, 1, N'-1,-87', 4, 0, -1, N'Richtext editor', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-07-10T02:36:41.153' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-51, N'2e6d3631-066e-44b8-aec4-96f09099b2b5', -1, 1, N'-1,-51', 2, 0, -1, N'Numeric', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-07-10T02:36:41.153' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-49, N'92897bc6-a5f3-4ffe-ae27-f2e7e33dda49', -1, 1, N'-1,-49', 2, 0, -1, N'True/false', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-07-10T02:36:41.153' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-43, N'fbaf13a8-4036-41f2-93a3-974f678c312a', -1, 1, N'-1,-43', 2, 0, -1, N'Checkbox list', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-07-10T02:36:41.153' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-42, N'f38f0ac7-1d27-439c-9f3f-089cd8825a53', -1, 1, N'-1,-42', 2, 0, -1, N'Dropdown multiple', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-07-10T02:36:41.157' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-41, N'5046194e-4237-453c-a547-15db3a07c4e1', -1, 1, N'-1,-41', 2, 0, -1, N'Date Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-07-10T02:36:41.153' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-40, N'bb5f57c9-ce2b-4bb9-b697-4caca783a805', -1, 1, N'-1,-40', 2, 0, -1, N'Radiobox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-07-10T02:36:41.157' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-39, N'0b6a45e7-44ba-430d-9da5-4e46060b9e03', -1, 1, N'-1,-39', 2, 0, -1, N'Dropdown', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-07-10T02:36:41.153' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-37, N'0225af17-b302-49cb-9176-b9f35cab9c17', -1, 1, N'-1,-37', 2, 0, -1, N'Approved Color', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-07-10T02:36:41.157' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-36, N'e4d66c0f-b935-4200-81f0-025f7256b89a', -1, 1, N'-1,-36', 2, 0, -1, N'Date Picker with time', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-07-10T02:36:41.157' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-21, N'bf7c7cbc-952f-4518-97a2-69e9c7b33842', -1, 0, N'-1,-21', 0, 0, -1, N'Recycle Bin', N'cf3d8e34-1c1c-41e9-ae56-878b57b32113', CAST(N'2022-07-10T02:36:41.140' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-20, N'0f582a79-1e41-4cf0-bfa0-76340651891a', -1, 0, N'-1,-20', 0, 0, -1, N'Recycle Bin', N'01bb7ff2-24dc-4c0c-95a2-c24ef72bbac8', CAST(N'2022-07-10T02:36:41.140' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (-1, N'916724a5-173d-4619-b97e-b9de133dd6f5', -1, 0, N'-1', 0, 0, -1, N'SYSTEM DATA: umbraco master root', N'ea7d8624-4cfe-4578-a871-24aa946bf34d', CAST(N'2022-07-10T02:36:41.127' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1031, N'f38bd2d7-65d0-48e6-95dc-87ce06ec2d3d', -1, 1, N'-1,1031', 2, 0, -1, N'Folder', N'4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e', CAST(N'2022-07-10T02:36:41.160' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1032, N'cc07b313-0843-4aa8-bbda-871c8da728c8', -1, 1, N'-1,1032', 2, 0, -1, N'Image', N'4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e', CAST(N'2022-07-10T02:36:41.163' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1033, N'4c52d8ab-54e6-40cd-999c-7a5f24903e4d', -1, 1, N'-1,1033', 2, 0, -1, N'File', N'4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e', CAST(N'2022-07-10T02:36:41.163' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1034, N'f6c515bb-653c-4bdc-821c-987729ebe327', -1, 1, N'-1,1034', 2, 0, -1, N'Video', N'4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e', CAST(N'2022-07-10T02:36:41.163' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1035, N'a5ddeee0-8fd8-4cee-a658-6f1fcdb00de3', -1, 1, N'-1,1035', 2, 0, -1, N'Audio', N'4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e', CAST(N'2022-07-10T02:36:41.163' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1036, N'a43e3414-9599-4230-a7d3-943a21b20122', -1, 1, N'-1,1036', 2, 0, -1, N'Article', N'4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e', CAST(N'2022-07-10T02:36:41.163' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1037, N'c4b1efcf-a9d5-41c4-9621-e9d273b52a9c', -1, 1, N'-1,1037', 2, 0, -1, N'Vector Graphics (SVG)', N'4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e', CAST(N'2022-07-10T02:36:41.163' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1041, N'b6b73142-b9c1-4bf8-a16d-e1c23320b549', -1, 1, N'-1,1041', 2, 0, -1, N'Tags', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-07-10T02:36:41.163' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1043, N'1df9f033-e6d4-451f-b8d2-e0cbc50a836f', -1, 1, N'-1,1043', 2, 0, -1, N'Image Cropper', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-07-10T02:36:41.167' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1044, N'd59be02f-1df9-4228-aa1e-01917d806cda', -1, 1, N'-1,1044', 0, 0, -1, N'Member', N'9b5416fb-e72f-45a9-a07b-5a9a2709ce43', CAST(N'2022-07-10T02:36:41.167' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1046, N'fd1e0da5-5606-4862-b679-5d0cf3a52a59', -1, 1, N'-1,1046', 2, 0, -1, N'Content Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-07-10T02:36:41.167' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1047, N'1ea2e01f-ebd8-4ce1-8d71-6b1149e63548', -1, 1, N'-1,1047', 2, 0, -1, N'Member Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-07-10T02:36:41.170' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1048, N'135d60e0-64d9-49ed-ab08-893c9ba44ae5', -1, 1, N'-1,1048', 2, 0, -1, N'Media Picker (legacy)', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-07-10T02:36:41.170' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1049, N'9dbbcbbb-2327-434a-b355-af1b84e5010a', -1, 1, N'-1,1049', 2, 0, -1, N'Multiple Media Picker (legacy)', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-07-10T02:36:41.170' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1050, N'b4e3535a-1753-47e2-8568-602cf8cfee6f', -1, 1, N'-1,1050', 2, 0, -1, N'Multi URL Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-07-10T02:36:41.173' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1051, N'4309a3ea-0d78-4329-a06c-c80b036af19a', -1, 1, N'-1,1051', 2, 0, -1, N'Media Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-07-10T02:36:41.173' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1052, N'1b661f40-2242-4b44-b9cb-3990ee2b13c0', -1, 1, N'-1,1052', 2, 0, -1, N'Multiple Media Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-07-10T02:36:41.173' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1053, N'ad9f0cf2-bda2-45d5-9ea1-a63cfc873fd3', -1, 1, N'-1,1053', 2, 0, -1, N'Image Media Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-07-10T02:36:41.173' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1054, N'0e63d883-b62b-4799-88c3-157f82e83ecc', -1, 1, N'-1,1054', 2, 0, -1, N'Multiple Image Media Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-07-10T02:36:41.177' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1055, N'95834492-438c-4d8c-9213-71773cd9b12c', -1, 1, N'-1,1055', 0, 0, -1, N'Root', N'2f7a2769-6b0b-4468-90dd-af42d64f7f16', CAST(N'2022-07-10T19:04:12.433' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1056, N'd2f9c1ea-5297-4c59-97bf-8db0a6aaff93', -1, 1, N'-1,1056', 0, 0, -1, N'Compositions', N'2f7a2769-6b0b-4468-90dd-af42d64f7f16', CAST(N'2022-07-10T19:04:29.170' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1057, N'88ff7c28-ecc7-4079-bf1a-60e30f1f53de', -1, 1, N'-1,1057', 0, 0, -1, N'Elements', N'2f7a2769-6b0b-4468-90dd-af42d64f7f16', CAST(N'2022-07-10T19:04:41.390' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1058, N'48f5114e-4107-4cba-abbe-fb51ea5a3129', -1, 1, N'-1,1058', 0, 0, -1, N'Pages', N'2f7a2769-6b0b-4468-90dd-af42d64f7f16', CAST(N'2022-07-10T19:04:49.123' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1059, N'8c68c202-c3a5-409a-bac7-08bf650c4978', 1056, 2, N'-1,1056,1059', 0, 0, -1, N'Meta Data', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2022-07-10T19:06:30.380' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1060, N'e207eea5-6001-42cd-8afc-c133c3af1018', -1, 1, N'-1,1060', 0, 0, NULL, N'Code Book', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2022-07-10T19:08:20.487' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1061, N'0b98b184-fccd-4964-a579-34cb3c231aa0', 1055, 2, N'-1,1055,1061', 0, 0, -1, N'Code Book', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2022-07-10T19:08:20.587' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1062, N'50b4d811-216e-43b0-b892-3dbcdc59e4c6', -1, 1, N'-1,1062', 0, 0, -1, N'Code Book', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2022-07-10T19:09:05.097' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1063, N'e3c480a1-ee4f-4ca6-a704-7f67cf070732', -1, 1, N'-1,1063', 37, 0, -1, N'Single Media Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-07-10T19:18:26.187' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1064, N'41a33d4f-b5cf-4152-a7c2-7be206826505', -1, 1, N'-1,1064', 38, 0, -1, N'Single URL Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-07-10T19:21:20.463' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1065, N'8c2ff783-1a03-49fa-82da-8628036a85f2', -1, 1, N'-1,1065', 39, 0, -1, N'Email address', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-07-10T19:21:46.617' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1066, N'8f8316b7-ba52-45cd-a748-851b25d84e1a', -1, 1, N'-1,1066', 0, 0, -1, N'images', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-07-10T19:27:19.273' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1067, N'2d4fa626-5594-4344-98dd-6969a44a9e46', 1066, 2, N'-1,1066,1067', 0, 0, -1, N'About Us', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-07-10T19:27:19.630' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1068, N'1ad81005-8fa8-4e76-8b7a-17f362241a0d', 1066, 2, N'-1,1066,1068', 1, 0, -1, N'Course 1', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-07-10T19:27:19.763' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1069, N'31680e9f-8609-42f4-88b8-691e7f3bb09f', 1066, 2, N'-1,1066,1069', 2, 0, -1, N'Course 2', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-07-10T19:27:19.870' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1070, N'0aec4b89-0c6d-4366-bca4-806118edb184', 1066, 2, N'-1,1066,1070', 3, 0, -1, N'Course 3', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-07-10T19:27:19.960' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1071, N'5e14714d-001c-4d64-b94c-2a2d1bd130ac', 1066, 2, N'-1,1066,1071', 4, 0, -1, N'Event 1', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-07-10T19:27:20.033' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1072, N'53a29bde-8dbc-46cc-8c6b-b6901e1ae878', 1066, 2, N'-1,1066,1072', 5, 0, -1, N'Event 2', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-07-10T19:27:20.117' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1073, N'd3951e1d-ef09-4f7a-b620-f299b8c82cca', 1066, 2, N'-1,1066,1073', 6, 0, -1, N'Event 3', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-07-10T19:27:20.187' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1074, N'57a1423b-1676-4cf4-8d58-17febbfcb0ec', 1066, 2, N'-1,1066,1074', 7, 0, -1, N'Favicon', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-07-10T19:27:20.277' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1075, N'fea5dcf1-1faa-4fa4-b650-dbe1f1460833', 1066, 2, N'-1,1066,1075', 8, 0, -1, N'Logo', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-07-10T19:27:20.353' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1076, N'b7af8751-10e9-4dd7-930f-d035d40c0683', 1066, 2, N'-1,1066,1076', 9, 0, -1, N'Preloader', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-07-10T19:27:20.437' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1077, N'07eeddbe-5cc7-4260-a06a-e3f18590529c', 1066, 2, N'-1,1066,1077', 10, 0, -1, N'Teacher', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-07-10T19:27:20.507' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1078, N'fdb12d04-f3b6-475f-b927-3dd088078f00', 1066, 2, N'-1,1066,1078', 11, 0, -1, N'backgrounds', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-07-10T19:27:20.587' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1079, N'27d55040-17f5-45f3-9f06-1ee10ee7157d', 1078, 3, N'-1,1066,1078,1079', 0, 0, -1, N'Page Title', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-07-10T19:27:20.643' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1080, N'20017f6e-974f-4c46-87ac-3d2d621ae795', 1078, 3, N'-1,1066,1078,1080', 1, 0, -1, N'Success Story', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-07-10T19:27:20.740' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1081, N'4bf54f68-aab7-4288-91aa-e49026c5865a', 1066, 2, N'-1,1066,1081', 12, 0, -1, N'banner', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-07-10T19:27:20.800' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1082, N'1a5c888c-b380-4dd7-8db2-e36434660750', 1081, 3, N'-1,1066,1081,1082', 0, 0, -1, N'Banner 1', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-07-10T19:27:20.853' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1083, N'baaee0b2-001a-4518-b963-cd5695b54187', 1081, 3, N'-1,1066,1081,1083', 1, 0, -1, N'Banner Feature', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-07-10T19:27:20.957' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1084, N'baf8a157-a06a-4206-9072-39bfce2bde01', 1066, 2, N'-1,1066,1084', 13, 0, -1, N'blog', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-07-10T19:27:21.013' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1085, N'8dca0179-e9bb-4e82-aa0d-04567cbd91a2', 1084, 3, N'-1,1066,1084,1085', 0, 0, -1, N'Blog Single', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-07-10T19:27:21.060' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1086, N'ff52c8ed-b7d7-4e22-a6b5-ab4220abf070', 1084, 3, N'-1,1066,1084,1086', 1, 0, -1, N'Post 1', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-07-10T19:27:21.133' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1087, N'd3d6f4a4-695f-4244-9a7c-c3079868bdc2', 1084, 3, N'-1,1066,1084,1087', 2, 0, -1, N'Post 2', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-07-10T19:27:21.210' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1088, N'b74cc43f-b273-4a92-a4cf-cb38660950ce', 1084, 3, N'-1,1066,1084,1088', 3, 0, -1, N'Post 3', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-07-10T19:27:21.280' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1089, N'd2153d13-0926-4492-8fea-dd690480e83d', 1066, 2, N'-1,1066,1089', 14, 0, -1, N'courses', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-07-10T19:27:21.357' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1090, N'cadf01b3-4021-4478-a79f-6378c918aed2', 1089, 3, N'-1,1066,1089,1090', 0, 0, -1, N'Course 1', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-07-10T19:27:21.403' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1091, N'a2420160-8615-4044-9e78-af38af99aaa6', 1089, 3, N'-1,1066,1089,1091', 1, 0, -1, N'Course 2', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-07-10T19:27:21.473' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1092, N'e1d65716-a11a-4b42-b8ce-d183ece59aa7', 1089, 3, N'-1,1066,1089,1092', 2, 0, -1, N'Course 3', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-07-10T19:27:21.557' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1093, N'38fc82d4-c2f3-44e0-a62b-4348c65dae8e', 1089, 3, N'-1,1066,1089,1093', 3, 0, -1, N'Course 4', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-07-10T19:27:21.637' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1094, N'ff4db176-658a-498e-bd92-2dfad776e0ea', 1089, 3, N'-1,1066,1089,1094', 4, 0, -1, N'Course 5', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-07-10T19:27:21.710' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1095, N'7ee96002-9a5e-4c19-a489-b4d134f7d3f1', 1089, 3, N'-1,1066,1089,1095', 5, 0, -1, N'Course 6', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-07-10T19:27:21.797' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1096, N'6e716076-e753-4a2b-b27b-ff49fd5afefb', 1089, 3, N'-1,1066,1089,1096', 6, 0, -1, N'Course Single', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-07-10T19:27:21.883' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1097, N'6f160d6f-cbec-4f97-86bb-883d0c290f91', 1066, 2, N'-1,1066,1097', 15, 0, -1, N'events', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-07-10T19:27:21.957' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1098, N'1d6e6f87-4b4f-474a-a43f-dc04582e7f33', 1097, 3, N'-1,1066,1097,1098', 0, 0, -1, N'Event 1', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-07-10T19:27:22.017' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1099, N'26feef31-b845-4b53-9cfd-1d0392a597c7', 1097, 3, N'-1,1066,1097,1099', 1, 0, -1, N'Event 2', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-07-10T19:27:22.127' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1100, N'94025279-1d37-41cc-88bb-e2a7e6ae3642', 1097, 3, N'-1,1066,1097,1100', 2, 0, -1, N'Event 3', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-07-10T19:27:22.230' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1101, N'e749557d-375a-44a1-b295-c9ee94a1c92a', 1097, 3, N'-1,1066,1097,1101', 3, 0, -1, N'Event Single', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-07-10T19:27:22.333' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1102, N'2b8cbb8b-49ed-48dd-ae06-06826b8e3441', 1066, 2, N'-1,1066,1102', 16, 0, -1, N'about', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-07-10T19:27:22.393' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1103, N'd1631a7c-4160-40ce-8b01-fb954cbe108e', 1102, 3, N'-1,1066,1102,1103', 0, 0, -1, N'About Page', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-07-10T19:27:22.460' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1104, N'aa5bde5d-c2fe-4f6a-bbe2-59d876a86cdc', 1102, 3, N'-1,1066,1102,1104', 1, 0, -1, N'About Us', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-07-10T19:27:22.537' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1105, N'ebf78efc-11c3-499a-a0c5-627aa5607b62', 1102, 3, N'-1,1066,1102,1105', 2, 0, -1, N'Video Thumb', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-07-10T19:27:22.620' AS DateTime))
GO
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1106, N'cdcc31f6-1188-48a1-9c8a-401d204e9251', 1066, 2, N'-1,1066,1106', 17, 0, -1, N'teachers', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-07-10T19:27:22.677' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1107, N'ce41350c-1061-45cd-b6a6-58ec905996c7', 1106, 3, N'-1,1066,1106,1107', 0, 0, -1, N'Teacher 1', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-07-10T19:27:22.757' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1108, N'9940e5be-d0b2-49c0-b3e2-64bfb29b69af', 1106, 3, N'-1,1066,1106,1108', 1, 0, -1, N'Teacher 2', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-07-10T19:27:22.847' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1109, N'10eb6578-4aea-451d-8412-aadfad1f8da3', 1106, 3, N'-1,1066,1106,1109', 2, 0, -1, N'Teacher 3', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-07-10T19:27:22.967' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1110, N'720b9999-3d19-4dce-88d6-b3bac72720a6', 1066, 2, N'-1,1066,1110', 18, 0, -1, N'event-speakers', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-07-10T19:27:23.030' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1111, N'a17c8bfa-d3c2-416c-aaa2-8eb035be312f', 1110, 3, N'-1,1066,1110,1111', 0, 0, -1, N'Speaker 1', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-07-10T19:27:23.083' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1112, N'bbc85cc8-47cb-47f0-92fe-704d83cfae22', 1110, 3, N'-1,1066,1110,1112', 1, 0, -1, N'Speaker 2', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-07-10T19:27:23.163' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1113, N'2794ce8c-68ad-43c3-8117-4ceadc82cf1b', 1110, 3, N'-1,1066,1110,1113', 2, 0, -1, N'Speaker 3', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-07-10T19:27:23.247' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1114, N'03f2ee86-4a5b-4c1a-950b-42b7b55f69d4', 1110, 3, N'-1,1066,1110,1114', 3, 0, -1, N'Speaker 4', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-07-10T19:27:23.320' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1115, N'be3ae50e-e186-4bc7-b292-87662c4d1af2', 1066, 2, N'-1,1066,1115', 19, 0, -1, N'scholarship', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-07-10T19:27:23.393' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1116, N'91f8e36f-1561-4223-b4ee-49cb8b5962e7', 1115, 3, N'-1,1066,1115,1116', 0, 0, -1, N'Scholarship Item 1', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-07-10T19:27:23.437' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1117, N'36ee37e3-3498-46dd-83ab-f9250c3cab1f', 1115, 3, N'-1,1066,1115,1117', 1, 0, -1, N'Scholarship Item 2', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-07-10T19:27:23.533' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1118, N'a182d911-b849-4445-8787-c2a00abd1cf3', 1115, 3, N'-1,1066,1115,1118', 2, 0, -1, N'Scholarship Item 3', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-07-10T19:27:23.807' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1119, N'ba144ac9-5667-47e7-bcef-f53dcc14f53c', 1115, 3, N'-1,1066,1115,1119', 3, 0, -1, N'Scholarship', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-07-10T19:27:23.887' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1120, N'9f496902-d3fd-45b1-b044-4b4299b50a91', 1066, 2, N'-1,1066,1120', 20, 0, -1, N'research', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-07-10T19:27:23.940' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1121, N'3d1dce59-c096-4042-87df-b9beb885942d', 1120, 3, N'-1,1066,1120,1121', 0, 0, -1, N'Research 1', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-07-10T19:27:23.980' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1122, N'6afd3141-5c8c-450f-8bc6-a3c6678aaffe', 1120, 3, N'-1,1066,1120,1122', 1, 0, -1, N'Research 2', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-07-10T19:27:24.053' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1123, N'c4d62621-b29f-4686-ad01-eaa51abce011', 1120, 3, N'-1,1066,1120,1123', 2, 0, -1, N'Research 3', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-07-10T19:27:24.137' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1124, N'9c214c99-5671-4a01-8b0f-3e160010e2d9', 1120, 3, N'-1,1066,1120,1124', 3, 0, -1, N'Research 4', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-07-10T19:27:24.213' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1125, N'0c22d659-847f-45c6-8e7f-ce1ba4ba34ce', 1120, 3, N'-1,1066,1120,1125', 4, 0, -1, N'Research 5', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-07-10T19:27:24.313' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1126, N'2b6e9e70-1ecc-4b31-aceb-42491c73a7b6', 1120, 3, N'-1,1066,1120,1126', 5, 0, -1, N'Research 6', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(N'2022-07-10T19:27:24.390' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1127, N'e6604863-c8f6-4f9a-a6de-f41b1877c6b3', 1058, 2, N'-1,1058,1127', 0, 0, -1, N'Notices', N'2f7a2769-6b0b-4468-90dd-af42d64f7f16', CAST(N'2022-07-10T19:34:25.833' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1128, N'18f1e07b-84a7-41d7-9e64-37e5fca305fe', 1058, 2, N'-1,1058,1128', 0, 0, -1, N'Researches', N'2f7a2769-6b0b-4468-90dd-af42d64f7f16', CAST(N'2022-07-10T19:34:36.157' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1129, N'cd97cf88-f780-4828-b88a-b3336d8d11a0', 1058, 2, N'-1,1058,1129', 0, 0, -1, N'Scholarships', N'2f7a2769-6b0b-4468-90dd-af42d64f7f16', CAST(N'2022-07-10T19:34:50.130' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1130, N'ceedbf00-7059-4680-9f0d-46039f1084c2', 1058, 2, N'-1,1058,1130', 0, 0, -1, N'About', N'2f7a2769-6b0b-4468-90dd-af42d64f7f16', CAST(N'2022-07-10T19:35:06.623' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1131, N'bdc79915-b2a9-4b7b-a2fd-3336be97f0e2', 1058, 2, N'-1,1058,1131', 0, 0, -1, N'Courses', N'2f7a2769-6b0b-4468-90dd-af42d64f7f16', CAST(N'2022-07-10T19:35:18.230' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1132, N'759365dc-7832-4d66-9bf7-fa5f6485d2d6', 1058, 2, N'-1,1058,1132', 0, 0, -1, N'Events', N'2f7a2769-6b0b-4468-90dd-af42d64f7f16', CAST(N'2022-07-10T19:35:30.290' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1133, N'661f46d8-ca6c-4f0d-a998-66f6d5f50e97', 1058, 2, N'-1,1058,1133', 0, 0, -1, N'Blogs', N'2f7a2769-6b0b-4468-90dd-af42d64f7f16', CAST(N'2022-07-10T19:35:44.653' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1134, N'232a07b5-4f33-453d-a435-658fb1e8ecd7', 1058, 2, N'-1,1058,1134', 0, 0, -1, N'Teachers', N'2f7a2769-6b0b-4468-90dd-af42d64f7f16', CAST(N'2022-07-10T19:36:02.810' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1135, N'708003a6-aafb-4f8e-89f8-a38d52ef849f', 1058, 2, N'-1,1058,1135', 0, 0, -1, N'Contact', N'2f7a2769-6b0b-4468-90dd-af42d64f7f16', CAST(N'2022-07-10T19:36:30.037' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1136, N'83b9c015-804c-4914-bf45-f881852d4d55', -1, 1, N'-1,1136', 0, 0, NULL, N'About', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2022-07-10T19:38:39.030' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1137, N'40a601fa-af3c-421f-a1be-719297ac2643', 1130, 3, N'-1,1058,1130,1137', 0, 0, -1, N'About', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2022-07-10T19:38:39.077' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1138, N'5c043f2b-b449-49a0-bfa1-ddb94454e915', -1, 1, N'-1,1138', 0, 0, NULL, N'Blog', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2022-07-10T19:39:05.283' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1139, N'b316534f-bb5e-40da-805c-4dda13612c3d', 1133, 3, N'-1,1058,1133,1139', 0, 0, -1, N'Blog', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2022-07-10T19:39:05.290' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1140, N'e00d4788-70ae-489a-947d-2cfbfddb0f3b', -1, 1, N'-1,1140', 0, 0, NULL, N'Blogs', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2022-07-10T19:39:41.867' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1141, N'176ecfe0-c537-44a7-ba6f-60dd42fa91d9', 1133, 3, N'-1,1058,1133,1141', 1, 0, -1, N'Blogs', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2022-07-10T19:39:41.903' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1142, N'285c1b5f-a981-4ea5-b16b-d4d1bf924d53', -1, 1, N'-1,1142', 0, 0, NULL, N'Contact US', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2022-07-10T19:41:06.557' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1143, N'd5893b57-db57-4d7d-8d75-f6dc8371ff1c', 1135, 3, N'-1,1058,1135,1143', 0, 0, -1, N'Contact US', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2022-07-10T19:41:06.583' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1144, N'714006dd-4644-47c4-a678-62a537f2307c', -1, 1, N'-1,1144', 0, 0, NULL, N'Courses', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2022-07-10T19:42:07.187' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1145, N'031af981-8792-4e11-9e24-c0987fc9120a', 1131, 3, N'-1,1058,1131,1145', 0, 0, -1, N'Courses', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2022-07-10T19:42:07.220' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1147, N'3a7582eb-60fa-4499-8b13-67936bcb8798', -1, 1, N'-1,1147', 0, 0, NULL, N'Courses', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2022-07-10T19:44:54.290' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1149, N'0f41bf9f-eede-430a-9c6a-86c35d382191', -1, 1, N'-1,1149', 0, 0, NULL, N'Course', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2022-07-10T19:45:21.530' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1150, N'eb6f70f7-bb1a-4ada-903b-8d8a9d3da634', 1131, 3, N'-1,1058,1131,1150', 1, 0, -1, N'Course', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2022-07-10T19:45:21.540' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1151, N'6c04975c-03fc-405c-9590-e51b9e447aec', -1, 1, N'-1,1151', 0, 0, NULL, N'Notice', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2022-07-10T19:46:25.183' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1152, N'4bd9fdeb-b004-493e-852f-aabb0a0b035e', 1127, 3, N'-1,1058,1127,1152', 0, 0, -1, N'Notice', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2022-07-10T19:46:25.210' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1153, N'3a0aaa53-5c21-4a0a-961c-3d084a0d9e1e', -1, 1, N'-1,1153', 0, 0, NULL, N'Research', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2022-07-10T19:47:16.087' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1154, N'8e1b06f2-a0ee-40f4-8107-8968af80db27', 1128, 3, N'-1,1058,1128,1154', 0, 0, -1, N'Research', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2022-07-10T19:47:16.110' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1155, N'9dd511e8-f386-4f03-be04-27b9d43480cb', -1, 1, N'-1,1155', 0, 0, NULL, N'Scholarships', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2022-07-10T19:48:48.210' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1156, N'bec04aff-3c20-4fd8-a233-9de680fab684', 1129, 3, N'-1,1058,1129,1156', 0, 0, -1, N'Scholarships', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2022-07-10T19:48:48.247' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1157, N'd343c912-ac5c-49fb-bf5e-17982f5dc933', -1, 1, N'-1,1157', 41, 0, -1, N'List View - scholarships', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-07-10T19:49:16.527' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1158, N'a17b445a-32ba-49b1-9cc7-393a786ab985', -1, 1, N'-1,1158', 42, 0, -1, N'List View - teachers', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-07-10T19:50:08.170' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1159, N'56aabe10-3898-4b8a-863a-42f267c52e2a', -1, 1, N'-1,1159', 0, 0, NULL, N'Teachers', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2022-07-10T19:50:37.707' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1160, N'47e63b63-2f4e-4fd8-9dd4-26c533584388', 1134, 3, N'-1,1058,1134,1160', 0, 0, -1, N'Teachers', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2022-07-10T19:50:37.730' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1161, N'1643f392-c1ff-4415-84f2-1437cb6875a5', -1, 1, N'-1,1161', 0, 0, NULL, N'Teacher', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2022-07-10T19:51:17.440' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1162, N'd3cd095a-9bab-436b-bd88-16ca309778b0', 1134, 3, N'-1,1058,1134,1162', 1, 0, -1, N'Teacher', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2022-07-10T19:51:17.487' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1163, N'46638c1e-130c-40e1-92e1-83f33a6c35cd', -1, 1, N'-1,1163', 0, 0, NULL, N'Scholership', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2022-07-10T19:51:51.017' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1164, N'ca0a3f3f-9573-4061-a922-24af6685f9d2', 1129, 3, N'-1,1058,1129,1164', 1, 0, -1, N'Scholarship', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2022-07-10T19:51:51.033' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1165, N'2eeec388-4fb1-4d26-b5d3-db23ebd26c8e', 1056, 2, N'-1,1056,1165', 1, 0, -1, N'Redirection', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2022-07-10T20:31:12.190' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1166, N'5d9b1407-a035-4466-ab15-41443a9be1a2', -1, 1, N'-1,1166', 0, 0, NULL, N'Researches', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2022-07-10T20:33:19.563' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1167, N'3a0eda12-b37a-41be-a3e7-e51ad498b80e', 1128, 3, N'-1,1058,1128,1167', 1, 0, -1, N'Researches', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2022-07-10T20:33:19.593' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1168, N'af6d7990-9bb6-4573-bfca-dd2ae16a89fe', -1, 1, N'-1,1168', 43, 0, -1, N'List View - researches', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-07-10T20:33:30.960' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1169, N'18a8d858-fe44-44cd-944a-4df1204fac18', -1, 1, N'-1,1169', 44, 0, -1, N'List View - notices', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-07-10T20:35:15.233' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1170, N'a4303988-99ee-4236-8669-4e7fae18ec71', -1, 1, N'-1,1170', 0, 0, NULL, N'Notices', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2022-07-10T20:35:53.767' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1171, N'355050c5-ba63-4cc6-a6f6-ef2742631b69', 1127, 3, N'-1,1058,1127,1171', 1, 0, -1, N'Notices', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2022-07-10T20:35:53.787' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1172, N'0ab44cb6-4a4b-488c-854f-72adece69352', -1, 1, N'-1,1172', 44, 0, -1, N'List View - courses', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-07-10T20:37:34.227' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1173, N'fc5eb690-d5ac-4b3b-a747-2f3480aa027e', -1, 1, N'-1,1173', 0, 0, NULL, N'Events', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2022-07-10T20:38:43.680' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1174, N'b6e42235-9c25-4793-911c-7c24d6954ad1', 1132, 3, N'-1,1058,1132,1174', 0, 0, -1, N'Events', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2022-07-10T20:38:43.703' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1175, N'00dcfca8-1584-41c9-91dc-766bbde18d74', -1, 1, N'-1,1175', 45, 0, -1, N'List View - events', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-07-10T20:38:46.827' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1176, N'ccfa7a9e-df5e-4021-ae08-7c432c81107d', -1, 1, N'-1,1176', 0, 0, NULL, N'Event', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2022-07-10T20:39:34.237' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1177, N'b360c5de-caa8-49c0-b6a4-f1025648c5f7', 1132, 3, N'-1,1058,1132,1177', 1, 0, -1, N'Event', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2022-07-10T20:39:34.270' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1178, N'0bcd41e8-747d-43c0-9b70-c12aa35a3d0c', -1, 1, N'-1,1178', 46, 0, -1, N'List View - newsLetter', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-07-10T20:41:53.727' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1179, N'552be6a4-62e5-46cb-ac43-f0c6ffd64919', 1055, 2, N'-1,1055,1179', 1, 0, -1, N'News Letter', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2022-07-10T20:42:30.483' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1180, N'7d63c477-836e-4954-8795-39370a161220', 1056, 2, N'-1,1056,1180', 2, 0, -1, N'NewsLetter Subscriber', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2022-07-10T20:44:33.713' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1181, N'6ff22dd5-af9a-4363-8aaf-6152f7b0511d', -1, 1, N'-1,1181', 47, 0, -1, N'NewsLetter Subscribers', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-07-10T20:48:12.407' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1182, N'4c3e67a9-6383-4d75-956e-973586a37315', 1057, 2, N'-1,1057,1182', 0, 0, -1, N'Menu', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2022-07-10T21:37:29.027' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1183, N'ee4f7a03-5dfd-4321-b04c-338fc79000da', -1, 1, N'-1,1183', 48, 0, -1, N'Footer Menu', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-07-10T21:39:03.287' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1184, N'f97165d2-c485-4d5f-9401-6d9e6a0aae4b', 1057, 2, N'-1,1057,1184', 1, 0, -1, N'Detailed Menu', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2022-07-10T21:50:55.887' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1185, N'071ecdd8-a159-49a4-974a-8fe391e4afbb', -1, 1, N'-1,1185', 49, 0, -1, N'Social Media Menu', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-07-10T21:55:30.677' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1186, N'754578e7-1ce1-4d14-8b94-57777a2340f9', 1062, 2, N'-1,1062,1186', 1, 0, -1, N'About', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2022-07-10T21:58:00.473' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1187, N'738f46fb-472a-45c2-9f4b-cac810fa1de8', 1062, 2, N'-1,1062,1187', 4, 0, -1, N'Blogs', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2022-07-10T21:58:21.753' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1188, N'a6904086-1ac1-4738-8a27-801d637147aa', 1062, 2, N'-1,1062,1188', 2, 0, -1, N'Courses', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2022-07-10T21:58:33.043' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1189, N'619ab688-2066-434a-8e1e-58bc11a3118d', 1062, 2, N'-1,1062,1189', 7, 0, -1, N'Scholarships', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2022-07-10T21:58:58.780' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1190, N'9e43eedb-11f5-4a2c-8396-dd472258a4f0', -1, 1, N'-1,1190', 50, 0, -1, N'List View - blogs', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-07-10T21:59:19.167' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1191, N'9f465a83-61c7-422c-b89b-a8aeb5e2f977', 1062, 2, N'-1,1062,1191', 5, 0, -1, N'Teachers', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2022-07-10T22:00:10.780' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1192, N'9e25c120-c7d5-4b55-b0ec-44544babf1cd', 1062, 2, N'-1,1062,1192', 6, 0, -1, N'Contact Us', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2022-07-10T22:00:22.363' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1193, N'fd7b9ce1-b24d-440a-90cf-13fd1ee44517', 1062, 2, N'-1,1062,1193', 3, 0, -1, N'Events', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2022-07-10T22:00:34.910' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1194, N'81a60352-95c0-42c4-a29c-ab7b7f8e839c', 1062, 2, N'-1,1062,1194', 9, 0, -1, N'Notices', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2022-07-10T22:00:46.477' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1195, N'e253f99f-5d3e-4425-ac2c-2a9ada634df8', 1062, 2, N'-1,1062,1195', 8, 0, -1, N'Researches', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2022-07-10T22:01:01.567' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1196, N'504f9f59-5c6b-454b-9f8d-e3096deb4e2a', 1058, 2, N'-1,1058,1196', 0, 0, -1, N'Home', N'2f7a2769-6b0b-4468-90dd-af42d64f7f16', CAST(N'2022-07-10T22:59:38.990' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1197, N'21d6e246-ca2d-4461-922e-f3ebf39bbc7d', -1, 1, N'-1,1197', 0, 0, NULL, N'Home', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(N'2022-07-10T23:00:10.223' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1198, N'94cad414-c114-44a9-b48a-f70a3ad7ac46', 1196, 3, N'-1,1058,1196,1198', 0, 0, -1, N'Home', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2022-07-10T23:00:10.263' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1199, N'9e0e6a37-fea7-4b39-80ea-5fedb72a4d4e', 1062, 2, N'-1,1062,1199', 0, 0, -1, N'Home', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2022-07-10T23:01:12.613' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1200, N'af71726b-5dfb-4c40-a024-0b0d562472fa', 1062, 2, N'-1,1062,1200', 10, 0, -1, N'NewsLetter', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2022-07-11T00:19:25.703' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1201, N'ff7a9ec2-85c2-486c-86a7-5b99a8f16487', 1200, 3, N'-1,1062,1200,1201', 0, 0, -1, N'Mohammed', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2022-07-11T00:19:49.953' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1202, N'0fd82594-c1f7-4860-abd5-591b11d74546', -1, 1, N'-1,1202', 51, 0, -1, N'ourTeachers - Treepicker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-07-11T14:21:12.650' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1203, N'4dd39646-245f-40a3-b4cb-978d51229df8', -1, 1, N'-1,1203', 52, 0, -1, N'Full Rich Text Editor', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-07-11T14:24:24.953' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1204, N'59a92be6-a423-4f38-8c89-4159b0cffc4c', -1, 1, N'-1,1204', 53, 0, -1, N'Repeatable textstrings', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-07-11T14:33:02.113' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1205, N'330155bf-08ac-4dfa-ac32-111c96e75ada', -1, 1, N'-1,1205', 54, 0, -1, N'relatedCourses - Treepicker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-07-11T14:34:18.503' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1206, N'3fda9d3a-9b8c-4aad-be2e-be2aa261db5b', 1191, 3, N'-1,1062,1191,1206', 0, 0, -1, N'John Doe', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2022-07-11T14:44:14.900' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1207, N'c85d4572-3cbf-428e-9204-f7efa6589dc5', 1191, 3, N'-1,1062,1191,1207', 1, 0, -1, N'Clark Malik', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2022-07-11T14:44:40.890' AS DateTime))
GO
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1208, N'fae7caa4-0637-481f-925c-d5205568d8ca', 1191, 3, N'-1,1062,1191,1208', 2, 0, -1, N'Jacke Masito', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2022-07-11T14:44:47.833' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1209, N'904cbdbb-174e-4ca2-a8b7-e22c53fd515a', 1188, 3, N'-1,1062,1188,1209', 0, 0, -1, N'Photography', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2022-07-11T14:50:41.277' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1210, N'2e9e9214-b73c-4f29-9206-19db2b1443eb', 1188, 3, N'-1,1062,1188,1210', 1, 0, -1, N'Programming', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2022-07-11T14:50:54.893' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1211, N'6265f2fb-f58c-4f27-bdca-dd90ed9f3ccd', 1188, 3, N'-1,1062,1188,1211', 2, 0, -1, N'Lifestyle Archives', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(N'2022-07-11T14:51:01.517' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1212, N'b7f76e5f-f70e-4cfa-a3fe-c0d6ef055b92', 1057, 2, N'-1,1057,1212', 2, 0, -1, N'Slid', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2022-07-11T17:09:56.033' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1213, N'3ca843e8-16c4-4883-ad82-6fac841a6b23', -1, 1, N'-1,1213', 55, 0, -1, N'Slider', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(N'2022-07-11T17:11:40.440' AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [uniqueId], [parentId], [level], [path], [sortOrder], [trashed], [nodeUser], [text], [nodeObjectType], [createDate]) VALUES (1214, N'79232e9b-23ae-414a-a4f0-68162778aec4', 1056, 2, N'-1,1056,1214', 3, 0, -1, N'Banner', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(N'2022-07-11T17:25:51.563' AS DateTime))
SET IDENTITY_INSERT [dbo].[umbracoNode] OFF
GO
SET IDENTITY_INSERT [dbo].[umbracoPropertyData] ON 

INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (1, 1, 52, 1, NULL, NULL, NULL, NULL, N'Code Book', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (2, 2, 52, 1, NULL, NULL, NULL, NULL, N'Code Book', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (3, 4, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/ecte4lmu/about-us.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (4, 4, 7, NULL, NULL, 816, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (5, 4, 8, NULL, NULL, 504, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (6, 4, 9, NULL, NULL, NULL, NULL, NULL, N'63364', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (7, 4, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (8, 5, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/aminqgvi/course-1.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (9, 5, 7, NULL, NULL, 371, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (10, 5, 8, NULL, NULL, 308, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (11, 5, 9, NULL, NULL, NULL, NULL, NULL, N'39340', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (12, 5, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (13, 6, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/tehgqmij/course-2.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (14, 6, 7, NULL, NULL, 371, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (15, 6, 8, NULL, NULL, 308, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (16, 6, 9, NULL, NULL, NULL, NULL, NULL, N'18206', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (17, 6, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (18, 7, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/r3fpyctn/course-3.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (19, 7, 7, NULL, NULL, 371, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (20, 7, 8, NULL, NULL, 308, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (21, 7, 9, NULL, NULL, NULL, NULL, NULL, N'24690', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (22, 7, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (23, 8, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/jnybixq2/event-1.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (24, 8, 7, NULL, NULL, 372, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (25, 8, 8, NULL, NULL, 318, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (26, 8, 9, NULL, NULL, NULL, NULL, NULL, N'32332', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (27, 8, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (28, 9, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/1cnleu32/event-2.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (29, 9, 7, NULL, NULL, 372, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (30, 9, 8, NULL, NULL, 318, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (31, 9, 9, NULL, NULL, NULL, NULL, NULL, N'43174', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (32, 9, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (33, 10, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/dmpjluyj/event-3.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (34, 10, 7, NULL, NULL, 372, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (35, 10, 8, NULL, NULL, 318, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (36, 10, 9, NULL, NULL, NULL, NULL, NULL, N'28885', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (37, 10, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (38, 11, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/hvbkcv1w/favicon.png"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (39, 11, 7, NULL, NULL, 60, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (40, 11, 8, NULL, NULL, 68, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (41, 11, 9, NULL, NULL, NULL, NULL, NULL, N'2121', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (42, 11, 10, NULL, NULL, NULL, NULL, NULL, N'png', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (43, 12, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/45okl5vk/logo.png"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (44, 12, 7, NULL, NULL, 200, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (45, 12, 8, NULL, NULL, 68, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (46, 12, 9, NULL, NULL, NULL, NULL, NULL, N'4669', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (47, 12, 10, NULL, NULL, NULL, NULL, NULL, N'png', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (48, 13, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/k4dl5n5j/preloader.gif"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (49, 13, 7, NULL, NULL, 400, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (50, 13, 8, NULL, NULL, 300, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (51, 13, 9, NULL, NULL, NULL, NULL, NULL, N'20936', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (52, 13, 10, NULL, NULL, NULL, NULL, NULL, N'gif', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (53, 14, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/xdop2b4h/teacher.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (54, 14, 7, NULL, NULL, 85, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (55, 14, 8, NULL, NULL, 85, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (56, 14, 9, NULL, NULL, NULL, NULL, NULL, N'3576', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (57, 14, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (58, 16, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/izinkj5v/page-title.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (59, 16, 7, NULL, NULL, 1600, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (60, 16, 8, NULL, NULL, 508, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (61, 16, 9, NULL, NULL, NULL, NULL, NULL, N'42727', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (62, 16, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (63, 17, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/nb5bcicp/success-story.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (64, 17, 7, NULL, NULL, 1280, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (65, 17, 8, NULL, NULL, 1183, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (66, 17, 9, NULL, NULL, NULL, NULL, NULL, N'247809', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (67, 17, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (68, 19, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/rkefygua/banner-1.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (69, 19, 7, NULL, NULL, 1600, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (70, 19, 8, NULL, NULL, 834, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (71, 19, 9, NULL, NULL, NULL, NULL, NULL, N'241488', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (72, 19, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (73, 20, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/wtqk3oq0/banner-feature.png"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (74, 20, 7, NULL, NULL, 591, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (75, 20, 8, NULL, NULL, 700, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (76, 20, 9, NULL, NULL, NULL, NULL, NULL, N'501171', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (77, 20, 10, NULL, NULL, NULL, NULL, NULL, N'png', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (78, 22, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/p2anvdn1/blog-single.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (79, 22, 7, NULL, NULL, 1172, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (80, 22, 8, NULL, NULL, 648, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (81, 22, 9, NULL, NULL, NULL, NULL, NULL, N'46620', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (82, 22, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (83, 23, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/3peff54x/post-1.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (84, 23, 7, NULL, NULL, 373, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (85, 23, 8, NULL, NULL, 252, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (86, 23, 9, NULL, NULL, NULL, NULL, NULL, N'7005', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (87, 23, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (88, 24, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/ul0nnu05/post-2.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (89, 24, 7, NULL, NULL, 373, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (90, 24, 8, NULL, NULL, 254, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (91, 24, 9, NULL, NULL, NULL, NULL, NULL, N'8676', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (92, 24, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (93, 25, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/hhcezn1t/post-3.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (94, 25, 7, NULL, NULL, 373, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (95, 25, 8, NULL, NULL, 251, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (96, 25, 9, NULL, NULL, NULL, NULL, NULL, N'7726', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (97, 25, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (98, 27, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/wuan5srb/course-1.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (99, 27, 7, NULL, NULL, 1165, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (100, 27, 8, NULL, NULL, 583, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (101, 27, 9, NULL, NULL, NULL, NULL, NULL, N'121416', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (102, 27, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (103, 28, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/myaffiqv/course-2.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (104, 28, 7, NULL, NULL, 371, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (105, 28, 8, NULL, NULL, 308, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (106, 28, 9, NULL, NULL, NULL, NULL, NULL, N'7250', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (107, 28, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (108, 29, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/cblnnyi0/course-3.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (109, 29, 7, NULL, NULL, 371, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (110, 29, 8, NULL, NULL, 308, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (111, 29, 9, NULL, NULL, NULL, NULL, NULL, N'9171', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (112, 29, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (113, 30, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/0kbpyoht/course-4.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (114, 30, 7, NULL, NULL, 371, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (115, 30, 8, NULL, NULL, 303, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (116, 30, 9, NULL, NULL, NULL, NULL, NULL, N'22948', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (117, 30, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (118, 31, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/ocyf152k/course-5.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (119, 31, 7, NULL, NULL, 371, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (120, 31, 8, NULL, NULL, 303, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (121, 31, 9, NULL, NULL, NULL, NULL, NULL, N'26413', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (122, 31, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (123, 32, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/arqos5s4/course-6.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (124, 32, 7, NULL, NULL, 371, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (125, 32, 8, NULL, NULL, 303, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (126, 32, 9, NULL, NULL, NULL, NULL, NULL, N'30228', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (127, 32, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (128, 33, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/obqhc1st/course-single.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (129, 33, 7, NULL, NULL, 1165, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (130, 33, 8, NULL, NULL, 583, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (131, 33, 9, NULL, NULL, NULL, NULL, NULL, N'40996', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (132, 33, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (133, 35, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/qfxh2hkp/event-1.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (134, 35, 7, NULL, NULL, 372, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (135, 35, 8, NULL, NULL, 318, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (136, 35, 9, NULL, NULL, NULL, NULL, NULL, N'9107', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (137, 35, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (138, 36, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/g5xp2jsf/event-2.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (139, 36, 7, NULL, NULL, 372, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (140, 36, 8, NULL, NULL, 318, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (141, 36, 9, NULL, NULL, NULL, NULL, NULL, N'10160', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (142, 36, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (143, 37, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/p3jaffbx/event-3.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (144, 37, 7, NULL, NULL, 372, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (145, 37, 8, NULL, NULL, 318, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (146, 37, 9, NULL, NULL, NULL, NULL, NULL, N'9654', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (147, 37, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (148, 38, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/pnkftz00/event-single.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (149, 38, 7, NULL, NULL, 1165, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (150, 38, 8, NULL, NULL, 583, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (151, 38, 9, NULL, NULL, NULL, NULL, NULL, N'121416', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (152, 38, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (153, 40, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/pinghula/about-page.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (154, 40, 7, NULL, NULL, 869, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (155, 40, 8, NULL, NULL, 461, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (156, 40, 9, NULL, NULL, NULL, NULL, NULL, N'105295', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (157, 40, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (158, 41, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/lppfxkx4/about-us.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (159, 41, 7, NULL, NULL, 816, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (160, 41, 8, NULL, NULL, 504, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (161, 41, 9, NULL, NULL, NULL, NULL, NULL, N'63364', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (162, 41, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (163, 42, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/5khpp04d/video-thumb.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (164, 42, 7, NULL, NULL, 540, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (165, 42, 8, NULL, NULL, 480, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (166, 42, 9, NULL, NULL, NULL, NULL, NULL, N'14887', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (167, 42, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (168, 44, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/bi0fdttb/teacher-1.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (169, 44, 7, NULL, NULL, 371, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (170, 44, 8, NULL, NULL, 418, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (171, 44, 9, NULL, NULL, NULL, NULL, NULL, N'30615', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (172, 44, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (173, 45, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/xdsfbgns/teacher-2.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (174, 45, 7, NULL, NULL, 371, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (175, 45, 8, NULL, NULL, 418, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (176, 45, 9, NULL, NULL, NULL, NULL, NULL, N'29056', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (177, 45, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (178, 46, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/pzspwehk/teacher-3.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (179, 46, 7, NULL, NULL, 371, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (180, 46, 8, NULL, NULL, 418, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (181, 46, 9, NULL, NULL, NULL, NULL, NULL, N'33190', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (182, 46, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (183, 48, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/5sfhzioc/speaker-1.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (184, 48, 7, NULL, NULL, 85, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (185, 48, 8, NULL, NULL, 85, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (186, 48, 9, NULL, NULL, NULL, NULL, NULL, N'1856', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (187, 48, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (188, 49, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/zzomro4l/speaker-2.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (189, 49, 7, NULL, NULL, 85, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (190, 49, 8, NULL, NULL, 85, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (191, 49, 9, NULL, NULL, NULL, NULL, NULL, N'1698', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (192, 49, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (193, 50, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/rlhjij3n/speaker-3.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (194, 50, 7, NULL, NULL, 85, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (195, 50, 8, NULL, NULL, 85, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (196, 50, 9, NULL, NULL, NULL, NULL, NULL, N'1759', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (197, 50, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (198, 51, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/qdxpea01/speaker-4.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (199, 51, 7, NULL, NULL, 85, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (200, 51, 8, NULL, NULL, 85, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (201, 51, 9, NULL, NULL, NULL, NULL, NULL, N'1691', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (202, 51, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (203, 53, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/nhrprelb/scholarship-item-1.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (204, 53, 7, NULL, NULL, 566, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (205, 53, 8, NULL, NULL, 424, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (206, 53, 9, NULL, NULL, NULL, NULL, NULL, N'16882', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (207, 53, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (208, 54, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/2u1p2nuy/scholarship-item-2.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (209, 54, 7, NULL, NULL, 628, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (210, 54, 8, NULL, NULL, 471, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (211, 54, 9, NULL, NULL, NULL, NULL, NULL, N'13672', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (212, 54, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (213, 55, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/c5mjfikj/scholarship-item-3.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (214, 55, 7, NULL, NULL, 568, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (215, 55, 8, NULL, NULL, 426, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (216, 55, 9, NULL, NULL, NULL, NULL, NULL, N'12328', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (217, 55, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (218, 56, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/z3fbjoth/scholarship.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (219, 56, 7, NULL, NULL, 1280, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (220, 56, 8, NULL, NULL, 853, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (221, 56, 9, NULL, NULL, NULL, NULL, NULL, N'34987', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (222, 56, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (223, 58, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/l5hb0pmw/research-1.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (224, 58, 7, NULL, NULL, 640, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (225, 58, 8, NULL, NULL, 400, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (226, 58, 9, NULL, NULL, NULL, NULL, NULL, N'12680', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (227, 58, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (228, 59, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/i2yp00um/research-2.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (229, 59, 7, NULL, NULL, 640, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (230, 59, 8, NULL, NULL, 400, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (231, 59, 9, NULL, NULL, NULL, NULL, NULL, N'12286', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (232, 59, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (233, 60, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/e2tnnre5/research-3.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (234, 60, 7, NULL, NULL, 580, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (235, 60, 8, NULL, NULL, 362, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (236, 60, 9, NULL, NULL, NULL, NULL, NULL, N'11629', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (237, 60, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (238, 61, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/t3gcdhdr/research-4.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (239, 61, 7, NULL, NULL, 576, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (240, 61, 8, NULL, NULL, 360, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (241, 61, 9, NULL, NULL, NULL, NULL, NULL, N'7200', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (242, 61, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (243, 62, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/l5lcedd5/research-5.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (244, 62, 7, NULL, NULL, 512, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (245, 62, 8, NULL, NULL, 320, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (246, 62, 9, NULL, NULL, NULL, NULL, NULL, N'7126', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (247, 62, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (248, 63, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'{"src":"/media/o0pg2k4m/research-6.jpg"}')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (249, 63, 7, NULL, NULL, 640, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (250, 63, 8, NULL, NULL, 400, NULL, NULL, NULL, NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (251, 63, 9, NULL, NULL, NULL, NULL, NULL, N'14646', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (252, 63, 10, NULL, NULL, NULL, NULL, NULL, N'jpg', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (253, 64, 52, 1, NULL, NULL, NULL, NULL, N'Code Book', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (254, 2, 53, 1, NULL, NULL, NULL, NULL, NULL, N'[]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (255, 64, 53, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"8f927ce9-327b-4193-a9ad-38b6a6e09e3d","mediaKey":"fea5dcf1-1faa-4fa4-b650-dbe1f1460833"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (258, 2, 60, 1, NULL, NULL, NULL, NULL, NULL, N'[{"name":"+44 300 303 0266","url":"callto:+443003030266"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (259, 64, 60, 1, NULL, NULL, NULL, NULL, NULL, N'[{"name":"+44 300 303 0266","url":"callto:+443003030266"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (260, 65, 52, 1, NULL, NULL, NULL, NULL, N'Code Book', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (261, 65, 53, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"8f927ce9-327b-4193-a9ad-38b6a6e09e3d","mediaKey":"fea5dcf1-1faa-4fa4-b650-dbe1f1460833"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (263, 65, 60, 1, NULL, NULL, NULL, NULL, NULL, N'[{"name":"+44 300 303 0266","url":"callto:+443003030266"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (264, 66, 52, 1, NULL, NULL, NULL, NULL, N'Code Book', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (265, 66, 53, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"8f927ce9-327b-4193-a9ad-38b6a6e09e3d","mediaKey":"fea5dcf1-1faa-4fa4-b650-dbe1f1460833"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (266, 66, 60, 1, NULL, NULL, NULL, NULL, NULL, N'[{"name":"+44 300 303 0266","url":"callto:+443003030266"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (267, 67, 52, 1, NULL, NULL, NULL, NULL, N'Code Book', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (268, 67, 53, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"8f927ce9-327b-4193-a9ad-38b6a6e09e3d","mediaKey":"fea5dcf1-1faa-4fa4-b650-dbe1f1460833"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (269, 67, 60, 1, NULL, NULL, NULL, NULL, NULL, N'[{"name":"+44 300 303 0266","url":"callto:+443003030266"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (270, 66, 68, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"b564509a-9116-4dcf-a728-e87c74954fa2","name":"Item 1","ncContentTypeAlias":"menu","menuTitle":"COMPANY","menuItems":null},{"key":"f02e646f-ebc1-449e-9767-eaaf8ec7df38","name":"Item 2","ncContentTypeAlias":"menu","menuTitle":"LINKS","menuItems":null},{"key":"4b080068-2601-4537-9706-4f528abe1afe","name":"Item 3","ncContentTypeAlias":"menu","menuTitle":"SUPPORT","menuItems":null},{"key":"65420287-072d-45ae-9bbb-b933b5f6f36a","name":"Item 4","ncContentTypeAlias":"menu","menuTitle":"RECOMMEND","menuItems":null}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (271, 67, 68, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"b564509a-9116-4dcf-a728-e87c74954fa2","name":"Item 1","ncContentTypeAlias":"menu","menuTitle":"COMPANY","menuItems":null},{"key":"f02e646f-ebc1-449e-9767-eaaf8ec7df38","name":"Item 2","ncContentTypeAlias":"menu","menuTitle":"LINKS","menuItems":null},{"key":"4b080068-2601-4537-9706-4f528abe1afe","name":"Item 3","ncContentTypeAlias":"menu","menuTitle":"SUPPORT","menuItems":null},{"key":"65420287-072d-45ae-9bbb-b933b5f6f36a","name":"Item 4","ncContentTypeAlias":"menu","menuTitle":"RECOMMEND","menuItems":null}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (272, 68, 52, 1, NULL, NULL, NULL, NULL, N'Code Book', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (273, 68, 53, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"8f927ce9-327b-4193-a9ad-38b6a6e09e3d","mediaKey":"fea5dcf1-1faa-4fa4-b650-dbe1f1460833"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (274, 68, 60, 1, NULL, NULL, NULL, NULL, NULL, N'[{"name":"+44 300 303 0266","url":"callto:+443003030266"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (275, 68, 68, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"b564509a-9116-4dcf-a728-e87c74954fa2","name":"COMPANY","ncContentTypeAlias":"menu","menuTitle":"COMPANY","menuItems":null},{"key":"f02e646f-ebc1-449e-9767-eaaf8ec7df38","name":"LINKS","ncContentTypeAlias":"menu","menuTitle":"LINKS","menuItems":null},{"key":"4b080068-2601-4537-9706-4f528abe1afe","name":"SUPPORT","ncContentTypeAlias":"menu","menuTitle":"SUPPORT","menuItems":null},{"key":"65420287-072d-45ae-9bbb-b933b5f6f36a","name":"RECOMMEND","ncContentTypeAlias":"menu","menuTitle":"RECOMMEND","menuItems":null}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (280, 75, 52, 1, NULL, NULL, NULL, NULL, N'Scholarships', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (281, 76, 52, 1, NULL, NULL, NULL, NULL, N'Scholarships', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (282, 77, 52, 1, NULL, NULL, NULL, NULL, N'Teachers', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (283, 78, 52, 1, NULL, NULL, NULL, NULL, N'Teachers', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (286, 81, 52, 1, NULL, NULL, NULL, NULL, N'Events', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (287, 82, 52, 1, NULL, NULL, NULL, NULL, N'Events', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (288, 83, 52, 1, NULL, NULL, NULL, NULL, N'Notices', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (289, 84, 52, 1, NULL, NULL, NULL, NULL, N'Notices', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (290, 85, 52, 1, NULL, NULL, NULL, NULL, N'Researches', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (291, 86, 52, 1, NULL, NULL, NULL, NULL, N'Researches', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (292, 87, 52, 1, NULL, NULL, NULL, NULL, N'Code Book', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (293, 87, 53, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"8f927ce9-327b-4193-a9ad-38b6a6e09e3d","mediaKey":"fea5dcf1-1faa-4fa4-b650-dbe1f1460833"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (294, 87, 60, 1, NULL, NULL, NULL, NULL, NULL, N'[{"name":"+44 300 303 0266","url":"callto:+443003030266"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (295, 87, 68, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"b564509a-9116-4dcf-a728-e87c74954fa2","name":"COMPANY","ncContentTypeAlias":"menu","menuTitle":"COMPANY","menuItems":null},{"key":"f02e646f-ebc1-449e-9767-eaaf8ec7df38","name":"LINKS","ncContentTypeAlias":"menu","menuTitle":"LINKS","menuItems":null},{"key":"4b080068-2601-4537-9706-4f528abe1afe","name":"SUPPORT","ncContentTypeAlias":"menu","menuTitle":"SUPPORT","menuItems":null},{"key":"65420287-072d-45ae-9bbb-b933b5f6f36a","name":"RECOMMEND","ncContentTypeAlias":"menu","menuTitle":"RECOMMEND","menuItems":null}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (296, 68, 59, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"16aa8042-2770-4c16-a5cd-b432a1afd540","name":"FaceBook","ncContentTypeAlias":"detailedMenu","itemName":"FaceBook","itemIcon":null,"itemURL":null},{"key":"8f91a3fe-7605-4a81-b98a-ebbccfcc508b","name":"Twitter","ncContentTypeAlias":"detailedMenu","itemName":"Twitter","itemIcon":null,"itemURL":null}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (297, 87, 59, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"16aa8042-2770-4c16-a5cd-b432a1afd540","name":"FaceBook","ncContentTypeAlias":"detailedMenu","itemName":"FaceBook","itemIcon":null,"itemURL":null},{"key":"8f91a3fe-7605-4a81-b98a-ebbccfcc508b","name":"Twitter","ncContentTypeAlias":"detailedMenu","itemName":"Twitter","itemIcon":null,"itemURL":null}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (298, 88, 52, 1, NULL, NULL, NULL, NULL, N'Code Book', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (299, 88, 53, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"8f927ce9-327b-4193-a9ad-38b6a6e09e3d","mediaKey":"fea5dcf1-1faa-4fa4-b650-dbe1f1460833"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (300, 87, 54, 1, NULL, NULL, NULL, NULL, NULL, N'[{"name":"Scholarships","udi":"umb://document/619ab6882066434a8e1e58bc11a3118d"},{"name":"Researches","udi":"umb://document/e253f99f5d3e4425ac2c2a9ada634df8"},{"name":"Notices","udi":"umb://document/81a6035295c042c4a29cab7b7f8e839c"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (301, 88, 54, 1, NULL, NULL, NULL, NULL, NULL, N'[{"name":"Scholarships","udi":"umb://document/619ab6882066434a8e1e58bc11a3118d"},{"name":"Researches","udi":"umb://document/e253f99f5d3e4425ac2c2a9ada634df8"},{"name":"Notices","udi":"umb://document/81a6035295c042c4a29cab7b7f8e839c"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (302, 87, 55, 1, NULL, NULL, NULL, NULL, NULL, N'[{"name":"About","udi":"umb://document/754578e71ce14d148b9457777a2340f9"},{"name":"Courses","udi":"umb://document/a69040861ac147388a27801d637147aa"},{"name":"Events","udi":"umb://document/fd7b9ce1b24d440a90cf13fd1ee44517"},{"name":"Blogs","udi":"umb://document/738f46fb472a45c29f4bcac810fa1de8"},{"name":"Teachers","udi":"umb://document/9f465a8361c7422cb89ba8aeb5e2f977"},{"name":"Contact Us","udi":"umb://document/9e25c120c7d54b55b0ec44544babf1cd"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (303, 88, 55, 1, NULL, NULL, NULL, NULL, NULL, N'[{"name":"About","udi":"umb://document/754578e71ce14d148b9457777a2340f9"},{"name":"Courses","udi":"umb://document/a69040861ac147388a27801d637147aa"},{"name":"Events","udi":"umb://document/fd7b9ce1b24d440a90cf13fd1ee44517"},{"name":"Blogs","udi":"umb://document/738f46fb472a45c29f4bcac810fa1de8"},{"name":"Teachers","udi":"umb://document/9f465a8361c7422cb89ba8aeb5e2f977"},{"name":"Contact Us","udi":"umb://document/9e25c120c7d54b55b0ec44544babf1cd"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (304, 88, 60, 1, NULL, NULL, NULL, NULL, NULL, N'[{"name":"+44 300 303 0266","url":"callto:+443003030266"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (305, 88, 68, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"b564509a-9116-4dcf-a728-e87c74954fa2","name":"COMPANY","ncContentTypeAlias":"menu","menuTitle":"COMPANY","menuItems":null},{"key":"f02e646f-ebc1-449e-9767-eaaf8ec7df38","name":"LINKS","ncContentTypeAlias":"menu","menuTitle":"LINKS","menuItems":null},{"key":"4b080068-2601-4537-9706-4f528abe1afe","name":"SUPPORT","ncContentTypeAlias":"menu","menuTitle":"SUPPORT","menuItems":null},{"key":"65420287-072d-45ae-9bbb-b933b5f6f36a","name":"RECOMMEND","ncContentTypeAlias":"menu","menuTitle":"RECOMMEND","menuItems":null}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (306, 88, 59, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"16aa8042-2770-4c16-a5cd-b432a1afd540","name":"FaceBook","ncContentTypeAlias":"detailedMenu","itemName":"FaceBook","itemIcon":null,"itemURL":null},{"key":"8f91a3fe-7605-4a81-b98a-ebbccfcc508b","name":"Twitter","ncContentTypeAlias":"detailedMenu","itemName":"Twitter","itemIcon":null,"itemURL":null}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (307, 89, 52, 1, NULL, NULL, NULL, NULL, N'Scholarships', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (308, 90, 52, 1, NULL, NULL, NULL, NULL, N'Code Book', NULL)
GO
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (309, 90, 53, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"8f927ce9-327b-4193-a9ad-38b6a6e09e3d","mediaKey":"fea5dcf1-1faa-4fa4-b650-dbe1f1460833"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (310, 90, 54, 1, NULL, NULL, NULL, NULL, NULL, N'[{"name":"Scholarships","udi":"umb://document/619ab6882066434a8e1e58bc11a3118d"},{"name":"Researches","udi":"umb://document/e253f99f5d3e4425ac2c2a9ada634df8"},{"name":"Notices","udi":"umb://document/81a6035295c042c4a29cab7b7f8e839c"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (311, 90, 55, 1, NULL, NULL, NULL, NULL, NULL, N'[{"name":"About","udi":"umb://document/754578e71ce14d148b9457777a2340f9"},{"name":"Courses","udi":"umb://document/a69040861ac147388a27801d637147aa"},{"name":"Events","udi":"umb://document/fd7b9ce1b24d440a90cf13fd1ee44517"},{"name":"Blogs","udi":"umb://document/738f46fb472a45c29f4bcac810fa1de8"},{"name":"Teachers","udi":"umb://document/9f465a8361c7422cb89ba8aeb5e2f977"},{"name":"Contact Us","udi":"umb://document/9e25c120c7d54b55b0ec44544babf1cd"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (312, 90, 60, 1, NULL, NULL, NULL, NULL, NULL, N'[{"name":"+44 300 303 0266","url":"callto:+443003030266"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (313, 88, 63, 1, NULL, NULL, NULL, NULL, N'23621 15 Mile Rd #C104, Clinton MI, 48035, New York, USA', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (314, 90, 63, 1, NULL, NULL, NULL, NULL, N'23621 15 Mile Rd #C104, Clinton MI, 48035, New York, USA', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (315, 88, 64, 1, NULL, NULL, NULL, NULL, N'+1 (2) 345 6789', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (316, 90, 64, 1, NULL, NULL, NULL, NULL, N'+1 (2) 345 6789', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (317, 88, 65, 1, NULL, NULL, NULL, NULL, N'+1 (2) 345 6789', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (318, 90, 65, 1, NULL, NULL, NULL, NULL, N'+1 (2) 345 6789', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (319, 88, 66, 1, NULL, NULL, NULL, NULL, N'contact@CodeBook.edu', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (320, 90, 66, 1, NULL, NULL, NULL, NULL, N'contact@CodeBook.edu', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (321, 90, 68, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"b564509a-9116-4dcf-a728-e87c74954fa2","name":"COMPANY","ncContentTypeAlias":"menu","menuTitle":"COMPANY","menuItems":null},{"key":"f02e646f-ebc1-449e-9767-eaaf8ec7df38","name":"LINKS","ncContentTypeAlias":"menu","menuTitle":"LINKS","menuItems":null},{"key":"4b080068-2601-4537-9706-4f528abe1afe","name":"SUPPORT","ncContentTypeAlias":"menu","menuTitle":"SUPPORT","menuItems":null},{"key":"65420287-072d-45ae-9bbb-b933b5f6f36a","name":"RECOMMEND","ncContentTypeAlias":"menu","menuTitle":"RECOMMEND","menuItems":null}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (322, 90, 59, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"16aa8042-2770-4c16-a5cd-b432a1afd540","name":"FaceBook","ncContentTypeAlias":"detailedMenu","itemName":"FaceBook","itemIcon":null,"itemURL":null},{"key":"8f91a3fe-7605-4a81-b98a-ebbccfcc508b","name":"Twitter","ncContentTypeAlias":"detailedMenu","itemName":"Twitter","itemIcon":null,"itemURL":null},{"key":"3cc9540e-5c3b-42bf-aea4-b3e5265b31e8","name":"Linkedin","ncContentTypeAlias":"detailedMenu","itemName":"Linkedin","itemIcon":null,"itemURL":null},{"key":"a8fcf10b-52c9-4032-825e-b6ed539a994b","name":"Instgram","ncContentTypeAlias":"detailedMenu","itemName":"Instgram","itemIcon":null,"itemURL":null}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (324, 71, 52, 1, NULL, NULL, NULL, NULL, N'Blogs', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (325, 72, 52, 1, NULL, NULL, NULL, NULL, N'Blogs', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (326, 69, 52, 1, NULL, NULL, NULL, NULL, N'About', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (327, 70, 52, 1, NULL, NULL, NULL, NULL, N'About', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (328, 91, 52, 1, NULL, NULL, NULL, NULL, N'About', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (329, 92, 52, 1, NULL, NULL, NULL, NULL, N'Code Book', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (330, 92, 53, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"8f927ce9-327b-4193-a9ad-38b6a6e09e3d","mediaKey":"fea5dcf1-1faa-4fa4-b650-dbe1f1460833"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (331, 92, 54, 1, NULL, NULL, NULL, NULL, NULL, N'[{"name":"Scholarships","udi":"umb://document/619ab6882066434a8e1e58bc11a3118d"},{"name":"Researches","udi":"umb://document/e253f99f5d3e4425ac2c2a9ada634df8"},{"name":"Notices","udi":"umb://document/81a6035295c042c4a29cab7b7f8e839c"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (332, 92, 55, 1, NULL, NULL, NULL, NULL, NULL, N'[{"name":"About","udi":"umb://document/754578e71ce14d148b9457777a2340f9"},{"name":"Courses","udi":"umb://document/a69040861ac147388a27801d637147aa"},{"name":"Events","udi":"umb://document/fd7b9ce1b24d440a90cf13fd1ee44517"},{"name":"Blogs","udi":"umb://document/738f46fb472a45c29f4bcac810fa1de8"},{"name":"Teachers","udi":"umb://document/9f465a8361c7422cb89ba8aeb5e2f977"},{"name":"Contact Us","udi":"umb://document/9e25c120c7d54b55b0ec44544babf1cd"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (333, 92, 60, 1, NULL, NULL, NULL, NULL, NULL, N'[{"name":"+44 300 303 0266","url":"callto:+443003030266"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (334, 92, 63, 1, NULL, NULL, NULL, NULL, N'23621 15 Mile Rd #C104, Clinton MI, 48035, New York, USA', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (335, 92, 64, 1, NULL, NULL, NULL, NULL, N'+1 (2) 345 6789', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (336, 92, 65, 1, NULL, NULL, NULL, NULL, N'+1 (2) 345 6789', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (337, 92, 66, 1, NULL, NULL, NULL, NULL, N'contact@CodeBook.edu', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (338, 92, 68, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"b564509a-9116-4dcf-a728-e87c74954fa2","name":"COMPANY","ncContentTypeAlias":"menu","menuTitle":"COMPANY","menuItems":null},{"key":"f02e646f-ebc1-449e-9767-eaaf8ec7df38","name":"LINKS","ncContentTypeAlias":"menu","menuTitle":"LINKS","menuItems":null},{"key":"4b080068-2601-4537-9706-4f528abe1afe","name":"SUPPORT","ncContentTypeAlias":"menu","menuTitle":"SUPPORT","menuItems":null},{"key":"65420287-072d-45ae-9bbb-b933b5f6f36a","name":"RECOMMEND","ncContentTypeAlias":"menu","menuTitle":"RECOMMEND","menuItems":null}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (339, 92, 59, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"16aa8042-2770-4c16-a5cd-b432a1afd540","name":"FaceBook","ncContentTypeAlias":"detailedMenu","itemName":"FaceBook","itemIcon":null,"itemURL":null},{"key":"8f91a3fe-7605-4a81-b98a-ebbccfcc508b","name":"Twitter","ncContentTypeAlias":"detailedMenu","itemName":"Twitter","itemIcon":null,"itemURL":null},{"key":"3cc9540e-5c3b-42bf-aea4-b3e5265b31e8","name":"Linkedin","ncContentTypeAlias":"detailedMenu","itemName":"Linkedin","itemIcon":null,"itemURL":null},{"key":"a8fcf10b-52c9-4032-825e-b6ed539a994b","name":"Instgram","ncContentTypeAlias":"detailedMenu","itemName":"Instgram","itemIcon":null,"itemURL":null}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (340, 79, 52, 1, NULL, NULL, NULL, NULL, N'Contact Us', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (341, 80, 52, 1, NULL, NULL, NULL, NULL, N'Contact Us', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (342, 93, 52, 1, NULL, NULL, NULL, NULL, N'Code Book', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (343, 93, 53, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"8f927ce9-327b-4193-a9ad-38b6a6e09e3d","mediaKey":"fea5dcf1-1faa-4fa4-b650-dbe1f1460833"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (344, 93, 54, 1, NULL, NULL, NULL, NULL, NULL, N'[{"name":"Scholarships","udi":"umb://document/619ab6882066434a8e1e58bc11a3118d"},{"name":"Researches","udi":"umb://document/e253f99f5d3e4425ac2c2a9ada634df8"},{"name":"Notices","udi":"umb://document/81a6035295c042c4a29cab7b7f8e839c"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (345, 93, 55, 1, NULL, NULL, NULL, NULL, NULL, N'[{"name":"Home","udi":"umb://document/9e0e6a37fea74b3980ea5fedb72a4d4e"},{"name":"About","udi":"umb://document/754578e71ce14d148b9457777a2340f9"},{"name":"Courses","udi":"umb://document/a69040861ac147388a27801d637147aa"},{"name":"Events","udi":"umb://document/fd7b9ce1b24d440a90cf13fd1ee44517"},{"name":"Blogs","udi":"umb://document/738f46fb472a45c29f4bcac810fa1de8"},{"name":"Teachers","udi":"umb://document/9f465a8361c7422cb89ba8aeb5e2f977"},{"name":"Contact Us","udi":"umb://document/9e25c120c7d54b55b0ec44544babf1cd"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (346, 93, 60, 1, NULL, NULL, NULL, NULL, NULL, N'[{"name":"+44 300 303 0266","url":"callto:+443003030266"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (347, 93, 63, 1, NULL, NULL, NULL, NULL, N'23621 15 Mile Rd #C104, Clinton MI, 48035, New York, USA', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (348, 93, 64, 1, NULL, NULL, NULL, NULL, N'+1 (2) 345 6789', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (349, 93, 65, 1, NULL, NULL, NULL, NULL, N'+1 (2) 345 6789', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (350, 93, 66, 1, NULL, NULL, NULL, NULL, N'contact@CodeBook.edu', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (351, 93, 68, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"b564509a-9116-4dcf-a728-e87c74954fa2","name":"COMPANY","ncContentTypeAlias":"menu","menuTitle":"COMPANY","menuItems":null},{"key":"f02e646f-ebc1-449e-9767-eaaf8ec7df38","name":"LINKS","ncContentTypeAlias":"menu","menuTitle":"LINKS","menuItems":null},{"key":"4b080068-2601-4537-9706-4f528abe1afe","name":"SUPPORT","ncContentTypeAlias":"menu","menuTitle":"SUPPORT","menuItems":null},{"key":"65420287-072d-45ae-9bbb-b933b5f6f36a","name":"RECOMMEND","ncContentTypeAlias":"menu","menuTitle":"RECOMMEND","menuItems":null}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (352, 93, 59, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"16aa8042-2770-4c16-a5cd-b432a1afd540","name":"FaceBook","ncContentTypeAlias":"detailedMenu","itemName":"FaceBook","itemIcon":null,"itemURL":null},{"key":"8f91a3fe-7605-4a81-b98a-ebbccfcc508b","name":"Twitter","ncContentTypeAlias":"detailedMenu","itemName":"Twitter","itemIcon":null,"itemURL":null},{"key":"3cc9540e-5c3b-42bf-aea4-b3e5265b31e8","name":"Linkedin","ncContentTypeAlias":"detailedMenu","itemName":"Linkedin","itemIcon":null,"itemURL":null},{"key":"a8fcf10b-52c9-4032-825e-b6ed539a994b","name":"Instgram","ncContentTypeAlias":"detailedMenu","itemName":"Instgram","itemIcon":null,"itemURL":null}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (353, 94, 52, 1, NULL, NULL, NULL, NULL, N'Home', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (354, 95, 52, 1, NULL, NULL, NULL, NULL, N'Home', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (355, 96, 52, 1, NULL, NULL, NULL, NULL, N'Code Book', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (356, 96, 53, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"8f927ce9-327b-4193-a9ad-38b6a6e09e3d","mediaKey":"fea5dcf1-1faa-4fa4-b650-dbe1f1460833"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (357, 96, 54, 1, NULL, NULL, NULL, NULL, NULL, N'[{"name":"Scholarships","udi":"umb://document/619ab6882066434a8e1e58bc11a3118d"},{"name":"Researches","udi":"umb://document/e253f99f5d3e4425ac2c2a9ada634df8"},{"name":"Notices","udi":"umb://document/81a6035295c042c4a29cab7b7f8e839c"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (358, 96, 55, 1, NULL, NULL, NULL, NULL, NULL, N'[{"name":"Home","udi":"umb://document/9e0e6a37fea74b3980ea5fedb72a4d4e"},{"name":"About","udi":"umb://document/754578e71ce14d148b9457777a2340f9"},{"name":"Courses","udi":"umb://document/a69040861ac147388a27801d637147aa"},{"name":"Events","udi":"umb://document/fd7b9ce1b24d440a90cf13fd1ee44517"},{"name":"Blogs","udi":"umb://document/738f46fb472a45c29f4bcac810fa1de8"},{"name":"Teachers","udi":"umb://document/9f465a8361c7422cb89ba8aeb5e2f977"},{"name":"Contact Us","udi":"umb://document/9e25c120c7d54b55b0ec44544babf1cd"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (359, 96, 60, 1, NULL, NULL, NULL, NULL, NULL, N'[{"name":"+44 300 303 0266","url":"callto:+443003030266"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (360, 96, 63, 1, NULL, NULL, NULL, NULL, N'23621 15 Mile Rd #C104, Clinton MI, 48035, New York, USA', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (361, 96, 64, 1, NULL, NULL, NULL, NULL, N'+1 (2) 345 6789', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (362, 96, 65, 1, NULL, NULL, NULL, NULL, N'+1 (2) 345 6789', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (363, 96, 66, 1, NULL, NULL, NULL, NULL, N'contact@CodeBook.edu', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (364, 96, 68, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"b564509a-9116-4dcf-a728-e87c74954fa2","name":"COMPANY","ncContentTypeAlias":"menu","menuTitle":"COMPANY","menuItems":null},{"key":"f02e646f-ebc1-449e-9767-eaaf8ec7df38","name":"LINKS","ncContentTypeAlias":"menu","menuTitle":"LINKS","menuItems":null},{"key":"4b080068-2601-4537-9706-4f528abe1afe","name":"SUPPORT","ncContentTypeAlias":"menu","menuTitle":"SUPPORT","menuItems":null},{"key":"65420287-072d-45ae-9bbb-b933b5f6f36a","name":"RECOMMEND","ncContentTypeAlias":"menu","menuTitle":"RECOMMEND","menuItems":null}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (365, 96, 59, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"16aa8042-2770-4c16-a5cd-b432a1afd540","name":"FaceBook","ncContentTypeAlias":"detailedMenu","itemName":"FaceBook","itemIcon":"ti-facebook","itemURL":"[{\"name\":\"https://www.facebook.com/\",\"target\":\"_blank\",\"url\":\"https://www.facebook.com/\"}]"},{"key":"8f91a3fe-7605-4a81-b98a-ebbccfcc508b","name":"Twitter","ncContentTypeAlias":"detailedMenu","itemName":"Twitter","itemIcon":"ti-twitter-alt","itemURL":"[{\"name\":\"https://twitter.com/\",\"target\":\"_blank\",\"url\":\"https://twitter.com/\"}]"},{"key":"3cc9540e-5c3b-42bf-aea4-b3e5265b31e8","name":"Linkedin","ncContentTypeAlias":"detailedMenu","itemName":"Linkedin","itemIcon":"ti-linkedin","itemURL":"[{\"name\":\"https://www.linkedin.com/\",\"url\":\"https://www.linkedin.com/\"}]"},{"key":"a8fcf10b-52c9-4032-825e-b6ed539a994b","name":"Instgram","ncContentTypeAlias":"detailedMenu","itemName":"Instgram","itemIcon":"ti-instagram","itemURL":"[{\"name\":\"https://www.instagram.com/\",\"target\":\"_blank\",\"url\":\"https://www.instagram.com/\"}]"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (366, 97, 52, 1, NULL, NULL, NULL, NULL, N'Code Book', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (367, 97, 53, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"8f927ce9-327b-4193-a9ad-38b6a6e09e3d","mediaKey":"fea5dcf1-1faa-4fa4-b650-dbe1f1460833"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (368, 97, 54, 1, NULL, NULL, NULL, NULL, NULL, N'[{"name":"Scholarships","udi":"umb://document/619ab6882066434a8e1e58bc11a3118d"},{"name":"Researches","udi":"umb://document/e253f99f5d3e4425ac2c2a9ada634df8"},{"name":"Notices","udi":"umb://document/81a6035295c042c4a29cab7b7f8e839c"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (369, 97, 55, 1, NULL, NULL, NULL, NULL, NULL, N'[{"name":"Home","udi":"umb://document/9e0e6a37fea74b3980ea5fedb72a4d4e"},{"name":"About","udi":"umb://document/754578e71ce14d148b9457777a2340f9"},{"name":"Courses","udi":"umb://document/a69040861ac147388a27801d637147aa"},{"name":"Events","udi":"umb://document/fd7b9ce1b24d440a90cf13fd1ee44517"},{"name":"Blogs","udi":"umb://document/738f46fb472a45c29f4bcac810fa1de8"},{"name":"Teachers","udi":"umb://document/9f465a8361c7422cb89ba8aeb5e2f977"},{"name":"Contact Us","udi":"umb://document/9e25c120c7d54b55b0ec44544babf1cd"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (370, 97, 60, 1, NULL, NULL, NULL, NULL, NULL, N'[{"name":"+44 300 303 0266","url":"callto:+443003030266"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (371, 97, 63, 1, NULL, NULL, NULL, NULL, N'23621 15 Mile Rd #C104, Clinton MI, 48035, New York, USA', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (372, 97, 64, 1, NULL, NULL, NULL, NULL, N'+1 (2) 345 6789', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (373, 97, 65, 1, NULL, NULL, NULL, NULL, N'+1 (2) 345 6789', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (374, 97, 66, 1, NULL, NULL, NULL, NULL, N'contact@CodeBook.edu', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (375, 97, 68, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"b564509a-9116-4dcf-a728-e87c74954fa2","name":"COMPANY","ncContentTypeAlias":"menu","menuTitle":"COMPANY","menuItems":"[{\"name\":\"About\",\"udi\":\"umb://document/754578e71ce14d148b9457777a2340f9\"},{\"name\":\"Teachers\",\"udi\":\"umb://document/9f465a8361c7422cb89ba8aeb5e2f977\"},{\"name\":\"Contact Us\",\"udi\":\"umb://document/9e25c120c7d54b55b0ec44544babf1cd\"},{\"name\":\"Blogs\",\"udi\":\"umb://document/738f46fb472a45c29f4bcac810fa1de8\"}]"},{"key":"f02e646f-ebc1-449e-9767-eaaf8ec7df38","name":"LINKS","ncContentTypeAlias":"menu","menuTitle":"LINKS","menuItems":"[{\"name\":\"Courses\",\"udi\":\"umb://document/a69040861ac147388a27801d637147aa\"},{\"name\":\"Events\",\"udi\":\"umb://document/fd7b9ce1b24d440a90cf13fd1ee44517\"},{\"name\":\"Gallary\",\"udi\":\"umb://document/50b4d811216e43b0b8923dbcdc59e4c6\"},{\"name\":\"FAQS\",\"udi\":\"umb://document/50b4d811216e43b0b8923dbcdc59e4c6\"}]"},{"key":"4b080068-2601-4537-9706-4f528abe1afe","name":"SUPPORT","ncContentTypeAlias":"menu","menuTitle":"SUPPORT","menuItems":null},{"key":"65420287-072d-45ae-9bbb-b933b5f6f36a","name":"RECOMMEND","ncContentTypeAlias":"menu","menuTitle":"RECOMMEND","menuItems":null}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (376, 97, 59, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"16aa8042-2770-4c16-a5cd-b432a1afd540","name":"FaceBook","ncContentTypeAlias":"detailedMenu","itemName":"FaceBook","itemIcon":"ti-facebook","itemURL":"[{\"name\":\"https://www.facebook.com/\",\"target\":\"_blank\",\"url\":\"https://www.facebook.com/\"}]"},{"key":"8f91a3fe-7605-4a81-b98a-ebbccfcc508b","name":"Twitter","ncContentTypeAlias":"detailedMenu","itemName":"Twitter","itemIcon":"ti-twitter-alt","itemURL":"[{\"name\":\"https://twitter.com/\",\"target\":\"_blank\",\"url\":\"https://twitter.com/\"}]"},{"key":"3cc9540e-5c3b-42bf-aea4-b3e5265b31e8","name":"Linkedin","ncContentTypeAlias":"detailedMenu","itemName":"Linkedin","itemIcon":"ti-linkedin","itemURL":"[{\"name\":\"https://www.linkedin.com/\",\"url\":\"https://www.linkedin.com/\"}]"},{"key":"a8fcf10b-52c9-4032-825e-b6ed539a994b","name":"Instgram","ncContentTypeAlias":"detailedMenu","itemName":"Instgram","itemIcon":"ti-instagram","itemURL":"[{\"name\":\"https://www.instagram.com/\",\"target\":\"_blank\",\"url\":\"https://www.instagram.com/\"}]"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (377, 98, 52, 1, NULL, NULL, NULL, NULL, N'Code Book', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (378, 98, 53, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"8f927ce9-327b-4193-a9ad-38b6a6e09e3d","mediaKey":"fea5dcf1-1faa-4fa4-b650-dbe1f1460833"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (379, 98, 54, 1, NULL, NULL, NULL, NULL, NULL, N'[{"name":"Scholarships","udi":"umb://document/619ab6882066434a8e1e58bc11a3118d"},{"name":"Researches","udi":"umb://document/e253f99f5d3e4425ac2c2a9ada634df8"},{"name":"Notices","udi":"umb://document/81a6035295c042c4a29cab7b7f8e839c"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (380, 98, 55, 1, NULL, NULL, NULL, NULL, NULL, N'[{"name":"Home","udi":"umb://document/9e0e6a37fea74b3980ea5fedb72a4d4e"},{"name":"About","udi":"umb://document/754578e71ce14d148b9457777a2340f9"},{"name":"Courses","udi":"umb://document/a69040861ac147388a27801d637147aa"},{"name":"Events","udi":"umb://document/fd7b9ce1b24d440a90cf13fd1ee44517"},{"name":"Blogs","udi":"umb://document/738f46fb472a45c29f4bcac810fa1de8"},{"name":"Teachers","udi":"umb://document/9f465a8361c7422cb89ba8aeb5e2f977"},{"name":"Contact Us","udi":"umb://document/9e25c120c7d54b55b0ec44544babf1cd"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (381, 98, 60, 1, NULL, NULL, NULL, NULL, NULL, N'[{"name":"+44 300 303 0266","url":"callto:+443003030266"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (382, 98, 63, 1, NULL, NULL, NULL, NULL, N'23621 15 Mile Rd #C104, Clinton MI, 48035, New York, USA', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (383, 98, 64, 1, NULL, NULL, NULL, NULL, N'+1 (2) 345 6789', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (384, 98, 65, 1, NULL, NULL, NULL, NULL, N'+1 (2) 345 6789', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (385, 98, 66, 1, NULL, NULL, NULL, NULL, N'contact@CodeBook.edu', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (386, 98, 68, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"b564509a-9116-4dcf-a728-e87c74954fa2","name":"COMPANY","ncContentTypeAlias":"menu","menuTitle":"COMPANY","menuItems":"[{\"name\":\"About\",\"udi\":\"umb://document/754578e71ce14d148b9457777a2340f9\"},{\"name\":\"Teachers\",\"udi\":\"umb://document/9f465a8361c7422cb89ba8aeb5e2f977\"},{\"name\":\"Contact Us\",\"udi\":\"umb://document/9e25c120c7d54b55b0ec44544babf1cd\"},{\"name\":\"Blogs\",\"udi\":\"umb://document/738f46fb472a45c29f4bcac810fa1de8\"}]"},{"key":"f02e646f-ebc1-449e-9767-eaaf8ec7df38","name":"LINKS","ncContentTypeAlias":"menu","menuTitle":"LINKS","menuItems":"[{\"name\":\"Courses\",\"udi\":\"umb://document/a69040861ac147388a27801d637147aa\"},{\"name\":\"Events\",\"udi\":\"umb://document/fd7b9ce1b24d440a90cf13fd1ee44517\"},{\"name\":\"Gallary\",\"udi\":\"umb://document/50b4d811216e43b0b8923dbcdc59e4c6\"},{\"name\":\"FAQS\",\"udi\":\"umb://document/50b4d811216e43b0b8923dbcdc59e4c6\"}]"},{"key":"4b080068-2601-4537-9706-4f528abe1afe","name":"SUPPORT","ncContentTypeAlias":"menu","menuTitle":"SUPPORT","menuItems":"[{\"name\":\"Fourms\",\"udi\":\"umb://document/50b4d811216e43b0b8923dbcdc59e4c6\"},{\"name\":\"Documentation\",\"udi\":\"umb://document/50b4d811216e43b0b8923dbcdc59e4c6\"},{\"name\":\"Language\",\"udi\":\"umb://document/50b4d811216e43b0b8923dbcdc59e4c6\"},{\"name\":\"Release Status\",\"udi\":\"umb://document/50b4d811216e43b0b8923dbcdc59e4c6\"}]"},{"key":"65420287-072d-45ae-9bbb-b933b5f6f36a","name":"RECOMMEND","ncContentTypeAlias":"menu","menuTitle":"RECOMMEND","menuItems":null}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (387, 98, 59, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"16aa8042-2770-4c16-a5cd-b432a1afd540","name":"FaceBook","ncContentTypeAlias":"detailedMenu","itemName":"FaceBook","itemIcon":"ti-facebook","itemURL":"[{\"name\":\"https://www.facebook.com/\",\"target\":\"_blank\",\"url\":\"https://www.facebook.com/\"}]"},{"key":"8f91a3fe-7605-4a81-b98a-ebbccfcc508b","name":"Twitter","ncContentTypeAlias":"detailedMenu","itemName":"Twitter","itemIcon":"ti-twitter-alt","itemURL":"[{\"name\":\"https://twitter.com/\",\"target\":\"_blank\",\"url\":\"https://twitter.com/\"}]"},{"key":"3cc9540e-5c3b-42bf-aea4-b3e5265b31e8","name":"Linkedin","ncContentTypeAlias":"detailedMenu","itemName":"Linkedin","itemIcon":"ti-linkedin","itemURL":"[{\"name\":\"https://www.linkedin.com/\",\"url\":\"https://www.linkedin.com/\"}]"},{"key":"a8fcf10b-52c9-4032-825e-b6ed539a994b","name":"Instgram","ncContentTypeAlias":"detailedMenu","itemName":"Instgram","itemIcon":"ti-instagram","itemURL":"[{\"name\":\"https://www.instagram.com/\",\"target\":\"_blank\",\"url\":\"https://www.instagram.com/\"}]"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (388, 99, 52, 1, NULL, NULL, NULL, NULL, N'Code Book', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (389, 99, 53, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"8f927ce9-327b-4193-a9ad-38b6a6e09e3d","mediaKey":"fea5dcf1-1faa-4fa4-b650-dbe1f1460833"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (390, 99, 54, 1, NULL, NULL, NULL, NULL, NULL, N'[{"name":"Scholarships","udi":"umb://document/619ab6882066434a8e1e58bc11a3118d"},{"name":"Researches","udi":"umb://document/e253f99f5d3e4425ac2c2a9ada634df8"},{"name":"Notices","udi":"umb://document/81a6035295c042c4a29cab7b7f8e839c"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (391, 99, 55, 1, NULL, NULL, NULL, NULL, NULL, N'[{"name":"Home","udi":"umb://document/9e0e6a37fea74b3980ea5fedb72a4d4e"},{"name":"About","udi":"umb://document/754578e71ce14d148b9457777a2340f9"},{"name":"Courses","udi":"umb://document/a69040861ac147388a27801d637147aa"},{"name":"Events","udi":"umb://document/fd7b9ce1b24d440a90cf13fd1ee44517"},{"name":"Blogs","udi":"umb://document/738f46fb472a45c29f4bcac810fa1de8"},{"name":"Teachers","udi":"umb://document/9f465a8361c7422cb89ba8aeb5e2f977"},{"name":"Contact Us","udi":"umb://document/9e25c120c7d54b55b0ec44544babf1cd"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (392, 99, 60, 1, NULL, NULL, NULL, NULL, NULL, N'[{"name":"+44 300 303 0266","url":"callto:+443003030266"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (393, 99, 63, 1, NULL, NULL, NULL, NULL, N'23621 15 Mile Rd #C104, Clinton MI, 48035, New York, USA', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (394, 99, 64, 1, NULL, NULL, NULL, NULL, N'+1 (2) 345 6789', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (395, 99, 65, 1, NULL, NULL, NULL, NULL, N'+1 (2) 345 6789', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (396, 99, 66, 1, NULL, NULL, NULL, NULL, N'contact@CodeBook.edu', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (397, 99, 68, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"b564509a-9116-4dcf-a728-e87c74954fa2","name":"COMPANY","ncContentTypeAlias":"menu","menuTitle":"COMPANY","menuItems":"[{\"name\":\"About\",\"udi\":\"umb://document/754578e71ce14d148b9457777a2340f9\"},{\"name\":\"Teachers\",\"udi\":\"umb://document/9f465a8361c7422cb89ba8aeb5e2f977\"},{\"name\":\"Contact Us\",\"udi\":\"umb://document/9e25c120c7d54b55b0ec44544babf1cd\"},{\"name\":\"Blogs\",\"udi\":\"umb://document/738f46fb472a45c29f4bcac810fa1de8\"}]"},{"key":"f02e646f-ebc1-449e-9767-eaaf8ec7df38","name":"LINKS","ncContentTypeAlias":"menu","menuTitle":"LINKS","menuItems":"[{\"name\":\"Courses\",\"udi\":\"umb://document/a69040861ac147388a27801d637147aa\"},{\"name\":\"Events\",\"udi\":\"umb://document/fd7b9ce1b24d440a90cf13fd1ee44517\"},{\"name\":\"Gallary\",\"udi\":\"umb://document/50b4d811216e43b0b8923dbcdc59e4c6\"},{\"name\":\"FAQS\",\"udi\":\"umb://document/50b4d811216e43b0b8923dbcdc59e4c6\"}]"},{"key":"4b080068-2601-4537-9706-4f528abe1afe","name":"SUPPORT","ncContentTypeAlias":"menu","menuTitle":"SUPPORT","menuItems":"[{\"name\":\"Fourms\",\"udi\":\"umb://document/50b4d811216e43b0b8923dbcdc59e4c6\"},{\"name\":\"Documentation\",\"udi\":\"umb://document/50b4d811216e43b0b8923dbcdc59e4c6\"},{\"name\":\"Language\",\"udi\":\"umb://document/50b4d811216e43b0b8923dbcdc59e4c6\"},{\"name\":\"Release Status\",\"udi\":\"umb://document/50b4d811216e43b0b8923dbcdc59e4c6\"}]"},{"key":"65420287-072d-45ae-9bbb-b933b5f6f36a","name":"RECOMMEND","ncContentTypeAlias":"menu","menuTitle":"RECOMMEND","menuItems":"[{\"name\":\"Umbraco\",\"udi\":\"umb://document/50b4d811216e43b0b8923dbcdc59e4c6\"},{\"name\":\"WordPress\",\"udi\":\"umb://document/50b4d811216e43b0b8923dbcdc59e4c6\"},{\"name\":\"eCommerce\",\"udi\":\"umb://document/50b4d811216e43b0b8923dbcdc59e4c6\"}]"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (398, 99, 59, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"16aa8042-2770-4c16-a5cd-b432a1afd540","name":"FaceBook","ncContentTypeAlias":"detailedMenu","itemName":"FaceBook","itemIcon":"ti-facebook","itemURL":"[{\"name\":\"https://www.facebook.com/\",\"target\":\"_blank\",\"url\":\"https://www.facebook.com/\"}]"},{"key":"8f91a3fe-7605-4a81-b98a-ebbccfcc508b","name":"Twitter","ncContentTypeAlias":"detailedMenu","itemName":"Twitter","itemIcon":"ti-twitter-alt","itemURL":"[{\"name\":\"https://twitter.com/\",\"target\":\"_blank\",\"url\":\"https://twitter.com/\"}]"},{"key":"3cc9540e-5c3b-42bf-aea4-b3e5265b31e8","name":"Linkedin","ncContentTypeAlias":"detailedMenu","itemName":"Linkedin","itemIcon":"ti-linkedin","itemURL":"[{\"name\":\"https://www.linkedin.com/\",\"url\":\"https://www.linkedin.com/\"}]"},{"key":"a8fcf10b-52c9-4032-825e-b6ed539a994b","name":"Instgram","ncContentTypeAlias":"detailedMenu","itemName":"Instgram","itemIcon":"ti-instagram","itemURL":"[{\"name\":\"https://www.instagram.com/\",\"target\":\"_blank\",\"url\":\"https://www.instagram.com/\"}]"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (399, 100, 52, 1, NULL, NULL, NULL, NULL, N'Code Book', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (400, 100, 53, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"8f927ce9-327b-4193-a9ad-38b6a6e09e3d","mediaKey":"fea5dcf1-1faa-4fa4-b650-dbe1f1460833"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (401, 100, 54, 1, NULL, NULL, NULL, NULL, NULL, N'[{"name":"Scholarships","udi":"umb://document/619ab6882066434a8e1e58bc11a3118d"},{"name":"Researches","udi":"umb://document/e253f99f5d3e4425ac2c2a9ada634df8"},{"name":"Notices","udi":"umb://document/81a6035295c042c4a29cab7b7f8e839c"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (402, 100, 55, 1, NULL, NULL, NULL, NULL, NULL, N'[{"name":"Home","udi":"umb://document/9e0e6a37fea74b3980ea5fedb72a4d4e"},{"name":"About","udi":"umb://document/754578e71ce14d148b9457777a2340f9"},{"name":"Courses","udi":"umb://document/a69040861ac147388a27801d637147aa"},{"name":"Events","udi":"umb://document/fd7b9ce1b24d440a90cf13fd1ee44517"},{"name":"Blogs","udi":"umb://document/738f46fb472a45c29f4bcac810fa1de8"},{"name":"Teachers","udi":"umb://document/9f465a8361c7422cb89ba8aeb5e2f977"},{"name":"Contact Us","udi":"umb://document/9e25c120c7d54b55b0ec44544babf1cd"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (403, 100, 60, 1, NULL, NULL, NULL, NULL, NULL, N'[{"name":"+44 300 303 0266","url":"callto:+443003030266"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (404, 100, 63, 1, NULL, NULL, NULL, NULL, N'23621 15 Mile Rd #C104, Clinton MI, 48035, New York, USA', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (405, 100, 64, 1, NULL, NULL, NULL, NULL, N'+1 (2) 345 6789', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (406, 100, 65, 1, NULL, NULL, NULL, NULL, N'+1 (2) 345 6789', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (407, 100, 66, 1, NULL, NULL, NULL, NULL, N'contact@CodeBook.edu', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (408, 100, 68, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"b564509a-9116-4dcf-a728-e87c74954fa2","name":"COMPANY","ncContentTypeAlias":"menu","menuTitle":"COMPANY","menuItems":"[{\"name\":\"About\",\"udi\":\"umb://document/754578e71ce14d148b9457777a2340f9\"},{\"name\":\"Teachers\",\"udi\":\"umb://document/9f465a8361c7422cb89ba8aeb5e2f977\"},{\"name\":\"Contact Us\",\"udi\":\"umb://document/9e25c120c7d54b55b0ec44544babf1cd\"},{\"name\":\"Blogs\",\"udi\":\"umb://document/738f46fb472a45c29f4bcac810fa1de8\"}]"},{"key":"f02e646f-ebc1-449e-9767-eaaf8ec7df38","name":"LINKS","ncContentTypeAlias":"menu","menuTitle":"LINKS","menuItems":"[{\"name\":\"Courses\",\"udi\":\"umb://document/a69040861ac147388a27801d637147aa\"},{\"name\":\"Events\",\"udi\":\"umb://document/fd7b9ce1b24d440a90cf13fd1ee44517\"},{\"name\":\"Gallary\",\"udi\":\"umb://document/50b4d811216e43b0b8923dbcdc59e4c6\"},{\"name\":\"FAQS\",\"udi\":\"umb://document/50b4d811216e43b0b8923dbcdc59e4c6\"}]"},{"key":"4b080068-2601-4537-9706-4f528abe1afe","name":"SUPPORT","ncContentTypeAlias":"menu","menuTitle":"SUPPORT","menuItems":"[{\"name\":\"Fourms\",\"udi\":\"umb://document/50b4d811216e43b0b8923dbcdc59e4c6\"},{\"name\":\"Documentation\",\"udi\":\"umb://document/50b4d811216e43b0b8923dbcdc59e4c6\"},{\"name\":\"Language\",\"udi\":\"umb://document/50b4d811216e43b0b8923dbcdc59e4c6\"},{\"name\":\"Release Status\",\"udi\":\"umb://document/50b4d811216e43b0b8923dbcdc59e4c6\"}]"},{"key":"65420287-072d-45ae-9bbb-b933b5f6f36a","name":"RECOMMEND","ncContentTypeAlias":"menu","menuTitle":"RECOMMEND","menuItems":"[{\"name\":\"Umbraco\",\"udi\":\"umb://document/50b4d811216e43b0b8923dbcdc59e4c6\"},{\"name\":\"WordPress\",\"udi\":\"umb://document/50b4d811216e43b0b8923dbcdc59e4c6\"},{\"name\":\"eCommerce\",\"udi\":\"umb://document/50b4d811216e43b0b8923dbcdc59e4c6\"}]"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (409, 100, 59, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"16aa8042-2770-4c16-a5cd-b432a1afd540","name":"FaceBook","ncContentTypeAlias":"detailedMenu","itemName":"FaceBook","itemIcon":"ti-facebook","itemURL":"[{\"name\":\"https://www.facebook.com/\",\"target\":\"_blank\",\"url\":\"https://www.facebook.com/\"}]"},{"key":"8f91a3fe-7605-4a81-b98a-ebbccfcc508b","name":"Twitter","ncContentTypeAlias":"detailedMenu","itemName":"Twitter","itemIcon":"ti-twitter-alt","itemURL":"[{\"name\":\"https://twitter.com/\",\"target\":\"_blank\",\"url\":\"https://twitter.com/\"}]"},{"key":"3cc9540e-5c3b-42bf-aea4-b3e5265b31e8","name":"Linkedin","ncContentTypeAlias":"detailedMenu","itemName":"Linkedin","itemIcon":"ti-linkedin","itemURL":"[{\"name\":\"https://www.linkedin.com/\",\"url\":\"https://www.linkedin.com/\"}]"},{"key":"a8fcf10b-52c9-4032-825e-b6ed539a994b","name":"Instgram","ncContentTypeAlias":"detailedMenu","itemName":"Instgram","itemIcon":"ti-instagram","itemURL":"[{\"name\":\"https://www.instagram.com/\",\"target\":\"_blank\",\"url\":\"https://www.instagram.com/\"}]"}]')
GO
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (410, 101, 52, 1, NULL, NULL, NULL, NULL, N'Code Book', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (411, 101, 53, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"8f927ce9-327b-4193-a9ad-38b6a6e09e3d","mediaKey":"fea5dcf1-1faa-4fa4-b650-dbe1f1460833"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (412, 101, 54, 1, NULL, NULL, NULL, NULL, NULL, N'[{"name":"Scholarships","udi":"umb://document/619ab6882066434a8e1e58bc11a3118d"},{"name":"Researches","udi":"umb://document/e253f99f5d3e4425ac2c2a9ada634df8"},{"name":"Notices","udi":"umb://document/81a6035295c042c4a29cab7b7f8e839c"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (413, 101, 55, 1, NULL, NULL, NULL, NULL, NULL, N'[{"name":"Home","udi":"umb://document/9e0e6a37fea74b3980ea5fedb72a4d4e"},{"name":"About","udi":"umb://document/754578e71ce14d148b9457777a2340f9"},{"name":"Courses","udi":"umb://document/a69040861ac147388a27801d637147aa"},{"name":"Events","udi":"umb://document/fd7b9ce1b24d440a90cf13fd1ee44517"},{"name":"Blogs","udi":"umb://document/738f46fb472a45c29f4bcac810fa1de8"},{"name":"Teachers","udi":"umb://document/9f465a8361c7422cb89ba8aeb5e2f977"},{"name":"Contact Us","udi":"umb://document/9e25c120c7d54b55b0ec44544babf1cd"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (414, 101, 60, 1, NULL, NULL, NULL, NULL, NULL, N'[{"name":"+44 300 303 0266","url":"callto:+443003030266"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (415, 101, 63, 1, NULL, NULL, NULL, NULL, N'23621 15 Mile Rd #C104, Clinton MI, 48035, New York, USA', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (416, 101, 64, 1, NULL, NULL, NULL, NULL, N'+1 (2) 345 6789', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (417, 101, 65, 1, NULL, NULL, NULL, NULL, N'+1 (2) 345 6789', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (418, 101, 66, 1, NULL, NULL, NULL, NULL, N'contact@CodeBook.edu', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (419, 101, 68, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"b564509a-9116-4dcf-a728-e87c74954fa2","name":"COMPANY","ncContentTypeAlias":"menu","menuTitle":"COMPANY","menuItems":"[{\"name\":\"About\",\"udi\":\"umb://document/754578e71ce14d148b9457777a2340f9\"},{\"name\":\"Teachers\",\"udi\":\"umb://document/9f465a8361c7422cb89ba8aeb5e2f977\"},{\"name\":\"Contact Us\",\"udi\":\"umb://document/9e25c120c7d54b55b0ec44544babf1cd\"},{\"name\":\"Blogs\",\"udi\":\"umb://document/738f46fb472a45c29f4bcac810fa1de8\"}]"},{"key":"f02e646f-ebc1-449e-9767-eaaf8ec7df38","name":"LINKS","ncContentTypeAlias":"menu","menuTitle":"LINKS","menuItems":"[{\"name\":\"Courses\",\"udi\":\"umb://document/a69040861ac147388a27801d637147aa\"},{\"name\":\"Events\",\"udi\":\"umb://document/fd7b9ce1b24d440a90cf13fd1ee44517\"},{\"name\":\"Gallary\",\"udi\":\"umb://document/50b4d811216e43b0b8923dbcdc59e4c6\"},{\"name\":\"FAQS\",\"udi\":\"umb://document/50b4d811216e43b0b8923dbcdc59e4c6\"}]"},{"key":"4b080068-2601-4537-9706-4f528abe1afe","name":"SUPPORT","ncContentTypeAlias":"menu","menuTitle":"SUPPORT","menuItems":"[{\"name\":\"Fourms\",\"udi\":\"umb://document/50b4d811216e43b0b8923dbcdc59e4c6\"},{\"name\":\"Documentation\",\"udi\":\"umb://document/50b4d811216e43b0b8923dbcdc59e4c6\"},{\"name\":\"Language\",\"udi\":\"umb://document/50b4d811216e43b0b8923dbcdc59e4c6\"},{\"name\":\"Release Status\",\"udi\":\"umb://document/50b4d811216e43b0b8923dbcdc59e4c6\"}]"},{"key":"65420287-072d-45ae-9bbb-b933b5f6f36a","name":"RECOMMEND","ncContentTypeAlias":"menu","menuTitle":"RECOMMEND","menuItems":"[{\"name\":\"Umbraco\",\"udi\":\"umb://document/50b4d811216e43b0b8923dbcdc59e4c6\"},{\"name\":\"WordPress\",\"udi\":\"umb://document/50b4d811216e43b0b8923dbcdc59e4c6\"},{\"name\":\"eCommerce\",\"udi\":\"umb://document/50b4d811216e43b0b8923dbcdc59e4c6\"}]"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (420, 101, 59, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"16aa8042-2770-4c16-a5cd-b432a1afd540","name":"FaceBook","ncContentTypeAlias":"detailedMenu","itemName":"FaceBook","itemIcon":"ti-facebook","itemURL":"[{\"name\":\"https://www.facebook.com/\",\"target\":\"_blank\",\"url\":\"https://www.facebook.com/\"}]"},{"key":"8f91a3fe-7605-4a81-b98a-ebbccfcc508b","name":"Twitter","ncContentTypeAlias":"detailedMenu","itemName":"Twitter","itemIcon":"ti-twitter-alt","itemURL":"[{\"name\":\"https://twitter.com/\",\"target\":\"_blank\",\"url\":\"https://twitter.com/\"}]"},{"key":"3cc9540e-5c3b-42bf-aea4-b3e5265b31e8","name":"Linkedin","ncContentTypeAlias":"detailedMenu","itemName":"Linkedin","itemIcon":"ti-linkedin","itemURL":"[{\"name\":\"https://www.linkedin.com/\",\"url\":\"https://www.linkedin.com/\"}]"},{"key":"a8fcf10b-52c9-4032-825e-b6ed539a994b","name":"Instgram","ncContentTypeAlias":"detailedMenu","itemName":"Instgram","itemIcon":"ti-instagram","itemURL":"[{\"name\":\"https://www.instagram.com/\",\"target\":\"_blank\",\"url\":\"https://www.instagram.com/\"}]"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (421, 104, 62, 1, NULL, NULL, NULL, NULL, N'mohammed.s.alhadik@gmail.com', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (422, 105, 62, 1, NULL, NULL, NULL, NULL, N'mohammed.s.alhadik@gmail.com', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (423, 106, 52, 1, NULL, NULL, NULL, NULL, N'About', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (424, 91, 73, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"c82a046d-523a-4732-ad29-1cc4ec789eac","mediaKey":"2d4fa626-5594-4344-98dd-6969a44a9e46"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (425, 106, 73, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"c82a046d-523a-4732-ad29-1cc4ec789eac","mediaKey":"2d4fa626-5594-4344-98dd-6969a44a9e46"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (426, 91, 74, 1, NULL, NULL, NULL, NULL, N'ABOUT OUR JOURNY', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (427, 106, 74, 1, NULL, NULL, NULL, NULL, N'ABOUT OUR JOURNY', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (428, 91, 75, 1, NULL, NULL, NULL, NULL, NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et.dolore magna aliqua. Ut enim ad minim veniam, quis nostrud. Lorem ipsum dolor sit amet consectetur, adipisicing elit. Saepe ipsa illo quod veritatis, magni debitis fugiat dolore voluptates! Consequatur, aliquid. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quaerat perferendis sint optio similique. Et amet magni facilis vero corporis quos.</p>
<p>exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ipsum a, facere fugit error accusamus est officiis vero in, nostrum laboriosam corrupti explicabo, cumque repudiandae deleniti perspiciatis quae consectetur enim. Laboriosam!</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (429, 106, 75, 1, NULL, NULL, NULL, NULL, NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et.dolore magna aliqua. Ut enim ad minim veniam, quis nostrud. Lorem ipsum dolor sit amet consectetur, adipisicing elit. Saepe ipsa illo quod veritatis, magni debitis fugiat dolore voluptates! Consequatur, aliquid. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quaerat perferendis sint optio similique. Et amet magni facilis vero corporis quos.</p>
<p>exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ipsum a, facere fugit error accusamus est officiis vero in, nostrum laboriosam corrupti explicabo, cumque repudiandae deleniti perspiciatis quae consectetur enim. Laboriosam!</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (430, 91, 76, 1, NULL, NULL, NULL, NULL, NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat.</p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (431, 106, 76, 1, NULL, NULL, NULL, NULL, NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat.</p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (432, 91, 77, 1, NULL, NULL, NULL, NULL, N'Success Stories', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (433, 106, 77, 1, NULL, NULL, NULL, NULL, N'Success Stories', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (434, 91, 78, 1, NULL, NULL, NULL, NULL, NULL, N'[{"name":"Youtube","url":"https://youtu.be/nA1Aqp0sPQo"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (435, 106, 78, 1, NULL, NULL, NULL, NULL, NULL, N'[{"name":"Youtube","url":"https://youtu.be/nA1Aqp0sPQo"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (436, 91, 79, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"b956862a-4a38-4a8f-bec5-b1fb3652b238","mediaKey":"20017f6e-974f-4c46-87ac-3d2d621ae795"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (437, 106, 79, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"b956862a-4a38-4a8f-bec5-b1fb3652b238","mediaKey":"20017f6e-974f-4c46-87ac-3d2d621ae795"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (438, 91, 80, 1, NULL, NULL, NULL, NULL, N' Our Teachers', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (439, 106, 80, 1, NULL, NULL, NULL, NULL, N' Our Teachers', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (440, 107, 52, 1, NULL, NULL, NULL, NULL, N'About', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (441, 107, 73, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"c82a046d-523a-4732-ad29-1cc4ec789eac","mediaKey":"2d4fa626-5594-4344-98dd-6969a44a9e46"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (442, 107, 74, 1, NULL, NULL, NULL, NULL, N'ABOUT OUR JOURNY', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (443, 107, 75, 1, NULL, NULL, NULL, NULL, NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et.dolore magna aliqua. Ut enim ad minim veniam, quis nostrud. Lorem ipsum dolor sit amet consectetur, adipisicing elit. Saepe ipsa illo quod veritatis, magni debitis fugiat dolore voluptates! Consequatur, aliquid. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quaerat perferendis sint optio similique. Et amet magni facilis vero corporis quos.</p>
<p>exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ipsum a, facere fugit error accusamus est officiis vero in, nostrum laboriosam corrupti explicabo, cumque repudiandae deleniti perspiciatis quae consectetur enim. Laboriosam!</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (444, 107, 76, 1, NULL, NULL, NULL, NULL, NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat.</p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (445, 107, 77, 1, NULL, NULL, NULL, NULL, N'Success Stories', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (446, 107, 78, 1, NULL, NULL, NULL, NULL, NULL, N'[{"name":"Youtube","url":"https://youtu.be/nA1Aqp0sPQo"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (447, 107, 79, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"b956862a-4a38-4a8f-bec5-b1fb3652b238","mediaKey":"20017f6e-974f-4c46-87ac-3d2d621ae795"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (448, 107, 80, 1, NULL, NULL, NULL, NULL, N' Our Teachers', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (449, 108, 52, 1, NULL, NULL, NULL, NULL, N'John Doe', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (450, 109, 52, 1, NULL, NULL, NULL, NULL, N'John Doe', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (451, 108, 82, 1, NULL, NULL, NULL, NULL, NULL, N'<p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Cumque accusamus tenetur ea harum delectus ab consequatur excepturi, odit qui in quo quia voluptate nam optio, culpa aspernatur. Error placeat iusto officia voluptas quae.</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (452, 109, 82, 1, NULL, NULL, NULL, NULL, NULL, N'<p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Cumque accusamus tenetur ea harum delectus ab consequatur excepturi, odit qui in quo quia voluptate nam optio, culpa aspernatur. Error placeat iusto officia voluptas quae.</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (453, 108, 83, 1, NULL, NULL, NULL, NULL, N'Computer Science', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (454, 109, 83, 1, NULL, NULL, NULL, NULL, N'Computer Science', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (455, 108, 85, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"392dca1e-9f01-4336-b5ce-2cb68cf594d0","mediaKey":"ce41350c-1061-45cd-b6a6-58ec905996c7"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (456, 109, 85, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"392dca1e-9f01-4336-b5ce-2cb68cf594d0","mediaKey":"ce41350c-1061-45cd-b6a6-58ec905996c7"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (457, 108, 86, 1, NULL, NULL, NULL, NULL, NULL, N'Computer Networking
Computer Security
Human Computer Interfacing')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (458, 109, 86, 1, NULL, NULL, NULL, NULL, NULL, N'Computer Networking
Computer Security
Human Computer Interfacing')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (459, 108, 87, 1, NULL, NULL, NULL, NULL, NULL, N'<p class="mb-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto.</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (460, 109, 87, 1, NULL, NULL, NULL, NULL, NULL, N'<p class="mb-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto.</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (461, 110, 52, 1, NULL, NULL, NULL, NULL, N'Clark Malik', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (462, 110, 82, 1, NULL, NULL, NULL, NULL, NULL, N'<p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Cumque accusamus tenetur ea harum delectus ab consequatur excepturi, odit qui in quo quia voluptate nam optio, culpa aspernatur. Error placeat iusto officia voluptas quae.</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (463, 110, 83, 1, NULL, NULL, NULL, NULL, N'Computer Science', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (464, 110, 85, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"392dca1e-9f01-4336-b5ce-2cb68cf594d0","mediaKey":"9940e5be-d0b2-49c0-b3e2-64bfb29b69af"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (465, 110, 86, 1, NULL, NULL, NULL, NULL, NULL, N'Computer Networking
Computer Security
Human Computer Interfacing')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (466, 110, 87, 1, NULL, NULL, NULL, NULL, NULL, N'<p class="mb-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto.</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (467, 111, 52, 1, NULL, NULL, NULL, NULL, N'Jacke Masito', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (468, 111, 82, 1, NULL, NULL, NULL, NULL, NULL, N'<p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Cumque accusamus tenetur ea harum delectus ab consequatur excepturi, odit qui in quo quia voluptate nam optio, culpa aspernatur. Error placeat iusto officia voluptas quae.</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (469, 111, 83, 1, NULL, NULL, NULL, NULL, N'Computer Science', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (470, 111, 85, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"392dca1e-9f01-4336-b5ce-2cb68cf594d0","mediaKey":"10eb6578-4aea-451d-8412-aadfad1f8da3"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (471, 111, 86, 1, NULL, NULL, NULL, NULL, NULL, N'Computer Networking
Computer Security
Human Computer Interfacing')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (472, 111, 87, 1, NULL, NULL, NULL, NULL, NULL, N'<p class="mb-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto.</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (473, 112, 52, 1, NULL, NULL, NULL, NULL, N'Clark Malik', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (474, 112, 82, 1, NULL, NULL, NULL, NULL, NULL, N'<p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Cumque accusamus tenetur ea harum delectus ab consequatur excepturi, odit qui in quo quia voluptate nam optio, culpa aspernatur. Error placeat iusto officia voluptas quae.</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (475, 112, 83, 1, NULL, NULL, NULL, NULL, N'Computer Science', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (476, 112, 85, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"392dca1e-9f01-4336-b5ce-2cb68cf594d0","mediaKey":"9940e5be-d0b2-49c0-b3e2-64bfb29b69af"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (477, 112, 86, 1, NULL, NULL, NULL, NULL, NULL, N'Computer Networking
Computer Security
Human Computer Interfacing')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (478, 112, 87, 1, NULL, NULL, NULL, NULL, NULL, N'<p class="mb-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto.</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (479, 113, 52, 1, NULL, NULL, NULL, NULL, N'Jacke Masito', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (480, 113, 82, 1, NULL, NULL, NULL, NULL, NULL, N'<p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Cumque accusamus tenetur ea harum delectus ab consequatur excepturi, odit qui in quo quia voluptate nam optio, culpa aspernatur. Error placeat iusto officia voluptas quae.</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (481, 113, 83, 1, NULL, NULL, NULL, NULL, N'Computer Science', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (482, 113, 85, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"392dca1e-9f01-4336-b5ce-2cb68cf594d0","mediaKey":"10eb6578-4aea-451d-8412-aadfad1f8da3"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (483, 113, 86, 1, NULL, NULL, NULL, NULL, NULL, N'Computer Networking
Computer Security
Human Computer Interfacing')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (484, 113, 87, 1, NULL, NULL, NULL, NULL, NULL, N'<p class="mb-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto.</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (485, 114, 52, 1, NULL, NULL, NULL, NULL, N'Photography', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (486, 115, 52, 1, NULL, NULL, NULL, NULL, N'Photography', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (487, 114, 89, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"b1fb1bb3-bf5b-44a4-b286-9a1f8935af36","mediaKey":"1ad81005-8fa8-4e76-8b7a-17f362241a0d"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (488, 115, 89, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"b1fb1bb3-bf5b-44a4-b286-9a1f8935af36","mediaKey":"1ad81005-8fa8-4e76-8b7a-17f362241a0d"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (489, 114, 90, 1, NULL, NULL, NULL, NULL, N'06 Month', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (490, 115, 90, 1, NULL, NULL, NULL, NULL, N'06 Month', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (491, 114, 91, 1, NULL, NULL, NULL, NULL, N'03 Hours', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (492, 115, 91, 1, NULL, NULL, NULL, NULL, N'03 Hours', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (493, 114, 92, 1, NULL, NULL, NULL, NULL, N'From: $699', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (494, 115, 92, 1, NULL, NULL, NULL, NULL, N'From: $699', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (495, 114, 93, 1, NULL, NULL, NULL, NULL, NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (496, 115, 93, 1, NULL, NULL, NULL, NULL, NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (497, 114, 94, 1, NULL, NULL, NULL, NULL, NULL, N'Lorem ipsum dolor sit amet consectetur adipisicing elit.
Lorem ipsum dolor sit amet consectetur adipisicing elit.
Lorem ipsum dolor sit amet consectetur adipisicing elit.
Lorem ipsum dolor sit amet consectetur adipisicing elit.
Lorem ipsum dolor sit amet consectetur adipisicing elit.
Lorem ipsum dolor sit amet consectetur adipisicing elit.
Lorem ipsum dolor sit amet consectetur adipisicing elit.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (498, 115, 94, 1, NULL, NULL, NULL, NULL, NULL, N'Lorem ipsum dolor sit amet consectetur adipisicing elit.
Lorem ipsum dolor sit amet consectetur adipisicing elit.
Lorem ipsum dolor sit amet consectetur adipisicing elit.
Lorem ipsum dolor sit amet consectetur adipisicing elit.
Lorem ipsum dolor sit amet consectetur adipisicing elit.
Lorem ipsum dolor sit amet consectetur adipisicing elit.
Lorem ipsum dolor sit amet consectetur adipisicing elit.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (499, 114, 95, 1, NULL, NULL, NULL, NULL, NULL, N'Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae obcaecati unde nulla? Lorem, ipsum dolor. Lorem, ipsum.
Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae obcaecati unde nulla? Lorem, ipsum dolor. Lorem, ipsum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae obcaecati unde nulla? Lorem, ipsum dolor. Lorem, ipsum.
Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae obcaecati unde nulla? Lorem, ipsum dolor. Lorem, ipsum.
Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae obcaecati unde nulla? Lorem, ipsum dolor. Lorem, ipsum.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (500, 115, 95, 1, NULL, NULL, NULL, NULL, NULL, N'Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae obcaecati unde nulla? Lorem, ipsum dolor. Lorem, ipsum.
Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae obcaecati unde nulla? Lorem, ipsum dolor. Lorem, ipsum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae obcaecati unde nulla? Lorem, ipsum dolor. Lorem, ipsum.
Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae obcaecati unde nulla? Lorem, ipsum dolor. Lorem, ipsum.
Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae obcaecati unde nulla? Lorem, ipsum dolor. Lorem, ipsum.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (501, 114, 96, 1, NULL, NULL, NULL, NULL, NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (502, 115, 96, 1, NULL, NULL, NULL, NULL, NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (503, 114, 97, 1, NULL, NULL, NULL, NULL, NULL, N'[]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (504, 115, 97, 1, NULL, NULL, NULL, NULL, NULL, N'[]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (505, 114, 99, 1, NULL, NULL, NULL, NULL, NULL, N'umb://document/3fda9d3a9b8c4aadbe2ebe2aa261db5b,umb://document/c85d45723cbf428e9204f7efa6589dc5,umb://document/fae7caa40637481f925cd5205568d8ca')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (506, 115, 99, 1, NULL, NULL, NULL, NULL, NULL, N'umb://document/3fda9d3a9b8c4aadbe2ebe2aa261db5b,umb://document/c85d45723cbf428e9204f7efa6589dc5,umb://document/fae7caa40637481f925cd5205568d8ca')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (507, 116, 52, 1, NULL, NULL, NULL, NULL, N' Programming', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (508, 116, 89, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"b1fb1bb3-bf5b-44a4-b286-9a1f8935af36","mediaKey":"1ad81005-8fa8-4e76-8b7a-17f362241a0d"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (509, 116, 90, 1, NULL, NULL, NULL, NULL, N'06 Month', NULL)
GO
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (510, 116, 91, 1, NULL, NULL, NULL, NULL, N'03 Hours', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (511, 116, 92, 1, NULL, NULL, NULL, NULL, N'From: $699', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (512, 116, 93, 1, NULL, NULL, NULL, NULL, NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (513, 116, 94, 1, NULL, NULL, NULL, NULL, NULL, N'Lorem ipsum dolor sit amet consectetur adipisicing elit.
Lorem ipsum dolor sit amet consectetur adipisicing elit.
Lorem ipsum dolor sit amet consectetur adipisicing elit.
Lorem ipsum dolor sit amet consectetur adipisicing elit.
Lorem ipsum dolor sit amet consectetur adipisicing elit.
Lorem ipsum dolor sit amet consectetur adipisicing elit.
Lorem ipsum dolor sit amet consectetur adipisicing elit.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (514, 116, 95, 1, NULL, NULL, NULL, NULL, NULL, N'Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae obcaecati unde nulla? Lorem, ipsum dolor. Lorem, ipsum.
Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae obcaecati unde nulla? Lorem, ipsum dolor. Lorem, ipsum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae obcaecati unde nulla? Lorem, ipsum dolor. Lorem, ipsum.
Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae obcaecati unde nulla? Lorem, ipsum dolor. Lorem, ipsum.
Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae obcaecati unde nulla? Lorem, ipsum dolor. Lorem, ipsum.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (515, 116, 96, 1, NULL, NULL, NULL, NULL, NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (516, 116, 97, 1, NULL, NULL, NULL, NULL, NULL, N'[]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (517, 116, 99, 1, NULL, NULL, NULL, NULL, NULL, N'umb://document/3fda9d3a9b8c4aadbe2ebe2aa261db5b,umb://document/c85d45723cbf428e9204f7efa6589dc5,umb://document/fae7caa40637481f925cd5205568d8ca')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (518, 117, 52, 1, NULL, NULL, NULL, NULL, N'Lifestyle Archives', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (519, 117, 89, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"b1fb1bb3-bf5b-44a4-b286-9a1f8935af36","mediaKey":"1ad81005-8fa8-4e76-8b7a-17f362241a0d"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (520, 117, 90, 1, NULL, NULL, NULL, NULL, N'06 Month', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (521, 117, 91, 1, NULL, NULL, NULL, NULL, N'03 Hours', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (522, 117, 92, 1, NULL, NULL, NULL, NULL, N'From: $699', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (523, 117, 93, 1, NULL, NULL, NULL, NULL, NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (524, 117, 94, 1, NULL, NULL, NULL, NULL, NULL, N'Lorem ipsum dolor sit amet consectetur adipisicing elit.
Lorem ipsum dolor sit amet consectetur adipisicing elit.
Lorem ipsum dolor sit amet consectetur adipisicing elit.
Lorem ipsum dolor sit amet consectetur adipisicing elit.
Lorem ipsum dolor sit amet consectetur adipisicing elit.
Lorem ipsum dolor sit amet consectetur adipisicing elit.
Lorem ipsum dolor sit amet consectetur adipisicing elit.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (525, 117, 95, 1, NULL, NULL, NULL, NULL, NULL, N'Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae obcaecati unde nulla? Lorem, ipsum dolor. Lorem, ipsum.
Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae obcaecati unde nulla? Lorem, ipsum dolor. Lorem, ipsum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae obcaecati unde nulla? Lorem, ipsum dolor. Lorem, ipsum.
Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae obcaecati unde nulla? Lorem, ipsum dolor. Lorem, ipsum.
Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae obcaecati unde nulla? Lorem, ipsum dolor. Lorem, ipsum.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (526, 117, 96, 1, NULL, NULL, NULL, NULL, NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (527, 117, 97, 1, NULL, NULL, NULL, NULL, NULL, N'[]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (528, 117, 99, 1, NULL, NULL, NULL, NULL, NULL, N'umb://document/3fda9d3a9b8c4aadbe2ebe2aa261db5b,umb://document/c85d45723cbf428e9204f7efa6589dc5,umb://document/fae7caa40637481f925cd5205568d8ca')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (529, 118, 52, 1, NULL, NULL, NULL, NULL, N' Programming', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (530, 118, 89, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"b1fb1bb3-bf5b-44a4-b286-9a1f8935af36","mediaKey":"1ad81005-8fa8-4e76-8b7a-17f362241a0d"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (531, 118, 90, 1, NULL, NULL, NULL, NULL, N'06 Month', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (532, 118, 91, 1, NULL, NULL, NULL, NULL, N'03 Hours', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (533, 118, 92, 1, NULL, NULL, NULL, NULL, N'From: $699', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (534, 118, 93, 1, NULL, NULL, NULL, NULL, NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (535, 118, 94, 1, NULL, NULL, NULL, NULL, NULL, N'Lorem ipsum dolor sit amet consectetur adipisicing elit.
Lorem ipsum dolor sit amet consectetur adipisicing elit.
Lorem ipsum dolor sit amet consectetur adipisicing elit.
Lorem ipsum dolor sit amet consectetur adipisicing elit.
Lorem ipsum dolor sit amet consectetur adipisicing elit.
Lorem ipsum dolor sit amet consectetur adipisicing elit.
Lorem ipsum dolor sit amet consectetur adipisicing elit.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (536, 118, 95, 1, NULL, NULL, NULL, NULL, NULL, N'Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae obcaecati unde nulla? Lorem, ipsum dolor. Lorem, ipsum.
Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae obcaecati unde nulla? Lorem, ipsum dolor. Lorem, ipsum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae obcaecati unde nulla? Lorem, ipsum dolor. Lorem, ipsum.
Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae obcaecati unde nulla? Lorem, ipsum dolor. Lorem, ipsum.
Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae obcaecati unde nulla? Lorem, ipsum dolor. Lorem, ipsum.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (537, 118, 96, 1, NULL, NULL, NULL, NULL, NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (538, 118, 97, 1, NULL, NULL, NULL, NULL, NULL, N'[]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (539, 118, 99, 1, NULL, NULL, NULL, NULL, NULL, N'umb://document/3fda9d3a9b8c4aadbe2ebe2aa261db5b,umb://document/c85d45723cbf428e9204f7efa6589dc5,umb://document/fae7caa40637481f925cd5205568d8ca')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (540, 119, 52, 1, NULL, NULL, NULL, NULL, N'Lifestyle Archives', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (541, 119, 89, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"b1fb1bb3-bf5b-44a4-b286-9a1f8935af36","mediaKey":"1ad81005-8fa8-4e76-8b7a-17f362241a0d"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (542, 119, 90, 1, NULL, NULL, NULL, NULL, N'06 Month', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (543, 119, 91, 1, NULL, NULL, NULL, NULL, N'03 Hours', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (544, 119, 92, 1, NULL, NULL, NULL, NULL, N'From: $699', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (545, 119, 93, 1, NULL, NULL, NULL, NULL, NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (546, 119, 94, 1, NULL, NULL, NULL, NULL, NULL, N'Lorem ipsum dolor sit amet consectetur adipisicing elit.
Lorem ipsum dolor sit amet consectetur adipisicing elit.
Lorem ipsum dolor sit amet consectetur adipisicing elit.
Lorem ipsum dolor sit amet consectetur adipisicing elit.
Lorem ipsum dolor sit amet consectetur adipisicing elit.
Lorem ipsum dolor sit amet consectetur adipisicing elit.
Lorem ipsum dolor sit amet consectetur adipisicing elit.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (547, 119, 95, 1, NULL, NULL, NULL, NULL, NULL, N'Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae obcaecati unde nulla? Lorem, ipsum dolor. Lorem, ipsum.
Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae obcaecati unde nulla? Lorem, ipsum dolor. Lorem, ipsum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae obcaecati unde nulla? Lorem, ipsum dolor. Lorem, ipsum.
Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae obcaecati unde nulla? Lorem, ipsum dolor. Lorem, ipsum.
Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae obcaecati unde nulla? Lorem, ipsum dolor. Lorem, ipsum.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (548, 119, 96, 1, NULL, NULL, NULL, NULL, NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (549, 119, 97, 1, NULL, NULL, NULL, NULL, NULL, N'[]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (550, 119, 99, 1, NULL, NULL, NULL, NULL, NULL, N'umb://document/3fda9d3a9b8c4aadbe2ebe2aa261db5b,umb://document/c85d45723cbf428e9204f7efa6589dc5,umb://document/fae7caa40637481f925cd5205568d8ca')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (551, 120, 52, 1, NULL, NULL, NULL, NULL, N'Lifestyle Archives', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (552, 120, 89, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"b1fb1bb3-bf5b-44a4-b286-9a1f8935af36","mediaKey":"1ad81005-8fa8-4e76-8b7a-17f362241a0d"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (553, 120, 90, 1, NULL, NULL, NULL, NULL, N'06 Month', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (554, 120, 91, 1, NULL, NULL, NULL, NULL, N'03 Hours', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (555, 120, 92, 1, NULL, NULL, NULL, NULL, N'From: $699', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (556, 120, 93, 1, NULL, NULL, NULL, NULL, NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (557, 120, 94, 1, NULL, NULL, NULL, NULL, NULL, N'Lorem ipsum dolor sit amet consectetur adipisicing elit.
Lorem ipsum dolor sit amet consectetur adipisicing elit.
Lorem ipsum dolor sit amet consectetur adipisicing elit.
Lorem ipsum dolor sit amet consectetur adipisicing elit.
Lorem ipsum dolor sit amet consectetur adipisicing elit.
Lorem ipsum dolor sit amet consectetur adipisicing elit.
Lorem ipsum dolor sit amet consectetur adipisicing elit.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (558, 120, 95, 1, NULL, NULL, NULL, NULL, NULL, N'Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae obcaecati unde nulla? Lorem, ipsum dolor. Lorem, ipsum.
Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae obcaecati unde nulla? Lorem, ipsum dolor. Lorem, ipsum.Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae obcaecati unde nulla? Lorem, ipsum dolor. Lorem, ipsum.
Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae obcaecati unde nulla? Lorem, ipsum dolor. Lorem, ipsum.
Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae obcaecati unde nulla? Lorem, ipsum dolor. Lorem, ipsum.')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (559, 120, 96, 1, NULL, NULL, NULL, NULL, NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (560, 120, 97, 1, NULL, NULL, NULL, NULL, NULL, N'[]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (561, 120, 99, 1, NULL, NULL, NULL, NULL, NULL, N'umb://document/3fda9d3a9b8c4aadbe2ebe2aa261db5b,umb://document/c85d45723cbf428e9204f7efa6589dc5,umb://document/fae7caa40637481f925cd5205568d8ca')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (562, 119, 100, 1, NULL, NULL, NULL, NULL, NULL, N'umb://document/2e9e9214b73c4f29920619db2b1443eb,umb://document/904cbdbb174e4ca2a8b7e22c53fd515a,umb://document/6265f2fbf58c4f27bdcadd90ed9f3ccd')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (563, 120, 100, 1, NULL, NULL, NULL, NULL, NULL, N'umb://document/2e9e9214b73c4f29920619db2b1443eb,umb://document/904cbdbb174e4ca2a8b7e22c53fd515a,umb://document/6265f2fbf58c4f27bdcadd90ed9f3ccd')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (564, 121, 52, 1, NULL, NULL, NULL, NULL, N'About', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (565, 121, 73, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"c82a046d-523a-4732-ad29-1cc4ec789eac","mediaKey":"2d4fa626-5594-4344-98dd-6969a44a9e46"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (566, 121, 74, 1, NULL, NULL, NULL, NULL, N'ABOUT OUR JOURNY', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (567, 121, 75, 1, NULL, NULL, NULL, NULL, NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et.dolore magna aliqua. Ut enim ad minim veniam, quis nostrud. Lorem ipsum dolor sit amet consectetur, adipisicing elit. Saepe ipsa illo quod veritatis, magni debitis fugiat dolore voluptates! Consequatur, aliquid. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quaerat perferendis sint optio similique. Et amet magni facilis vero corporis quos.</p>
<p>exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ipsum a, facere fugit error accusamus est officiis vero in, nostrum laboriosam corrupti explicabo, cumque repudiandae deleniti perspiciatis quae consectetur enim. Laboriosam!</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (568, 121, 76, 1, NULL, NULL, NULL, NULL, NULL, N'<p>Success Stories</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (569, 121, 77, 1, NULL, NULL, NULL, NULL, N'Success Stories', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (570, 121, 78, 1, NULL, NULL, NULL, NULL, NULL, N'[{"name":"Youtube","url":"https://youtu.be/nA1Aqp0sPQo"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (571, 121, 79, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"b956862a-4a38-4a8f-bec5-b1fb3652b238","mediaKey":"20017f6e-974f-4c46-87ac-3d2d621ae795"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (572, 121, 80, 1, NULL, NULL, NULL, NULL, N' Our Teachers', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (573, 107, 81, 1, NULL, NULL, NULL, NULL, NULL, N'umb://document/3fda9d3a9b8c4aadbe2ebe2aa261db5b,umb://document/c85d45723cbf428e9204f7efa6589dc5,umb://document/fae7caa40637481f925cd5205568d8ca')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (574, 121, 81, 1, NULL, NULL, NULL, NULL, NULL, N'umb://document/3fda9d3a9b8c4aadbe2ebe2aa261db5b,umb://document/c85d45723cbf428e9204f7efa6589dc5,umb://document/fae7caa40637481f925cd5205568d8ca')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (575, 122, 52, 1, NULL, NULL, NULL, NULL, N'About', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (576, 122, 73, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"c82a046d-523a-4732-ad29-1cc4ec789eac","mediaKey":"2d4fa626-5594-4344-98dd-6969a44a9e46"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (577, 122, 74, 1, NULL, NULL, NULL, NULL, N'ABOUT OUR JOURNY', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (578, 122, 75, 1, NULL, NULL, NULL, NULL, NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et.dolore magna aliqua. Ut enim ad minim veniam, quis nostrud. Lorem ipsum dolor sit amet consectetur, adipisicing elit. Saepe ipsa illo quod veritatis, magni debitis fugiat dolore voluptates! Consequatur, aliquid. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quaerat perferendis sint optio similique. Et amet magni facilis vero corporis quos.</p>
<p>exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ipsum a, facere fugit error accusamus est officiis vero in, nostrum laboriosam corrupti explicabo, cumque repudiandae deleniti perspiciatis quae consectetur enim. Laboriosam!</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (579, 122, 76, 1, NULL, NULL, NULL, NULL, N'Success Stories', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (580, 122, 77, 1, NULL, NULL, NULL, NULL, NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat.</p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (581, 122, 78, 1, NULL, NULL, NULL, NULL, NULL, N'[{"name":"Youtube","url":"https://youtu.be/nA1Aqp0sPQo"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (582, 122, 79, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"b956862a-4a38-4a8f-bec5-b1fb3652b238","mediaKey":"20017f6e-974f-4c46-87ac-3d2d621ae795"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (583, 122, 80, 1, NULL, NULL, NULL, NULL, N' Our Teachers', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (584, 122, 81, 1, NULL, NULL, NULL, NULL, NULL, N'umb://document/3fda9d3a9b8c4aadbe2ebe2aa261db5b,umb://document/c85d45723cbf428e9204f7efa6589dc5,umb://document/fae7caa40637481f925cd5205568d8ca')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (585, 123, 52, 1, NULL, NULL, NULL, NULL, N'About', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (586, 123, 73, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"c82a046d-523a-4732-ad29-1cc4ec789eac","mediaKey":"2d4fa626-5594-4344-98dd-6969a44a9e46"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (587, 123, 74, 1, NULL, NULL, NULL, NULL, N'ABOUT OUR JOURNY', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (588, 123, 75, 1, NULL, NULL, NULL, NULL, NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et.dolore magna aliqua. Ut enim ad minim veniam, quis nostrud. Lorem ipsum dolor sit amet consectetur, adipisicing elit. Saepe ipsa illo quod veritatis, magni debitis fugiat dolore voluptates! Consequatur, aliquid. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quaerat perferendis sint optio similique. Et amet magni facilis vero corporis quos.</p>
<p>exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum, dolor sit amet consectetur adipisicing elit. Ipsum a, facere fugit error accusamus est officiis vero in, nostrum laboriosam corrupti explicabo, cumque repudiandae deleniti perspiciatis quae consectetur enim. Laboriosam!</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (589, 123, 76, 1, NULL, NULL, NULL, NULL, N'Success Stories', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (590, 123, 77, 1, NULL, NULL, NULL, NULL, NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat.</p>
<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (591, 123, 78, 1, NULL, NULL, NULL, NULL, NULL, N'[{"name":"Youtube","url":"https://youtu.be/nA1Aqp0sPQo"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (592, 123, 79, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"b956862a-4a38-4a8f-bec5-b1fb3652b238","mediaKey":"20017f6e-974f-4c46-87ac-3d2d621ae795"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (593, 123, 80, 1, NULL, NULL, NULL, NULL, N' Our Teachers', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (594, 123, 81, 1, NULL, NULL, NULL, NULL, NULL, N'umb://document/3fda9d3a9b8c4aadbe2ebe2aa261db5b,umb://document/c85d45723cbf428e9204f7efa6589dc5,umb://document/fae7caa40637481f925cd5205568d8ca')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (595, 124, 52, 1, NULL, NULL, NULL, NULL, N'Home', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (596, 95, 101, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"74d8cb9d-4031-4e4b-ae7b-c8b52122ba4e","name":"Your bright future is our mission","ncContentTypeAlias":"slid","title":"Your bright future is our mission","description":"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exer</p>","applyButton":"Apply Now","applicationRedirection":"[{\"name\":\"Courses\",\"udi\":\"umb://document/a69040861ac147388a27801d637147aa\"}]"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (597, 124, 101, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"74d8cb9d-4031-4e4b-ae7b-c8b52122ba4e","name":"Your bright future is our mission","ncContentTypeAlias":"slid","title":"Your bright future is our mission","description":"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exer</p>","applyButton":"Apply Now","applicationRedirection":"[{\"name\":\"Courses\",\"udi\":\"umb://document/a69040861ac147388a27801d637147aa\"}]"},{"key":"b027d0c7-16a8-451f-a42f-feae19626b8b","name":"Your bright future is our mission","ncContentTypeAlias":"slid","title":"Your bright future is our mission","description":"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exer</p>","applyButton":"Apply Now","applicationRedirection":"[{\"name\":\"Courses\",\"udi\":\"umb://document/a69040861ac147388a27801d637147aa\"}]"},{"key":"9d5c76e6-5e90-4ec4-92df-8923c9ff0ff0","name":"Your bright future is our mission","ncContentTypeAlias":"slid","title":"Your bright future is our mission","description":"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exer</p>","applyButton":"Apply Now","applicationRedirection":"[{\"name\":\"Courses\",\"udi\":\"umb://document/a69040861ac147388a27801d637147aa\"}]"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (598, 95, 102, 1, NULL, NULL, NULL, NULL, NULL, N'[]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (599, 124, 102, 1, NULL, NULL, NULL, NULL, NULL, N'[]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (600, 125, 52, 1, NULL, NULL, NULL, NULL, N'Home', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (601, 125, 101, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"74d8cb9d-4031-4e4b-ae7b-c8b52122ba4e","name":"Your bright future is our mission","ncContentTypeAlias":"slid","title":"Your bright future is our mission","description":"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exer</p>","applyButton":"Apply Now","applicationRedirection":"[{\"name\":\"Courses\",\"udi\":\"umb://document/a69040861ac147388a27801d637147aa\"}]"},{"key":"b027d0c7-16a8-451f-a42f-feae19626b8b","name":"Your bright future is our mission","ncContentTypeAlias":"slid","title":"Your bright future is our mission","description":"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exer</p>","applyButton":"Apply Now","applicationRedirection":"[{\"name\":\"Courses\",\"udi\":\"umb://document/a69040861ac147388a27801d637147aa\"}]"},{"key":"9d5c76e6-5e90-4ec4-92df-8923c9ff0ff0","name":"Your bright future is our mission","ncContentTypeAlias":"slid","title":"Your bright future is our mission","description":"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exer</p>","applyButton":"Apply Now","applicationRedirection":"[{\"name\":\"Courses\",\"udi\":\"umb://document/a69040861ac147388a27801d637147aa\"}]"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (602, 125, 102, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"e4522124-ed30-415c-93b7-1d94598d78b2","mediaKey":"27d55040-17f5-45f3-9f06-1ee10ee7157d"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (603, 126, 52, 1, NULL, NULL, NULL, NULL, N'Home', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (604, 126, 101, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"74d8cb9d-4031-4e4b-ae7b-c8b52122ba4e","name":"Your bright future is our mission","ncContentTypeAlias":"slid","title":"Your bright future is our mission","description":"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exer</p>","applyButton":"Apply Now","applicationRedirection":"[{\"name\":\"Courses\",\"udi\":\"umb://document/a69040861ac147388a27801d637147aa\"}]"},{"key":"b027d0c7-16a8-451f-a42f-feae19626b8b","name":"Your bright future is our mission","ncContentTypeAlias":"slid","title":"Your bright future is our mission","description":"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exer</p>","applyButton":"Apply Now","applicationRedirection":"[{\"name\":\"Courses\",\"udi\":\"umb://document/a69040861ac147388a27801d637147aa\"}]"},{"key":"9d5c76e6-5e90-4ec4-92df-8923c9ff0ff0","name":"Your bright future is our mission","ncContentTypeAlias":"slid","title":"Your bright future is our mission","description":"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exer</p>","applyButton":"Apply Now","applicationRedirection":"[{\"name\":\"Courses\",\"udi\":\"umb://document/a69040861ac147388a27801d637147aa\"}]"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (605, 126, 102, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"e4522124-ed30-415c-93b7-1d94598d78b2","mediaKey":"27d55040-17f5-45f3-9f06-1ee10ee7157d"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (606, 125, 110, 1, NULL, NULL, NULL, NULL, NULL, N'[]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (607, 126, 110, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"ca8cd294-5660-4c3c-886c-7e0011b9e5a3","mediaKey":"2d4fa626-5594-4344-98dd-6969a44a9e46"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (608, 127, 52, 1, NULL, NULL, NULL, NULL, N'Home', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (609, 127, 101, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"74d8cb9d-4031-4e4b-ae7b-c8b52122ba4e","name":"Your bright future is our mission","ncContentTypeAlias":"slid","title":"Your bright future is our mission","description":"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exer</p>","applyButton":"Apply Now","applicationRedirection":"[{\"name\":\"Courses\",\"udi\":\"umb://document/a69040861ac147388a27801d637147aa\"}]"},{"key":"b027d0c7-16a8-451f-a42f-feae19626b8b","name":"Your bright future is our mission","ncContentTypeAlias":"slid","title":"Your bright future is our mission","description":"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exer</p>","applyButton":"Apply Now","applicationRedirection":"[{\"name\":\"Courses\",\"udi\":\"umb://document/a69040861ac147388a27801d637147aa\"}]"},{"key":"9d5c76e6-5e90-4ec4-92df-8923c9ff0ff0","name":"Your bright future is our mission","ncContentTypeAlias":"slid","title":"Your bright future is our mission","description":"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exer</p>","applyButton":"Apply Now","applicationRedirection":"[{\"name\":\"Courses\",\"udi\":\"umb://document/a69040861ac147388a27801d637147aa\"}]"}]')
GO
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (610, 127, 102, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"e4522124-ed30-415c-93b7-1d94598d78b2","mediaKey":"27d55040-17f5-45f3-9f06-1ee10ee7157d"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (611, 126, 107, 1, NULL, NULL, NULL, NULL, N'About Educenter', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (612, 127, 107, 1, NULL, NULL, NULL, NULL, N'About Educenter', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (613, 126, 108, 1, NULL, NULL, NULL, NULL, NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat</p>
<p>cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (614, 127, 108, 1, NULL, NULL, NULL, NULL, NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat</p>
<p>cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (615, 127, 110, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"ca8cd294-5660-4c3c-886c-7e0011b9e5a3","mediaKey":"2d4fa626-5594-4344-98dd-6969a44a9e46"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (616, 128, 52, 1, NULL, NULL, NULL, NULL, N'Home', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (617, 128, 101, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"74d8cb9d-4031-4e4b-ae7b-c8b52122ba4e","name":"Your bright future is our mission","ncContentTypeAlias":"slid","title":"Your bright future is our mission","description":"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exer</p>","applyButton":"Apply Now","applicationRedirection":"[{\"name\":\"Courses\",\"udi\":\"umb://document/a69040861ac147388a27801d637147aa\"}]"},{"key":"b027d0c7-16a8-451f-a42f-feae19626b8b","name":"Your bright future is our mission","ncContentTypeAlias":"slid","title":"Your bright future is our mission","description":"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exer</p>","applyButton":"Apply Now","applicationRedirection":"[{\"name\":\"Courses\",\"udi\":\"umb://document/a69040861ac147388a27801d637147aa\"}]"},{"key":"9d5c76e6-5e90-4ec4-92df-8923c9ff0ff0","name":"Your bright future is our mission","ncContentTypeAlias":"slid","title":"Your bright future is our mission","description":"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exer</p>","applyButton":"Apply Now","applicationRedirection":"[{\"name\":\"Courses\",\"udi\":\"umb://document/a69040861ac147388a27801d637147aa\"}]"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (618, 128, 102, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"e4522124-ed30-415c-93b7-1d94598d78b2","mediaKey":"27d55040-17f5-45f3-9f06-1ee10ee7157d"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (619, 128, 107, 1, NULL, NULL, NULL, NULL, N'About Educenter', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (620, 128, 108, 1, NULL, NULL, NULL, NULL, NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat</p>
<p>cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (621, 127, 109, 1, NULL, NULL, NULL, NULL, NULL, N'[{"name":"About","udi":"umb://document/754578e71ce14d148b9457777a2340f9"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (622, 128, 109, 1, NULL, NULL, NULL, NULL, NULL, N'[{"name":"About","udi":"umb://document/754578e71ce14d148b9457777a2340f9"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (623, 128, 110, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"ca8cd294-5660-4c3c-886c-7e0011b9e5a3","mediaKey":"2d4fa626-5594-4344-98dd-6969a44a9e46"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (624, 129, 52, 1, NULL, NULL, NULL, NULL, N'Home', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (625, 129, 101, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"74d8cb9d-4031-4e4b-ae7b-c8b52122ba4e","name":"Your bright future is our mission","ncContentTypeAlias":"slid","title":"Your bright future is our mission","description":"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exer</p>","applyButton":"Apply Now","applicationRedirection":"[{\"name\":\"Courses\",\"udi\":\"umb://document/a69040861ac147388a27801d637147aa\"}]"},{"key":"b027d0c7-16a8-451f-a42f-feae19626b8b","name":"Your bright future is our mission","ncContentTypeAlias":"slid","title":"Your bright future is our mission","description":"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exer</p>","applyButton":"Apply Now","applicationRedirection":"[{\"name\":\"Courses\",\"udi\":\"umb://document/a69040861ac147388a27801d637147aa\"}]"},{"key":"9d5c76e6-5e90-4ec4-92df-8923c9ff0ff0","name":"Your bright future is our mission","ncContentTypeAlias":"slid","title":"Your bright future is our mission","description":"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exer</p>","applyButton":"Apply Now","applicationRedirection":"[{\"name\":\"Courses\",\"udi\":\"umb://document/a69040861ac147388a27801d637147aa\"}]"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (626, 129, 102, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"e4522124-ed30-415c-93b7-1d94598d78b2","mediaKey":"27d55040-17f5-45f3-9f06-1ee10ee7157d"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (627, 129, 107, 1, NULL, NULL, NULL, NULL, N'About Educenter', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (628, 129, 108, 1, NULL, NULL, NULL, NULL, NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat</p>
<p>cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (629, 129, 109, 1, NULL, NULL, NULL, NULL, NULL, N'[{"name":"About","udi":"umb://document/754578e71ce14d148b9457777a2340f9"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (630, 129, 110, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"ca8cd294-5660-4c3c-886c-7e0011b9e5a3","mediaKey":"2d4fa626-5594-4344-98dd-6969a44a9e46"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (631, 128, 111, 1, NULL, NULL, NULL, NULL, NULL, N'umb://document/904cbdbb174e4ca2a8b7e22c53fd515a,umb://document/2e9e9214b73c4f29920619db2b1443eb,umb://document/6265f2fbf58c4f27bdcadd90ed9f3ccd')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (632, 129, 111, 1, NULL, NULL, NULL, NULL, NULL, N'umb://document/904cbdbb174e4ca2a8b7e22c53fd515a,umb://document/2e9e9214b73c4f29920619db2b1443eb,umb://document/6265f2fbf58c4f27bdcadd90ed9f3ccd')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (633, 128, 112, 1, NULL, NULL, NULL, NULL, N' Our Teachers', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (634, 129, 112, 1, NULL, NULL, NULL, NULL, N' Our Teachers', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (635, 128, 113, 1, NULL, NULL, NULL, NULL, NULL, N'umb://document/c85d45723cbf428e9204f7efa6589dc5,umb://document/fae7caa40637481f925cd5205568d8ca,umb://document/3fda9d3a9b8c4aadbe2ebe2aa261db5b')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (636, 129, 113, 1, NULL, NULL, NULL, NULL, NULL, N'umb://document/c85d45723cbf428e9204f7efa6589dc5,umb://document/fae7caa40637481f925cd5205568d8ca,umb://document/3fda9d3a9b8c4aadbe2ebe2aa261db5b')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (637, 130, 52, 1, NULL, NULL, NULL, NULL, N'Home', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (638, 130, 101, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"74d8cb9d-4031-4e4b-ae7b-c8b52122ba4e","name":"Your bright future is our mission","ncContentTypeAlias":"slid","title":"Your bright future is our mission","description":"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exer</p>","applyButton":"Apply Now","applicationRedirection":"[{\"name\":\"Courses\",\"udi\":\"umb://document/a69040861ac147388a27801d637147aa\"}]"},{"key":"b027d0c7-16a8-451f-a42f-feae19626b8b","name":"Your bright future is our mission","ncContentTypeAlias":"slid","title":"Your bright future is our mission","description":"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exer</p>","applyButton":"Apply Now","applicationRedirection":"[{\"name\":\"Courses\",\"udi\":\"umb://document/a69040861ac147388a27801d637147aa\"}]"},{"key":"9d5c76e6-5e90-4ec4-92df-8923c9ff0ff0","name":"Your bright future is our mission","ncContentTypeAlias":"slid","title":"Your bright future is our mission","description":"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exer</p>","applyButton":"Apply Now","applicationRedirection":"[{\"name\":\"Courses\",\"udi\":\"umb://document/a69040861ac147388a27801d637147aa\"}]"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (639, 130, 102, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"e4522124-ed30-415c-93b7-1d94598d78b2","mediaKey":"27d55040-17f5-45f3-9f06-1ee10ee7157d"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (640, 130, 107, 1, NULL, NULL, NULL, NULL, N'About Educenter', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (641, 130, 108, 1, NULL, NULL, NULL, NULL, NULL, N'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat</p>
<p>cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (642, 130, 109, 1, NULL, NULL, NULL, NULL, NULL, N'[{"name":"About","udi":"umb://document/754578e71ce14d148b9457777a2340f9"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (643, 130, 110, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"ca8cd294-5660-4c3c-886c-7e0011b9e5a3","mediaKey":"2d4fa626-5594-4344-98dd-6969a44a9e46"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (644, 130, 111, 1, NULL, NULL, NULL, NULL, NULL, N'umb://document/904cbdbb174e4ca2a8b7e22c53fd515a,umb://document/2e9e9214b73c4f29920619db2b1443eb,umb://document/6265f2fbf58c4f27bdcadd90ed9f3ccd')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (645, 130, 112, 1, NULL, NULL, NULL, NULL, N' Our Teachers', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (646, 130, 113, 1, NULL, NULL, NULL, NULL, NULL, N'umb://document/c85d45723cbf428e9204f7efa6589dc5,umb://document/fae7caa40637481f925cd5205568d8ca,umb://document/3fda9d3a9b8c4aadbe2ebe2aa261db5b')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (647, 131, 52, 1, NULL, NULL, NULL, NULL, N'Code Book', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (648, 131, 53, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"8f927ce9-327b-4193-a9ad-38b6a6e09e3d","mediaKey":"fea5dcf1-1faa-4fa4-b650-dbe1f1460833"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (649, 131, 54, 1, NULL, NULL, NULL, NULL, NULL, N'[{"name":"Scholarships","udi":"umb://document/619ab6882066434a8e1e58bc11a3118d"},{"name":"Researches","udi":"umb://document/e253f99f5d3e4425ac2c2a9ada634df8"},{"name":"Notices","udi":"umb://document/81a6035295c042c4a29cab7b7f8e839c"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (650, 131, 55, 1, NULL, NULL, NULL, NULL, NULL, N'[{"name":"Home","udi":"umb://document/9e0e6a37fea74b3980ea5fedb72a4d4e"},{"name":"About","udi":"umb://document/754578e71ce14d148b9457777a2340f9"},{"name":"Courses","udi":"umb://document/a69040861ac147388a27801d637147aa"},{"name":"Events","udi":"umb://document/fd7b9ce1b24d440a90cf13fd1ee44517"},{"name":"Blogs","udi":"umb://document/738f46fb472a45c29f4bcac810fa1de8"},{"name":"Teachers","udi":"umb://document/9f465a8361c7422cb89ba8aeb5e2f977"},{"name":"Contact Us","udi":"umb://document/9e25c120c7d54b55b0ec44544babf1cd"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (651, 131, 60, 1, NULL, NULL, NULL, NULL, NULL, N'[{"name":"+44 300 303 0266","url":"callto:+443003030266"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (652, 101, 118, 1, NULL, NULL, NULL, NULL, N'umb://document/9e0e6a37fea74b3980ea5fedb72a4d4e', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (653, 131, 118, 1, NULL, NULL, NULL, NULL, N'umb://document/9e0e6a37fea74b3980ea5fedb72a4d4e', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (654, 131, 63, 1, NULL, NULL, NULL, NULL, N'23621 15 Mile Rd #C104, Clinton MI, 48035, New York, USA', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (655, 131, 64, 1, NULL, NULL, NULL, NULL, N'+1 (2) 345 6789', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (656, 131, 65, 1, NULL, NULL, NULL, NULL, N'+1 (2) 345 6789', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (657, 131, 66, 1, NULL, NULL, NULL, NULL, N'contact@CodeBook.edu', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (658, 131, 68, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"b564509a-9116-4dcf-a728-e87c74954fa2","name":"COMPANY","ncContentTypeAlias":"menu","menuTitle":"COMPANY","menuItems":"[{\"name\":\"About\",\"udi\":\"umb://document/754578e71ce14d148b9457777a2340f9\"},{\"name\":\"Teachers\",\"udi\":\"umb://document/9f465a8361c7422cb89ba8aeb5e2f977\"},{\"name\":\"Contact Us\",\"udi\":\"umb://document/9e25c120c7d54b55b0ec44544babf1cd\"},{\"name\":\"Blogs\",\"udi\":\"umb://document/738f46fb472a45c29f4bcac810fa1de8\"}]"},{"key":"f02e646f-ebc1-449e-9767-eaaf8ec7df38","name":"LINKS","ncContentTypeAlias":"menu","menuTitle":"LINKS","menuItems":"[{\"name\":\"Courses\",\"udi\":\"umb://document/a69040861ac147388a27801d637147aa\"},{\"name\":\"Events\",\"udi\":\"umb://document/fd7b9ce1b24d440a90cf13fd1ee44517\"},{\"name\":\"Gallary\",\"udi\":\"umb://document/50b4d811216e43b0b8923dbcdc59e4c6\"},{\"name\":\"FAQS\",\"udi\":\"umb://document/50b4d811216e43b0b8923dbcdc59e4c6\"}]"},{"key":"4b080068-2601-4537-9706-4f528abe1afe","name":"SUPPORT","ncContentTypeAlias":"menu","menuTitle":"SUPPORT","menuItems":"[{\"name\":\"Fourms\",\"udi\":\"umb://document/50b4d811216e43b0b8923dbcdc59e4c6\"},{\"name\":\"Documentation\",\"udi\":\"umb://document/50b4d811216e43b0b8923dbcdc59e4c6\"},{\"name\":\"Language\",\"udi\":\"umb://document/50b4d811216e43b0b8923dbcdc59e4c6\"},{\"name\":\"Release Status\",\"udi\":\"umb://document/50b4d811216e43b0b8923dbcdc59e4c6\"}]"},{"key":"65420287-072d-45ae-9bbb-b933b5f6f36a","name":"RECOMMEND","ncContentTypeAlias":"menu","menuTitle":"RECOMMEND","menuItems":"[{\"name\":\"Umbraco\",\"udi\":\"umb://document/50b4d811216e43b0b8923dbcdc59e4c6\"},{\"name\":\"WordPress\",\"udi\":\"umb://document/50b4d811216e43b0b8923dbcdc59e4c6\"},{\"name\":\"eCommerce\",\"udi\":\"umb://document/50b4d811216e43b0b8923dbcdc59e4c6\"}]"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (659, 131, 59, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"16aa8042-2770-4c16-a5cd-b432a1afd540","name":"FaceBook","ncContentTypeAlias":"detailedMenu","itemName":"FaceBook","itemIcon":"ti-facebook","itemURL":"[{\"name\":\"https://www.facebook.com/\",\"target\":\"_blank\",\"url\":\"https://www.facebook.com/\"}]"},{"key":"8f91a3fe-7605-4a81-b98a-ebbccfcc508b","name":"Twitter","ncContentTypeAlias":"detailedMenu","itemName":"Twitter","itemIcon":"ti-twitter-alt","itemURL":"[{\"name\":\"https://twitter.com/\",\"target\":\"_blank\",\"url\":\"https://twitter.com/\"}]"},{"key":"3cc9540e-5c3b-42bf-aea4-b3e5265b31e8","name":"Linkedin","ncContentTypeAlias":"detailedMenu","itemName":"Linkedin","itemIcon":"ti-linkedin","itemURL":"[{\"name\":\"https://www.linkedin.com/\",\"url\":\"https://www.linkedin.com/\"}]"},{"key":"a8fcf10b-52c9-4032-825e-b6ed539a994b","name":"Instgram","ncContentTypeAlias":"detailedMenu","itemName":"Instgram","itemIcon":"ti-instagram","itemURL":"[{\"name\":\"https://www.instagram.com/\",\"target\":\"_blank\",\"url\":\"https://www.instagram.com/\"}]"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (660, 78, 115, 1, NULL, NULL, NULL, NULL, NULL, N'[]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (661, 132, 115, 1, NULL, NULL, NULL, NULL, NULL, N'[]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (662, 132, 52, 1, NULL, NULL, NULL, NULL, N'Teachers', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (663, 78, 119, 1, NULL, NULL, NULL, NULL, NULL, N'cat1
cat2
cat3')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (664, 132, 119, 1, NULL, NULL, NULL, NULL, NULL, N'cat1
cat2
cat3')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (665, 133, 52, 1, NULL, NULL, NULL, NULL, N'John Doe', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (666, 133, 82, 1, NULL, NULL, NULL, NULL, NULL, N'<p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Cumque accusamus tenetur ea harum delectus ab consequatur excepturi, odit qui in quo quia voluptate nam optio, culpa aspernatur. Error placeat iusto officia voluptas quae.</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (667, 133, 83, 1, NULL, NULL, NULL, NULL, N'Computer Science', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (668, 133, 85, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"392dca1e-9f01-4336-b5ce-2cb68cf594d0","mediaKey":"ce41350c-1061-45cd-b6a6-58ec905996c7"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (669, 133, 86, 1, NULL, NULL, NULL, NULL, NULL, N'Computer Networking
Computer Security
Human Computer Interfacing')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (670, 133, 87, 1, NULL, NULL, NULL, NULL, NULL, N'<p class="mb-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto.</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (671, 109, 120, 1, NULL, NULL, NULL, NULL, NULL, N'cat1')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (672, 133, 120, 1, NULL, NULL, NULL, NULL, NULL, N'cat1')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (673, 134, 52, 1, NULL, NULL, NULL, NULL, N'Clark Malik', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (674, 134, 82, 1, NULL, NULL, NULL, NULL, NULL, N'<p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Cumque accusamus tenetur ea harum delectus ab consequatur excepturi, odit qui in quo quia voluptate nam optio, culpa aspernatur. Error placeat iusto officia voluptas quae.</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (675, 134, 83, 1, NULL, NULL, NULL, NULL, N'Computer Science', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (676, 134, 85, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"392dca1e-9f01-4336-b5ce-2cb68cf594d0","mediaKey":"9940e5be-d0b2-49c0-b3e2-64bfb29b69af"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (677, 134, 86, 1, NULL, NULL, NULL, NULL, NULL, N'Computer Networking
Computer Security
Human Computer Interfacing')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (678, 134, 87, 1, NULL, NULL, NULL, NULL, NULL, N'<p class="mb-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto.</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (679, 112, 120, 1, NULL, NULL, NULL, NULL, NULL, N'cat2')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (680, 134, 120, 1, NULL, NULL, NULL, NULL, NULL, N'cat2')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (681, 135, 52, 1, NULL, NULL, NULL, NULL, N'Jacke Masito', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (682, 135, 82, 1, NULL, NULL, NULL, NULL, NULL, N'<p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Cumque accusamus tenetur ea harum delectus ab consequatur excepturi, odit qui in quo quia voluptate nam optio, culpa aspernatur. Error placeat iusto officia voluptas quae.</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (683, 135, 83, 1, NULL, NULL, NULL, NULL, N'Computer Science', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (684, 135, 85, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"392dca1e-9f01-4336-b5ce-2cb68cf594d0","mediaKey":"10eb6578-4aea-451d-8412-aadfad1f8da3"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (685, 135, 86, 1, NULL, NULL, NULL, NULL, NULL, N'Computer Networking
Computer Security
Human Computer Interfacing')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (686, 135, 87, 1, NULL, NULL, NULL, NULL, NULL, N'<p class="mb-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto.</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (687, 113, 88, 1, NULL, NULL, NULL, NULL, NULL, N'umb://document/6265f2fbf58c4f27bdcadd90ed9f3ccd,umb://document/2e9e9214b73c4f29920619db2b1443eb,umb://document/904cbdbb174e4ca2a8b7e22c53fd515a')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (688, 135, 88, 1, NULL, NULL, NULL, NULL, NULL, N'umb://document/6265f2fbf58c4f27bdcadd90ed9f3ccd,umb://document/2e9e9214b73c4f29920619db2b1443eb,umb://document/904cbdbb174e4ca2a8b7e22c53fd515a')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (689, 113, 120, 1, NULL, NULL, NULL, NULL, NULL, N'cat1')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (690, 135, 120, 1, NULL, NULL, NULL, NULL, NULL, N'cat1')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (691, 136, 52, 1, NULL, NULL, NULL, NULL, N'Clark Malik', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (692, 136, 82, 1, NULL, NULL, NULL, NULL, NULL, N'<p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Cumque accusamus tenetur ea harum delectus ab consequatur excepturi, odit qui in quo quia voluptate nam optio, culpa aspernatur. Error placeat iusto officia voluptas quae.</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (693, 136, 83, 1, NULL, NULL, NULL, NULL, N'Computer Science', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (694, 136, 85, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"392dca1e-9f01-4336-b5ce-2cb68cf594d0","mediaKey":"9940e5be-d0b2-49c0-b3e2-64bfb29b69af"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (695, 136, 86, 1, NULL, NULL, NULL, NULL, NULL, N'Computer Networking
Computer Security
Human Computer Interfacing')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (696, 136, 87, 1, NULL, NULL, NULL, NULL, NULL, N'<p class="mb-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto.</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (697, 134, 88, 1, NULL, NULL, NULL, NULL, NULL, N'umb://document/2e9e9214b73c4f29920619db2b1443eb,umb://document/904cbdbb174e4ca2a8b7e22c53fd515a,umb://document/6265f2fbf58c4f27bdcadd90ed9f3ccd')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (698, 136, 88, 1, NULL, NULL, NULL, NULL, NULL, N'umb://document/2e9e9214b73c4f29920619db2b1443eb,umb://document/904cbdbb174e4ca2a8b7e22c53fd515a,umb://document/6265f2fbf58c4f27bdcadd90ed9f3ccd')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (699, 136, 120, 1, NULL, NULL, NULL, NULL, NULL, N'cat2')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (700, 137, 52, 1, NULL, NULL, NULL, NULL, N'John Doe', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (701, 137, 82, 1, NULL, NULL, NULL, NULL, NULL, N'<p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Cumque accusamus tenetur ea harum delectus ab consequatur excepturi, odit qui in quo quia voluptate nam optio, culpa aspernatur. Error placeat iusto officia voluptas quae.</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (702, 137, 83, 1, NULL, NULL, NULL, NULL, N'Computer Science', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (703, 137, 85, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"392dca1e-9f01-4336-b5ce-2cb68cf594d0","mediaKey":"ce41350c-1061-45cd-b6a6-58ec905996c7"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (704, 137, 86, 1, NULL, NULL, NULL, NULL, NULL, N'Computer Networking
Computer Security
Human Computer Interfacing')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (705, 137, 87, 1, NULL, NULL, NULL, NULL, NULL, N'<p class="mb-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto.</p>')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (706, 133, 88, 1, NULL, NULL, NULL, NULL, NULL, N'umb://document/2e9e9214b73c4f29920619db2b1443eb,umb://document/904cbdbb174e4ca2a8b7e22c53fd515a,umb://document/6265f2fbf58c4f27bdcadd90ed9f3ccd')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (707, 137, 88, 1, NULL, NULL, NULL, NULL, NULL, N'umb://document/2e9e9214b73c4f29920619db2b1443eb,umb://document/904cbdbb174e4ca2a8b7e22c53fd515a,umb://document/6265f2fbf58c4f27bdcadd90ed9f3ccd')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (708, 137, 120, 1, NULL, NULL, NULL, NULL, NULL, N'cat1')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (709, 131, 121, 1, NULL, NULL, NULL, NULL, N' Subscribe Now ', NULL)
GO
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (710, 131, 122, 1, NULL, NULL, NULL, NULL, N'Join', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (711, 131, 123, 1, NULL, NULL, NULL, NULL, N'Enter you Email', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (712, 138, 52, 1, NULL, NULL, NULL, NULL, N'Code Book', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (713, 138, 53, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"8f927ce9-327b-4193-a9ad-38b6a6e09e3d","mediaKey":"fea5dcf1-1faa-4fa4-b650-dbe1f1460833"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (714, 138, 54, 1, NULL, NULL, NULL, NULL, NULL, N'[{"name":"Scholarships","udi":"umb://document/619ab6882066434a8e1e58bc11a3118d"},{"name":"Researches","udi":"umb://document/e253f99f5d3e4425ac2c2a9ada634df8"},{"name":"Notices","udi":"umb://document/81a6035295c042c4a29cab7b7f8e839c"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (715, 138, 55, 1, NULL, NULL, NULL, NULL, NULL, N'[{"name":"Home","udi":"umb://document/9e0e6a37fea74b3980ea5fedb72a4d4e"},{"name":"About","udi":"umb://document/754578e71ce14d148b9457777a2340f9"},{"name":"Courses","udi":"umb://document/a69040861ac147388a27801d637147aa"},{"name":"Events","udi":"umb://document/fd7b9ce1b24d440a90cf13fd1ee44517"},{"name":"Blogs","udi":"umb://document/738f46fb472a45c29f4bcac810fa1de8"},{"name":"Teachers","udi":"umb://document/9f465a8361c7422cb89ba8aeb5e2f977"},{"name":"Contact Us","udi":"umb://document/9e25c120c7d54b55b0ec44544babf1cd"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (716, 138, 60, 1, NULL, NULL, NULL, NULL, NULL, N'[{"name":"+44 300 303 0266","url":"callto:+443003030266"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (717, 138, 118, 1, NULL, NULL, NULL, NULL, N'umb://document/9e0e6a37fea74b3980ea5fedb72a4d4e', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (718, 138, 121, 1, NULL, NULL, NULL, NULL, N' Subscribe Now ', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (719, 138, 122, 1, NULL, NULL, NULL, NULL, N'Join', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (720, 138, 123, 1, NULL, NULL, NULL, NULL, N'Enter you Email', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (721, 138, 63, 1, NULL, NULL, NULL, NULL, N'23621 15 Mile Rd #C104, Clinton MI, 48035, New York, USA', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (722, 138, 64, 1, NULL, NULL, NULL, NULL, N'+1 (2) 345 6789', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (723, 138, 65, 1, NULL, NULL, NULL, NULL, N'+1 (2) 345 6789', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (724, 138, 66, 1, NULL, NULL, NULL, NULL, N'contact@CodeBook.edu', NULL)
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (725, 138, 68, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"b564509a-9116-4dcf-a728-e87c74954fa2","name":"COMPANY","ncContentTypeAlias":"menu","menuTitle":"COMPANY","menuItems":"[{\"name\":\"About\",\"udi\":\"umb://document/754578e71ce14d148b9457777a2340f9\"},{\"name\":\"Teachers\",\"udi\":\"umb://document/9f465a8361c7422cb89ba8aeb5e2f977\"},{\"name\":\"Contact Us\",\"udi\":\"umb://document/9e25c120c7d54b55b0ec44544babf1cd\"},{\"name\":\"Blogs\",\"udi\":\"umb://document/738f46fb472a45c29f4bcac810fa1de8\"}]"},{"key":"f02e646f-ebc1-449e-9767-eaaf8ec7df38","name":"LINKS","ncContentTypeAlias":"menu","menuTitle":"LINKS","menuItems":"[{\"name\":\"Courses\",\"udi\":\"umb://document/a69040861ac147388a27801d637147aa\"},{\"name\":\"Events\",\"udi\":\"umb://document/fd7b9ce1b24d440a90cf13fd1ee44517\"},{\"name\":\"Gallary\",\"udi\":\"umb://document/50b4d811216e43b0b8923dbcdc59e4c6\"},{\"name\":\"FAQS\",\"udi\":\"umb://document/50b4d811216e43b0b8923dbcdc59e4c6\"}]"},{"key":"4b080068-2601-4537-9706-4f528abe1afe","name":"SUPPORT","ncContentTypeAlias":"menu","menuTitle":"SUPPORT","menuItems":"[{\"name\":\"Fourms\",\"udi\":\"umb://document/50b4d811216e43b0b8923dbcdc59e4c6\"},{\"name\":\"Documentation\",\"udi\":\"umb://document/50b4d811216e43b0b8923dbcdc59e4c6\"},{\"name\":\"Language\",\"udi\":\"umb://document/50b4d811216e43b0b8923dbcdc59e4c6\"},{\"name\":\"Release Status\",\"udi\":\"umb://document/50b4d811216e43b0b8923dbcdc59e4c6\"}]"},{"key":"65420287-072d-45ae-9bbb-b933b5f6f36a","name":"RECOMMEND","ncContentTypeAlias":"menu","menuTitle":"RECOMMEND","menuItems":"[{\"name\":\"Umbraco\",\"udi\":\"umb://document/50b4d811216e43b0b8923dbcdc59e4c6\"},{\"name\":\"WordPress\",\"udi\":\"umb://document/50b4d811216e43b0b8923dbcdc59e4c6\"},{\"name\":\"eCommerce\",\"udi\":\"umb://document/50b4d811216e43b0b8923dbcdc59e4c6\"}]"}]')
INSERT [dbo].[umbracoPropertyData] ([id], [versionId], [propertyTypeId], [languageId], [segment], [intValue], [decimalValue], [dateValue], [varcharValue], [textValue]) VALUES (726, 138, 59, 1, NULL, NULL, NULL, NULL, NULL, N'[{"key":"16aa8042-2770-4c16-a5cd-b432a1afd540","name":"FaceBook","ncContentTypeAlias":"detailedMenu","itemName":"FaceBook","itemIcon":"ti-facebook","itemURL":"[{\"name\":\"https://www.facebook.com/\",\"target\":\"_blank\",\"url\":\"https://www.facebook.com/\"}]"},{"key":"8f91a3fe-7605-4a81-b98a-ebbccfcc508b","name":"Twitter","ncContentTypeAlias":"detailedMenu","itemName":"Twitter","itemIcon":"ti-twitter-alt","itemURL":"[{\"name\":\"https://twitter.com/\",\"target\":\"_blank\",\"url\":\"https://twitter.com/\"}]"},{"key":"3cc9540e-5c3b-42bf-aea4-b3e5265b31e8","name":"Linkedin","ncContentTypeAlias":"detailedMenu","itemName":"Linkedin","itemIcon":"ti-linkedin","itemURL":"[{\"name\":\"https://www.linkedin.com/\",\"url\":\"https://www.linkedin.com/\"}]"},{"key":"a8fcf10b-52c9-4032-825e-b6ed539a994b","name":"Instgram","ncContentTypeAlias":"detailedMenu","itemName":"Instgram","itemIcon":"ti-instagram","itemURL":"[{\"name\":\"https://www.instagram.com/\",\"target\":\"_blank\",\"url\":\"https://www.instagram.com/\"}]"}]')
SET IDENTITY_INSERT [dbo].[umbracoPropertyData] OFF
GO
SET IDENTITY_INSERT [dbo].[umbracoRelation] ON 

INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (124, 1206, 1207, 1, CAST(N'2022-07-11T14:44:41.153' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (126, 1206, 1208, 1, CAST(N'2022-07-11T14:44:47.900' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (129, 1209, 1068, 4, CAST(N'2022-07-11T14:50:41.497' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (130, 1209, 1206, 5, CAST(N'2022-07-11T14:50:41.497' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (131, 1209, 1207, 5, CAST(N'2022-07-11T14:50:41.497' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (132, 1209, 1208, 5, CAST(N'2022-07-11T14:50:41.497' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (137, 1209, 1210, 1, CAST(N'2022-07-11T14:50:55.057' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (142, 1209, 1211, 1, CAST(N'2022-07-11T14:51:01.573' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (143, 1210, 1068, 4, CAST(N'2022-07-11T14:51:31.480' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (144, 1210, 1206, 5, CAST(N'2022-07-11T14:51:31.480' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (145, 1210, 1207, 5, CAST(N'2022-07-11T14:51:31.480' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (146, 1210, 1208, 5, CAST(N'2022-07-11T14:51:31.480' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (151, 1211, 1068, 4, CAST(N'2022-07-11T14:52:14.933' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (152, 1211, 1206, 5, CAST(N'2022-07-11T14:52:14.933' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (153, 1211, 1207, 5, CAST(N'2022-07-11T14:52:14.933' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (154, 1211, 1208, 5, CAST(N'2022-07-11T14:52:14.933' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (155, 1211, 1210, 5, CAST(N'2022-07-11T14:52:14.933' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (156, 1211, 1209, 5, CAST(N'2022-07-11T14:52:14.933' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (157, 1211, 1211, 5, CAST(N'2022-07-11T14:52:14.933' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (168, 1186, 1067, 4, CAST(N'2022-07-11T15:06:13.503' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (169, 1186, 1080, 4, CAST(N'2022-07-11T15:06:13.503' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (170, 1186, 1206, 5, CAST(N'2022-07-11T15:06:13.503' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (171, 1186, 1207, 5, CAST(N'2022-07-11T15:06:13.503' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (172, 1186, 1208, 5, CAST(N'2022-07-11T15:06:13.503' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (194, 1199, 1188, 5, CAST(N'2022-07-11T17:23:22.657' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (195, 1199, 1079, 4, CAST(N'2022-07-11T17:23:22.657' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (196, 1199, 1186, 5, CAST(N'2022-07-11T17:23:22.657' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (197, 1199, 1067, 4, CAST(N'2022-07-11T17:23:22.657' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (198, 1199, 1209, 5, CAST(N'2022-07-11T17:23:22.657' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (199, 1199, 1210, 5, CAST(N'2022-07-11T17:23:22.657' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (200, 1199, 1211, 5, CAST(N'2022-07-11T17:23:22.657' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (201, 1199, 1207, 5, CAST(N'2022-07-11T17:23:22.657' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (202, 1199, 1208, 5, CAST(N'2022-07-11T17:23:22.657' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (203, 1199, 1206, 5, CAST(N'2022-07-11T17:23:22.657' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (218, 1208, 1109, 4, CAST(N'2022-07-11T17:41:11.297' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (219, 1208, 1211, 5, CAST(N'2022-07-11T17:41:11.297' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (220, 1208, 1210, 5, CAST(N'2022-07-11T17:41:11.297' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (221, 1208, 1209, 5, CAST(N'2022-07-11T17:41:11.297' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (222, 1207, 1108, 4, CAST(N'2022-07-11T17:41:31.050' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (223, 1207, 1210, 5, CAST(N'2022-07-11T17:41:31.050' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (224, 1207, 1209, 5, CAST(N'2022-07-11T17:41:31.050' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (225, 1207, 1211, 5, CAST(N'2022-07-11T17:41:31.050' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (226, 1206, 1107, 4, CAST(N'2022-07-11T17:41:45.867' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (227, 1206, 1210, 5, CAST(N'2022-07-11T17:41:45.867' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (228, 1206, 1209, 5, CAST(N'2022-07-11T17:41:45.867' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (229, 1206, 1211, 5, CAST(N'2022-07-11T17:41:45.867' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (242, 1062, 1075, 4, CAST(N'2022-07-11T17:50:59.870' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (243, 1062, 1189, 5, CAST(N'2022-07-11T17:50:59.870' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (244, 1062, 1195, 5, CAST(N'2022-07-11T17:50:59.870' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (245, 1062, 1194, 5, CAST(N'2022-07-11T17:50:59.870' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (246, 1062, 1199, 5, CAST(N'2022-07-11T17:50:59.870' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (247, 1062, 1186, 5, CAST(N'2022-07-11T17:50:59.870' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (248, 1062, 1188, 5, CAST(N'2022-07-11T17:50:59.870' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (249, 1062, 1193, 5, CAST(N'2022-07-11T17:50:59.870' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (250, 1062, 1187, 5, CAST(N'2022-07-11T17:50:59.870' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (251, 1062, 1191, 5, CAST(N'2022-07-11T17:50:59.870' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (252, 1062, 1192, 5, CAST(N'2022-07-11T17:50:59.870' AS DateTime), N'')
INSERT [dbo].[umbracoRelation] ([id], [parentId], [childId], [relType], [datetime], [comment]) VALUES (253, 1062, 1062, 5, CAST(N'2022-07-11T17:50:59.870' AS DateTime), N'')
SET IDENTITY_INSERT [dbo].[umbracoRelation] OFF
GO
SET IDENTITY_INSERT [dbo].[umbracoRelationType] ON 

INSERT [dbo].[umbracoRelationType] ([id], [typeUniqueId], [dual], [parentObjectType], [childObjectType], [name], [alias]) VALUES (1, N'4cbeb612-e689-3563-b755-bf3ede295433', 1, N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', N'Relate Document On Copy', N'relateDocumentOnCopy')
INSERT [dbo].[umbracoRelationType] ([id], [typeUniqueId], [dual], [parentObjectType], [childObjectType], [name], [alias]) VALUES (2, N'0cc3507c-66ab-3091-8913-3d998148e423', 0, N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', N'Relate Parent Document On Delete', N'relateParentDocumentOnDelete')
INSERT [dbo].[umbracoRelationType] ([id], [typeUniqueId], [dual], [parentObjectType], [childObjectType], [name], [alias]) VALUES (3, N'8307994f-faf2-3844-bab9-72d34514edf2', 0, N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', N'Relate Parent Media Folder On Delete', N'relateParentMediaFolderOnDelete')
INSERT [dbo].[umbracoRelationType] ([id], [typeUniqueId], [dual], [parentObjectType], [childObjectType], [name], [alias]) VALUES (4, N'4954ce93-3bf9-3d1e-9cd2-21bf9f9c2abf', 0, NULL, NULL, N'Related Media', N'umbMedia')
INSERT [dbo].[umbracoRelationType] ([id], [typeUniqueId], [dual], [parentObjectType], [childObjectType], [name], [alias]) VALUES (5, N'0b93e414-5abe-36ec-a6bb-516e56f12238', 0, NULL, NULL, N'Related Document', N'umbDocument')
SET IDENTITY_INSERT [dbo].[umbracoRelationType] OFF
GO
SET IDENTITY_INSERT [dbo].[umbracoServer] ON 

INSERT [dbo].[umbracoServer] ([id], [address], [computerName], [registeredDate], [lastNotifiedDate], [isActive], [isMaster]) VALUES (1, N'http://localhost/umbraco', N'M-ALHADIK//LM/W3SVC/2/ROOT', CAST(N'2022-07-10T02:37:09.417' AS DateTime), CAST(N'2022-10-13T00:29:25.917' AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[umbracoServer] OFF
GO
SET IDENTITY_INSERT [dbo].[umbracoUser] ON 

INSERT [dbo].[umbracoUser] ([id], [userDisabled], [userNoConsole], [userName], [userLogin], [userPassword], [passwordConfig], [userEmail], [userLanguage], [securityStampToken], [failedLoginAttempts], [lastLockoutDate], [lastPasswordChangeDate], [lastLoginDate], [emailConfirmedDate], [invitedDate], [createDate], [updateDate], [avatar], [tourData]) VALUES (-1, 0, 0, N'Mohammed Alhadik', N'MohammedAlhadik@gmail.com', N'6P3yJ2GMgd/ecRwb3n8aQg==4I7899PuSlsx/CDAgajrqtqyWNi11CNOsCoJKLrolRc=', N'{"hashAlgorithm":"HMACSHA256"}', N'MohammedAlhadik@gmail.com', N'en-US', N'373d99e5-3ab7-4655-8ffb-ccd679ef13d7', 0, NULL, CAST(N'2022-07-10T02:36:43.230' AS DateTime), CAST(N'2022-10-12T21:41:07.547' AS DateTime), NULL, NULL, CAST(N'2022-07-10T02:36:41.033' AS DateTime), CAST(N'2022-10-12T21:41:07.570' AS DateTime), NULL, N'[{"alias":"umbIntroIntroduction","completed":false,"disabled":true},{"alias":"umbEmailMarketing","completed":false,"disabled":true}]')
INSERT [dbo].[umbracoUser] ([id], [userDisabled], [userNoConsole], [userName], [userLogin], [userPassword], [passwordConfig], [userEmail], [userLanguage], [securityStampToken], [failedLoginAttempts], [lastLockoutDate], [lastPasswordChangeDate], [lastLoginDate], [emailConfirmedDate], [invitedDate], [createDate], [updateDate], [avatar], [tourData]) VALUES (1, 0, 0, N'Writer', N'Writer@CodeBook.edu', N'7w9Jk9yVfslvykxcbU6L1g==hqsem+AkwIpsLsPXny+n77m9YPzscjndaAacv0mjc0g=', N'{"hashAlgorithm":"HMACSHA256"}', N'Writer@CodeBook.edu', N'en-US', N'2c57d050-cb01-4146-8293-434de0618877', 0, NULL, CAST(N'2022-07-10T02:43:12.493' AS DateTime), NULL, NULL, NULL, CAST(N'2022-07-10T02:43:12.453' AS DateTime), CAST(N'2022-07-10T02:43:12.550' AS DateTime), NULL, NULL)
INSERT [dbo].[umbracoUser] ([id], [userDisabled], [userNoConsole], [userName], [userLogin], [userPassword], [passwordConfig], [userEmail], [userLanguage], [securityStampToken], [failedLoginAttempts], [lastLockoutDate], [lastPasswordChangeDate], [lastLoginDate], [emailConfirmedDate], [invitedDate], [createDate], [updateDate], [avatar], [tourData]) VALUES (2, 0, 0, N'Center Admin', N'Admin@CodeBook.edu', N'tYZCKepgLiBSiCpirRIurg==XXMQz/wAn5kld6b/jVEiNS4GIpPHF2694Y6ZjwWJXYM=', N'{"hashAlgorithm":"HMACSHA256"}', N'Admin@CodeBook.edu', N'en-US', N'eefd58ae-14fb-4d4c-bd07-5671be03ea23', 0, NULL, CAST(N'2022-07-10T02:44:15.650' AS DateTime), NULL, NULL, NULL, CAST(N'2022-07-10T02:44:15.630' AS DateTime), CAST(N'2022-07-10T02:44:15.677' AS DateTime), NULL, NULL)
INSERT [dbo].[umbracoUser] ([id], [userDisabled], [userNoConsole], [userName], [userLogin], [userPassword], [passwordConfig], [userEmail], [userLanguage], [securityStampToken], [failedLoginAttempts], [lastLockoutDate], [lastPasswordChangeDate], [lastLoginDate], [emailConfirmedDate], [invitedDate], [createDate], [updateDate], [avatar], [tourData]) VALUES (3, 0, 0, N'Center Admin', N'CenterAdmin@CodeBook.edu', N'EsmsHluZazE/oQ39IW9YqA==9p4tFllb+C9ggOI5FnDh3hBAyczo8QPnbrRn3OwIEQo=', N'{"hashAlgorithm":"HMACSHA256"}', N'CenterAdmin@CodeBook.edu', N'en-US', N'199290cc-5701-406c-8adf-bf23d3ff69f9', 0, NULL, CAST(N'2022-07-12T14:35:46.690' AS DateTime), NULL, NULL, NULL, CAST(N'2022-07-12T14:35:46.657' AS DateTime), CAST(N'2022-07-12T14:35:46.720' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[umbracoUser] OFF
GO
INSERT [dbo].[umbracoUser2UserGroup] ([userId], [userGroupId]) VALUES (-1, 1)
INSERT [dbo].[umbracoUser2UserGroup] ([userId], [userGroupId]) VALUES (-1, 5)
INSERT [dbo].[umbracoUser2UserGroup] ([userId], [userGroupId]) VALUES (1, 2)
INSERT [dbo].[umbracoUser2UserGroup] ([userId], [userGroupId]) VALUES (2, 1)
INSERT [dbo].[umbracoUser2UserGroup] ([userId], [userGroupId]) VALUES (3, 1)
INSERT [dbo].[umbracoUser2UserGroup] ([userId], [userGroupId]) VALUES (3, 2)
INSERT [dbo].[umbracoUser2UserGroup] ([userId], [userGroupId]) VALUES (3, 3)
INSERT [dbo].[umbracoUser2UserGroup] ([userId], [userGroupId]) VALUES (3, 4)
INSERT [dbo].[umbracoUser2UserGroup] ([userId], [userGroupId]) VALUES (3, 5)
GO
SET IDENTITY_INSERT [dbo].[umbracoUserGroup] ON 

INSERT [dbo].[umbracoUserGroup] ([id], [userGroupAlias], [userGroupName], [userGroupDefaultPermissions], [createDate], [updateDate], [icon], [startContentId], [startMediaId]) VALUES (1, N'admin', N'Administrators', N'CADMOSKTPIURZ:5F7ï', CAST(N'2022-07-10T02:36:41.987' AS DateTime), CAST(N'2022-07-10T02:36:41.987' AS DateTime), N'icon-medal', -1, -1)
INSERT [dbo].[umbracoUserGroup] ([id], [userGroupAlias], [userGroupName], [userGroupDefaultPermissions], [createDate], [updateDate], [icon], [startContentId], [startMediaId]) VALUES (2, N'writer', N'Writers', N'CAH:F', CAST(N'2022-07-10T02:36:41.997' AS DateTime), CAST(N'2022-07-10T02:36:41.997' AS DateTime), N'icon-edit', -1, -1)
INSERT [dbo].[umbracoUserGroup] ([id], [userGroupAlias], [userGroupName], [userGroupDefaultPermissions], [createDate], [updateDate], [icon], [startContentId], [startMediaId]) VALUES (3, N'editor', N'Editors', N'CADMOSKTPUZ:5Fï', CAST(N'2022-07-10T02:36:41.997' AS DateTime), CAST(N'2022-07-10T02:36:41.997' AS DateTime), N'icon-tools', -1, -1)
INSERT [dbo].[umbracoUserGroup] ([id], [userGroupAlias], [userGroupName], [userGroupDefaultPermissions], [createDate], [updateDate], [icon], [startContentId], [startMediaId]) VALUES (4, N'translator', N'Translators', N'AF', CAST(N'2022-07-10T02:36:42.000' AS DateTime), CAST(N'2022-07-10T02:36:42.000' AS DateTime), N'icon-globe', -1, -1)
INSERT [dbo].[umbracoUserGroup] ([id], [userGroupAlias], [userGroupName], [userGroupDefaultPermissions], [createDate], [updateDate], [icon], [startContentId], [startMediaId]) VALUES (5, N'sensitiveData', N'Sensitive data', N'', CAST(N'2022-07-10T02:36:42.000' AS DateTime), CAST(N'2022-07-10T02:36:42.000' AS DateTime), N'icon-lock', -1, -1)
SET IDENTITY_INSERT [dbo].[umbracoUserGroup] OFF
GO
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'content')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'forms')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'media')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'member')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'packages')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'settings')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'translation')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (1, N'users')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (2, N'content')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (3, N'content')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (3, N'forms')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (3, N'media')
INSERT [dbo].[umbracoUserGroup2App] ([userGroupId], [app]) VALUES (4, N'translation')
GO
INSERT [dbo].[umbracoUserLogin] ([sessionId], [userId], [loggedInUtc], [lastValidatedUtc], [loggedOutUtc], [ipAddress]) VALUES (N'c4d7c82e-1f9f-4412-b113-01135a99e216', -1, CAST(N'2022-10-12T19:41:08.653' AS DateTime), CAST(N'2022-10-12T19:41:08.653' AS DateTime), NULL, N'127.0.0.1')
GO
/****** Object:  Index [IX_cmsContentType]    Script Date: 10/13/2022 12:46:20 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsContentType] ON [dbo].[cmsContentType]
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_cmsContentType_icon]    Script Date: 10/13/2022 12:46:20 AM ******/
CREATE NONCLUSTERED INDEX [IX_cmsContentType_icon] ON [dbo].[cmsContentType]
(
	[icon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsDictionary_id]    Script Date: 10/13/2022 12:46:20 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsDictionary_id] ON [dbo].[cmsDictionary]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_cmsDictionary_key]    Script Date: 10/13/2022 12:46:20 AM ******/
CREATE NONCLUSTERED INDEX [IX_cmsDictionary_key] ON [dbo].[cmsDictionary]
(
	[key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsDictionary_Parent]    Script Date: 10/13/2022 12:46:20 AM ******/
CREATE NONCLUSTERED INDEX [IX_cmsDictionary_Parent] ON [dbo].[cmsDictionary]
(
	[parent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsMacro_UniqueId]    Script Date: 10/13/2022 12:46:20 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsMacro_UniqueId] ON [dbo].[cmsMacro]
(
	[uniqueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_cmsMacroPropertyAlias]    Script Date: 10/13/2022 12:46:20 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsMacroPropertyAlias] ON [dbo].[cmsMacro]
(
	[macroAlias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_cmsMacroProperty_Alias]    Script Date: 10/13/2022 12:46:20 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsMacroProperty_Alias] ON [dbo].[cmsMacroProperty]
(
	[macro] ASC,
	[macroPropertyAlias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsMacroProperty_UniquePropertyId]    Script Date: 10/13/2022 12:46:20 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsMacroProperty_UniquePropertyId] ON [dbo].[cmsMacroProperty]
(
	[uniquePropertyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_cmsMember_LoginName]    Script Date: 10/13/2022 12:46:20 AM ******/
CREATE NONCLUSTERED INDEX [IX_cmsMember_LoginName] ON [dbo].[cmsMember]
(
	[LoginName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_cmsPropertyTypeAlias]    Script Date: 10/13/2022 12:46:20 AM ******/
CREATE NONCLUSTERED INDEX [IX_cmsPropertyTypeAlias] ON [dbo].[cmsPropertyType]
(
	[Alias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsPropertyTypeUniqueID]    Script Date: 10/13/2022 12:46:20 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsPropertyTypeUniqueID] ON [dbo].[cmsPropertyType]
(
	[UniqueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsPropertyTypeGroupUniqueID]    Script Date: 10/13/2022 12:46:20 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsPropertyTypeGroupUniqueID] ON [dbo].[cmsPropertyTypeGroup]
(
	[uniqueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_cmsTags]    Script Date: 10/13/2022 12:46:20 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsTags] ON [dbo].[cmsTags]
(
	[group] ASC,
	[tag] ASC,
	[languageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsTags_LanguageId]    Script Date: 10/13/2022 12:46:20 AM ******/
CREATE NONCLUSTERED INDEX [IX_cmsTags_LanguageId] ON [dbo].[cmsTags]
(
	[languageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsTemplate_nodeId]    Script Date: 10/13/2022 12:46:20 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsTemplate_nodeId] ON [dbo].[cmsTemplate]
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoAccess_nodeId]    Script Date: 10/13/2022 12:46:20 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoAccess_nodeId] ON [dbo].[umbracoAccess]
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_umbracoAccessRule]    Script Date: 10/13/2022 12:46:20 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoAccessRule] ON [dbo].[umbracoAccessRule]
(
	[ruleValue] ASC,
	[ruleType] ASC,
	[accessId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoContentVersion_Current]    Script Date: 10/13/2022 12:46:20 AM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoContentVersion_Current] ON [dbo].[umbracoContentVersion]
(
	[current] ASC
)
INCLUDE([nodeId]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoContentVersion_NodeId]    Script Date: 10/13/2022 12:46:20 AM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoContentVersion_NodeId] ON [dbo].[umbracoContentVersion]
(
	[nodeId] ASC,
	[current] ASC
)
INCLUDE([id],[versionDate],[text],[userId]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoContentVersionCultureVariation_LanguageId]    Script Date: 10/13/2022 12:46:20 AM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoContentVersionCultureVariation_LanguageId] ON [dbo].[umbracoContentVersionCultureVariation]
(
	[languageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoContentVersionCultureVariation_VersionId]    Script Date: 10/13/2022 12:46:20 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoContentVersionCultureVariation_VersionId] ON [dbo].[umbracoContentVersionCultureVariation]
(
	[versionId] ASC,
	[languageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoDocument_Published]    Script Date: 10/13/2022 12:46:20 AM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoDocument_Published] ON [dbo].[umbracoDocument]
(
	[published] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoDocumentCultureVariation_LanguageId]    Script Date: 10/13/2022 12:46:20 AM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoDocumentCultureVariation_LanguageId] ON [dbo].[umbracoDocumentCultureVariation]
(
	[languageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoDocumentCultureVariation_NodeId]    Script Date: 10/13/2022 12:46:20 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoDocumentCultureVariation_NodeId] ON [dbo].[umbracoDocumentCultureVariation]
(
	[nodeId] ASC,
	[languageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoLanguage_fallbackLanguageId]    Script Date: 10/13/2022 12:46:20 AM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoLanguage_fallbackLanguageId] ON [dbo].[umbracoLanguage]
(
	[fallbackLanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_umbracoLanguage_languageISOCode]    Script Date: 10/13/2022 12:46:20 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoLanguage_languageISOCode] ON [dbo].[umbracoLanguage]
(
	[languageISOCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoLog]    Script Date: 10/13/2022 12:46:20 AM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoLog] ON [dbo].[umbracoLog]
(
	[NodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_umbracoMediaVersion]    Script Date: 10/13/2022 12:46:20 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoMediaVersion] ON [dbo].[umbracoMediaVersion]
(
	[id] ASC,
	[path] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoNode_Level]    Script Date: 10/13/2022 12:46:20 AM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoNode_Level] ON [dbo].[umbracoNode]
(
	[level] ASC,
	[parentId] ASC,
	[sortOrder] ASC,
	[nodeObjectType] ASC,
	[trashed] ASC
)
INCLUDE([nodeUser],[path],[uniqueId],[createDate]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoNode_ObjectType]    Script Date: 10/13/2022 12:46:20 AM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoNode_ObjectType] ON [dbo].[umbracoNode]
(
	[nodeObjectType] ASC,
	[trashed] ASC
)
INCLUDE([uniqueId],[parentId],[level],[path],[sortOrder],[nodeUser],[text],[createDate]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoNode_ParentId]    Script Date: 10/13/2022 12:46:20 AM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoNode_ParentId] ON [dbo].[umbracoNode]
(
	[parentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_umbracoNode_Path]    Script Date: 10/13/2022 12:46:20 AM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoNode_Path] ON [dbo].[umbracoNode]
(
	[path] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoNode_Trashed]    Script Date: 10/13/2022 12:46:20 AM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoNode_Trashed] ON [dbo].[umbracoNode]
(
	[trashed] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoNode_UniqueId]    Script Date: 10/13/2022 12:46:20 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoNode_UniqueId] ON [dbo].[umbracoNode]
(
	[uniqueId] ASC
)
INCLUDE([parentId],[level],[path],[sortOrder],[trashed],[nodeUser],[text],[createDate]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoPropertyData_LanguageId]    Script Date: 10/13/2022 12:46:20 AM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoPropertyData_LanguageId] ON [dbo].[umbracoPropertyData]
(
	[languageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoPropertyData_PropertyTypeId]    Script Date: 10/13/2022 12:46:20 AM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoPropertyData_PropertyTypeId] ON [dbo].[umbracoPropertyData]
(
	[propertyTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_umbracoPropertyData_Segment]    Script Date: 10/13/2022 12:46:20 AM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoPropertyData_Segment] ON [dbo].[umbracoPropertyData]
(
	[segment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_umbracoPropertyData_VersionId]    Script Date: 10/13/2022 12:46:20 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoPropertyData_VersionId] ON [dbo].[umbracoPropertyData]
(
	[versionId] ASC,
	[propertyTypeId] ASC,
	[languageId] ASC,
	[segment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_umbracoRedirectUrl]    Script Date: 10/13/2022 12:46:20 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoRedirectUrl] ON [dbo].[umbracoRedirectUrl]
(
	[urlHash] ASC,
	[contentKey] ASC,
	[culture] ASC,
	[createDateUtc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoRelation_parentChildType]    Script Date: 10/13/2022 12:46:20 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoRelation_parentChildType] ON [dbo].[umbracoRelation]
(
	[parentId] ASC,
	[childId] ASC,
	[relType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_umbracoRelationType_alias]    Script Date: 10/13/2022 12:46:20 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoRelationType_alias] ON [dbo].[umbracoRelationType]
(
	[alias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_umbracoRelationType_name]    Script Date: 10/13/2022 12:46:20 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoRelationType_name] ON [dbo].[umbracoRelationType]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoRelationType_UniqueId]    Script Date: 10/13/2022 12:46:20 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoRelationType_UniqueId] ON [dbo].[umbracoRelationType]
(
	[typeUniqueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_computerName]    Script Date: 10/13/2022 12:46:20 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_computerName] ON [dbo].[umbracoServer]
(
	[computerName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoServer_isActive]    Script Date: 10/13/2022 12:46:20 AM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoServer_isActive] ON [dbo].[umbracoServer]
(
	[isActive] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_umbracoUser_userLogin]    Script Date: 10/13/2022 12:46:20 AM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoUser_userLogin] ON [dbo].[umbracoUser]
(
	[userLogin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_umbracoUserGroup_userGroupAlias]    Script Date: 10/13/2022 12:46:20 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoUserGroup_userGroupAlias] ON [dbo].[umbracoUserGroup]
(
	[userGroupAlias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_umbracoUserGroup_userGroupName]    Script Date: 10/13/2022 12:46:20 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoUserGroup_userGroupName] ON [dbo].[umbracoUserGroup]
(
	[userGroupName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoUser2NodePermission_nodeId]    Script Date: 10/13/2022 12:46:20 AM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoUser2NodePermission_nodeId] ON [dbo].[umbracoUserGroup2NodePermission]
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoUserLogin_lastValidatedUtc]    Script Date: 10/13/2022 12:46:20 AM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoUserLogin_lastValidatedUtc] ON [dbo].[umbracoUserLogin]
(
	[lastValidatedUtc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoUserStartNode_startNodeType]    Script Date: 10/13/2022 12:46:20 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoUserStartNode_startNodeType] ON [dbo].[umbracoUserStartNode]
(
	[startNodeType] ASC,
	[startNode] ASC,
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[cmsContentType] ADD  CONSTRAINT [DF_cmsContentType_thumbnail]  DEFAULT ('folder.png') FOR [thumbnail]
GO
ALTER TABLE [dbo].[cmsContentType] ADD  CONSTRAINT [DF_cmsContentType_isContainer]  DEFAULT ('0') FOR [isContainer]
GO
ALTER TABLE [dbo].[cmsContentType] ADD  CONSTRAINT [DF_cmsContentType_isElement]  DEFAULT ('0') FOR [isElement]
GO
ALTER TABLE [dbo].[cmsContentType] ADD  CONSTRAINT [DF_cmsContentType_allowAtRoot]  DEFAULT ('0') FOR [allowAtRoot]
GO
ALTER TABLE [dbo].[cmsContentType] ADD  CONSTRAINT [DF_cmsContentType_variations]  DEFAULT ('1') FOR [variations]
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType] ADD  CONSTRAINT [df_cmsContentTypeAllowedContentType_sortOrder]  DEFAULT ('0') FOR [SortOrder]
GO
ALTER TABLE [dbo].[cmsDocumentType] ADD  CONSTRAINT [DF_cmsDocumentType_IsDefault]  DEFAULT ('0') FOR [IsDefault]
GO
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroUseInEditor]  DEFAULT ('0') FOR [macroUseInEditor]
GO
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroRefreshRate]  DEFAULT ('0') FOR [macroRefreshRate]
GO
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroCacheByPage]  DEFAULT ('1') FOR [macroCacheByPage]
GO
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroCachePersonalized]  DEFAULT ('0') FOR [macroCachePersonalized]
GO
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroDontRender]  DEFAULT ('0') FOR [macroDontRender]
GO
ALTER TABLE [dbo].[cmsMacroProperty] ADD  CONSTRAINT [DF_cmsMacroProperty_macroPropertySortOrder]  DEFAULT ('0') FOR [macroPropertySortOrder]
GO
ALTER TABLE [dbo].[cmsMember] ADD  CONSTRAINT [DF_cmsMember_Email]  DEFAULT ('''') FOR [Email]
GO
ALTER TABLE [dbo].[cmsMember] ADD  CONSTRAINT [DF_cmsMember_LoginName]  DEFAULT ('''') FOR [LoginName]
GO
ALTER TABLE [dbo].[cmsMember] ADD  CONSTRAINT [DF_cmsMember_Password]  DEFAULT ('''') FOR [Password]
GO
ALTER TABLE [dbo].[cmsMemberType] ADD  CONSTRAINT [DF_cmsMemberType_memberCanEdit]  DEFAULT ('0') FOR [memberCanEdit]
GO
ALTER TABLE [dbo].[cmsMemberType] ADD  CONSTRAINT [DF_cmsMemberType_viewOnProfile]  DEFAULT ('0') FOR [viewOnProfile]
GO
ALTER TABLE [dbo].[cmsMemberType] ADD  CONSTRAINT [DF_cmsMemberType_isSensitive]  DEFAULT ('0') FOR [isSensitive]
GO
ALTER TABLE [dbo].[cmsPropertyType] ADD  CONSTRAINT [DF_cmsPropertyType_sortOrder]  DEFAULT ('0') FOR [sortOrder]
GO
ALTER TABLE [dbo].[cmsPropertyType] ADD  CONSTRAINT [DF_cmsPropertyType_mandatory]  DEFAULT ('0') FOR [mandatory]
GO
ALTER TABLE [dbo].[cmsPropertyType] ADD  CONSTRAINT [DF_cmsPropertyType_labelOnTop]  DEFAULT ('0') FOR [labelOnTop]
GO
ALTER TABLE [dbo].[cmsPropertyType] ADD  CONSTRAINT [DF_cmsPropertyType_variations]  DEFAULT ('1') FOR [variations]
GO
ALTER TABLE [dbo].[cmsPropertyType] ADD  CONSTRAINT [DF_cmsPropertyType_UniqueID]  DEFAULT (newid()) FOR [UniqueID]
GO
ALTER TABLE [dbo].[cmsPropertyTypeGroup] ADD  CONSTRAINT [DF_cmsPropertyTypeGroup_uniqueID]  DEFAULT (newid()) FOR [uniqueID]
GO
ALTER TABLE [dbo].[cmsPropertyTypeGroup] ADD  CONSTRAINT [DF_cmsPropertyTypeGroup_type]  DEFAULT ('0') FOR [type]
GO
ALTER TABLE [dbo].[umbracoAccess] ADD  CONSTRAINT [DF_umbracoAccess_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoAccess] ADD  CONSTRAINT [DF_umbracoAccess_updateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[umbracoAccessRule] ADD  CONSTRAINT [DF_umbracoAccessRule_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoAccessRule] ADD  CONSTRAINT [DF_umbracoAccessRule_updateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[umbracoAudit] ADD  CONSTRAINT [DF_umbracoAudit_eventDateUtc]  DEFAULT (getdate()) FOR [eventDateUtc]
GO
ALTER TABLE [dbo].[umbracoCacheInstruction] ADD  CONSTRAINT [DF_umbracoCacheInstruction_instructionCount]  DEFAULT ('1') FOR [instructionCount]
GO
ALTER TABLE [dbo].[umbracoConsent] ADD  CONSTRAINT [DF_umbracoConsent_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoContentVersion] ADD  CONSTRAINT [DF_umbracoContentVersion_versionDate]  DEFAULT (getdate()) FOR [versionDate]
GO
ALTER TABLE [dbo].[umbracoContentVersion] ADD  CONSTRAINT [DF_umbracoContentVersion_preventCleanup]  DEFAULT ('0') FOR [preventCleanup]
GO
ALTER TABLE [dbo].[umbracoExternalLogin] ADD  CONSTRAINT [DF_umbracoExternalLogin_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoKeyValue] ADD  CONSTRAINT [DF_umbracoKeyValue_updated]  DEFAULT (getdate()) FOR [updated]
GO
ALTER TABLE [dbo].[umbracoLanguage] ADD  CONSTRAINT [DF_umbracoLanguage_isDefaultVariantLang]  DEFAULT ('0') FOR [isDefaultVariantLang]
GO
ALTER TABLE [dbo].[umbracoLanguage] ADD  CONSTRAINT [DF_umbracoLanguage_mandatory]  DEFAULT ('0') FOR [mandatory]
GO
ALTER TABLE [dbo].[umbracoLog] ADD  CONSTRAINT [DF_umbracoLog_Datestamp]  DEFAULT (getdate()) FOR [Datestamp]
GO
ALTER TABLE [dbo].[umbracoNode] ADD  CONSTRAINT [DF_umbracoNode_uniqueId]  DEFAULT (newid()) FOR [uniqueId]
GO
ALTER TABLE [dbo].[umbracoNode] ADD  CONSTRAINT [DF_umbracoNode_trashed]  DEFAULT ('0') FOR [trashed]
GO
ALTER TABLE [dbo].[umbracoNode] ADD  CONSTRAINT [DF_umbracoNode_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoRelation] ADD  CONSTRAINT [DF_umbracoRelation_datetime]  DEFAULT (getdate()) FOR [datetime]
GO
ALTER TABLE [dbo].[umbracoServer] ADD  CONSTRAINT [DF_umbracoServer_registeredDate]  DEFAULT (getdate()) FOR [registeredDate]
GO
ALTER TABLE [dbo].[umbracoUser] ADD  CONSTRAINT [DF_umbracoUser_userDisabled]  DEFAULT ('0') FOR [userDisabled]
GO
ALTER TABLE [dbo].[umbracoUser] ADD  CONSTRAINT [DF_umbracoUser_userNoConsole]  DEFAULT ('0') FOR [userNoConsole]
GO
ALTER TABLE [dbo].[umbracoUser] ADD  CONSTRAINT [DF_umbracoUser_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoUser] ADD  CONSTRAINT [DF_umbracoUser_updateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[umbracoUserGroup] ADD  CONSTRAINT [DF_umbracoUserGroup_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoUserGroup] ADD  CONSTRAINT [DF_umbracoUserGroup_updateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[cmsContentNu]  WITH NOCHECK ADD  CONSTRAINT [FK_cmsContentNu_umbracoContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoContent] ([nodeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[cmsContentNu] CHECK CONSTRAINT [FK_cmsContentNu_umbracoContent_nodeId]
GO
ALTER TABLE [dbo].[cmsContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentType_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsContentType] CHECK CONSTRAINT [FK_cmsContentType_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsContentType2ContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_child] FOREIGN KEY([childContentTypeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsContentType2ContentType] CHECK CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_child]
GO
ALTER TABLE [dbo].[cmsContentType2ContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_parent] FOREIGN KEY([parentContentTypeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsContentType2ContentType] CHECK CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_parent]
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType] FOREIGN KEY([Id])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType] CHECK CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType]
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType1] FOREIGN KEY([AllowedId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType] CHECK CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType1]
GO
ALTER TABLE [dbo].[cmsDictionary]  WITH CHECK ADD  CONSTRAINT [FK_cmsDictionary_cmsDictionary_id] FOREIGN KEY([parent])
REFERENCES [dbo].[cmsDictionary] ([id])
GO
ALTER TABLE [dbo].[cmsDictionary] CHECK CONSTRAINT [FK_cmsDictionary_cmsDictionary_id]
GO
ALTER TABLE [dbo].[cmsDocumentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocumentType_cmsContentType_nodeId] FOREIGN KEY([contentTypeNodeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsDocumentType] CHECK CONSTRAINT [FK_cmsDocumentType_cmsContentType_nodeId]
GO
ALTER TABLE [dbo].[cmsDocumentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocumentType_cmsTemplate_nodeId] FOREIGN KEY([templateNodeId])
REFERENCES [dbo].[cmsTemplate] ([nodeId])
GO
ALTER TABLE [dbo].[cmsDocumentType] CHECK CONSTRAINT [FK_cmsDocumentType_cmsTemplate_nodeId]
GO
ALTER TABLE [dbo].[cmsDocumentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocumentType_umbracoNode_id] FOREIGN KEY([contentTypeNodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsDocumentType] CHECK CONSTRAINT [FK_cmsDocumentType_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsLanguageText]  WITH CHECK ADD  CONSTRAINT [FK_cmsLanguageText_cmsDictionary_id] FOREIGN KEY([UniqueId])
REFERENCES [dbo].[cmsDictionary] ([id])
GO
ALTER TABLE [dbo].[cmsLanguageText] CHECK CONSTRAINT [FK_cmsLanguageText_cmsDictionary_id]
GO
ALTER TABLE [dbo].[cmsLanguageText]  WITH CHECK ADD  CONSTRAINT [FK_cmsLanguageText_umbracoLanguage_id] FOREIGN KEY([languageId])
REFERENCES [dbo].[umbracoLanguage] ([id])
GO
ALTER TABLE [dbo].[cmsLanguageText] CHECK CONSTRAINT [FK_cmsLanguageText_umbracoLanguage_id]
GO
ALTER TABLE [dbo].[cmsMacroProperty]  WITH CHECK ADD  CONSTRAINT [FK_cmsMacroProperty_cmsMacro_id] FOREIGN KEY([macro])
REFERENCES [dbo].[cmsMacro] ([id])
GO
ALTER TABLE [dbo].[cmsMacroProperty] CHECK CONSTRAINT [FK_cmsMacroProperty_cmsMacro_id]
GO
ALTER TABLE [dbo].[cmsMember]  WITH CHECK ADD  CONSTRAINT [FK_cmsMember_umbracoContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsMember] CHECK CONSTRAINT [FK_cmsMember_umbracoContent_nodeId]
GO
ALTER TABLE [dbo].[cmsMember2MemberGroup]  WITH CHECK ADD  CONSTRAINT [FK_cmsMember2MemberGroup_cmsMember_nodeId] FOREIGN KEY([Member])
REFERENCES [dbo].[cmsMember] ([nodeId])
GO
ALTER TABLE [dbo].[cmsMember2MemberGroup] CHECK CONSTRAINT [FK_cmsMember2MemberGroup_cmsMember_nodeId]
GO
ALTER TABLE [dbo].[cmsMember2MemberGroup]  WITH CHECK ADD  CONSTRAINT [FK_cmsMember2MemberGroup_umbracoNode_id] FOREIGN KEY([MemberGroup])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsMember2MemberGroup] CHECK CONSTRAINT [FK_cmsMember2MemberGroup_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsMemberType]  WITH CHECK ADD  CONSTRAINT [FK_cmsMemberType_cmsContentType_nodeId] FOREIGN KEY([NodeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsMemberType] CHECK CONSTRAINT [FK_cmsMemberType_cmsContentType_nodeId]
GO
ALTER TABLE [dbo].[cmsMemberType]  WITH CHECK ADD  CONSTRAINT [FK_cmsMemberType_umbracoNode_id] FOREIGN KEY([NodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsMemberType] CHECK CONSTRAINT [FK_cmsMemberType_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsPropertyType]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyType_cmsContentType_nodeId] FOREIGN KEY([contentTypeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsPropertyType] CHECK CONSTRAINT [FK_cmsPropertyType_cmsContentType_nodeId]
GO
ALTER TABLE [dbo].[cmsPropertyType]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyType_cmsPropertyTypeGroup_id] FOREIGN KEY([propertyTypeGroupId])
REFERENCES [dbo].[cmsPropertyTypeGroup] ([id])
GO
ALTER TABLE [dbo].[cmsPropertyType] CHECK CONSTRAINT [FK_cmsPropertyType_cmsPropertyTypeGroup_id]
GO
ALTER TABLE [dbo].[cmsPropertyType]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyType_umbracoDataType_nodeId] FOREIGN KEY([dataTypeId])
REFERENCES [dbo].[umbracoDataType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsPropertyType] CHECK CONSTRAINT [FK_cmsPropertyType_umbracoDataType_nodeId]
GO
ALTER TABLE [dbo].[cmsPropertyTypeGroup]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyTypeGroup_cmsContentType_nodeId] FOREIGN KEY([contenttypeNodeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsPropertyTypeGroup] CHECK CONSTRAINT [FK_cmsPropertyTypeGroup_cmsContentType_nodeId]
GO
ALTER TABLE [dbo].[cmsTagRelationship]  WITH CHECK ADD  CONSTRAINT [FK_cmsTagRelationship_cmsContent] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsTagRelationship] CHECK CONSTRAINT [FK_cmsTagRelationship_cmsContent]
GO
ALTER TABLE [dbo].[cmsTagRelationship]  WITH CHECK ADD  CONSTRAINT [FK_cmsTagRelationship_cmsPropertyType] FOREIGN KEY([propertyTypeId])
REFERENCES [dbo].[cmsPropertyType] ([id])
GO
ALTER TABLE [dbo].[cmsTagRelationship] CHECK CONSTRAINT [FK_cmsTagRelationship_cmsPropertyType]
GO
ALTER TABLE [dbo].[cmsTagRelationship]  WITH CHECK ADD  CONSTRAINT [FK_cmsTagRelationship_cmsTags_id] FOREIGN KEY([tagId])
REFERENCES [dbo].[cmsTags] ([id])
GO
ALTER TABLE [dbo].[cmsTagRelationship] CHECK CONSTRAINT [FK_cmsTagRelationship_cmsTags_id]
GO
ALTER TABLE [dbo].[cmsTags]  WITH CHECK ADD  CONSTRAINT [FK_cmsTags_umbracoLanguage_id] FOREIGN KEY([languageId])
REFERENCES [dbo].[umbracoLanguage] ([id])
GO
ALTER TABLE [dbo].[cmsTags] CHECK CONSTRAINT [FK_cmsTags_umbracoLanguage_id]
GO
ALTER TABLE [dbo].[cmsTemplate]  WITH CHECK ADD  CONSTRAINT [FK_cmsTemplate_umbracoNode] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsTemplate] CHECK CONSTRAINT [FK_cmsTemplate_umbracoNode]
GO
ALTER TABLE [dbo].[umbracoAccess]  WITH CHECK ADD  CONSTRAINT [FK_umbracoAccess_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoAccess] CHECK CONSTRAINT [FK_umbracoAccess_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoAccess]  WITH CHECK ADD  CONSTRAINT [FK_umbracoAccess_umbracoNode_id1] FOREIGN KEY([loginNodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoAccess] CHECK CONSTRAINT [FK_umbracoAccess_umbracoNode_id1]
GO
ALTER TABLE [dbo].[umbracoAccess]  WITH CHECK ADD  CONSTRAINT [FK_umbracoAccess_umbracoNode_id2] FOREIGN KEY([noAccessNodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoAccess] CHECK CONSTRAINT [FK_umbracoAccess_umbracoNode_id2]
GO
ALTER TABLE [dbo].[umbracoAccessRule]  WITH CHECK ADD  CONSTRAINT [FK_umbracoAccessRule_umbracoAccess_id] FOREIGN KEY([accessId])
REFERENCES [dbo].[umbracoAccess] ([id])
GO
ALTER TABLE [dbo].[umbracoAccessRule] CHECK CONSTRAINT [FK_umbracoAccessRule_umbracoAccess_id]
GO
ALTER TABLE [dbo].[umbracoContent]  WITH CHECK ADD  CONSTRAINT [FK_umbracoContent_cmsContentType_NodeId] FOREIGN KEY([contentTypeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[umbracoContent] CHECK CONSTRAINT [FK_umbracoContent_cmsContentType_NodeId]
GO
ALTER TABLE [dbo].[umbracoContent]  WITH CHECK ADD  CONSTRAINT [FK_umbracoContent_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoContent] CHECK CONSTRAINT [FK_umbracoContent_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoContentSchedule]  WITH CHECK ADD  CONSTRAINT [FK_umbracoContentSchedule_umbracoContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoContent] ([nodeId])
GO
ALTER TABLE [dbo].[umbracoContentSchedule] CHECK CONSTRAINT [FK_umbracoContentSchedule_umbracoContent_nodeId]
GO
ALTER TABLE [dbo].[umbracoContentSchedule]  WITH CHECK ADD  CONSTRAINT [FK_umbracoContentSchedule_umbracoLanguage_id] FOREIGN KEY([languageId])
REFERENCES [dbo].[umbracoLanguage] ([id])
GO
ALTER TABLE [dbo].[umbracoContentSchedule] CHECK CONSTRAINT [FK_umbracoContentSchedule_umbracoLanguage_id]
GO
ALTER TABLE [dbo].[umbracoContentVersion]  WITH CHECK ADD  CONSTRAINT [FK_umbracoContentVersion_umbracoContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoContent] ([nodeId])
GO
ALTER TABLE [dbo].[umbracoContentVersion] CHECK CONSTRAINT [FK_umbracoContentVersion_umbracoContent_nodeId]
GO
ALTER TABLE [dbo].[umbracoContentVersion]  WITH CHECK ADD  CONSTRAINT [FK_umbracoContentVersion_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoContentVersion] CHECK CONSTRAINT [FK_umbracoContentVersion_umbracoUser_id]
GO
ALTER TABLE [dbo].[umbracoContentVersionCleanupPolicy]  WITH CHECK ADD  CONSTRAINT [FK_umbracoContentVersionCleanupPolicy_cmsContentType_nodeId] FOREIGN KEY([contentTypeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[umbracoContentVersionCleanupPolicy] CHECK CONSTRAINT [FK_umbracoContentVersionCleanupPolicy_cmsContentType_nodeId]
GO
ALTER TABLE [dbo].[umbracoContentVersionCultureVariation]  WITH NOCHECK ADD  CONSTRAINT [FK_umbracoContentVersionCultureVariation_umbracoContentVersion_id] FOREIGN KEY([versionId])
REFERENCES [dbo].[umbracoContentVersion] ([id])
GO
ALTER TABLE [dbo].[umbracoContentVersionCultureVariation] CHECK CONSTRAINT [FK_umbracoContentVersionCultureVariation_umbracoContentVersion_id]
GO
ALTER TABLE [dbo].[umbracoContentVersionCultureVariation]  WITH NOCHECK ADD  CONSTRAINT [FK_umbracoContentVersionCultureVariation_umbracoLanguage_id] FOREIGN KEY([languageId])
REFERENCES [dbo].[umbracoLanguage] ([id])
GO
ALTER TABLE [dbo].[umbracoContentVersionCultureVariation] CHECK CONSTRAINT [FK_umbracoContentVersionCultureVariation_umbracoLanguage_id]
GO
ALTER TABLE [dbo].[umbracoContentVersionCultureVariation]  WITH NOCHECK ADD  CONSTRAINT [FK_umbracoContentVersionCultureVariation_umbracoUser_id] FOREIGN KEY([availableUserId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoContentVersionCultureVariation] CHECK CONSTRAINT [FK_umbracoContentVersionCultureVariation_umbracoUser_id]
GO
ALTER TABLE [dbo].[umbracoDataType]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDataType_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoDataType] CHECK CONSTRAINT [FK_umbracoDataType_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoDocument]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDocument_umbracoContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoContent] ([nodeId])
GO
ALTER TABLE [dbo].[umbracoDocument] CHECK CONSTRAINT [FK_umbracoDocument_umbracoContent_nodeId]
GO
ALTER TABLE [dbo].[umbracoDocumentCultureVariation]  WITH NOCHECK ADD  CONSTRAINT [FK_umbracoDocumentCultureVariation_umbracoLanguage_id] FOREIGN KEY([languageId])
REFERENCES [dbo].[umbracoLanguage] ([id])
GO
ALTER TABLE [dbo].[umbracoDocumentCultureVariation] CHECK CONSTRAINT [FK_umbracoDocumentCultureVariation_umbracoLanguage_id]
GO
ALTER TABLE [dbo].[umbracoDocumentCultureVariation]  WITH NOCHECK ADD  CONSTRAINT [FK_umbracoDocumentCultureVariation_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoDocumentCultureVariation] CHECK CONSTRAINT [FK_umbracoDocumentCultureVariation_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoDocumentVersion]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDocumentVersion_cmsTemplate_nodeId] FOREIGN KEY([templateId])
REFERENCES [dbo].[cmsTemplate] ([nodeId])
GO
ALTER TABLE [dbo].[umbracoDocumentVersion] CHECK CONSTRAINT [FK_umbracoDocumentVersion_cmsTemplate_nodeId]
GO
ALTER TABLE [dbo].[umbracoDocumentVersion]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDocumentVersion_umbracoContentVersion_id] FOREIGN KEY([id])
REFERENCES [dbo].[umbracoContentVersion] ([id])
GO
ALTER TABLE [dbo].[umbracoDocumentVersion] CHECK CONSTRAINT [FK_umbracoDocumentVersion_umbracoContentVersion_id]
GO
ALTER TABLE [dbo].[umbracoDomain]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDomain_umbracoNode_id] FOREIGN KEY([domainRootStructureID])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoDomain] CHECK CONSTRAINT [FK_umbracoDomain_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoLanguage]  WITH CHECK ADD  CONSTRAINT [FK_umbracoLanguage_umbracoLanguage_id] FOREIGN KEY([fallbackLanguageId])
REFERENCES [dbo].[umbracoLanguage] ([id])
GO
ALTER TABLE [dbo].[umbracoLanguage] CHECK CONSTRAINT [FK_umbracoLanguage_umbracoLanguage_id]
GO
ALTER TABLE [dbo].[umbracoLog]  WITH CHECK ADD  CONSTRAINT [FK_umbracoLog_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoLog] CHECK CONSTRAINT [FK_umbracoLog_umbracoUser_id]
GO
ALTER TABLE [dbo].[umbracoMediaVersion]  WITH CHECK ADD  CONSTRAINT [FK_umbracoMediaVersion_umbracoContentVersion_id] FOREIGN KEY([id])
REFERENCES [dbo].[umbracoContentVersion] ([id])
GO
ALTER TABLE [dbo].[umbracoMediaVersion] CHECK CONSTRAINT [FK_umbracoMediaVersion_umbracoContentVersion_id]
GO
ALTER TABLE [dbo].[umbracoNode]  WITH CHECK ADD  CONSTRAINT [FK_umbracoNode_umbracoNode_id] FOREIGN KEY([parentId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoNode] CHECK CONSTRAINT [FK_umbracoNode_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoNode]  WITH CHECK ADD  CONSTRAINT [FK_umbracoNode_umbracoUser_id] FOREIGN KEY([nodeUser])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoNode] CHECK CONSTRAINT [FK_umbracoNode_umbracoUser_id]
GO
ALTER TABLE [dbo].[umbracoPropertyData]  WITH CHECK ADD  CONSTRAINT [FK_umbracoPropertyData_cmsPropertyType_id] FOREIGN KEY([propertyTypeId])
REFERENCES [dbo].[cmsPropertyType] ([id])
GO
ALTER TABLE [dbo].[umbracoPropertyData] CHECK CONSTRAINT [FK_umbracoPropertyData_cmsPropertyType_id]
GO
ALTER TABLE [dbo].[umbracoPropertyData]  WITH CHECK ADD  CONSTRAINT [FK_umbracoPropertyData_umbracoContentVersion_id] FOREIGN KEY([versionId])
REFERENCES [dbo].[umbracoContentVersion] ([id])
GO
ALTER TABLE [dbo].[umbracoPropertyData] CHECK CONSTRAINT [FK_umbracoPropertyData_umbracoContentVersion_id]
GO
ALTER TABLE [dbo].[umbracoPropertyData]  WITH CHECK ADD  CONSTRAINT [FK_umbracoPropertyData_umbracoLanguage_id] FOREIGN KEY([languageId])
REFERENCES [dbo].[umbracoLanguage] ([id])
GO
ALTER TABLE [dbo].[umbracoPropertyData] CHECK CONSTRAINT [FK_umbracoPropertyData_umbracoLanguage_id]
GO
ALTER TABLE [dbo].[umbracoRedirectUrl]  WITH CHECK ADD  CONSTRAINT [FK_umbracoRedirectUrl_umbracoNode_uniqueID] FOREIGN KEY([contentKey])
REFERENCES [dbo].[umbracoNode] ([uniqueId])
GO
ALTER TABLE [dbo].[umbracoRedirectUrl] CHECK CONSTRAINT [FK_umbracoRedirectUrl_umbracoNode_uniqueID]
GO
ALTER TABLE [dbo].[umbracoRelation]  WITH NOCHECK ADD  CONSTRAINT [FK_umbracoRelation_umbracoNode] FOREIGN KEY([parentId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoRelation] CHECK CONSTRAINT [FK_umbracoRelation_umbracoNode]
GO
ALTER TABLE [dbo].[umbracoRelation]  WITH NOCHECK ADD  CONSTRAINT [FK_umbracoRelation_umbracoNode1] FOREIGN KEY([childId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoRelation] CHECK CONSTRAINT [FK_umbracoRelation_umbracoNode1]
GO
ALTER TABLE [dbo].[umbracoRelation]  WITH NOCHECK ADD  CONSTRAINT [FK_umbracoRelation_umbracoRelationType_id] FOREIGN KEY([relType])
REFERENCES [dbo].[umbracoRelationType] ([id])
GO
ALTER TABLE [dbo].[umbracoRelation] CHECK CONSTRAINT [FK_umbracoRelation_umbracoRelationType_id]
GO
ALTER TABLE [dbo].[umbracoUser2NodeNotify]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2NodeNotify] CHECK CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoUser2NodeNotify]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2NodeNotify] CHECK CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoUser_id]
GO
ALTER TABLE [dbo].[umbracoUser2UserGroup]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2UserGroup_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2UserGroup] CHECK CONSTRAINT [FK_umbracoUser2UserGroup_umbracoUser_id]
GO
ALTER TABLE [dbo].[umbracoUser2UserGroup]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2UserGroup_umbracoUserGroup_id] FOREIGN KEY([userGroupId])
REFERENCES [dbo].[umbracoUserGroup] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2UserGroup] CHECK CONSTRAINT [FK_umbracoUser2UserGroup_umbracoUserGroup_id]
GO
ALTER TABLE [dbo].[umbracoUserGroup]  WITH CHECK ADD  CONSTRAINT [FK_startContentId_umbracoNode_id] FOREIGN KEY([startContentId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoUserGroup] CHECK CONSTRAINT [FK_startContentId_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoUserGroup]  WITH CHECK ADD  CONSTRAINT [FK_startMediaId_umbracoNode_id] FOREIGN KEY([startMediaId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoUserGroup] CHECK CONSTRAINT [FK_startMediaId_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoUserGroup2App]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUserGroup2App_umbracoUserGroup_id] FOREIGN KEY([userGroupId])
REFERENCES [dbo].[umbracoUserGroup] ([id])
GO
ALTER TABLE [dbo].[umbracoUserGroup2App] CHECK CONSTRAINT [FK_umbracoUserGroup2App_umbracoUserGroup_id]
GO
ALTER TABLE [dbo].[umbracoUserGroup2NodePermission]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUserGroup2NodePermission_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoUserGroup2NodePermission] CHECK CONSTRAINT [FK_umbracoUserGroup2NodePermission_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoUserGroup2NodePermission]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUserGroup2NodePermission_umbracoUserGroup_id] FOREIGN KEY([userGroupId])
REFERENCES [dbo].[umbracoUserGroup] ([id])
GO
ALTER TABLE [dbo].[umbracoUserGroup2NodePermission] CHECK CONSTRAINT [FK_umbracoUserGroup2NodePermission_umbracoUserGroup_id]
GO
ALTER TABLE [dbo].[umbracoUserLogin]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUserLogin_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoUserLogin] CHECK CONSTRAINT [FK_umbracoUserLogin_umbracoUser_id]
GO
ALTER TABLE [dbo].[umbracoUserStartNode]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUserStartNode_umbracoNode_id] FOREIGN KEY([startNode])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoUserStartNode] CHECK CONSTRAINT [FK_umbracoUserStartNode_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoUserStartNode]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUserStartNode_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoUserStartNode] CHECK CONSTRAINT [FK_umbracoUserStartNode_umbracoUser_id]
GO
USE [master]
GO
ALTER DATABASE [CodeBook_V8] SET  READ_WRITE 
GO
