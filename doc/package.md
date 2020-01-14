### flutter 插件和包

#### package类型

#### Dart包 package

#### 插件包 plugin
包含ios和android

### 创建
- 可视化
 file=>new=>new Flutter Project
- 命令行
 > flutrer create --org org.devio --template=plugin name_plugin
 > flutrer create --template=package name_package


### 发布
修改pubspec.yaml
修改CHANGELOG.MD //可选，修改日志

登录
> flutter packages publish --dry-run //发布前预检
> flutter packages publish


