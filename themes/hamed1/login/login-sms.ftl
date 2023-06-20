<#import "template.ftl" as layout>
<#import "components/button/primary.ftl" as buttonPrimary>
<#import "components/input/primary.ftl" as inputPrimary>
<#import "components/label/totp.ftl" as labelTotp>

<@layout.registrationLayout displayInfo=true; section>
    <#if section = "header">
        ${msg("smsAuthTitle",realm.displayName)}
    <#elseif section = "form">
		<form id="kc-sms-code-login-form" class="${properties.kcFormClass!}"
			  action="${url.loginAction}" method="post"
			  style="justify-content: space-around">
			<div class="${properties.kcFormGroupClass!}">
                <#--<div class="${properties.kcLabelWrapperClass!}">
					<label for="code" class="${properties.kcLabelClass!}">${msg("smsAuthLabel")}</label>
				</div>
				<div class="${properties.kcInputWrapperClass!}">
					<input type="text" id="code" name="code" class="${properties.kcInputClass!}" autofocus/>
				</div>-->
				<div>
                    <@labelTotp.kw />
				</div>
				<div>
                    <@inputPrimary.kw
                    type="text"
                    id="code"
                    name="code"
                    autofocus=true
                    invalid=["totp"]
                    >
                    </@inputPrimary.kw>
				</div>
				<br>
				<div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
					<div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
						<div class="${properties.kcFormOptionsWrapperClass!}">
							<span><a href="${url.loginUrl}">${kcSanitize(msg("backToLogin"))?no_esc}</a></span>
						</div>
					</div>

					<div class="pt-4">
                        <@buttonPrimary.kw name="login" type="submit">
                            ${msg("doSubmit")}
                        </@buttonPrimary.kw>
					</div>
				</div>
				<br>
				<div style="justify-content: center" align="center">
                    ${msg("smsAuthInstruction")}
				</div>
		</form>
    <#--<#elseif section = "info" >
		<div style="justify-content: center">
            ${msg("smsAuthInstruction")}
		</div>-->
    </#if>
</@layout.registrationLayout>
