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
        return ${classInfo.className?uncap_first}Repository.save(${classInfo.className?uncap_first});
    }

    /**
    * 更新
    */
    public ${classInfo.className} update(String id, ${classInfo.className}RO ${classInfo.className?uncap_first}RO) {
        ${classInfo.className} ${classInfo.className?uncap_first} = ${classInfo.className?uncap_first}Repository.findById(id).get();
        ${classInfo.className?uncap_first}.setId(id);
<#if classInfo.fieldList?exists && classInfo.fieldList?size gt 0>
    <#list classInfo.fieldList as fieldItem>
        <#if fieldItem.fieldName == 'id' || fieldItem.fieldName == 'createTime' || fieldItem.fieldName = 'updateTime'>
            <#continue>
        </#if>
        ${classInfo.className?uncap_first}.set${fieldItem.fieldName?cap_first}(${classInfo.className?uncap_first}RO.get${fieldItem.fieldName?cap_first}());
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
        ${classInfo.className?uncap_first}.setIsDelete("true");
        ${classInfo.className?uncap_first}Repository.save(${classInfo.className?uncap_first});
    }

    /**
    * 查询
    */
    public Result find(String id){
        Optional<${classInfo.className}> ${classInfo.className?uncap_first}=${classInfo.className?uncap_first}Repository.findById(id);
        if(${classInfo.className?uncap_first}.isPresent()){
            return new Result(true,ResultCode.SUCCESS.getCode(),"成功",${classInfo.className?uncap_first}.get());
        }else{
            return new Result(true,ResultCode.ERROR.getCode(),"没有找到该对象");
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
    public Page<${classInfo.className}> list(${classInfo.className} ${classInfo.className?uncap_first},
                         int pageNumber,
                         int pageSize) {

            //创建匹配器，需要查询条件请修改此处代码
            //ExampleMatcher matcher = ExampleMatcher.matching().withIgnorePaths("createTime", "updateTime").withMatcher("name", match -> match.contains());
            ExampleMatcher matcher = ExampleMatcher.matchingAll();

            //创建实例
            Example<${classInfo.className}> example = Example.of(${classInfo.className?uncap_first}, matcher);
            //分页构造
            Pageable pageable = PageRequest.of(pageNumber - 1,pageSize);

            return ${classInfo.className?uncap_first}Repository.findAll(example, pageable);
    }

    /**
    * 批量删除
    */
    @Transactional
    public void delete(List<String> ids) {
        for (String id : ids) {
            ${classInfo.className} byId = ${classInfo.className?uncap_first}Repository.findById(id).get();
            byId.setIsDelete("true");
            ${classInfo.className?uncap_first}Repository.save(byId);
        }
    }

}
