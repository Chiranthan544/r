library(rvest)
url<-"https://books.toscrape.com/"

html_content=read_html(url)

class(html_content)
html_content

title_xpath<-'//*[@class="product_pod"]/h3/a'
price_xpath<-'//*[@class="product_pod"]/div[2]/p[1]'
#Extract 
titles<-html_content%>%html_nodes(xpath=title_xpath)%>%html_text()%>%trimws()

prices<-html_content%>%html_nodes(xpath=price_xpath)%>%html_text()%>%trimws()

#Combine the extracted data into a data frame
book_data<-data.frame(Title=titles,Price=prices)
#Print the extracted data print(book_data)
print(book_data)
#Save the extracted data to a csv file
write.csv(book_name,"book_data.csv",row.names=FALSE)