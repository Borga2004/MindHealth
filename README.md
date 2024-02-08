# Student Mental Health Dashboard

Welcome to the Student Mental Health Dashboard! This Shiny application allows you to explore the mental health data of students based on various factors such as gender, major, marital status, and current year in college.

## About the Project

The Student Mental Health Dashboard is developed to visualize and analyze the mental health data collected from students at the International Islamic University of Malaysia. The dashboard provides insights into the levels of depression, anxiety, panic, and distribution of treatment among students.

## How to Use

To use the dashboard:

1. Clone or download the repository to your local machine.
2. Make sure you have R and RStudio installed.
3. Open the `app.R` file in RStudio.
4. Install the required packages if not already installed (`shiny` and `ggplot2`).
5. Run the application by clicking on the "Run App" button in RStudio.

Once the application is running, you can interact with it by selecting different options in the sidebar panel to filter the data and visualize the mental health metrics.

## Data

The example dataset used in this application (`Student_MH`) includes the following columns:

- Gender: Gender of the student (Male/Female)
- Major: Student's major
- Married: Marital status (Yes/No)
- Year: Current year in college
- Depression: Level of depression
- Anxiety: Level of anxiety
- Panic: Level of panic
- Treatment: Whether the student is receiving treatment for mental health issues (Yes/No)

You can replace this dataset with your own data by modifying the `Student_MH` data frame in the `app.R` file.

## Screenshots

![image](https://github.com/Borga2004/MindHealth/assets/159353248/4947226a-670a-4fb3-8b00-c4ad056f70e7)
![image](https://github.com/Borga2004/MindHealth/assets/159353248/6d955c38-6368-472b-bb7f-5e44355a474a)



## Acknowledgements

- The data used in this application was collected from the International Islamic University of Malaysia.
