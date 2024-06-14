import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import mplcyberpunk

plt.style.use("dark_background")

kc_tax = pd.read_csv("kc_tax.csv")

# Removing very expensive and very small or large datasets
kc_tax_new = kc_tax.loc[(kc_tax.TaxAssessedValue < 750000) &
                        (kc_tax.SqFtTotLiving > 100) &
                        (kc_tax.SqFtTotLiving < 3500), :]

# Create a custom colormap
cmap = plt.cm.colors.ListedColormap(['aqua', 'black'])

# Set the figure facecolor to black
fig, ax = plt.subplots(figsize=(10, 8))
# fig.set_facecolor('black')

# Plot hexbin with custom colormap and set border color to black
hexbin = kc_tax_new.plot(kind='hexbin', x='SqFtTotLiving', y='TaxAssessedValue',
                         sharex=False, grid=True, gridsize=50, cmap='inferno', ax=ax, edgecolors='black', mincnt=1)

# Set grid color to dark grey
ax.grid(color='#330169', linestyle='-', linewidth=0.5)

ax.set_xlabel('Finished Square Feet')
ax.set_ylabel('Tax Assessed Value')

for spine in ax.spines.values():
    spine.set_edgecolor('black')

# Save the figure to the Downloads folder
plt.savefig(r'C:\Users\badal\Downloads\hexbin_plot.png')

plt.show()
