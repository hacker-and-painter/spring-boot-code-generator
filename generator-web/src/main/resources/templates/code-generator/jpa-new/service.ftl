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
    * 新增或编辑
    */
    public Object save(${classInfo.className} ${classInfo.className?uncap_first}){
        return ${classInfo.className?uncap_first}Repository.save(${classInfo.className?uncap_first});
    }

    /**
    * 删除
    */
    public Object delete(String id){
        Optional<${classInfo.className}> ${classInfo.className?uncap_first}=${classInfo.className?uncap_first}Repository.findById(id);
        if(${classInfo.className?uncap_first}.isPresent()){
            ${classInfo.className?uncap_first}Repository.deleteById(id);
            return new Result(true,StatusCode.OK,"删除成功");
        }else{
            return new Result(true,StatusCode.ERROR,"没有找到该对象");
        }
    }

    /**
    * 查询
    */
    public Object find(String id){
        Optional<${classInfo.className}> ${classInfo.className?uncap_first}=${classInfo.className?uncap_first}Repository.findById(id);
        if(${classInfo.className?uncap_first}.isPresent()){
            return new Result(true,StatusCode.OK,"成功",${classInfo.className?uncap_first}.get());
        }else{
            return new Result(true,StatusCode.ERROR,"没有找到该对象");
        }
    }

    /**
    * 查询所有
    */
    public Object findAll(${classInfo.className} ${classInfo.className?uncap_first}){
        //创建匹配器，需要查询条件请修改此处代码
        ExampleMatcher matcher = ExampleMatcher.matchingAll();

        //创建实例
        Example<${classInfo.className}> example = Example.of(${classInfo.className?uncap_first}, matcher);

        return ${classInfo.className?uncap_first}Repository.findAll(example);
    }

    /**
    * 分页查询
    */
    public Object list(${classInfo.className} ${classInfo.className?uncap_first},
                         int pageNumber,
                         int pageSize) {

            //创建匹配器，需要查询条件请修改此处代码
            ExampleMatcher matcher = ExampleMatcher.matchingAll();

            //创建实例
            Example<${classInfo.className}> example = Example.of(${classInfo.className?uncap_first}, matcher);
            //分页构造
            Pageable pageable = PageRequest.of(pageNumber - 1,pageSize);

            return ${classInfo.className?uncap_first}Repository.findAll(example, pageable);
    }

}
