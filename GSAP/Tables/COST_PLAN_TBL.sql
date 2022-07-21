CREATE TABLE [GSAP].[COST_PLAN_TBL] (
    [PLAN_COST_HEAD_CODE]       VARCHAR (50)    NULL,
    [COUNTRY_CODE]              VARCHAR (50)    NULL,
    [COMPANY_CODE]              VARCHAR (10)    NULL,
    [OP_SEGMENT_LINE_ITEM]      VARCHAR (15)    NULL,
    [OP_SEGMENT_LINE_ITEM_DESC] VARCHAR (100)   NULL,
    [LC_CONVERTED]              DECIMAL (20, 9) NULL,
    [PLANFX]                    FLOAT (53)      NULL,
    [PLAN_COST_PERIOD]          VARCHAR (20)    NULL,
    [PLAN_COST_LC]              DECIMAL (20, 9) NULL,
    [CURRENCY_CODE]             VARCHAR (10)    NULL
);

