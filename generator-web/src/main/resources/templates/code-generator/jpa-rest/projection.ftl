import java.io.Serializable;
import javax.persistence.*;
import lombok.Data;
import java.util.Date;
import java.util.List;

/**
* @Description 投影
* @Author ${authorName}
* @Date ${.now?string('yyyy-MM-dd HH:mm:ss')}
**/
public interface ${classInfo.className}Projection {

<#if classInfo.fieldList?exists && classInfo.fieldList?size gt 0>
    <#list classInfo.fieldList as fieldItem >
    @ApiModelProperty("${fieldItem.fieldComment}")
    <#if fieldItem.fieldClass == 'LocalDateTime'>
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    </#if>
    ${fieldItem.fieldClass} get${fieldItem.fieldName}();

    </#list>
    public ${classInfo.className}VO() {
    }
</#if>

}
