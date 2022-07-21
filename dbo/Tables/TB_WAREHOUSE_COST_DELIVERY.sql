﻿CREATE TABLE [dbo].[TB_WAREHOUSE_COST_DELIVERY] (
    [ALLOCABLE]         NVARCHAR (MAX) NULL,
    [BILLING_DOCUMENT]  NVARCHAR (MAX) NULL,
    [CHARGE]            NVARCHAR (MAX) NULL,
    [CLIENT_CODE]       INT            NULL,
    [COSTCATEGORY_CODE] NVARCHAR (MAX) NULL,
    [CURRENCY]          NVARCHAR (MAX) NULL,
    [CUSTOMER_NUMBER]   NVARCHAR (MAX) NULL,
    [DELIVERY]          NVARCHAR (MAX) NULL,
    [LAST_ACTION_CD]    NVARCHAR (MAX) NULL,
    [LAST_DTM]          DATETIME       NULL,
    [LOADING_UNITS]     NVARCHAR (MAX) NULL,
    [NET_PRICE]         NVARCHAR (MAX) NULL,
    [PLANT_CODE]        NVARCHAR (MAX) NULL,
    [PROCESSED_IND]     NVARCHAR (MAX) NULL,
    [PROCESSED_DATE]    DATE           NULL,
    [PROCESSED_TIME]    NVARCHAR (MAX) NULL,
    [QUANTITY]          NVARCHAR (MAX) NULL,
    [SYSTEM_ID]         NVARCHAR (MAX) NULL,
    [TRANSMISSION_DATE] DATE           NULL,
    [TRANSMISSION_TIME] NVARCHAR (MAX) NULL,
    [UOM]               NVARCHAR (MAX) NULL,
    [VENDOR_REFERENCE]  NVARCHAR (MAX) NULL
);
