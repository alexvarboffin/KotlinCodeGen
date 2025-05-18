package {{package}}.apis
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
import io.ktor.client.*
import io.ktor.client.request.*
<#if import>
import {{import}}
</#if>

/*
 * {{fileComment}}
 */
class {{classname}}(private val client: HttpClient) {
<#list operations as op>
    /**
     * Handles the operation: {{op.summary}}
     */
    suspend fun {{op.nickname}}(<#list op.allParams as param>{{param.name}}: {{param.dataType}}<#if !param.last>, </#if></#list>): {{op.returnType?default("kotlin.Unit")}} {
        return client.get("${op.path}")
    }
</#list>
}