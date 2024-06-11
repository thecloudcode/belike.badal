from transformers import pipeline

classifier = pipeline("sentiment-analysis")
res = classifier([
    "I have suffering from Cancer",
    "I am feeling very happy"
])
print(res)
