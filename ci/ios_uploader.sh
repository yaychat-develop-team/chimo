#!/usr/bin/env bash
#!/usr/local/bin

# 勿在 source 时强制要求密钥（Android-only / 未配 iOS 凭据时不应直接失败）
apiKey="${APP_STORE_API_KEY:-}"
apiIssuer="${APP_STORE_API_ISSUER:-}"

require_app_store_api() {
    if [ -z "${apiKey}" ] || [ -z "${apiIssuer}" ]; then
        echo "ERROR: APP_STORE_API_KEY / APP_STORE_API_ISSUER is not set" >&2
        echo "Set them in Jenkins credentials or ci/ci.env (see ci/ci.env.example)." >&2
        return 1
    fi
}

function upload_ipa() {
    require_app_store_api || return 1
    local ipa_file=${1}
    if [ ! -f "$ipa_file" ]; then
        echo -e "\033[31m file $ipa_file not exists \033[0m"
        return 1
    fi

    upload="xcrun altool --upload-app -f $ipa_file -t iOS --apiKey $apiKey --apiIssuer $apiIssuer --verbose"
    echo "running upload cmd" $upload
    uploadApp="$($upload)"
    echo uploadApp
    if [ -z "$uploadApp" ]; then
        echo -e "\033[31m upload failed \033[0m"
    else
        echo -e "\033[46;30m upload success \033[0m"
    fi
}

function validate_and_upload(){
    require_app_store_api || return 1
    local ipa_file=${1}
    if [ ! -f "$ipa_file" ]; then
        echo -e "\033[31m file $ipa_file not exists \033[0m"
        return 1
    fi

    validate="xcrun altool --validate-app -f $ipa_file -t iOS --apiKey $apiKey --apiIssuer $apiIssuer --verbose"
    echo "running validate cmd" $validate

    runValidate="$($validate)"
    echo $runValidate

    if [ -z "$runValidate" ]; then
        echo -e "033[31m validate failed \033[0m"
    else
        upload_ipa $ipa_file
    fi
}



function enter_api_key() {
    if [ -z "$1" ]; then
        echo -e "\033[31m Please enter apiKey \033[0m"
        read key
        while ([ -z "$key" ]); do
            echo -e "\033[31m Please enter apiKey \033[0m"
            read key
        done
        apiKey=$key
    else
        apiKey=$1
    fi

    if [ -z "$2" ]; then
        echo -e "\033[31m Please enter apiIssuer \033[0m"
        read issuer
        while ([ -z "$issuer" ]); do
            echo -e "\033[31m Please enter apiIssuer \033[0m"
            read issuer
        done
        apiIssuer=$issuer
    else
    apiIssuer=$2
    fi

    echo -e "\033[46;30m apiKey is: $apiKey -- apiIssuer is: $apiIssuer \033[0m"
}