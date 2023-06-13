<#macro kw>
    <div class=" min-h-screen sm:py-16 flex items-center justify-center items-center"
         style="background-color: #FAFAFD">
        <div class="w-fit flex justify-center items-center w-full p-5 relative mx-auto my-auto rounded-xl shadow-lg bg-white"
             style="width: auto;
             padding-left:16px;padding-right: 32px;padding-bottom: 16px;padding-top: 16px;">
            <div
                    style="position: relative;
                    height: 100%; width: 100%;
                    align-items: start; display: flex;
                    justify-content: start;"
            >
                <div class="text-center" style="display: flex;justify-content: center;">
                    <img src="${url.resourcesPath}/dist/img/login.png"
                         alt="login illustration" style="padding:0">
                </div>
                <div class="space-y-6 w-full ">
                    <#nested>
                </div>
            </div>
        </div>
    </div>
</#macro>
