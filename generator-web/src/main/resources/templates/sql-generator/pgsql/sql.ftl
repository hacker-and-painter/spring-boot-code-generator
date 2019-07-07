<#--CREATE TABLE "public"."${tableInfo.tableName}" (-->
<#--"id" varchar(255) NOT NULL,-->

<#--<#if tableInfo.fieldList?exists && tableInfo.fieldList?size gt 0>-->
<#--    <#list tableInfo.fieldList as fieldName >-->
<#--        "${fieldName}" varchar(255),-->
<#--    </#list>-->
<#--</#if>-->

<#--CONSTRAINT "${tableInfo.tableName}_pkey" PRIMARY KEY ("id")-->
<#--);-->

<#--ALTER TABLE "public"."${tableInfo.tableName}"-->
<#--OWNER TO "postgres";-->

<#--COMMENT ON COLUMN "public"."${tableInfo.tableName}"."id" IS '主键';-->
