{{
    config(
        materialized = 'incremental',
        unique_key='ID',
        incremental_strategy='merge',
        merge_update_columns = ["ID","ISDELETED","CAMPAIGNID","LEADID","CONTACTID","STATUS","HASRESPONDED","CREATEDDATE","CREATEDBYID","LASTMODIFIEDDATE",
"LASTMODIFIEDBYID","SYSTEMMODSTAMP","FIRSTRESPONDEDDATE","SALUTATION","NAME","FIRSTNAME","LASTNAME","TITLE","STREET",
"CITY","STATE","POSTALCODE","COUNTRY","EMAIL","PHONE","FAX","MOBILEPHONE","DONOTCALL","HASOPTEDOUTOFEMAIL","HASOPTEDOUTOFFAX",
"LEADSOURCE","COMPANYORACCOUNT","TYPE","LEADORCONTACTID","LEADORCONTACTOWNERID", "DW_UPDATE_DT"],
        database='DBT_INFOFISCUS_DATAMART_DEV', 
        post_hook="Update DBT_INFOFISCUS_LANDING_DEV.CT_SALESFORCE.INFOFISCUS_CT CT SET LAST_RUN_DATE = CURRENT_TIMESTAMP() WHERE
        SRC_OBJECT =  'CAMPAIGNMEMBER' AND TGT_OBJECT = 'STG_CAMPAIGNMEMBER' ;"
    )
}}

SELECT 
"ID",
"ISDELETED",
"CAMPAIGNID",
"LEADID",
"CONTACTID",
"STATUS",
"HASRESPONDED",
"CREATEDDATE",
"CREATEDBYID",
"LASTMODIFIEDDATE",
"LASTMODIFIEDBYID",
"SYSTEMMODSTAMP",
"FIRSTRESPONDEDDATE",
"SALUTATION",
"NAME",
"FIRSTNAME",
"LASTNAME",
"TITLE",
"STREET",
"CITY",
"STATE",
"POSTALCODE",
"COUNTRY",
"EMAIL",
"PHONE",
"FAX",
"MOBILEPHONE",
"DONOTCALL",
"HASOPTEDOUTOFEMAIL",
"HASOPTEDOUTOFFAX",
"LEADSOURCE",
"COMPANYORACCOUNT",
"TYPE",
"LEADORCONTACTID",
"LEADORCONTACTOWNERID", "ID" AS "DW_KEY_ID",     
CURRENT_TIMESTAMP AS "DW_INSERT_DT", CURRENT_TIMESTAMP AS "DW_UPDATE_DT" 
FROM {{ref('STG_CAMPAIGNMEMBER')}}
            