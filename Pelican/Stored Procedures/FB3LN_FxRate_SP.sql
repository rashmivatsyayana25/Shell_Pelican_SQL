﻿CREATE PROCEDURE Pelican.FB3LN_FxRate_SP AS
SELECT Pelican.GSAP_PROD.[ACCOUNTING_DOC_LINE_ITEM_NO],Pelican.GSAP_PROD.[AMT_IN_DOC_CURRENCY_DECIMAL_SHIFT],Pelican.GSAP_PROD.[BSEG_ACCOUNT_TYPE],Pelican.GSAP_PROD.[BSEG_ACCOUNT_TYPE_DESCRIPTION]	               
,Pelican.GSAP_PROD.[BSEG_GENERAL_LEDGER_ACCOUNT_2],Pelican.GSAP_PROD.[COMPANY_CODE],Pelican.GSAP_PROD.[COMPANY_CODE_DESCRIPTION],Pelican.GSAP_PROD.[COMPANY_COUNTRY_CODE],Pelican.GSAP_PROD.[COST_CENTER],Pelican.GSAP_PROD.[COST_CENTER_LONG_TEXT]	                       
,Pelican.GSAP_PROD.[COST_CENTER_SHORT_TEXT],Pelican.GSAP_PROD.[COST_ELEMENT],Pelican.GSAP_PROD.[COST_ELEMENT_LONG_TEXT],Pelican.GSAP_PROD.[COST_ELEMENT_SHORT_TEXT],Pelican.GSAP_PROD.[COUNTRY],Pelican.GSAP_PROD.[CURRENCY_CODE],Pelican.GSAP_PROD.[DEBIT_CREDIT_IND]	                           
,Pelican.GSAP_PROD.[DEBIT_CREDIT_IND_DESCRIPTION],Pelican.GSAP_PROD.[DOCUMENT_DATE],Pelican.GSAP_PROD.[DOCUMENT_HEADER_TEXT],Pelican.GSAP_PROD.[DOCUMENT_ITEM],Pelican.GSAP_PROD.[DOCUMENT_LINE_LAST_DTM],Pelican.GSAP_PROD.[DOCUMENT_NAME]	                               
,Pelican.GSAP_PROD.[DOCUMENT_NUMBER],Pelican.GSAP_PROD.[DOCUMENT_POSTING_DATE],Pelican.GSAP_PROD.[DOCUMENT_POSTING_PERIOD],Pelican.GSAP_PROD.[DOCUMENT_STATUS],Pelican.GSAP_PROD.[DOCUMENT_TYPE],Pelican.GSAP_PROD.[DOCUMENT_TYPE_DESC]	                           
,Pelican.GSAP_PROD.[FBL3N_Reusable_Last_Dtm],Pelican.GSAP_PROD.[FISCAL_YEAR],Pelican.GSAP_PROD.[FUNCTIONAL_AREA],Pelican.GSAP_PROD.[FUNCTIONAL_AREA_DESCRIPTION],Pelican.GSAP_PROD.[GENERAL_LEDGER_ACCOUNT_MASTER_RECORD_LAST_DTM]
,Pelican.GSAP_PROD.[GENERAL_LEDGER_ACCOUNT_NO],Pelican.GSAP_PROD.[GENERAL_LEDGER_ACCT_LONG_TEXT],Pelican.GSAP_PROD.[GENERAL_LEDGER_SHORT_TEXT],Pelican.GSAP_PROD.[ITEM_TEXT]	                           
,Pelican.GSAP_PROD.[LOCAL_CURRENCY3_AMOUNT],Pelican.GSAP_PROD.[PLANT],Pelican.GSAP_PROD.[PLANT_NAME],Pelican.GSAP_PROD.[POSTING_CODE],Pelican.GSAP_PROD.[POSTING_CODE_DESCRIPTION],Pelican.GSAP_PROD.[PROFIT_CENTER]	                               
,Pelican.GSAP_PROD.[PROFIT_CENTER_LONG_TEXT],Pelican.GSAP_PROD.[PROFIT_CENTER_SHORT_TEXT],Pelican.GSAP_PROD.[SFS_LINE_ITEM],Pelican.GSAP_PROD.[T001_COMPANY_CODE],Pelican.GSAP_PROD.[T001W_PLANT_CODE],Pelican.GSAP_PROD.[T003T_DOCUMENT_TYPE_CODE],
Pelican.GSAP_PROD.[T005T_COUNTRY_CODE],Pelican.GSAP_PROD.[T005T_COUNTRY_NAME],Pelican.GSAP_PROD.[VENDOR_ACCOUNT_NO],Pelican.GSAP_PROD.[VENDOR_NAME],Pelican.GSAP_PROD.[YEAR]
FROM Pelican.GSAP_PROD;