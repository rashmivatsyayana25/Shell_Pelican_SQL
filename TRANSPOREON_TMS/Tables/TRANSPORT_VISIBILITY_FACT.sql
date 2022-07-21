﻿CREATE TABLE [TRANSPOREON_TMS].[TRANSPORT_VISIBILITY_FACT] (
    [DELIVERY_NO]                        NUMERIC (20)  NOT NULL,
    [TRANSPORT_NO]                       VARCHAR (50)  NOT NULL,
    [TRANSP_VISIBILITY_STATUS_DESC]      VARCHAR (150) NOT NULL,
    [STATUS_PLACED_MANUAL_DATE_STAMP_ID] BIGINT        NULL,
    [STATUS_PLACED_SYS_DATE_STAMP_ID]    BIGINT        NULL,
    [STATUS_PLACED_SYS_TIME_STAMP_ID]    BIGINT        NULL,
    [STATUS_PLACED_MANUAL_TIME_STAMP_ID] BIGINT        NULL,
    [COMPANY_NAME]                       VARCHAR (150) COLLATE Latin1_General_100_CI_AI_SC_UTF8 NULL,
    [STATUS]                             VARCHAR (5)   NULL,
    [TIMESTAMP]                          DATETIME      NULL,
    CONSTRAINT [PK_TRANSPORT_VISIBILITY_FACT] PRIMARY KEY CLUSTERED ([DELIVERY_NO] ASC, [TRANSPORT_NO] ASC, [TRANSP_VISIBILITY_STATUS_DESC] ASC),
    CONSTRAINT [FK_STATUS_PLACED_MANUAL_DATA_STAMP] FOREIGN KEY ([STATUS_PLACED_MANUAL_DATE_STAMP_ID]) REFERENCES [COMMON_DIMENSIONS].[DATE_DIM] ([DATE_ID]),
    CONSTRAINT [FK_STATUS_PLACED_MANUAL_TIME_STAMP] FOREIGN KEY ([STATUS_PLACED_MANUAL_TIME_STAMP_ID]) REFERENCES [COMMON_DIMENSIONS].[TIME_DIM] ([TIME_ID]),
    CONSTRAINT [FK_STATUS_PLACED_SYS_DATA_STAMP] FOREIGN KEY ([STATUS_PLACED_SYS_DATE_STAMP_ID]) REFERENCES [COMMON_DIMENSIONS].[DATE_DIM] ([DATE_ID]),
    CONSTRAINT [FK_STATUS_PLACED_SYS_TIME_STAMP] FOREIGN KEY ([STATUS_PLACED_SYS_TIME_STAMP_ID]) REFERENCES [COMMON_DIMENSIONS].[TIME_DIM] ([TIME_ID])
);

