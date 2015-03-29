CREATE TABLE [dbo].[Projects] (
    [ProjectId]        INT             IDENTITY (1, 1) NOT NULL,
    [Name]             NVARCHAR (50)   NULL,
    [StartDate]        DATE            NULL,
    [EndDate]          DATE            NULL,
    [EstimatedRevenue] DECIMAL (10, 2) NULL,
    CONSTRAINT [PK_Projects] PRIMARY KEY CLUSTERED ([ProjectId] ASC)
);

