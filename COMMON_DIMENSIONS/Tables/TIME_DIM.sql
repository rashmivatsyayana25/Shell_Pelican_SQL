﻿CREATE TABLE [COMMON_DIMENSIONS].[TIME_DIM] (
    [TIME_ID] BIGINT       IDENTITY (1, 1) NOT NULL,
    [HOUR]    VARCHAR (20) NULL,
    [MINUTE]  VARCHAR (20) NULL,
    [SECOND]  VARCHAR (20) NULL,
    CONSTRAINT [PK_TIME_DIM] PRIMARY KEY CLUSTERED ([TIME_ID] ASC)
);
