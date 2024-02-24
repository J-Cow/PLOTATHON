import pandas as pd

# Read the CSV file into a DataFrame
df = pd.read_csv("Datasheet.csv")


print(df.head())

# Specify the category based on which you want to remove empty cells
#category = 'Name'

# Remove rows with empty cells in the specified category
#cleaned_df = df.dropna(subset=[category])

# Write the cleaned DataFrame back to a CSV file
#cleaned_df.to_csv("cleaned_dataset.csv", index=False)