# Info 简介
A simple domain list that include some Chinese platform showing IP info when user leave comments or write their articles.   

一个简易的域名列表，用于列出一些记录用户 IP 信息，并在评论或创作内容时向公众展示的平台

For [Clash](https://github.com/Dreamacro/clash) users, a simple profile has been generated to import into Clash configuration:

对于 [Clash](https://github.com/Dreamacro/clash) 用户，你可以直接导入以下规则：

```yaml
rule-providers:
# example 示例
# weibo
  weibo:
    type: http
    behavior: classical
    path: ./ruleset/weibo.yaml
    url: https://raw.githubusercontent.com/bolucat/domain-list/main/clash/weibo.yaml
    interval: 86400
```

This project comes with ABSOLUTELY NO WARRANTY, to the extent permitted by applicable law.

这个项目不做任何法律上的承诺，请自行在当地法律允许范围内使用
# License
[CC-BY-SA-4.0](./LICENSE)