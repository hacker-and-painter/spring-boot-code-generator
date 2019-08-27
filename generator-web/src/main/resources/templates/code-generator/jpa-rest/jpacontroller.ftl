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

    @ApiOperation("查询所有")
    @GetMapping
    public Result findAll(){
        return new Result(true, StatusCode.OK.getCode(), "查询成功",  ${classInfo.className?uncap_first}Service.findAll());
    }

    @ApiOperation("通过id查询")
    @GetMapping("/{caseId}")
    public Result findById(@PathVariable("caseId") String id){
        return new Result(true, StatusCode.OK.getCode(), "查询成功", ${classInfo.className?uncap_first}Service.findById(id));
    }

    @ApiOperation("新增")
    @PostMapping
    public Result save(@RequestBody BusCase busCase){
        ${classInfo.className?uncap_first}Service.save(busCase);
        return new Result(true, StatusCode.OK.getCode(), "添加成功");
    }

    @ApiOperation("更新")
    @PutMapping("/{caseId}")
    public Result update(@PathVariable("caseId") String id, @RequestBody BusCase busCase){
        busCase.setId(id);
        ${classInfo.className?uncap_first}Service.update(busCase);
        return new Result(true, StatusCode.OK.getCode(), "修改成功");
    }

    @ApiOperation("删除")
    @DeleteMapping("/{caseId}")
    public Result deleteByID(@PathVariable("caseId") String id){
        ${classInfo.className?uncap_first}Service.deleteById(id);
        return new Result(true, StatusCode.OK.getCode(), "删除成功");
    }

    @ApiOperation("批量删除")
    @PostMapping("/delete")
    public Result delete(@RequestBody List<String> ids){
        ${classInfo.className?uncap_first}Service.delete(ids);
        return new Result(true, StatusCode.OK.getCode(), "删除成功");
    }

    @ApiOperation("分页查询")
    @PostMapping("/search/{page}/{size}")
    public Result pageQuery(@RequestBody ${classInfo.className} ${classInfo.className?uncap_first}, @PathVariable(value = "page") int currentPage, @PathVariable(value = "size") int pageSize) {
    Page<${classInfo.className}> pageData = ${classInfo.className?uncap_first}Service.list(${classInfo.className?uncap_first}, currentPage, pageSize);
        return new Result(true, StatusCode.OK.getCode(), "查询成功",
        pageData);
    }
}
