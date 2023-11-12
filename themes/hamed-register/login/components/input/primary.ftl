<#macro kw invalid name
autofocus=false
disabled=false
message=true
required=true
hint=""
isRtl=true
onInvalid=""
minLength=""
maxLength=""
hasPattern=false
pattern=""
hasToggleVisibility = false
rest...>

<p>
    <label class="sr-only" for="${name}">
        <#nested>
    </label>
    <input
            <#if autofocus>autofocus</#if>
        <#if disabled>disabled</#if>
        <#if required>required</#if>
            aria-invalid="${messagesPerField.existsError(invalid)?c}"
            class="border-gray-300 mt-1 rounded-md w-full focus:border-primary-300 focus:ring focus:ring-primary-200 focus:ring-opacity-50 sm:text-sm"
<#--            class="block border-gray-300 mt-1 rounded-md w-full focus:border-primary-300 focus:ring focus:ring-primary-200 focus:ring-opacity-50 sm:text-sm"-->
            style="width: 315px;
            direction: rtl;
            align-content: center ;
            align-items: center;
            align-self: center;
            text-align-all: center;
            text-align: center;
            "
            id="${name}"
            name="${name}"
            placeholder="${msg("${hint}")}"
            oninvalid="${onInvalid}"
            minlength="${minLength}"
            maxLength="${maxLength}"
            <#if hasPattern>pattern="${pattern}"</#if>
    <#list rest as attrName, attrValue>
        ${attrName}="${attrValue}"
    </#list>
    >
    <#if hasToggleVisibility>
    <i class="bi bi-eye-slash" id="togglePassword" onclick="togglePassword()"></i>
    </#if>

    <#if message && messagesPerField.existsError(invalid)>
        <div class="mt-2 text-red-600 text-sm">
            ${kcSanitize(messagesPerField.getFirstError(invalid))?no_esc}
        </div>
    </#if>
    </p>
</#macro>
