MarkovKB
-----------------

MarkovKB is a proof of concept for a predictive keyboard. It learns how you type as you type and gives you suggestions as to what you might want to type next. If one of the suggestions is correct, you can simply click on the prediction to insert it instead of typing it out. MarkovKB learns more about your typing style the more it's used, so the predictions will be more and more accurate as more text is typed with it.

As this is merely a proof of concept, the things MarkovKB learns about how you type are not stored persistently: each instance is a 'fresh slate', so to speak. In a real use case, the program might flush entered text to persistent storage every `\n`, for example.

MIT license
