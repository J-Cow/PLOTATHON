import pandas as pd

# Load the CSV file into a DataFrame
try:
    df = pd.read_csv("Datasheet.csv", encoding='utf-8')
except UnicodeDecodeError:
    df = pd.read_csv("Datasheet.csv", encoding='latin-1')


# Drop non-numeric columns
bool_columns = df.select_dtypes(include=['bool']).columns
numeric_columns = df.select_dtypes(include=['float64', 'int64']).columns
df_numeric = df[numeric_columns]

# Display the first few rows of the DataFrame to understand its structure
print(df_numeric.head())

# Check for any missing values in the DataFrame
print(df_numeric.isnull().sum())

# If there are missing values, handle them appropriately (e.g., fill with mean/median, drop rows, etc.)

# Calculate correlation matrix
correlation_matrix = df_numeric.corr()

# Display the correlation matrix
print(correlation_matrix)