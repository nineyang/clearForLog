## 前言
在服务器上，经常会因为一些日志文件被大量生成和写入而占用磁盘，如果不定期清理，则会导致站点无法正常运行，而服务器提供商往往并没有提供提供自动清理日志的服务，遂写了一个可以帮助清理的`bash`脚本。

## 使用
该脚本需要指定两个参数，第一个参数是`log`所在的根目录，第二个参数是需要清理前几天的数据。
例:
```
echo '0 0 1 * * /bin/sh /your/save/path/clear.sh /your/log/path 15' > /your/crontab/file
```
把执行命令放入到你的`crontab`队列中，每月1号零点清理一次，会把`log`的最后修改时间距离现在已经超过`15`天的文件删除，支持递归删除。