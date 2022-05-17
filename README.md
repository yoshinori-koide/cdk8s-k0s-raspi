# cdk8s-k0s-raspi
ラズパイ上のk0sをcdk8sで管理してみる

→ k0s ダメなのでやっぱり k3s でいきます。

# cdk8s comment

```
> cdk8s synth

dist/cdk8s-k0s-raspi-bk.k8s.yaml
========================================================================================================
 Your cdk8s typescript project is ready!

   cat help         Print this message
 
  Compile:
   npm run compile     Compile typescript code to javascript (or "yarn watch")
   npm run watch       Watch for changes and compile typescript in the background
   npm run build       Compile + synth

  Synthesize:
   npm run synth       Synthesize k8s manifests from charts to dist/ (ready for 'kubectl apply -f')

 Deploy:
   kubectl apply -f dist/

 Upgrades:
   npm run import        Import/update k8s apis (you should check-in this directory)
   npm run upgrade       Upgrade cdk8s modules to latest version
   npm run upgrade:next  Upgrade cdk8s modules to latest "@next" version (last commit)

========================================================================================================
```

# k0s は ラズパイ4ではダメのよう

https://github.com/k0sproject/k0s/issues/827

>> I have to conclude that at least for now, k0s on RPi4 Raspbian is not supported.
>>
> Well, k0s itself does work on armv7 and etcd will probably work fine too once the env is set properly. However, you are correct in the sense that k0s controllers are not fully supported on other than amd64 arch as etcd does not claim to fully support those archs. See: https://etcd.io/docs/v3.4/op-guide/supported-platform/

ということで k3s を使います。

以下のコマンドであっさり削除は完了

```
$ make down
...
$ sudo rm $(which k0s)
```

# k3s を利用します。

https://rancher.com/docs/k3s/latest/en/

インストール時のログ

```
[INFO]  Finding release for channel stable
[INFO]  Using v1.23.6+k3s1 as release
[INFO]  Downloading hash https://github.com/k3s-io/k3s/releases/download/v1.23.6+k3s1/sha256sum-arm.txt
[INFO]  Downloading binary https://github.com/k3s-io/k3s/releases/download/v1.23.6+k3s1/k3s-armhf
[INFO]  Verifying binary download
[INFO]  Installing k3s to /usr/local/bin/k3s
[INFO]  Skipping installation of SELinux RPM
[INFO]  Skipping /usr/local/bin/kubectl symlink to k3s, command exists in PATH at /usr/bin/kubectl
[INFO]  Creating /usr/local/bin/crictl symlink to k3s
[INFO]  Creating /usr/local/bin/ctr symlink to k3s
[INFO]  Creating killall script /usr/local/bin/k3s-killall.sh
[INFO]  Creating uninstall script /usr/local/bin/k3s-uninstall.sh
[INFO]  env: Creating environment file /etc/systemd/system/k3s.service.env
[INFO]  systemd: Creating service file /etc/systemd/system/k3s.service
[INFO]  systemd: Enabling k3s unit
Created symlink /etc/systemd/system/multi-user.target.wants/k3s.service → /etc/systemd/system/k3s.service.
[INFO]  systemd: Starting k3s
```