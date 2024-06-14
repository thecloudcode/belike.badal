import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
import mplcyberpunk

plt.style.use("cyberpunk")

columns = ['Preg', 'Plas', 'Pres', 'Skin', 'Test', 'Mass', 'Pedi', 'Age', 'Class']
colors = ['#4a00ff', '#7300ff', '#7a00ff', '#9000ff', '#9e00ff', '#ce00ff', '#e100ff', '#ff00ea', '#ff00ae']

df = pd.read_csv("https://raw.githubusercontent.com/jbrownlee/Datasets/master/pima-indians-diabetes.csv", sep=',', names=columns)

fig, axes = plt.subplots(nrows=3, ncols=3, figsize=(10,8))
axes = axes.flatten()

for i, col in enumerate(df):
    df[col].plot(kind="density", ax=axes[i], subplots=True, sharex=False, color=colors[i])
    axes[i].set_title(col)
    mplcyberpunk.make_lines_glow(axes[i])
    mplcyberpunk.add_gradient_fill(axes[i], alpha_gradientglow=0.5)
    axes[i].patch.set_facecolor('black')
    axes[i].legend([col])

fig.patch.set_facecolor('black')

plt.tight_layout()
plt.show()