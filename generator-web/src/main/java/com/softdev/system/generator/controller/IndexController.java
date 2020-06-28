package com.softdev.system.generator.controller;

import com.softdev.system.generator.entity.ClassInfo;
import com.softdev.system.generator.entity.ReturnT;
import com.softdev.system.generator.util.CodeGeneratorTool;
import com.softdev.system.generator.util.FreemarkerTool;
import freemarker.template.TemplateException;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

/**
 * spring boot code generator
 *
 * @author zhengk/moshow
 */
@Controller
@Slf4j
public class IndexController {

    @Autowired
    private FreemarkerTool freemarkerTool;

    @GetMapping("/")
    public String index() {
        return "index";
    }

    @PostMapping("/genCode")
    @ResponseBody
    public ReturnT<Map<String, String>> codeGenerate(String tableSql,
                                                     //2019-2-10 liutf 修改为@RequestParam参数校验
                                                     @RequestParam(required = false, defaultValue = "Gao Hang Hang") String authorName,
                                                     @RequestParam(required = false, defaultValue = "com.gaohanghang.system") String packageName,
                                                     @RequestParam(required = false, defaultValue = "ApiReturnUtil") String returnUtil
    ) {


        try {

            if (StringUtils.isBlank(tableSql)) {
                return new ReturnT<>(ReturnT.FAIL_CODE, "表结构信息不可为空");
            }

            // parse table
            ClassInfo classInfo = CodeGeneratorTool.processTableIntoClassInfo(tableSql);

            // code genarete
            Map<String, Object> params = new HashMap<String, Object>();
            params.put("classInfo", classInfo);
            params.put("authorName", authorName);
            params.put("packageName", packageName);
            params.put("returnUtil", returnUtil);

            // result
            Map<String, String> result = new HashMap<String, String>();

            //UI
            result.put("swagger-ui", freemarkerTool.processString("code-generator/ui/swagger-ui.ftl", params));
            result.put("element-ui", freemarkerTool.processString("code-generator/ui/element-ui.ftl", params));
            result.put("bootstrap-ui", freemarkerTool.processString("code-generator/ui/bootstrap-ui.ftl", params));
            //mybatis old
            result.put("controller", freemarkerTool.processString("code-generator/mybatis/controller.ftl", params));
            result.put("service", freemarkerTool.processString("code-generator/mybatis/service.ftl", params));
            result.put("service_impl", freemarkerTool.processString("code-generator/mybatis/service_impl.ftl", params));
            result.put("mapper", freemarkerTool.processString("code-generator/mybatis/mapper.ftl", params));
            result.put("mybatis", freemarkerTool.processString("code-generator/mybatis/mybatis.ftl", params));
            result.put("model", freemarkerTool.processString("code-generator/mybatis/model.ftl", params));
            //jpa
            result.put("entity", freemarkerTool.processString("code-generator/jpa/entity.ftl", params));
            result.put("repository", freemarkerTool.processString("code-generator/jpa/repository.ftl", params));
            result.put("jpacontroller", freemarkerTool.processString("code-generator/jpa/jpacontroller.ftl", params));
            //jpa-new
            result.put("jpa-new-entity", freemarkerTool.processString("code-generator/jpa-new/entity.ftl", params));
            result.put("jpa-new-repository", freemarkerTool.processString("code-generator/jpa-new/repository.ftl", params));
            result.put("jpa-new-controller", freemarkerTool.processString("code-generator/jpa-new/jpacontroller.ftl", params));
            result.put("jpa-new-service", freemarkerTool.processString("code-generator/jpa-new/service.ftl", params));
            //Util
            result.put("util", freemarkerTool.processString("code-generator/util/util.ftl", params));
            //jdbc template
            result.put("jtdao", freemarkerTool.processString("code-generator/jdbc-template/jtdao.ftl", params));
            result.put("jtdaoimpl", freemarkerTool.processString("code-generator/jdbc-template/jtdaoimpl.ftl", params));
            //beetsql
            result.put("beetlmd", freemarkerTool.processString("code-generator/beetlsql/beetlmd.ftl", params));
            result.put("beetlentity", freemarkerTool.processString("code-generator/beetlsql/beetlentity.ftl", params));
            result.put("beetlentitydto", freemarkerTool.processString("code-generator/beetlsql/beetlentitydto.ftl", params));
            result.put("beetlcontroller", freemarkerTool.processString("code-generator/beetlsql/beetlcontroller.ftl", params));
            //mybatis plus
            result.put("pluscontroller", freemarkerTool.processString("code-generator/mybatis-plus/pluscontroller.ftl", params));
            result.put("plusmapper", freemarkerTool.processString("code-generator/mybatis-plus/plusmapper.ftl", params));
            //sql generate
            result.put("select", freemarkerTool.processString("sql-generator/pgsql/select.ftl", params));
            result.put("insert", freemarkerTool.processString("sql-generator/pgsql/insert.ftl", params));
            result.put("update", freemarkerTool.processString("sql-generator/pgsql/update.ftl", params));
            result.put("delete", freemarkerTool.processString("sql-generator/pgsql/delete.ftl", params));
            //jpa-restful
            result.put("jpa-rest-entity", freemarkerTool.processString("code-generator/jpa-rest/entity.ftl", params));
            result.put("jpa-rest-dto", freemarkerTool.processString("code-generator/jpa-rest/dto.ftl", params));
            result.put("jpa-rest-vo", freemarkerTool.processString("code-generator/jpa-rest/vo.ftl", params));
            result.put("jpa-rest-add-param", freemarkerTool.processString("code-generator/jpa-rest/addparam.ftl", params));
            result.put("jpa-rest-update-param", freemarkerTool.processString("code-generator/jpa-rest/updateparam.ftl", params));
            result.put("jpa-rest-page-param", freemarkerTool.processString("code-generator/jpa-rest/pageparam.ftl", params));
            result.put("projection", freemarkerTool.processString("code-generator/jpa-rest/projection.ftl", params));
            result.put("jpa-rest-repository", freemarkerTool.processString("code-generator/jpa-rest/repository.ftl", params));
            result.put("jpa-rest-controller", freemarkerTool.processString("code-generator/jpa-rest/jpacontroller.ftl", params));
            result.put("jpa-rest-service", freemarkerTool.processString("code-generator/jpa-rest/service.ftl", params));
            result.put("jpa-rest-test", freemarkerTool.processString("code-generator/jpa-rest/test.ftl", params));


            // 计算,生成代码行数
            int lineNum = 0;
            for (Map.Entry<String, String> item : result.entrySet()) {
                if (item.getValue() != null) {
                    lineNum += StringUtils.countMatches(item.getValue(), "\n");
                }
            }
            log.info("生成代码行数：{}", lineNum);
            //测试环境可自行开启
            //log.info("生成代码数据：{}", result);
            return new ReturnT<>(result);
        } catch (IOException | TemplateException e) {
            log.error(e.getMessage(), e);
            return new ReturnT<>(ReturnT.FAIL_CODE, "表结构解析失败" + e.getMessage());
        }
    }

