<#import "template.ftl" as layout>
<#import "components/button/primary.ftl" as buttonPrimary>
<#import "components/input/primary.ftl" as inputPrimary>
<#import "components/link/secondary.ftl" as linkSecondary>

<@layout.registrationLayout
displayMessage=!messagesPerField.existsError("firstName", "lastName", "email", "username", "password", "password-confirm")
;
section
>
    <#if section="header">
        ${msg("registerTitle")}
    <#elseif section="form">
        <form action="${url.registrationAction}" class="m-0 space-y-4" method="post">
            <div>
                <@inputPrimary.kw
                autocomplete="given-name"
                autofocus=true
                invalid=["firstName"]
                name="firstName"
                hint="firstName"
                type="text"
                isRtl=true
                value=(register.formData.firstName)!''
                >
                    ${msg("firstName")}
                </@inputPrimary.kw>
            </div>
            <div>
                <@inputPrimary.kw
                autocomplete="family-name"
                invalid=["lastName"]
                name="lastName"
                hint="lastName"
                type="text"
                value=(register.formData.lastName)!''
                >
                    ${msg("lastName")}
                </@inputPrimary.kw>
            </div>
            <div>
                <@inputPrimary.kw
                class="${properties.kcInputClass!}"
                id="user.attributes.mobile_number"
                name="user.attributes.mobile_number"
                value="${(register.formData['user.attributes.mobile_number']!'')}"
                autocomplete="phone_number"
                invalid=["phoneNumber"]
                hint="phoneNumber"
                type="text"
                minLength="11"
                onInvaliddd="Invaaaaaaliiiiiiid"
                >
                    ${msg("phoneNumber")}
                </@inputPrimary.kw>
            </div>
            <#--<div class="${properties.kcFormGroupClass!}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="user.attributes.mobile_number" class="${properties.kcLabelClass!}">
                        Date of birth</label>
                </div>

                <div class="${properties.kcInputWrapperClass!}">
                    <input type="date" class="${properties.kcInputClass!}"
                           id="user.attributes.mobile_number" name="user.attributes.dob"
                           value="${(register.formData['user.attributes.mobile_number']!'')}"/>
                </div>
            </div>-->
            <#--<div class="${properties.kcFormGroupClass!}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="user.attributes.dob" class="${properties.kcLabelClass!}">
                        Date of birth</label>
                </div>

                <div class="${properties.kcInputWrapperClass!}">
                    <input type="date" class="${properties.kcInputClass!}"
                           id="user.attributes.dob" name="user.attributes.dob"
                           value="${(register.formData['user.attributes.dob']!'')}"/>
                </div>
            </div>-->
            <#--<div>
                <@inputPrimary.kw
                autocomplete="phone"
                invalid=["email"]
                name="email"
                hint="email"
                type="email"
                value=(register.formData.email)!''
                >
                    ${msg("email")}
                </@inputPrimary.kw>
            </div>-->
            <#if !realm.registrationEmailAsUsername>
                <div>
                    <@inputPrimary.kw
                    autocomplete="username"
                    invalid=["username"]
                    name="username"
                    hint="usernameOrEmail"
                    type="text"
                    value=(register.formData.username)!''
                    >
                        ${msg("usernameOrEmail")}
                    </@inputPrimary.kw>
                </div>
            </#if>
            <#if passwordRequired??>
                <div>
                    <@inputPrimary.kw
                    autocomplete="new-password"
                    invalid=["password", "password-confirm"]
                    message=false
                    name="password"
                    hint="password"
                    type="password"
                    >
                        ${msg("password")}
                    </@inputPrimary.kw>
                </div>
                <div>
                    <@inputPrimary.kw
                    autocomplete="new-password"
                    invalid=["password-confirm"]
                    name="password-confirm"
                    hint="password-confirm"
                    type="password"
                    >
                        ${msg("passwordConfirm")}
                    </@inputPrimary.kw>
                </div>
            </#if>
            <#if recaptchaRequired??>
                <div>
                    <div class="g-recaptcha" data-sitekey="${recaptchaSiteKey}" data-size="compact"></div>
                </div>
            </#if>
            <div>
                <@buttonPrimary.kw type="submit">
                    ${msg("doRegister")}
                </@buttonPrimary.kw>
            </div>
            <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}"
                       type="submit" value="${msg("doRegister")}"/>
            </div>
        </form>
    <#elseif section="nav">
        <@linkSecondary.kw href=url.loginUrl>
            <span class="text-sm">${kcSanitize(msg("backToLogin"))?no_esc}</span>
        </@linkSecondary.kw>
    </#if>
</@layout.registrationLayout>

<script>
    function validateCustomField() {
        var customField = document.getElementById('mobile_number');
        var errorElement = document.getElementById('custom-field-error');

        // Add your custom validation logic here
        if (customField.value.length < 5) {
            errorElement.textContent = 'Custom field must be at least 5 characters long.';
        } else {
            errorElement.textContent = '';
        }
    }

    document.addEventListener('DOMContentLoaded', function () {
        var customField = document.getElementById('mobile_number');
        customField.addEventListener('input', validateCustomField);
    });
</script>

