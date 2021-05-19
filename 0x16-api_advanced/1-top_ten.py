#!/usr/bin/python3
"""
Queries the Reddit API and returns titles of the first 10 hot
posts for a given subreddit
"""
import requests


def top_ten(subreddit):
    """Gets the titles of the top 10 posts"""
    headers = {'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7)'}
    r = requests.get('https://www.reddit.com/r/{}/hot/.json'.
                     format(subreddit), headers=headers)
    if r.status_code == 404:
        print(None)
        return
    result = r.json().get('data').get('children')
    for t in result[0:10]:
        print(t.get('data').get('title'))
    # print (r)
