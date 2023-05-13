checkouts_by_material <- author_df %>% group_by(date, MaterialType) %>%
  summarize(total_checkouts = sum(Checkouts, na.rm = TRUE))

checkouts_line_by_material <- ggplot(data = checkouts_by_material) +
  geom_line(aes(x = date, y = total_checkouts, color = MaterialType)) +
  scale_y_continuous(limits = c(0, 1000)) +
  labs(title = "J.R.R. Tolkien Checkouts by Material Type", 
       x = "Date", 
       y = "Total Checkouts",
       color = "Material Type")

checkouts_line_by_material