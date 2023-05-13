spl_df <- read.csv("2017-2023-10-Checkouts-SPL-Data.csv")

spl_df <- spl_df %>% 
  mutate(date = paste0(CheckoutYear, "-", CheckoutMonth, "-01"))

spl_df$date <- as.Date(spl_df$date)

author_df <- spl_df %>% 
  filter(str_detect(Creator, "(i?)Tolkien"))

author_df$concise_title[str_detect(author_df$Title, "(?i)hobbit")] <- "The Hobbit"
author_df$concise_title[str_detect(author_df$Title, "(?i)two")] <- "The two Towers"
author_df$concise_title[str_detect(author_df$Title, "(?i)fellowship")] <- "The Fellowship of the Ring"

concise_df <- author_df %>% 
  na.omit(concise_title)

checkouts_per_title <- author_df %>% 
  group_by(date, concise_title) %>% 
  summarize(total_checkouts = sum(Checkouts, na.rm = TRUE))
checkouts_line_by_book <- ggplot(data = checkouts_per_title) +
  geom_line(aes(x = date, y = total_checkouts, color = concise_title)) +
  scale_y_continuous(limits = c(0, 400)) +
  labs(title = "J.R.R. Tolkien Checkouts by Title", 
       x = "Date", 
       y = "Total Checkouts",
       color = "Title")

checkouts_line_by_book
