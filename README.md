#### ionic动态更改App主图标效果
![gif]( http://m.qilong.com/Public/newmobile/default/Images/iconchange.gif "DEMO-GIF")


iOS平台：
    1.iOS10.3以上才可使用
    2.需要预先配置好icon图标和info.plist资料可查看示例图片规格如下：
        icon尺寸为：@2x = 120×120  @3x = 180×180
        plist：
            <dict>
                <key>CFBundleAlternateIcons</key>
                <dict>
                    <key>多云</key>
                    <dict>
                    <key>CFBundleIconFiles</key>
                    <array>
                        <string>多云</string>
                    </array>
                    <key>UIPrerenderedIcon</key>
                    <false/>
                    </dict>
                </dict>
            </dict>

Android平台：
    1.安卓设置后需要等待30秒至1分钟等待时间才会生效替换
    2.需要修改AndroidManifest对应的标签并且预先配置好icon图标可查看示例图片规格如下：
        icon尺寸为：mipmap-mdpi = 48×48  mipmap-hdpi = 96×96  mipmap-xhdpi = 144×144  mipmap-xxhdpi = 256×256 mipmap-xxxhdpi = 512×512
        AndroidManifest：
            // 1.MainActivity删除或注释intent-filter标签
                <activity
                    android:name="MainActivity"
                    android:configChanges="orientation|keyboardHidden|keyboard|screenSize|locale"
                    android:label="@string/activity_name"
                    android:launchMode="singleTop"
                    android:theme="@android:style/Theme.DeviceDefault.NoActionBar"
                    android:windowSoftInputMode="adjustResize">
                    <!--<intent-filter android:label="@string/launcher_name">-->
                    <!--<action android:name="android.intent.action.MAIN" />-->
                    <!--<category android:name="android.intent.category.LAUNCHER" />-->
                    <!--</intent-filter>-->
                </activity>
            // 2.新配置defaultActivity
                <activity-alias
                    android:name=".defaultActivity"
                    android:enabled="true"
                    android:exported="true"
                    android:icon="@mipmap/you_default_icon" //you_default_icon你的默认icon的名称
                    android:label="@string/app_name"
                    android:targetActivity=".MainActivity">
                    <intent-filter>
                        <action android:name="android.intent.action.MAIN" />
                        <category android:name="android.intent.category.LAUNCHER" />
                    </intent-filter>
                </activity-alias>
            // 3.新增其它可替换icon配置，可配多个
                <activity-alias
                    android:name=".you_code_name" //you_code_name代码调用的别名
                    android:enabled="false"
                    android:exported="true"
                    android:icon="@mipmap/you_icon_name" //you_icon_name配置的图片名称
                    android:label="@string/app_name"  //label可换成你想要的名称。如果不想换填写：@string/app_name
                    android:targetActivity=".MainActivity">
                    <intent-filter>
                        <action android:name="android.intent.action.MAIN" />
                        <category android:name="android.intent.category.LAUNCHER" />
                    </intent-filter>
                </activity-alias>

JS调用：
    iOS有checkSupport方法，安卓没有
    IconChangPlugin.checkSupport(success => {
      alert("check success");
    }, error => {
      alert("check error");
    });


    iOS传参：配置好的icon名称
                        var option = "icon名称"; //传default，既设置回默认图片

    Android传参：数组     name为配置好的icon名称 
                        isOn为是否设置此icon，请确保数组里只存在一个true不然会出现问题
                        var option = [
                        {
                            name:"defaultActivity", //defaultActivity为固定写法，既设置回默认图片
                            isOn:false
                        },
                        {
                            name:"test",
                            isOn:true
                        }];
    IconChangPlugin.changeIcon(option, success => {
        alert("changeIcon success");
    }, error => {
        alert("changeIcon error");
    });
