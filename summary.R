#What is the average number of checkouts for each item?

avg_checkouts <- author_df %>% group_by(concise_title) %>% summarize(average = mean(Checkouts))

#What is the month or year with the most/least checkouts for a book that you're interested in?

year = author_df %>% filter(concise_title == "The Hobbit") %>% group_by(CheckoutYear) %>% summarize(total = sum(Checkouts)) %>% filter(total == max(total)) %>% pull(CheckoutYear)

#What is the month or year with the most/least checkouts for ebooks?

year_least_ebook <- author_df %>% filter(MaterialType == "EBOOK") %>% group_by(CheckoutYear) %>% summarize(total = sum(Checkouts)) %>% filter(total == min(total)) %>% pull(CheckoutYear)


#What is the highest number of books sold in a year.

highest_sold_in_year <- author_df %>% group_by(CheckoutYear) %>% summarize(total = sum(Checkouts)) %>% filter(total == max(total)) %>% pull(total)

#What is the least popular book?

least_popular_book <- author_df %>% group_by(concise_title) %>% summarize(total_checkouts = sum(Checkouts)) %>% filter(total_checkouts == min(total_checkouts)) %>% pull(concise_title)
