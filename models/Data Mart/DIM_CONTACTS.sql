{{
    config(
        materialized = 'incremental',
        unique_key='ID',
        incremental_strategy='merge',
        merge_update_columns = ["ID","ISDELETED","MASTERRECORDID","NAME","TYPE", "RECORDTYPEID",
"PARENTID","BILLINGSTREET","BILLINGCITY","BILLINGSTATE","BILLINGPOSTALCODE",
"BILLINGCOUNTRY","BILLINGSTATECODE","BILLINGCOUNTRYCODE","BILLINGLATITUDE",
"BILLINGLONGITUDE","BILLINGGEOCODEACCURACY","SHIPPINGSTREET","SHIPPINGCITY","SHIPPINGSTATE",
"SHIPPINGPOSTALCODE","SHIPPINGCOUNTRY","SHIPPINGSTATECODE","SHIPPINGCOUNTRYCODE",
"SHIPPINGLATITUDE","SHIPPINGLONGITUDE","SHIPPINGGEOCODEACCURACY","PHONE","FAX","WEBSITE","PHOTOURL",
"SIC","INDUSTRY","ANNUALREVENUE","NUMBEROFEMPLOYEES","OWNERSHIP","TICKERSYMBOL","DESCRIPTION","SITE",
"OWNERID","CREATEDDATE","CREATEDBYID","LASTMODIFIEDDATE","LASTMODIFIEDBYID","SYSTEMMODSTAMP",
"LASTACTIVITYDATE","LASTVIEWEDDATE","LASTREFERENCEDDATE","ISPARTNER","ISCUSTOMERPORTAL",
"JIGSAW","JIGSAWCOMPANYID","ACCOUNTSOURCE","SICDESC","DANDBCOMPANYID","OPERATINGHOURSID ID","ISDELETED",
"NAME","PARENTID","RECORDTYPEID","TYPE","STATUS","STARTDATE","ENDDATE","EXPECTEDREVENUE",
"BUDGETEDCOST","ACTUALCOST","CAMPAIGNIMAGEID","EXPECTEDRESPONSE","NUMBERSENT","ISACTIVE",
"DESCRIPTION","NUMBEROFLEADS","NUMBEROFCONVERTEDLEADS","NUMBEROFCONTACTS","NUMBEROFRESPONSES",
"NUMBEROFOPPORTUNITIES","NUMBEROFWONOPPORTUNITIES","AMOUNTALLOPPORTUNITIES","AMOUNTWONOPPORTUNITIES",
"CURRENCYISOCODE","OWNERID","TENANTID","CREATEDDATE","CREATEDBYID","LASTMODIFIEDDATE",
"LASTMODIFIEDBYID","SYSTEMMODSTAMP","LASTACTIVITYDATE","LASTVIEWEDDATE","LASTREFERENCEDDATE",
"CAMPAIGNMEMBERRECORDTYPEID ID","ISDELETED","MASTERRECORDID","ACCOUNTID","LASTNAME","FIRSTNAME",
"SALUTATION","NAME","OTHERSTREET","OTHERCITY","OTHERSTATE","OTHERPOSTALCODE","OTHERCOUNTRY","OTHERLATITUDE",
"OTHERLONGITUDE","OTHERGEOCODEACCURACY","MAILINGSTREET","MAILINGCITY","MAILINGSTATE","MAILINGPOSTALCODE",
"MAILINGCOUNTRY","MAILINGLATITUDE","MAILINGLONGITUDE","MAILINGGEOCODEACCURACY","PHONE","FAX","MOBILEPHONE",
"HOMEPHONE","OTHERPHONE","ASSISTANTPHONE","REPORTSTOID","EMAIL","TITLE","DEPARTMENT","ASSISTANTNAME",
"LEADSOURCE","BIRTHDATE","DESCRIPTION","OWNERID","CREATEDDATE","CREATEDBYID","LASTMODIFIEDDATE",
"LASTMODIFIEDBYID","SYSTEMMODSTAMP","LASTACTIVITYDATE","LASTCUREQUESTDATE","LASTCUUPDATEDATE","LASTVIEWEDDATE",
"LASTREFERENCEDDATE","EMAILBOUNCEDREASON","EMAILBOUNCEDDATE","ISEMAILBOUNCED","PHOTOURL","JIGSAW",
"JIGSAWCONTACTID","CLEANSTATUS","INDIVIDUALID", "DW_UPDATE_DT"],
        database='DBT_INFOFISCUS_DATAMART_DEV', 
        post_hook="Update DBT_INFOFISCUS_LANDING_DEV.CT_SALESFORCE.INFOFISCUS_CT CT SET LAST_RUN_DATE = CURRENT_TIMESTAMP() WHERE
        SRC_OBJECT =  'CONTACTS' AND TGT_OBJECT = 'STG_CONTACTS' ;"
    )
}}

