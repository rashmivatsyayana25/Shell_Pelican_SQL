﻿CREATE TABLE [COMMON_DIMENSIONS].[UOM_DIM] (
    [UOM_ID] INT          IDENTITY (1, 1) NOT NULL,
    [UOM]    VARCHAR (50) NULL,
    CONSTRAINT [PK_UOM_DIM] PRIMARY KEY CLUSTERED ([UOM_ID] ASC)
);

