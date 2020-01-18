### 启动页面白屏
由于初始化时，flutter代码编译解析放入内存中，完成渲染，
在这个过程中无内容渲染，所以白屏

####解决
loading。。。 / welcomepage...
开源：flutter_splash_screen


### 全面屏
### 全屏幕手机
屏幕大
长宽比
19.5:9 vs 16:9(传统的)
安全区域（刘海）
#### 全面屏页面适配
- 使用了Scaffold的appBar与bottomNavigationBar是不需要额外适配的，因为Scaffold已经自动完成了
- 需要手动适配
需要预留出顶部和底部的安全区域
1. 采用SafeArea来包裹页面
SafeArea是flutter中的一个适配全面屏的组件，类似rn中SafeAreaView
2. 借助MediaQuery.of(context).padding获取屏幕四周的padding，根据padding来手动设置安全区域

##### andriod额外加一步
需要设置最大长宽显示比例
在android中AndroidManifest.xml
添加
<meta-data 
    android:name="android.max_aspect"
    android:value="2.3"
>

### flutter项目优化
- 代码优化
 封装
- 包大小优化
1. 压缩本地图片 https://tingpng.com
2. 使用单架构，选择一种常用的abiFilters架构 
ndk{abiFilters "armeabi-v7a"}
- 流畅性优化
1. 按需创建页面
PageView
2. 缓存页面 AutomaticKeepAliveClientMixin
在旅拍页面中使用
3. 耗时的计算放到独立的isolate
会放在单独的线程处理
- 内存优化
1. 图片优化
根据控件大小加载指定分辨率的图片尺寸
2. 列表优化
分页加载
listView.build 会按屏幕的大小请求展示列表
3. 防止内存泄露
事件订阅与销毁

### 打包 build
#### andriod
1. AndroidManifest.xml配置
- main.dart
- 添加app名和快照名

2. 检查和配置build.gradle文件 build.gradle(Module:app)
- applicationId
- versionCode & versionName
- minSdkVersion & targetSdkVersion

3. 添加app启动图标
app/res/mipmap/ic_launcher.png(hdpi)

4. 签名app
- 创建证书
build-> generate signed bundle/apk ->...
-  参考官网

5. 配置APK混淆
新建文件
proguard-rules.pro

// build.gradle(Module:app)中
buildTypes {
    signisngConfig signisngConfig.release
    minifyEnabled true //压缩
    useProguard true //代码安全性
}

6. 构建APK
> flutter build apk

7. 将apk发布应用市场

#### ios
1. 申请ios企业级或个人开发者账号

2. 在app store connect注册你的app

3. 为你的app注册Bundle ID

4. 添加app名字

5. 设置Bundle ID

6. 添加app启动图标

7. 设置签名账号

8. 创建构建存档
> flutter build ios

构建存档
xcode中
product->destination->generic ios device

product->archive
构建完成后会弹出弹出，可以上传到app store connect,在传入到app store