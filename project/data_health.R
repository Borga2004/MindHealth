library(readr)
library(ggplot2)
Student_Mental_health <- read_csv("Desktop/project/digital_health/Student Mental health.csv")
View(Student_Mental_health)

colnames(Student_Mental_health)

# Create a histogram for the 'Do you have Depression?' variable
ggplot(Student_Mental_health, aes(x = `Do you have Depression?`)) +
  geom_bar(fill = "blue", color = "black", alpha = 0.7) +
  labs(title = "Distribution of Depression Status",
       x = "Depression Status",
       y = "Frequency")

# Create a histogram for the 'Age' variable
ggplot(Student_Mental_health, aes(x = Age)) +
  geom_histogram(binwidth = 1, fill = "blue", color = "black", alpha = 0.7) +
  labs(title = "Distribution of Ages",
       x = "Age",
       y = "Frequency")



# Create a violin plot for the "Age" variable with percentages on the y-axis
ggplot(Student_Mental_health, aes(x = "", y = Age)) +
  geom_violin(fill = "blue", color = "black", alpha = 0.8) +
  geom_point(aes(shape = factor(1)), fill = "lightblue", color = "black", size = 3) +
  labs(title = "Violin Plot of Age") +
  theme_minimal() +
  guides(shape = FALSE) +  # Hide the legend for the shape
  scale_y_continuous(labels = scales::percent_format(scale = 1))  # Format y-axis as percentages


# View the first few rows of the data
head(Student_Mental_health)



# Calculate percentages
percentages <- prop.table(table(Student_Mental_health$Age)) * 100

# Create a histogram with percentages
barplot(
  percentages,
  main = "Histogram of Age (Percentage)",
  xlab = "Age",
  col = "blue",
  ylim = c(0, 30),  # Adjust this based on your data
  ylab = "Percentage"
)




# Columns of interest
columns_of_interest <- c('Choose your gender', 'Age', 'Marital status', 'Do you have Depression?', 'Do you have Anxiety?', 'Do you have Panic attack?', 'Did you seek any specialist for a treatment?')


# Function to create pie chart with percentages
create_pie_chart <- function(data, column) {
  data_pie <- table(data[[column]])
  percent_labels <- paste0(round(prop.table(data_pie) * 100), "%")
  
  pie(data_pie, labels = percent_labels, main = paste('Distribution of', column), col = rainbow(length(data_pie)))
}


# Function to create count plot
create_count_plot <- function(data, column) {
  ggplot(data, aes(x = .data[[column]], fill = `What is your CGPA?`)) +
    geom_bar(position = 'dodge', color = 'black', show.legend = TRUE) +
    labs(title = paste('Countplot of', column, 'by CGPA'),
         x = column, y = 'Count') +
    theme_minimal()
}


# Create and display pie charts
for (column in columns_of_interest) {
  create_pie_chart(Student_Mental_health, column)
}

# Create and display count plots
for (column in columns_of_interest) {
  create_count_plot(Student_Mental_health, column)
}


# Create a count plot for a categorical variable with percentages on the y-axis
ggplot(Student_Mental_health, aes(x = `Choose your gender`, fill = `What is your CGPA?`)) +
  geom_bar(position = 'dodge', color = 'black', show.legend = TRUE) +
  labs(title = "Countplot of Gender by CGPA", x = "Gender", y = "Percentage") +
  theme_minimal() +
  scale_y_continuous(labels = scales::percent_format(scale = 1))  # Format y-axis as percentages




# Count plot for Panic attack by Gender
ggplot(Student_Mental_health, aes(x = `Do you have Panic attack?`, fill = `Choose your gender`)) +
  geom_bar(position = 'dodge', color = 'black', show.legend = TRUE) +
  labs(title = 'Countplot of Panic attack by Gender',
       x = 'Panic attack', y = 'Count') +
  theme_minimal()



# Count plot for Anxiety by Depression
ggplot(Student_Mental_health, aes(x = `Do you have Anxiety?`, fill = `Do you have Depression?`)) +
  geom_bar(position = 'dodge', color = 'black', show.legend = TRUE) +
  labs(title = 'Countplot of Anxiety attack by Depression',
       x = 'Panic attack', y = 'Count') +
  theme_minimal()



# A jitter plot for Age and Panic attack
ggplot(Student_Mental_health, aes(x = `Do you have Panic attack?`, y = Age, color = `Do you have Panic attack?`)) +
  geom_jitter(position = position_jitter(width = 0.2), size = 3) +
  labs(title = 'Jitter Plot of Age by Panic attack',
       x = 'Panic attack', y = 'Age') +
  theme_minimal()



# Convert 'Do you have Panic attack?' to a binary numeric variable
Student_Mental_health$`Do you have Panic attack?` <- as.numeric(Student_Mental_health$`Do you have Panic attack?` == "Yes")

# Fit logistic regression model
logistic_model <- glm(`Do you have Panic attack?` ~ Age, data = Student_Mental_health, family = "binomial")

# Summary of the logistic regression model
summary(logistic_model)



ggplot(Student_Mental_health, aes(x = `Marital status`, fill = `Do you have Panic attack?`)) +
  geom_bar() +
  labs(title = 'Bar Plot of Marital status by Panic attack',
       x = 'Marital status', y = 'Count') +
  theme_minimal()


# pie chart with percentages
panic_attack_column <- Student_Mental_health$`Do you have Panic attack?`
panic_attack_table <- table(panic_attack_column)
panic_attack_percentages <- prop.table(panic_attack_table) * 100
pie(panic_attack_percentages, main = "Panic Attack Distribution", labels = paste(names(panic_attack_percentages), "\n", sprintf("%.1f%%", panic_attack_percentages)), col = rainbow(length(panic_attack_percentages)))



#columns of interest
depression_column <- Student_Mental_health$`Do you have Depression?`
anxiety_column <- Student_Mental_health$`Do you have Anxiety?`

# frequencies for Depression
depression_table <- table(depression_column)
depression_percentages <- prop.table(depression_table) * 100

# pie chart for Depression
pie(depression_percentages, main = "Depression Distribution", labels = paste(names(depression_percentages), "\n", sprintf("%.1f%%", depression_percentages)), col = rainbow(length(depression_percentages)))


# chart for Anxiety
anxiety_table <- table(anxiety_column)
anxiety_percentages <- prop.table(anxiety_table) * 100
pie(anxiety_percentages, main = "Anxiety Distribution", labels = paste(names(anxiety_percentages), "\n", sprintf("%.1f%%", anxiety_percentages)), col = rainbow(length(anxiety_percentages)))



# Create a count plot for gender and depression
ggplot(Student_Mental_health, aes(x = `Choose your gender`, fill = `Do you have Depression?`)) +
  geom_bar(position = "dodge", stat = "count") +
  labs(title = "Gender and Depression", x = "Gender", y = "Count") +
  scale_fill_manual(values = c("No" = "blue", "Yes" = "red")) +
  theme_minimal()

