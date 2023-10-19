# data visualization
# data
# mapping (aesthetics), coordinates, x/y axis
# geometric representation (type of chart)
# facet (division of charts)
# labels (title of the chart, x/y axis)
# theme of the chart

# load library
library(tidyverse)

#data()
#?starwars
#?msleep
#?mtcars

# histogram - analyze one numerical variable
# can also use boxplot and density plot
view(starwars)
ggplot(starwars, mapping=aes(x=height)) +
  geom_histogram()

starwars %>% 
  drop_na(height) %>% 
  ggplot(mapping=aes(x=height)) +
  geom_histogram()

starwars %>% 
  filter(height < 200) %>% 
  ggplot(aes(height)) +
  geom_histogram() +
  labs(title="Height of characters") +
  theme_bw()

# bar chart - categorical value
starwars %>% 
  # remove N/A
  drop_na(hair_color) %>% 
  # filter the values
  # filter (hair_color = "black" |
  #hair_color = "brown") %>% 
  filter(hair_color %in% 
           c("black", "brown")) %>% 
  ggplot(aes(hair_color)) +
  geom_bar(alpha = 0.5) +
  facet_wrap(~gender) +
  labs(title="Hair color by gender", 
       x= "Hair color",
       y = "Count of character")

starwars %>% 
  drop_na(hair_color, gender) %>% 
  filter(hair_color %in% 
           c("black", "brown")) %>% 
  ggplot(aes(hair_color, fill=gender)) +
  geom_bar() +
  # facet_wrap(~gender) +
  labs(title="Hair color by gender", 
       x= "Hair color",
       y = "Count of character") +
  theme_minimal()

# scatter plot: 2 numerical variables
starwars %>% 
  drop_na(height, mass) %>% 
  filter(mass < 500) %>% 
  ggplot(aes(height,mass)) +
  geom_point(aes(color=gender,
                 alpha=0.5)) +
  geom_smooth(method="lm") +
  labs(title="Height and Weight 
       of Characters") +
  theme_light()
# create a stacked bar chart 
# between eye_color and gender
# check the distribution of height by 
# eye_color and gender using box plot
# geom_box