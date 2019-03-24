library("xml2")
library("rvest")
# 指定要爬取的url
url <- 'https://www.imdb.com/search/title?%20count=100&release_date=2016,2016&title_type=feature'
# 从网页读取html代码
webpage <- read_html(url)

# 用CSS选择器获取排名部分
rank_data_html <- html_nodes(webpage,'.text-primary')

# 把排名转换为文本
rank_data <- html_text(rank_data_html)

# 检查一下数据
head(rank_data)

# 数据预处理：把排名转换为数值型
rank_data<-as.numeric(rank_data)

# 再检查一遍
head(rank_data)

# 爬取标题
title_data_html <- html_nodes(webpage,'.lister-item-header a')

# 转换为文本
title_data <- html_text(title_data_html)

# 检查一下
head(title_data)

# 爬取描述
description_data_html <- html_nodes(webpage,'.ratings-bar+ .text-muted')

# 转为文本
description_data <- html_text(description_data_html)

# 检查一下
head(description_data)

# 移除 '\n'
description_data<-gsub("\n","",description_data)

# 再检查一下
head(description_data)

# 爬取runtime section
runtime_data_html <- html_nodes(webpage,'.text-muted .runtime')

# 转为文本
runtime_data <- html_text(runtime_data_html)

# 检查一下
head(runtime_data)

