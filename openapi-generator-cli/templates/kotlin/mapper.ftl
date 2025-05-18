package org.openapitools.client.mappers

import org.openapitools.client.models.${classname}

object ${classname}Mapper {
    fun toMap(model: ${classname}): Map<String, Any?> = mapOf(
        <#list modelVars as var>
        "${var.baseName}" to model.${var.name}<#if !var.last>, </#if>
        </#list>
    )

    // Пример обратного маппинга (можешь расширить под свои нужды)
    fun fromMap(data: Map<String, Any?>): ${classname} {
        return ${classname}(
            <#list modelVars as var>
            data["${var.baseName}"] as ${var.dataType}<#if !var.last>, </#if>
            </#list>
        )
    }
}