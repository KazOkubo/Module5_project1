tb1 <- sdat %>%
  select(age) %>%
  table() %>%
  prop.table()*100

tb2 <- sdat %>%
  select(female) %>%
  table() %>%
  prop.table()*100

tb3 <- sdat %>%
  select(hhold_income) %>%
  table() %>%
  prop.table()*100

df1 <- as.data.frame(tb1)
df2 <- as.data.frame(tb2)
df3 <- as.data.frame(tb3)

tmp <- merge( data.frame(df1, row.names=NULL),
              data.frame(df2, row.names=NULL),
              by=0, all=TRUE )[-1]

mdf <- merge( data.frame(tmp, row.names=NULL),
              data.frame(df3, row.names=NULL),
              by=0, all=TRUE )[-1]

knitr::kable( mdf, format="html", digits=2,
              col.names=c("Category","%","Category","%","Category","%"), caption="Demographics of Survey Respondents" ) %>%
  kableExtra::kable_styling( bootstrap_options=c("striped","bordered"), full_width=FALSE ) %>%
  add_header_above( c("Ages"=2 ,"Gender"=2, "Income"=2) )
