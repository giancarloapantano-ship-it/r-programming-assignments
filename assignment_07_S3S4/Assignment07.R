#Data loading and Inspection
data("mtcars")
my_data <- mtcars #loaded a dataset and set it to a new object.

head(my_data) #used to show the first few rows
str(my_data) #used to show the structure of the data

#Generic Function Tests and Explanations
print(my_data) #testing print
summary(my_data) #testing summary
plot(my_data$mpg, my_data$hp, main = "MPG vs HP") #testing plot to assure a dispatch to plot.data.frame

#S3 + S4 Class Definitions and Examples
s3_obj <- list(name = "Myself", age = 29, GPA = 3.5)
class(s3_obj) <- "student_s3"

setClass("student_s4",
         slots = c(name = "character", age = "numeric", GPA = "numeric"))
s4_obj <- new("student_s4", name = "Myself", age = 29, GPA = 3.5)

print(s3_obj) #s3 dispatch
print(s4_obj) #s4 dispatch