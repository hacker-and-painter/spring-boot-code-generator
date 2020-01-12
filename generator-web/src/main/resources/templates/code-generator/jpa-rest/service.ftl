package ${packageName}.controller;

import ${packageName}.entity.${classInfo.className};
import ${packageName}.repository.${classInfo.className}Repository;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.data.domain.ExampleMatcher;
import org.springframework.data.domain.PageRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;
import java.util.Map;

/**
 * @Description
 * @Author ${authorName}
 * @Date ${.now?string('yyyy-MM-dd HH:mm:ss')}
 **/
@Service
@Slf4j
public class ${classInfo.className}Service {

    @Autowired
    private ${classInfo.className}Repository ${classInfo.className?uncap_first}Repository;


    /**
    * 查询所有
    */
    public List<${classInfo.className}> findAll(){
        return ${classInfo.className?uncap_first}Repository.findAll();
    }

    /**
    * 通过id查询
    */
    public ${classInfo.className} findById(String id){
        return ${classInfo.className?uncap_first}Repository.findById(id).orElse(null);
    }

    /**
    * 新增
    */
    public ${classInfo.className} save(${classInfo.className} ${classInfo.className?uncap_first}){
<#list classInfo.fieldList as fieldItem >
    <#if fieldItem.fieldName == 'isDelete'>
        ${classInfo.className?uncap_first}.setIsDelete(false);
    </#if>
</#list>
        return ${classInfo.className?uncap_first}Repository.save(${classInfo.className?uncap_first});
    }

    /**
    * 更新
    */
    public ${classInfo.className} update(String id, ${classInfo.className}UpdateParam ${classInfo.className?uncap_first}UpdateParam) {
        ${classInfo.className} ${classInfo.className?uncap_first} = ${classInfo.className?uncap_first}Repository.findById(id).get();
<#if classInfo.fieldList?exists && classInfo.fieldList?size gt 0>
    <#list classInfo.fieldList as fieldItem>
        <#if fieldItem.fieldName == 'id' || fieldItem.fieldName == 'createTime' || fieldItem.fieldName = 'updateTime' || fieldItem.fieldName = 'isDelete' >
            <#continue>
        </#if>
        if(${classInfo.className?uncap_first}UpdateParam.get${fieldItem.fieldName?cap_first}() != null) {
            ${classInfo.className?uncap_first}.set${fieldItem.fieldName?cap_first}(${classInfo.className?uncap_first}UpdateParam.get${fieldItem.fieldName?cap_first}());
        }
    </#list>
</#if>
        return ${classInfo.className?uncap_first}Repository.save(${classInfo.className?uncap_first});
    }

    /**
    * 删除
    */
    public void deleteById(String id){
        ${classInfo.className?uncap_first}Repository.deleteById(id);
    }

    /**
    * 软删除
    */
    public void softDeleteById(String id){
        ${classInfo.className} ${classInfo.className?uncap_first} = ${classInfo.className?uncap_first}Repository.findById(id).get();
        ${classInfo.className?uncap_first}.setIsDelete(true);
        ${classInfo.className?uncap_first}Repository.save(${classInfo.className?uncap_first});
    }

    /**
    * 批量删除
    */
    @Transactional
    public void delete(List<String> ids) {
        ${classInfo.className?uncap_first}Repository.deleteByIdIn(ids);
    }

    /**
    * 批量软删除
    */
    @Transactional
    public void delete(List<String> ids) {
        for (String id : ids) {
            Optional<${classInfo.className}> byIdOptional = ${classInfo.className?uncap_first}Repository.findById(id);
            if (byIdOptional.isPresent()) {
            ${classInfo.className} byId = byIdOptional.get();
            byId.setIsDelete(true);
            ${classInfo.className?uncap_first}Repository.save(byId);
            }
        }
    }

    /**
    * 查询
    */
    public Result find(String id){
        Optional<${classInfo.className}> ${classInfo.className?uncap_first}=${classInfo.className?uncap_first}Repository.findById(id);
        if(${classInfo.className?uncap_first}.isPresent()){
            return new Result(true,ResultCode.SUCCESS.getCode(),"成功",${classInfo.className?uncap_first}.get());
        }else{
            return new Result(true,ResultCode.FAILED.getCode(),"没有找到该对象");
        }
    }

<#--    /**-->
<#--    * 查询所有-->
<#--    */-->
<#--    public Object findAll(${classInfo.className} ${classInfo.className?uncap_first}){-->
<#--        //创建匹配器，需要查询条件请修改此处代码-->
<#--        ExampleMatcher matcher = ExampleMatcher.matchingAll();-->

<#--        //创建实例-->
<#--        Example<${classInfo.className}> example = Example.of(${classInfo.className?uncap_first}, matcher);-->

<#--        return ${classInfo.className?uncap_first}Repository.findAll(example);-->
<#--    }-->

    /**
    * 分页查询
    */
    public Page<${classInfo.className}> list(${classInfo.className}PageParam ${classInfo.className?uncap_first}PageParam,
                         int pageNumber,
                         int pageSize) {

            // 创建匹配器，需要查询条件请修改此处代码
            //ExampleMatcher matcher = ExampleMatcher.matching().withIgnorePaths("createTime", "updateTime").withMatcher("name", match -> match.contains());
            ExampleMatcher matcher = ExampleMatcher.matchingAll();

            ${classInfo.className} ${classInfo.className?uncap_first} = new ${classInfo.className}();
    <#if classInfo.fieldList?exists && classInfo.fieldList?size gt 0>
        <#list classInfo.fieldList as fieldItem>
            <#if fieldItem.fieldName == 'id' || fieldItem.fieldName == 'createTime' || fieldItem.fieldName = 'updateTime' || fieldItem.fieldName = 'isDelete' >
                <#continue>
            </#if>
            ${classInfo.className?uncap_first}.set${fieldItem.fieldName?cap_first}(${classInfo.className?uncap_first}PageParam.get${fieldItem.fieldName?cap_first}());
        </#list>
    </#if>

            // 创建实例
            Example<${classInfo.className}> example = Example.of(${classInfo.className?uncap_first}, matcher);
            // 排序
            Sort sort = new Sort(Sort.Direction.DESC, "updateTime");
            // 分页构造
            Pageable pageable = PageRequest.of(pageNumber - 1, pageSize, sort);

            //// 分页构造
            //Pageable pageable = PageRequest.of(pageNumber - 1,pageSize);

            return ${classInfo.className?uncap_first}Repository.findAll(example, pageable);
    }

}
