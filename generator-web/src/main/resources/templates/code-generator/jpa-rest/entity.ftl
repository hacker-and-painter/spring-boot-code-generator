import java.io.Serializable;
import javax.persistence.*;
import lombok.Data;
import java.util.Date;
import java.util.List;

/**
 * @Description
 * @Author ${authorName}
 * @Date ${.now?string('yyyy-MM-dd HH:mm:ss')}
 **/
@Entity
@Data
@Table(name = "${classInfo.tableName}")
<#list classInfo.fieldList as fieldItem >
    <#if fieldItem.fieldName == 'createTime'>
@EntityListeners(AuditingEntityListener.class)
    </#if>
</#list>
@Where(clause="is_delete = false or is_delete is null") // 执行的所有查询将只显示未删除行
public class ${classInfo.className} implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid")
<#if classInfo.fieldList?exists && classInfo.fieldList?size gt 0>
<#list classInfo.fieldList as fieldItem >
    <#if fieldItem.fieldClass == 'LocalDateTime'>
    @ApiModelProperty(value = "${fieldItem.fieldComment}", example = "2019-01-01 22:18:59")
    <#else>
    @ApiModelProperty(value = "${fieldItem.fieldComment}")
    </#if>
    <#if fieldItem.fieldClass == 'LocalDateTime'>
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    </#if>
    <#if fieldItem.fieldClass == 'LocalDate'>
    @JsonFormat(pattern = "yyyy-MM-dd")
    </#if>
    <#if fieldItem.fieldName == 'createTime'>
    @CreatedDate
    </#if>
    <#if fieldItem.fieldName == 'updateTime'>
    @LastModifiedDate
    </#if>
    private ${fieldItem.fieldClass} ${fieldItem.fieldName};

</#list>
    public ${classInfo.className}() {
    }
</#if>

}