SELECT 
"ID","ISDELETED","MASTERRECORDID","NAME","TYPE",NULL AS "RECORDTYPEID",
"PARENTID","BILLINGSTREET","BILLINGCITY","BILLINGSTATE","BILLINGPOSTALCODE",
"BILLINGCOUNTRY",NULL AS "BILLINGSTATECODE",NULL AS "BILLINGCOUNTRYCODE","BILLINGLATITUDE",
"BILLINGLONGITUDE","BILLINGGEOCODEACCURACY","SHIPPINGSTREET","SHIPPINGCITY","SHIPPINGSTATE",
"SHIPPINGPOSTALCODE","SHIPPINGCOUNTRY",NULL AS "SHIPPINGSTATECODE",NULL AS "SHIPPINGCOUNTRYCODE",
"SHIPPINGLATITUDE","SHIPPINGLONGITUDE","SHIPPINGGEOCODEACCURACY","PHONE","FAX","WEBSITE","PHOTOURL",
"SIC","INDUSTRY","ANNUALREVENUE","NUMBEROFEMPLOYEES","OWNERSHIP","TICKERSYMBOL","DESCRIPTION","SITE",
"OWNERID","CREATEDDATE","CREATEDBYID","LASTMODIFIEDDATE","LASTMODIFIEDBYID","SYSTEMMODSTAMP",
"LASTACTIVITYDATE","LASTVIEWEDDATE","LASTREFERENCEDDATE",NULL AS "ISPARTNER",NULL AS "ISCUSTOMERPORTAL",
"JIGSAW","JIGSAWCOMPANYID","ACCOUNTSOURCE","SICDESC","DANDBCOMPANYID","OPERATINGHOURSID ID","ISDELETED",
"NAME","PARENTID",NULL AS "RECORDTYPEID","TYPE","STATUS","STARTDATE","ENDDATE","EXPECTEDREVENUE",
"BUDGETEDCOST","ACTUALCOST",NULL AS "CAMPAIGNIMAGEID","EXPECTEDRESPONSE","NUMBERSENT","ISACTIVE",
"DESCRIPTION","NUMBEROFLEADS","NUMBEROFCONVERTEDLEADS","NUMBEROFCONTACTS","NUMBEROFRESPONSES",
"NUMBEROFOPPORTUNITIES","NUMBEROFWONOPPORTUNITIES","AMOUNTALLOPPORTUNITIES","AMOUNTWONOPPORTUNITIES",
NULL AS "CURRENCYISOCODE","OWNERID",NULL AS "TENANTID","CREATEDDATE","CREATEDBYID","LASTMODIFIEDDATE",
"LASTMODIFIEDBYID","SYSTEMMODSTAMP","LASTACTIVITYDATE","LASTVIEWEDDATE","LASTREFERENCEDDATE",
"CAMPAIGNMEMBERRECORDTYPEID ID","ISDELETED","MASTERRECORDID","ACCOUNTID","LASTNAME","FIRSTNAME",
"SALUTATION","NAME","OTHERSTREET","OTHERCITY","OTHERSTATE","OTHERPOSTALCODE","OTHERCOUNTRY","OTHERLATITUDE",
"OTHERLONGITUDE","OTHERGEOCODEACCURACY","MAILINGSTREET","MAILINGCITY","MAILINGSTATE","MAILINGPOSTALCODE",
"MAILINGCOUNTRY","MAILINGLATITUDE","MAILINGLONGITUDE","MAILINGGEOCODEACCURACY","PHONE","FAX","MOBILEPHONE",
"HOMEPHONE","OTHERPHONE","ASSISTANTPHONE","REPORTSTOID","EMAIL","TITLE","DEPARTMENT","ASSISTANTNAME",
"LEADSOURCE","BIRTHDATE","DESCRIPTION","OWNERID","CREATEDDATE","CREATEDBYID","LASTMODIFIEDDATE",
"LASTMODIFIEDBYID","SYSTEMMODSTAMP","LASTACTIVITYDATE","LASTCUREQUESTDATE","LASTCUUPDATEDATE","LASTVIEWEDDATE",
"LASTREFERENCEDDATE","EMAILBOUNCEDREASON","EMAILBOUNCEDDATE","ISEMAILBOUNCED","PHOTOURL","JIGSAW",
"JIGSAWCONTACTID","CLEANSTATUS","INDIVIDUALID", "ID" AS "DW_KEY_ID",     
CURRENT_TIMESTAMP AS "DW_INSERT_DT", CURRENT_TIMESTAMP AS "DW_UPDATE_DT" 
FROM {{ref('STG_CONTACTS')}}
            