SET FOREIGN_KEY_CHECKS=0;

-- CREATE DATABASE spiderflow;
USE spiderflow;

DROP TABLE IF EXISTS `sp_flow`;
CREATE TABLE `sp_flow` (
  `id` varchar(32) NOT NULL,
  `name` varchar(64) DEFAULT NULL COMMENT '任务名字',
  `xml` longtext DEFAULT NULL COMMENT 'xml表达式',
  `cron` varchar(255) DEFAULT NULL COMMENT 'corn表达式',
  `enabled` char(1) DEFAULT '0' COMMENT '任务是否启动,默认未启动',
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP  COMMENT '创建时间',
  `last_execute_time` datetime DEFAULT NULL  COMMENT '上一次执行时间',
  `next_execute_time` datetime DEFAULT NULL   COMMENT '下一次执行时间',
  `execute_count` int(8) DEFAULT NULL  COMMENT '定时执行的已执行次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT '爬虫任务表';

INSERT INTO `sp_flow` VALUES ('b45fb98d2a564c23ba623a377d5e12e9', '爬取码云GVP', '<mxGraphModel>\n  <root>\n    <mxCell id=\"0\">\n      <JsonProperty as=\"data\">\n        {&quot;spiderName&quot;:&quot;爬取码云GVP&quot;,&quot;threadCount&quot;:&quot;&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"1\" parent=\"0\"/>\n    <mxCell id=\"2\" value=\"开始\" style=\"start\" parent=\"1\" vertex=\"1\">\n      <mxGeometry x=\"80\" y=\"80\" width=\"24\" height=\"24\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;shape&quot;:&quot;start&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"5\" value=\"抓取首页\" style=\"request\" parent=\"1\" vertex=\"1\">\n      <mxGeometry x=\"180\" y=\"80\" width=\"24\" height=\"24\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;抓取首页&quot;,&quot;loopVariableName&quot;:&quot;&quot;,&quot;sleep&quot;:&quot;&quot;,&quot;timeout&quot;:&quot;&quot;,&quot;response-charset&quot;:&quot;&quot;,&quot;method&quot;:&quot;GET&quot;,&quot;body-type&quot;:&quot;none&quot;,&quot;body-content-type&quot;:&quot;text/plain&quot;,&quot;loopCount&quot;:&quot;&quot;,&quot;url&quot;:&quot;https://gitee.com/gvp/all&quot;,&quot;proxy&quot;:&quot;&quot;,&quot;request-body&quot;:[&quot;&quot;],&quot;follow-redirect&quot;:&quot;1&quot;,&quot;shape&quot;:&quot;request&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"6\" value=\"\" parent=\"1\" source=\"2\" target=\"5\" edge=\"1\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;&quot;,&quot;condition&quot;:&quot;&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"7\" value=\"提取项目名、地址\" style=\"variable\" parent=\"1\" vertex=\"1\">\n      <mxGeometry x=\"330\" y=\"80\" width=\"24\" height=\"24\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;提取项目名、地址&quot;,&quot;loopVariableName&quot;:&quot;&quot;,&quot;variable-name&quot;:[&quot;projectUrls&quot;,&quot;projectNames&quot;],&quot;loopCount&quot;:&quot;&quot;,&quot;variable-value&quot;:[&quot;${extract.selectors(resp.html,&#39;.categorical-project-card a&#39;,&#39;attr&#39;,&#39;href&#39;)}&quot;,&quot;${extract.selectors(resp.html,&#39;.project-name&#39;)}&quot;],&quot;shape&quot;:&quot;variable&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"8\" value=\"\" parent=\"1\" source=\"5\" target=\"7\" edge=\"1\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;&quot;,&quot;condition&quot;:&quot;&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"9\" value=\"抓取详情页\" style=\"request\" parent=\"1\" vertex=\"1\">\n      <mxGeometry x=\"450.16668701171875\" y=\"80\" width=\"24\" height=\"24\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;抓取详情页&quot;,&quot;loopVariableName&quot;:&quot;projectIndex&quot;,&quot;sleep&quot;:&quot;&quot;,&quot;timeout&quot;:&quot;&quot;,&quot;response-charset&quot;:&quot;&quot;,&quot;method&quot;:&quot;GET&quot;,&quot;body-type&quot;:&quot;none&quot;,&quot;body-content-type&quot;:&quot;text/plain&quot;,&quot;loopCount&quot;:&quot;10&quot;,&quot;url&quot;:&quot;https://gitee.com/${projectUrls[projectIndex]}&quot;,&quot;proxy&quot;:&quot;&quot;,&quot;request-body&quot;:[&quot;&quot;],&quot;follow-redirect&quot;:&quot;1&quot;,&quot;shape&quot;:&quot;request&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"10\" value=\"\" parent=\"1\" source=\"7\" target=\"9\" edge=\"1\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;&quot;,&quot;condition&quot;:&quot;&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"12\" value=\"提取项目描述\" style=\"variable\" parent=\"1\" vertex=\"1\">\n      <mxGeometry x=\"550\" y=\"80\" width=\"24\" height=\"24\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;提取项目描述&quot;,&quot;loopVariableName&quot;:&quot;&quot;,&quot;variable-name&quot;:[&quot;projectDesc&quot;],&quot;loopCount&quot;:&quot;&quot;,&quot;variable-value&quot;:[&quot;${extract.selector(resp.html,&#39;.git-project-desc-text&#39;)}&quot;],&quot;shape&quot;:&quot;variable&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"13\" value=\"\" parent=\"1\" source=\"9\" target=\"12\" edge=\"1\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;&quot;,&quot;condition&quot;:&quot;&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"14\" value=\"输出\" style=\"output\" parent=\"1\" vertex=\"1\">\n      <mxGeometry x=\"660.1666870117188\" y=\"80\" width=\"24\" height=\"24\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;输出&quot;,&quot;output-name&quot;:[&quot;项目名&quot;,&quot;项目地址&quot;,&quot;项目描述&quot;],&quot;output-value&quot;:[&quot;${projectNames[projectIndex]}&quot;,&quot;https://gitee.com${projectUrls[projectIndex]}&quot;,&quot;${projectDesc}&quot;],&quot;shape&quot;:&quot;output&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"15\" value=\"\" parent=\"1\" source=\"12\" target=\"14\" edge=\"1\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;&quot;,&quot;condition&quot;:&quot;&quot;}\n      </JsonProperty>\n    </mxCell>\n  </root>\n</mxGraphModel>\n', null, '0', '2019-08-22 13:46:54', null, null, null);
INSERT INTO `sp_flow` VALUES ('f0a67f17ee1a498a9b2f4ca30556f3c3', '抓取每日菜价', '<mxGraphModel>\n  <root>\n    <mxCell id=\"0\">\n      <JsonProperty as=\"data\">\n        {&quot;spiderName&quot;:&quot;抓取每日菜价&quot;,&quot;threadCount&quot;:&quot;&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"1\" parent=\"0\"/>\n    <mxCell id=\"2\" value=\"开始\" style=\"start\" parent=\"1\" vertex=\"1\">\n      <mxGeometry x=\"80\" y=\"80\" width=\"24\" height=\"24\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;shape&quot;:&quot;start&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"3\" value=\"开始抓取\" style=\"request\" parent=\"1\" vertex=\"1\">\n      <mxGeometry x=\"219.83334350585938\" y=\"80\" width=\"24\" height=\"24\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;开始抓取&quot;,&quot;loopVariableName&quot;:&quot;&quot;,&quot;sleep&quot;:&quot;&quot;,&quot;timeout&quot;:&quot;&quot;,&quot;response-charset&quot;:&quot;&quot;,&quot;method&quot;:&quot;GET&quot;,&quot;body-type&quot;:&quot;none&quot;,&quot;body-content-type&quot;:&quot;text/plain&quot;,&quot;loopCount&quot;:&quot;&quot;,&quot;url&quot;:&quot;http://www.beijingprice.cn:8086/price/priceToday/PageLoad/LoadPrice?jsoncallback=1&quot;,&quot;proxy&quot;:&quot;&quot;,&quot;request-body&quot;:[&quot;&quot;],&quot;follow-redirect&quot;:&quot;1&quot;,&quot;shape&quot;:&quot;request&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"4\" value=\"\" parent=\"1\" source=\"2\" target=\"3\" edge=\"1\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;&quot;,&quot;condition&quot;:&quot;&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"5\" value=\"解析JSON\" style=\"variable\" parent=\"1\" vertex=\"1\">\n      <mxGeometry x=\"350\" y=\"80\" width=\"24\" height=\"24\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;解析JSON&quot;,&quot;loopVariableName&quot;:&quot;&quot;,&quot;variable-name&quot;:[&quot;jsonstr&quot;,&quot;jsondata&quot;,&quot;data&quot;],&quot;loopCount&quot;:&quot;&quot;,&quot;variable-value&quot;:[&quot;${string.substring(resp.html,2,resp.html.length()-1)}&quot;,&quot;${json.parse(jsonstr)}&quot;,&quot;${extract.jsonpath(jsondata[0],&#39;data&#39;)}&quot;],&quot;shape&quot;:&quot;variable&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"6\" value=\"\" parent=\"1\" source=\"3\" target=\"5\" edge=\"1\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;&quot;,&quot;condition&quot;:&quot;&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"7\" value=\"输出\" style=\"output\" parent=\"1\" vertex=\"1\">\n      <mxGeometry x=\"480.16668701171875\" y=\"80\" width=\"24\" height=\"24\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;输出&quot;,&quot;loopVariableName&quot;:&quot;i&quot;,&quot;output-name&quot;:[&quot;菜名&quot;,&quot;菜价&quot;,&quot;单位&quot;],&quot;loopCount&quot;:&quot;${list.length(data)}&quot;,&quot;output-value&quot;:[&quot;${data[i].ItemName}&quot;,&quot;${data[i].Price04}&quot;,&quot;${data[i].ItemUnit}&quot;],&quot;shape&quot;:&quot;output&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"8\" value=\"\" parent=\"1\" source=\"5\" target=\"7\" edge=\"1\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;&quot;,&quot;condition&quot;:&quot;&quot;}\n      </JsonProperty>\n    </mxCell>\n  </root>\n</mxGraphModel>\n', null, '0', '2019-08-22 13:48:22', null, null, null);
INSERT INTO `sp_flow` VALUES ('b4430885ba8349588d1220d37eac831d', '爬取开源中国动弹', '<mxGraphModel>\n  <root>\n    <mxCell id=\"0\">\n      <JsonProperty as=\"data\">\n        {&quot;spiderName&quot;:&quot;爬取开源中国动弹&quot;,&quot;threadCount&quot;:&quot;&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"1\" parent=\"0\"/>\n    <mxCell id=\"2\" value=\"开始\" style=\"start\" vertex=\"1\" parent=\"1\">\n      <mxGeometry x=\"80\" y=\"80\" width=\"32\" height=\"32\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;shape&quot;:&quot;start&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"3\" value=\"爬取动弹\" style=\"request\" vertex=\"1\" parent=\"1\">\n      <mxGeometry x=\"220\" y=\"80\" width=\"32\" height=\"32\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;爬取动弹&quot;,&quot;loopVariableName&quot;:&quot;&quot;,&quot;sleep&quot;:&quot;&quot;,&quot;timeout&quot;:&quot;&quot;,&quot;response-charset&quot;:&quot;&quot;,&quot;method&quot;:&quot;GET&quot;,&quot;parameter-name&quot;:[&quot;type&quot;,&quot;lastLogId&quot;],&quot;body-type&quot;:&quot;none&quot;,&quot;body-content-type&quot;:&quot;text/plain&quot;,&quot;loopCount&quot;:&quot;&quot;,&quot;url&quot;:&quot;https://www.oschina.net/tweets/widgets/_tweet_index_list &quot;,&quot;proxy&quot;:&quot;&quot;,&quot;parameter-value&quot;:[&quot;ajax&quot;,&quot;${lastLogId}&quot;],&quot;request-body&quot;:&quot;&quot;,&quot;follow-redirect&quot;:&quot;1&quot;,&quot;tls-validate&quot;:&quot;1&quot;,&quot;shape&quot;:&quot;request&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"4\" value=\"\" edge=\"1\" parent=\"1\" source=\"2\" target=\"3\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;&quot;,&quot;condition&quot;:&quot;&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"5\" value=\"提取lastLogId以及tweets\" style=\"variable\" vertex=\"1\" parent=\"1\">\n      <mxGeometry x=\"340\" y=\"80\" width=\"32\" height=\"32\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;提取lastLogId以及tweets&quot;,&quot;loopVariableName&quot;:&quot;&quot;,&quot;variable-name&quot;:[&quot;lastLogId&quot;,&quot;tweets&quot;,&quot;fetchCount&quot;],&quot;loopCount&quot;:&quot;&quot;,&quot;variable-value&quot;:[&quot;${resp.selector(&#39;.tweet-item:last-child&#39;).attr(&#39;data-tweet-id&#39;)}&quot;,&quot;${resp.selectors(&#39;.tweet-item[data-tweet-id]&#39;)}&quot;,&quot;${fetchCount == null ? 0 : fetchCount + 1}&quot;],&quot;shape&quot;:&quot;variable&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"6\" value=\"\" edge=\"1\" parent=\"1\" source=\"3\" target=\"5\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;&quot;,&quot;condition&quot;:&quot;&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"7\" value=\"循环\" style=\"loop\" vertex=\"1\" parent=\"1\">\n      <mxGeometry x=\"340\" y=\"250\" width=\"32\" height=\"32\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;循环&quot;,&quot;loopVariableName&quot;:&quot;index&quot;,&quot;loopCount&quot;:&quot;${list.length(tweets)}&quot;,&quot;shape&quot;:&quot;loop&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"8\" value=\"\" edge=\"1\" parent=\"1\" source=\"5\" target=\"7\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;&quot;,&quot;condition&quot;:&quot;&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"9\" value=\"提取详细信息\" style=\"variable\" vertex=\"1\" parent=\"1\">\n      <mxGeometry x=\"340\" y=\"340\" width=\"32\" height=\"32\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;提取详细信息&quot;,&quot;loopVariableName&quot;:&quot;&quot;,&quot;variable-name&quot;:[&quot;content&quot;,&quot;author&quot;,&quot;like&quot;,&quot;reply&quot;,&quot;publishTime&quot;],&quot;loopCount&quot;:&quot;&quot;,&quot;variable-value&quot;:[&quot;${tweets[index].selector(&#39;.text&#39;).text()}&quot;,&quot;${tweets[index].selector(&#39;.user&#39;).text()}&quot;,&quot;${tweets[index].selector(&#39;.like span&#39;).text()}&quot;,&quot;${tweets[index].selector(&#39;.reply span&#39;).text()}&quot;,&quot;${tweets[index].selector(&#39;.date&#39;).regx(&#39;(.*?)&amp;nbsp&#39;)}&quot;],&quot;shape&quot;:&quot;variable&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"10\" value=\"\" edge=\"1\" parent=\"1\" source=\"7\" target=\"9\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;&quot;,&quot;condition&quot;:&quot;&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"11\" value=\"输出\" style=\"output\" vertex=\"1\" parent=\"1\">\n      <mxGeometry x=\"340\" y=\"430\" width=\"32\" height=\"32\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;输出&quot;,&quot;loopVariableName&quot;:&quot;&quot;,&quot;output-name&quot;:[&quot;作者&quot;,&quot;内容&quot;,&quot;点赞数&quot;,&quot;评论数&quot;,&quot;发布时间&quot;],&quot;loopCount&quot;:&quot;&quot;,&quot;output-value&quot;:[&quot;${author}&quot;,&quot;${content}&quot;,&quot;${like}&quot;,&quot;${reply}&quot;,&quot;${publishTime}&quot;],&quot;shape&quot;:&quot;output&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"12\" value=\"\" edge=\"1\" parent=\"1\" source=\"9\" target=\"11\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;&quot;,&quot;condition&quot;:&quot;&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"13\" value=\"爬取3页\" edge=\"1\" parent=\"1\" source=\"5\" target=\"3\">\n      <mxGeometry x=\"-0.0312\" y=\"-20\" relative=\"1\" as=\"geometry\">\n        <Array as=\"points\">\n          <mxPoint x=\"356\" y=\"180\"/>\n          <mxPoint x=\"236\" y=\"180\"/>\n        </Array>\n        <mxPoint as=\"offset\"/>\n      </mxGeometry>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;爬取5页&quot;,&quot;condition&quot;:&quot;${fetchCount &lt; 3}&quot;}\n      </JsonProperty>\n    </mxCell>\n  </root>\n</mxGraphModel>\n', '', '0', '2019-11-03 17:02:49', '2019-11-04 10:11:31', '2019-11-03 17:30:56', '3');
INSERT INTO `sp_flow` VALUES ('663aaa5e36a84c9594ef3cfd6738e9a7', '百度热点', '<mxGraphModel>\n  <root>\n    <mxCell id=\"0\">\n      <JsonProperty as=\"data\">\n        {&quot;spiderName&quot;:&quot;百度热点&quot;,&quot;threadCount&quot;:&quot;&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"1\" parent=\"0\"/>\n    <mxCell id=\"2\" value=\"开始\" style=\"start\" parent=\"1\" vertex=\"1\">\n      <mxGeometry x=\"80\" y=\"80\" width=\"32\" height=\"32\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;shape&quot;:&quot;start&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"3\" value=\"开始抓取\" style=\"request\" parent=\"1\" vertex=\"1\">\n      <mxGeometry x=\"220\" y=\"80\" width=\"32\" height=\"32\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;开始抓取&quot;,&quot;loopVariableName&quot;:&quot;&quot;,&quot;sleep&quot;:&quot;&quot;,&quot;timeout&quot;:&quot;&quot;,&quot;response-charset&quot;:&quot;gbk&quot;,&quot;method&quot;:&quot;GET&quot;,&quot;body-type&quot;:&quot;none&quot;,&quot;body-content-type&quot;:&quot;text/plain&quot;,&quot;loopCount&quot;:&quot;&quot;,&quot;url&quot;:&quot;https://top.baidu.com/buzz?b=1&amp;fr=topindex&quot;,&quot;proxy&quot;:&quot;&quot;,&quot;request-body&quot;:&quot;&quot;,&quot;follow-redirect&quot;:&quot;1&quot;,&quot;tls-validate&quot;:&quot;1&quot;,&quot;shape&quot;:&quot;request&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"4\" value=\"定义变量\" style=\"variable\" parent=\"1\" vertex=\"1\">\n      <mxGeometry x=\"360\" y=\"80\" width=\"32\" height=\"32\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;定义变量&quot;,&quot;loopVariableName&quot;:&quot;&quot;,&quot;variable-name&quot;:[&quot;elementbd&quot;],&quot;loopCount&quot;:&quot;&quot;,&quot;variable-value&quot;:[&quot;${resp.xpaths(&#39;//*[@id=\\&quot;main\\&quot;]/div[2]/div/table/tbody/tr&#39;)}&quot;],&quot;shape&quot;:&quot;variable&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"5\" value=\"输出\" style=\"output\" parent=\"1\" vertex=\"1\">\n      <mxGeometry x=\"480\" y=\"80\" width=\"32\" height=\"32\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;输出&quot;,&quot;loopVariableName&quot;:&quot;i&quot;,&quot;output-name&quot;:[&quot;名称&quot;,&quot;地址&quot;,&quot;百度指数&quot;,&quot;2&quot;],&quot;loopCount&quot;:&quot;${elementbd.size()-1}&quot;,&quot;output-value&quot;:[&quot;${elementbd[i+1].xpath(&#39;//td[2]/a[1]/text()&#39;)}&quot;,&quot;${elementbd[i+1].xpath(&#39;//td[2]/a[1]/@href&#39;)}&quot;,&quot;${elementbd[i+1].xpath(&#39;//td[4]/span/text()&#39;)}&quot;,&quot;${elementbd[i+1].xpath(&#39;//td[3]/a[2]/text()&#39;)}&quot;],&quot;shape&quot;:&quot;output&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"6\" value=\"\" parent=\"1\" source=\"2\" target=\"3\" edge=\"1\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;&quot;,&quot;condition&quot;:&quot;&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"7\" value=\"\" parent=\"1\" source=\"3\" target=\"4\" edge=\"1\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;&quot;,&quot;condition&quot;:&quot;&quot;}\n      </JsonProperty>\n    </mxCell>\n    <mxCell id=\"8\" value=\"\" parent=\"1\" source=\"4\" target=\"5\" edge=\"1\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n      <JsonProperty as=\"data\">\n        {&quot;value&quot;:&quot;&quot;,&quot;condition&quot;:&quot;&quot;}\n      </JsonProperty>\n    </mxCell>\n  </root>\n</mxGraphModel>\n', '0 0/30 * * * ? *', '1', '2019-10-20 17:24:21', '2019-11-04 08:52:05', '2019-10-30 14:52:39', '45');

DROP TABLE IF EXISTS `sp_datasource`;
CREATE TABLE `sp_datasource` (
  `id` varchar(32) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `driver_class_name` varchar(255) DEFAULT NULL,
  `jdbc_url` varchar(255) DEFAULT NULL,
  `username` varchar(64) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `sp_variable`;
CREATE TABLE `sp_variable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT '变量名',
  `value` varchar(512) DEFAULT NULL COMMENT '变量值',
  `description` varchar(255) DEFAULT NULL COMMENT '变量描述',
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/* v0.3.0 新增 */
DROP TABLE IF EXISTS `sp_task`;
CREATE TABLE `sp_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flow_id` varchar(32) NOT NULL,
  `begin_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

/* v0.4.0 新增 */
DROP TABLE IF EXISTS `sp_function`;
CREATE TABLE `sp_function`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '函数名',
  `parameter` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参数',
  `script` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'js脚本',
  `create_date` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

/* v0.5.0 新增 */
DROP TABLE IF EXISTS `sp_flow_notice`;
CREATE TABLE `sp_flow_notice` (
  `id` varchar(32) NOT NULL,
  `recipients` varchar(200) DEFAULT NULL COMMENT '收件人',
  `notice_way` char(10) DEFAULT NULL COMMENT '通知方式',
  `start_notice` char(1) DEFAULT '0' COMMENT '流程开始通知:1:开启通知,0:关闭通知',
  `exception_notice` char(1) DEFAULT '0' COMMENT '流程异常通知:1:开启通知,0:关闭通知',
  `end_notice` char(1) DEFAULT '0' COMMENT '流程结束通知:1:开启通知,0:关闭通知',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT '爬虫任务通知表';