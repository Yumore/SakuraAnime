###############################################
# apksigner 工具进行 APK 签名
###############################################
#cd 到 SDk目录\build-tools\33.0.1

#1、普通签名指令
apksigner sign --ks test.jks --ks-key-alias test --out signed.apk unsigned.apk

#2、带密码的签名指令
apksigner sign --ks test.jks --ks-key-alias test --ks-pass pass:"test_pwd" --out signed.apk unsigned.apk

#3、V3轮替签名
#3.1 生成 keyline 文件，用于后续签名
apksigner rotate --out keyline --old-signer --ks test.jks --new-signer --ks test_new.jks

#3.2 轮替签名
apksigner sign --ks test.jks --next-signer --ks test_new.jks --lineage keyline --out signed.apk unsigned.apk




###################################################
# apksigner 工具校验 APK 签名
###################################################
# 验证V1、V2、V3签名
apksigner verify -v --print-certs signed.apk

# 验证V4签名
apksigner verify -v --print-certs -v4-signature-file signed.apk.idsig signed.apk

