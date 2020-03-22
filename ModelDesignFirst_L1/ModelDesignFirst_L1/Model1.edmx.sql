
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 03/22/2020 14:25:43
-- Generated from EDMX file: C:\Users\ALEXANDRU\source\repos\ModelDesignFirst_L1\ModelDesignFirst_L1\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [TestPerson];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_CustomerOrder]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrderSet] DROP CONSTRAINT [FK_CustomerOrder];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[People]', 'U') IS NOT NULL
    DROP TABLE [dbo].[People];
GO
IF OBJECT_ID(N'[dbo].[CustomerSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CustomerSet];
GO
IF OBJECT_ID(N'[dbo].[OrderSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OrderSet];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'People'
CREATE TABLE [dbo].[People] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(10)  NOT NULL,
    [MidleName] nvarchar(10)  NOT NULL,
    [LastName] nvarchar(10)  NOT NULL,
    [TelephonNumber] nvarchar(10)  NOT NULL,
    [OrderId] int  NOT NULL
);
GO

-- Creating table 'CustomerSet'
CREATE TABLE [dbo].[CustomerSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [CustomerId] nvarchar(max)  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [City] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'OrderSet'
CREATE TABLE [dbo].[OrderSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [OrderId] nvarchar(max)  NOT NULL,
    [TotalValue] nvarchar(max)  NOT NULL,
    [Date] nvarchar(max)  NOT NULL,
    [CustomerCustomerId] nvarchar(max)  NOT NULL,
    [CustomerId] int  NOT NULL
);
GO

-- Creating table 'AlbumSet'
CREATE TABLE [dbo].[AlbumSet] (
    [Id] int IDENTITY(1,1) NOT NULL
);
GO

-- Creating table 'ArtistSet'
CREATE TABLE [dbo].[ArtistSet] (
    [Id] int IDENTITY(1,1) NOT NULL
);
GO

-- Creating table 'ArtistAlbum'
CREATE TABLE [dbo].[ArtistAlbum] (
    [Artist_Id] int  NOT NULL,
    [Album_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'People'
ALTER TABLE [dbo].[People]
ADD CONSTRAINT [PK_People]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'CustomerSet'
ALTER TABLE [dbo].[CustomerSet]
ADD CONSTRAINT [PK_CustomerSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'OrderSet'
ALTER TABLE [dbo].[OrderSet]
ADD CONSTRAINT [PK_OrderSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'AlbumSet'
ALTER TABLE [dbo].[AlbumSet]
ADD CONSTRAINT [PK_AlbumSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ArtistSet'
ALTER TABLE [dbo].[ArtistSet]
ADD CONSTRAINT [PK_ArtistSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Artist_Id], [Album_Id] in table 'ArtistAlbum'
ALTER TABLE [dbo].[ArtistAlbum]
ADD CONSTRAINT [PK_ArtistAlbum]
    PRIMARY KEY CLUSTERED ([Artist_Id], [Album_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [CustomerId] in table 'OrderSet'
ALTER TABLE [dbo].[OrderSet]
ADD CONSTRAINT [FK_CustomerOrder]
    FOREIGN KEY ([CustomerId])
    REFERENCES [dbo].[CustomerSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CustomerOrder'
CREATE INDEX [IX_FK_CustomerOrder]
ON [dbo].[OrderSet]
    ([CustomerId]);
GO

-- Creating foreign key on [Artist_Id] in table 'ArtistAlbum'
ALTER TABLE [dbo].[ArtistAlbum]
ADD CONSTRAINT [FK_ArtistAlbum_Artist]
    FOREIGN KEY ([Artist_Id])
    REFERENCES [dbo].[ArtistSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Album_Id] in table 'ArtistAlbum'
ALTER TABLE [dbo].[ArtistAlbum]
ADD CONSTRAINT [FK_ArtistAlbum_Album]
    FOREIGN KEY ([Album_Id])
    REFERENCES [dbo].[AlbumSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ArtistAlbum_Album'
CREATE INDEX [IX_FK_ArtistAlbum_Album]
ON [dbo].[ArtistAlbum]
    ([Album_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------