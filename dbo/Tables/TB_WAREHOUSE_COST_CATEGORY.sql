CREATE TABLE [dbo].[TB_WAREHOUSE_COST_CATEGORY] (
    [CLIENT_CODE]                       INT            NULL,
    [COSTCATEGORY_CODE]                 NVARCHAR (MAX) NULL,
    [CONSOLIDATED_CATEGORY]             NVARCHAR (MAX) NULL,
    [WAREHOUSE_COST_CATEGORY]           NVARCHAR (MAX) NULL,
    [WAREHOUSE_COST_TYPE]               NVARCHAR (MAX) NULL,
    [WAREHOUSE_COST_ITEM]               NVARCHAR (MAX) NULL,
    [WAREHOUSE_COST_CATEGORY_ALLOCABLE] NVARCHAR (MAX) NULL,
    [LAST_DTM]                          DATETIME       NULL,
    [SYSTEM_ID]                         NVARCHAR (MAX) NULL,
    [LAST_ACTION_CD]                    NVARCHAR (MAX) NULL
);

