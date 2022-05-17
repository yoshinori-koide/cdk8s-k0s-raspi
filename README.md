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