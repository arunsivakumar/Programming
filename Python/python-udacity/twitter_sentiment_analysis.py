import tweepy
from textblob import TextBlob

# Authentication

consumer_key = 'ywnHh1WfuEYpEEo54i2trULAZ'
consumer_secret = '5NBsH2RpeSBoAi8yljardWWRoBmvvn04LZc1CdkRhgNXJItFUM'


access_token = '1580376360-TuILQSJRW1fOCKa7CuFF5WUiowmcHv9lh0CHKnC'
access_token_secret = 'vZ81VJA6odBVDuiGCMxdqSDIGxt4YHsxbqdHJmLWkG731'

# OAuth for app login

auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)

api = tweepy.API(auth)

# Collect tweets

tweets = api.search('iPhone8')

# Perform sentiment analysis

for tweet in tweets:
    print(tweet.text)
    analysis = TextBlob(tweet.text)
    print(analysis.sentiment)

