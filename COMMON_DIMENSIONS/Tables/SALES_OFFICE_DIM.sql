﻿CREATE TABLE [COMMON_DIMENSIONS].[SALES_OFFICE_DIM] (
    [SALES_OFFICE_ID]   INT           IDENTITY (1, 1) NOT NULL,
    [SALES_OFFICE_DESC] VARCHAR (250) NULL,
    CONSTRAINT [PK_SALES_OFFICE_DIM] PRIMARY KEY CLUSTERED ([SALES_OFFICE_ID] ASC)
);

