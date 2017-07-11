% MATLAB Workshop
% Empirical Reasoning Center
% 15 June 2016

% MATLAB is the matrix laboratory.

% - What does MATLAB look like? -
% The editor window allows you to read, write, and run scripts.
% The workspace lists all assigned variables and briefly describes the data.
% The command window displays output and allows you to run commands.
% The current folder sidebar sets your working directory.

% In MATLAB scripts are saved as .m files. 

% Anything that follows a percent sign is read as a comment and not run. 

% Commands can be run from 2 places: the editor and command windows.
% Type into the command window 
fprintf('Hello World')
% To run commands from the editor, you can either run the entire script or
% you can run a selection. 
% To run the entire script select Run (the Play icon in the toolbar).

% Run the following command from the editor by highlighting the line, right
% clicking it, and selecting "Evaluate Selection" (you can also use the 
% keyboard shortcut).
fprintf('Hello World, again')

% - Accessing your data -

% Set the working directory using the current folder.
% Find where you saved the TeachingRatings.csv file. 
% Save your current m files to this folder.

% To read in the data use the following command:
data=csvread('TeachingRatings.csv');
% This command creates a variable called "data" containing the entire
% dataset.

% To import a .csv there cannot be any headers and there can only 
% be 1 sheet.  (Open this file in excel to see.)

% - What does the data look like? -

% Look up the dimensions of data by typing:
size(data)

% The first element of this output is the number of rows, and the second element is the
% number of columns.

% You can view the data in 2 ways:
% 1) Double click the variable in the workspace 
% 2) Type the variable name:
data

% - Separating the data into 8 variables -
% We know from the excel sheet that each variable is a column of data.
% We want to assign a variable to each each column 
% For the first variable run:
minority = data(:,1);
% The variable you are creating is always on the left hand
% side of the equal sign.
% The single equal sign assigns the variable.
% The variable should equal all rows of the first column of the data
% variable.
% The right hand side of the equation says that the variable should equal
% the values of the data variable in all rows (indicated by the :) of the
% first column (indicated by the 1).
% (rows, columns)

% Other options:
% x=data(c,a:b) will set x to equal data's row c of columns a through b.
% You can use any combination such that you specify (rows, columns).

% The semicolon supresses output.  With the semicolon the command will
% be run but nothing will be displayed in the command window.

% What happens when you delete the semicolon and run the line again?

% So the rest of the data should be spliced using the following commands:
age = data(:,2);
female = data(:,3);
onecredit = data(:,4);
beauty = data(:,5);
course_eval = data(:,6);
intro = data(:,7);
nnenglish = data(:,8);

%  -When you don't know what to do... -

% MATLAB has a lot of great resources if you are trying to figure out if a
% command exists, what the syntax of a command is, or how to change the
% options. 

% If you search for the term in the "Search Documentation" box MATLAB will
% display the relevent pages in the manual.

% If you want less thorough help (like if you're just trying to remember
% something) you can type help and then the term into the command window.
% For example, run:
help functions 

% - Assignment & Reassignment -

% You cannot have 2 variables with the same name at the same time.  
% And MATLAB will not give any warning if you are creating a variable that
% already exists (as STATA does).  MATLAB will simply reassign the variable
% For example, run
x=1
% To reassign x, run
x=2:5

% MATLAB has no way of recalling x as 1.

% - Comparisons -
% In MATLAB, true = 1 and false = 0.
% So if:
x=1
% and you ask if x is equal to 2:
x==2
% then the output would indicate false, 0.
% the double equal sign is used because it is a comparison (you're not
% assigning x to equal 2 here).

% - Concatinating & Appending -

% Scalers, vectors, and matrices can be joined together.
x=1
y=2
z=[x;y;5]
% z is set to equal a matrix (indicated by the brackets]; the first element
% is equal to x (the semicolon indicates the end of that row); the second
% element is equal to y; and the element in the third row is equal to 5.

% Concatination can also use strings and not just numerics
x='Hello'
y=' world'
w=[x,y]
% w is set to equal a matrix; the first element is equal to x (the comma
% indicates the end of that column); and the second element is equal to y.

% You can concatinate with as many rows and columns as you want, but all
% rows must be the same length and all columns must be the same length.

% Indexing
% You can also isolate scalers, vectors, and matrices from larger vectors
% or matrices using parentheses.
a=z(1)
b=z(2:3)
% a is set to equal the first element of z.
% b is set to equal the second through the third element of z.
c=[1,2,3;4,5,6]
d=c(2,3)
% d is set to equal the element in the second row & third column of c.

% - Functions - 
% You can use preset functions that MATLAB has made, or you can make your
% own functions.  

avg_beauty=mean(beauty)

% If there is a function you think MATLAB might already have, search
% documentation to find out the syntax.
% For example, type


% - Conditional Statements -

% Conditional statements depend on whether certain conditions are true or
% false.
% Here is an example of an if block,
a=7
b=5

if a>b
    % The commands below this "if" are only executed if the condition
    % is true.
    fprintf('a is greater than b\n')
elseif a<b
    % If the first condition is false, then this second condition is
    % tested.  The following commands are only run if the first condition
    % is false and the second condition is true. 
    fprintf('a is less than b\n')
else
    % If both the first and second conditions are false then the following
    % commands are run
    fprintf('a is equal to b\n')
end % All if blocks must have a specified end or else following commands
% would be assumed to be part of the else.  

% Indenting matters.  To fix indenting highlight the block, right click,
% and select "Smart Indenting"


% To create a function you must open a new script and title it what you
% plan on calling your function.  


% The function script begins here:



% Type the following commands into a new script called average.m
function y=average(x)

% The first line in the script must specify that you are creating a
% function.
% After "function" you enter the number of outputs your function will
% return, the name of the function, and the inputs to the function.

% The number of outputs depends on what the function does.  If you want the
% function to give you a single value then you specify a variable.
% If you want more than one output (mean and standard deviation for
% exmaple), you would specify [m,s] (=stats(x))

if size(x,2)>1
    error('This function requires a column vector')
end

% The condition requires the input to only have 1 column.
% Size is the number of rows & the number of columns. The 2 indicates you
% want just the number of columns 

% Error prints the string in red to the command window and does not run the
% rest of the function. 


y=sum(x)/size(x,1)

% This is the creation of the output.  The output variable you specified in
% the first line is what gets returned.  In a function that exact variable
% must be assigned or there won't be any output from the function. 

% Size is used to calculate the number of rows (the 1 indicates rows and
% not columns). 

end
% All functions must specify their end.


% The function script ends here.



% Now you should be able to run the average command.
% Try:
average_age=average(age)
% Try testing your error:
a=[1,2,3,4,5,6,7,8,9,10]
average(a)


% - For Loops -

% For loops are incredibly useful but require a conceptual understanding. 

attractive=[]
for counter=1:size(beauty,1) % The counter variable iterates through the specifed range
    currentbeauty=beauty(counter) % isolate the current observation
    if currentbeauty>=avg_beauty
        currentattractive=1 % assign the attractive variable if condition is met
    else
        currentattractive=0 % assign the attractive variable if condition is not met
    end 
    attractive=[attractive;currentattractive] % append it to the list.
end

% - Graphs -

% Scatter Plot
scatter(beauty,course_eval,'filled','c')
xlim([-2,3]) % x axis limits
ylim([0,10]) % y axis limits
xlabel('beauty') % x axis labels
ylabel('course evaluation') % y axis labels
title('Beauty and Course Evaluations') % table

% Histogram 
histogram(age,20,'Facecolor','c') % 20 specifies the number of bins
title('Distribution of Age')
xlabel('age')
ylabel('frequency')