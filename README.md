# cdk8s-k0s-raspi
ラズパイ上のk0sをcdk8sで管理してみる


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