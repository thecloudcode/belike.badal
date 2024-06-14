import matplotlib.pyplot as plt
import mplcyberpunk

plt.style.use("fivethirtyeight")
slices = [77, 23,57,17]
colors = ["#F38181","#FCE38A","#EAFFD0","#95E1D3"]
l = ["Me","I","Badal","BPS"]
explode = [0, 0.1, 0, 0]
plt.pie(slices,
        labels=l,
        colors=colors,
        wedgeprops={'edgecolor':'black'},
        explode=explode,
        shadow=True,
        startangle=360,
        autopct='%1.1f%%'
        )

plt.title("Pie Chart")
plt.tight_layout()
plt.show()