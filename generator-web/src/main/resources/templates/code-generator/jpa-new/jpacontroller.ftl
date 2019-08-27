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
@RestController
@RequestMapping("/${classInfo.className?uncap_first}")
public class ${classInfo.className}Controller {

    @Autowired
    private ${classInfo.className}Service ${classInfo.className?uncap_first}Service;

    @ApiOperation("新增或编辑")
    @PostMapping("/save")
    public Object save(@RequestBody ${classInfo.className} ${classInfo.className?uncap_first}){
        return ${classInfo.className?uncap_first}Service.save(${classInfo.className?uncap_first});
    }

    @ApiOperation("删除")
    @DeleteMapping("/delete")
    public Object delete(String id){
        return ${classInfo.className?uncap_first}Service.delete(id);
    }

    @ApiOperation("查询")
    @GetMapping("/find")
    public Object find(String id){
        return ${classInfo.className?uncap_first}Service.find(id);
    }

<#--    @ApiOperation("查询所有")-->
<#--    @GetMapping("/findAll")-->
<#--    public Object findAll(${classInfo.className} ${classInfo.className?uncap_first}){-->
<#--        return ${classInfo.className?uncap_first}Service.findAll(${classInfo.className?uncap_first});-->
<#--    }-->

    @ApiOperation("分页查询")
    @GetMapping("/list")
    public Object list(${classInfo.className} ${classInfo.className?uncap_first},
                        @RequestParam(required = false, defaultValue = "1") int pageNumber,
                        @RequestParam(required = false, defaultValue = "10") int pageSize) {

        return ${classInfo.className?uncap_first}Service.list(${classInfo.className?uncap_first}, pageNumber, pageSize);
    }

}
