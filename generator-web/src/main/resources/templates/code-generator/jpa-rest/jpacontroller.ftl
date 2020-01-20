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
@Api(tags = {"  "})
public class ${classInfo.className}Controller {

    @Autowired
    private ${classInfo.className}Service ${classInfo.className?uncap_first}Service;

    //@ApiOperation("查询所有")
    //@GetMapping
    //public Result<List<${classInfo.className}>> findAll(){
    //    List<${classInfo.className}> all = ${classInfo.className?uncap_first}Service.findAll();
    //    return new Result<List<${classInfo.className}>>(true, ResultCode.SUCCESS.getCode(), "查询成功", all);
    //}

    @ApiOperation("通过id查询")
    @GetMapping("/{id}")
    public Result<${classInfo.className}> findById(@PathVariable("id") String id){
        ${classInfo.className} byId = ${classInfo.className?uncap_first}Service.findById(id);
        return new Result<${classInfo.className}>(true, ResultCode.SUCCESS.getCode(), "查询成功", byId);
    }

    @ApiOperation("新增")
    @PostMapping
    public Result<${classInfo.className}> save(@RequestBody ${classInfo.className}AddParam ${classInfo.className?uncap_first}AddParam){
        ${classInfo.className} save = ${classInfo.className?uncap_first}Service.save(${classInfo.className?uncap_first}AddParam);
        return new Result<${classInfo.className}>(true, ResultCode.SUCCESS.getCode(), "添加成功", save);
    }

    @ApiOperation("更新")
    @PutMapping("/{id}")
    public Result<${classInfo.className}> update(@PathVariable("id") String id, @RequestBody ${classInfo.className}UpdateParam ${classInfo.className?uncap_first}UpdateParam){
        ${classInfo.className} update = ${classInfo.className?uncap_first}Service.update(id, ${classInfo.className?uncap_first}UpdateParam);
        return new Result<${classInfo.className}>(true, ResultCode.SUCCESS.getCode(), "更新成功", update);
    }

    @ApiOperation("删除")
    @DeleteMapping("/{caseId}")
    public Result deleteByID(@PathVariable("caseId") String id){
        ${classInfo.className?uncap_first}Service.deleteById(id);
        return new Result(true, ResultCode.SUCCESS.getCode(), "删除成功");
    }

    @ApiOperation("批量删除")
    @PostMapping("/delete")
    public Result delete(@RequestBody List<String> ids){
        ${classInfo.className?uncap_first}Service.delete(ids);
        return new Result(true, ResultCode.SUCCESS.getCode(), "删除成功");
    }

    @ApiOperation("软删除")
    @DeleteMapping("/{id}")
    public Result deleteByID(@PathVariable("id") String id){
        ${classInfo.className?uncap_first}Service.softDeleteById(id);
        return new Result(true, ResultCode.SUCCESS.getCode(), "删除成功");
    }

    @ApiOperation("批量软删除")
    @PostMapping("/delete")
    public Result delete(@RequestBody List<String> ids){
        ${classInfo.className?uncap_first}Service.delete(ids);
        return new Result(true, ResultCode.SUCCESS.getCode(), "删除成功");
    }

    @ApiOperation("分页查询")
    @PostMapping("/search/{page}/{size}")
    public Result<Page<${classInfo.className}>> pageQuery(@RequestBody ${classInfo.className}PageParam ${classInfo.className?uncap_first}PageParam, @PathVariable(value = "page") int currentPage, @PathVariable(value = "size") int pageSize) {
        Page<${classInfo.className}> pageData = ${classInfo.className?uncap_first}Service.list(${classInfo.className?uncap_first}PageParam, currentPage, pageSize);
        return new Result<Page<${classInfo.className}>>(true, ResultCode.SUCCESS.getCode(), "查询成功", pageData);
    }

}
