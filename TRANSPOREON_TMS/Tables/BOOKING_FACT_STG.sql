CREATE TABLE [TRANSPOREON_TMS].[BOOKING_FACT_STG] (
    [TRANSPORT_NO]                      VARCHAR (50)  NOT NULL,
    [BOOKING_START_DATE_ID]             BIGINT        NULL,
    [BOOKING_END_DATE_ID]               BIGINT        NULL,
    [BOOKING_START_TIME_ID]             BIGINT        NULL,
    [BOOKING_END_TIME_ID]               BIGINT        NULL,
    [BOOKING_CREATION_DATE_ID]          BIGINT        NULL,
    [BOOKING_CREATION_TIME_ID]          BIGINT        NULL,
    [BOOKING_STATUS_ID]                 INT           NULL,
    [DISPATCH_STATUS_ARRIVAL_DATE_ID]   BIGINT        NULL,
    [DISPATCH_STATUS_ARRIVAL_TIME_ID]   BIGINT        NULL,
    [DISPATCH_STATUS_DEPARTURE_DATE_ID] BIGINT        NULL,
    [DISPATCH_STATUS_DEPARTURE_TIME_ID] BIGINT        NULL,
    [LOADING_TYPE_ID]                   INT           NULL,
    [LOCATION_NAME]                     VARCHAR (100) COLLATE Latin1_General_100_CI_AI_SC_UTF8 NULL,
    [ADDED_BY_COMPANY]                  VARCHAR (100) NULL,
    [GATE_DESC]                         VARCHAR (100) COLLATE Latin1_General_100_CI_AI_SC_UTF8 NULL,
    [COMMENT]                           VARCHAR (MAX) COLLATE Latin1_General_100_CI_AI_SC_UTF8 NULL,
    [VEHICLE_LICENCE_PLATE_NO]          VARCHAR (MAX) COLLATE Latin1_General_100_CI_AI_SC_UTF8 NULL,
    [STATUS]                            VARCHAR (5)   NULL,
    [TIMESTAMP]                         DATETIME      NULL
);

