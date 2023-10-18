# install the package
install.packages("tidyverse")
# load the package
library(tidyverse)
# view datasets available in R
data()
# view starwars dataset
view(starwars)
# view(msleep)
# summary(msleep)
# understand the data
glimpse(starwars)
class(starwars)
class(starwars$hair_color)
unique(starwars$gender)

# manipulate the data
# changing data types
# as.integer() as.double() as.character()
starwars$gender <- as.factor(starwars$gender)
class(starwars$gender)

# filtering columns in dataset
# ctrl + shift + m to add pipe operator
starwars %>% 
  select(name, hair_color) %>% 
  filter(hair_color %in% c("blond", "brown")) %>% 
  view()

starwars %>% 
  select(name, hair_color, height) %>% 
  filter(hair_color %in% c("blond", "brown")
         & height < 180 ) %>% 
  view()

# handling missing values
starwars %>% 
  select(name, height, mass, ends_with("color")) %>% 
  filter(!complete.cases(.)) %>% 
  view()
# dropping empty observations
starwars$height <- starwars %>% 
  drop_na(height) %>% 
  view()
# filling empty observations (categorical)
starwars %>% 
  mutate(hair_color = replace_na(
    hair_color, "none"
  )) %>% 
  view()

# recoding variables
starwars %>% 
  mutate(gender = recode(gender, "masculine" = 1,
                         "feminine" = 2)) %>% 
  view()
# rename a variable
starwars %>% 
  # rename(newName = oldName)
  rename("list_of_films" = "films") %>% 
  view()

# reordering columns
# assign it to df
starwars <- starwars %>% 
  select(name, species, everything()) %>% 
  view()

# subsetting 
starwars_sub <- starwars %>% 
  select(1:4, ends_with("color"), homeworld) %>% 
  view()

# view dataset documentation
?msleep
# how to create a new column by modifying an old column

starwars[duplicated(starwars),]
starwars_rows <- starwars[duplicated(starwars),]
starwars_new <- 
summary(starwars)
starwars_new <- unique(starwars)
summary(starwars_new)
starwars_new <- unique(starwars[,c("col2","col3")])
starwars_new <- duplicated(starwars[c("col2","col3"),])
starwars_new_new <- starwars[!starwars_new,]