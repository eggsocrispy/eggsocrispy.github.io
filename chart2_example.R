library("dplyr")
checkouts_by_usage <- author_df %>%  
  group_by(date, UsageClass) %>% 
  summarize(total_checkouts = sum(Checkouts, na.rm = TRUE), .groups = 'drop')

checkouts_line_by_usage <- ggplot(data = checkouts_by_usage) +
  geom_line(aes(x = date, y = total_checkouts, color = UsageClass)) +
  scale_y_continuous(limits = c(0, 1000)) +
  labs(title = "J.R.R. Tolkien Checkouts by Usage", 
       x = "Date", 
       y = "Total Checkouts",
       color = "Usage Type")

checkouts_line_by_usage