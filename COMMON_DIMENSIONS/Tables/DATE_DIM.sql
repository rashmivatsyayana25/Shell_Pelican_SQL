﻿CREATE TABLE [COMMON_DIMENSIONS].[DATE_DIM] (
    [DATE_ID] BIGINT IDENTITY (1, 1) NOT NULL,
    [DATE]    DATE   NULL,
    CONSTRAINT [PK_DATE_DIM] PRIMARY KEY CLUSTERED ([DATE_ID] ASC)
);