    /**
     * 输入表名和字段名生成建表语句(暂只支出postgresql)
     * TODO 支持生成mysql建表语句
     *
     * @param tableName 表名
     * @param fields    字段名
     * @return
     */
    @GetMapping("/sqlGenerate")
    @ResponseBody
    @ApiOperation("输入表名和字段名生成建表语句")
    public String sqlGenerate(@RequestParam String tableName, String fields, String comments, String types, String lengths) {
        tableName = tableName.toLowerCase();

        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("DROP TABLE IF EXISTS \"public\".\"").append(tableName).append("\";\n");
        stringBuilder.append("CREATE TABLE \"public\".\"").append(tableName).append("\" (\n").append("\"id\" varchar(255) NOT NULL,\n");

        String[] fieldsArr = null;
        String[] commentsArr = null;
        String[] lengthsArr = null;
        String[] typesArr = null;

        // 字段
        if (!StringUtils.isBlank(fields)) {
            if (fields.contains(" ")) {
                fieldsArr = fields.split(" ");
            } else {
                fieldsArr = fields.split(",");
            }
        }

        // 类型
        if (StringUtils.isNotBlank(types)) {
            if (types.contains(" ")) {
                typesArr = types.split(" ");
            } else {
                typesArr = types.split(",");
            }
        }

        // 注释
        if (!StringUtils.isBlank(comments)) {
            if (comments.contains(" ")) {
                commentsArr = comments.split(" ");
            } else {
                commentsArr = comments.split(",");
            }
        }

        // 长度
        if (StringUtils.isNotBlank(lengths)) {
            if (lengths.contains(" ")) {
                lengthsArr = lengths.split(" ");
            } else {
                lengthsArr = lengths.split(",");
            }
        }


        //for (String fieldName : fieldsArr) {
        //    if ("id".equals(fieldName.toLowerCase())) {
        //        continue;
        //    }
        //    stringBuilder.append("\"").append(fieldName.toLowerCase()).append("\"").append(" varchar(255),\n");
        //}

        for (int i = 0; i < fieldsArr.length; i++) {
            if ("id".equals(fieldsArr[i].toLowerCase())) {
                continue;
            }

            if (typesArr != null) {
                if (lengthsArr != null) {
                    if (StringUtils.isNotBlank(typesArr[i]) && StringUtils.isNotBlank(lengthsArr[i])) {
                        String type = conversionType(typesArr[i]);
                        if (fieldsArr[i].toLowerCase().endsWith("_time")) {
                            stringBuilder.append("\"").append(fieldsArr[i].toLowerCase()).append("\"").append(" timestamp(6),\n");
                        } else {
                            stringBuilder.append("\"").append(fieldsArr[i].toLowerCase()).append("\"").append(" " + type + "(" + lengthsArr[i] + "),\n");
                        }
                    }
                } else {
                    if (fieldsArr[i].toLowerCase().endsWith("_time")) {
                        stringBuilder.append("\"").append(fieldsArr[i].toLowerCase()).append("\"").append(" timestamp(6),\n");
                    } else {
                        stringBuilder.append("\"").append(fieldsArr[i].toLowerCase()).append("\"").append(" varchar(" + lengthsArr[i] + "),\n");
                    }
                }
            } else {
                if (fieldsArr[i].toLowerCase().endsWith("_time")) {
                    stringBuilder.append("\"").append(fieldsArr[i].toLowerCase()).append("\"").append(" timestamp(6),\n");
                } else {
                    stringBuilder.append("\"").append(fieldsArr[i].toLowerCase()).append("\"").append(" varchar(255),\n");
                }
            }


            //if (lengthsArr[i] != null) {
            //    if (typesArr != null) {
            //        if (typesArr[i] != null) {
            //            String type = conversionType(typesArr[i]);
            //                stringBuilder.append("\"").append(fieldsArr[i].toLowerCase()).append("\"").append(" "+ type +"("+ lengthsArr[i] +"),\n");
            //        }  else {
            //            if (fieldsArr[i].toLowerCase().endsWith("_time")) {
            //                stringBuilder.append("\"").append(fieldsArr[i].toLowerCase()).append("\"").append(" timestamp(6),\n");
            //            }
            //        }
            //    } else {
            //        if (fieldsArr[i].toLowerCase().endsWith("_time")) {
            //            stringBuilder.append("\"").append(fieldsArr[i].toLowerCase()).append("\"").append(" timestamp(6),\n");
            //        } else {
            //            stringBuilder.append("\"").append(fieldsArr[i].toLowerCase()).append("\"").append(" varchar("+ lengthsArr[i] +"),\n");
            //        }
            //    }
            //} else {
            //    stringBuilder.append("\"").append(fieldsArr[i].toLowerCase()).append("\"").append(" varchar(255),\n");
            //}
        }

        stringBuilder.append("CONSTRAINT ").append("\"").append(tableName).append("_pkey").append("\"").append(" PRIMARY KEY (\"id\")\n" +
                ");\n");

        stringBuilder.append("ALTER TABLE \"public\".\"").append(tableName).append("\"\n").append("OWNER TO \"postgres\";\n");

        for (int i = 0; i < fieldsArr.length; i++) {
            if (commentsArr[i] != null) {
                stringBuilder.append("COMMENT ON COLUMN \"public\".\"").append(tableName).append("\".\"").append(fieldsArr[i].toLowerCase()).append("\" IS '").append(commentsArr[i]).append("';\n");
            }
        }

        return stringBuilder.toString();
    }

    public String conversionType(String typeAbbreviation) {
        if ("C".equals(typeAbbreviation)) {
            return "varchar";
        } else if ("N".equals(typeAbbreviation)) {
            return "int4";
        }
        return null;
    }

}
