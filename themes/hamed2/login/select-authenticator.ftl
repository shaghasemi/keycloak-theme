<#--<#import "template.ftl" as layout>-->
<#--<#import "template_2.ftl" as layout>-->
<#import "template_base.ftl" as layout>
<#import "components/button/primary.ftl" as buttonPrimary>

<#import "components/layout/container.ftl" as container>


<@container.kw >
    <div class="justify-right flex space-between"
         style="position: relative;
         display: flex;
         height: 100%;
         align-self: flex-start">
        <div style="display: flex; ">
            <img src="${url.resourcesPath}/dist/img/logo_full.png"
                 alt="senaam logo" style="float: right; margin: 0;">
        </div>
    </div>
    <br>
    <h1 class="text-right justify-right text-xl"
        style="margin-bottom: 32px; padding-right: 32px; ">
        ${msg("loginChooseAuthenticator")}
    </h1>

    <@layout.registrationLayout
    displayInfo=false
    displayRequiredFields=false
    displayMessage=false;
    section>
        <br>

        <#if section = "header" || section = "show-username">
            <script type="text/javascript">
                function fillAndSubmit(authExecId) {
                    document.getElementById('authexec-hidden-input').value = authExecId;
                    document.getElementById('kc-select-credential-form').submit();
                }
            </script>
        <#elseif section = "form" >
            <form id="kc-select-credential-form"
                  style="display: flex;flex-direction: column;justify-content: center;align-items: center;"
                  class="m-0 space-y-4"
                  action="${url.loginAction}"
                  method="post">
                <#list auth.authenticationSelections as authenticationSelection>
                    <div onclick="fillAndSubmit('${authenticationSelection.authExecId}')">
                        <@buttonPrimary.kw type="submit">
                            ${msg(authenticationSelection.helpText)}
                        </@buttonPrimary.kw>
                        <br>
                    </div>
                </#list>
                <input type="hidden" id="authexec-hidden-input" name="authenticationExecution"/>
            </form>
        </#if>
    </@layout.registrationLayout>
</@container.kw>
