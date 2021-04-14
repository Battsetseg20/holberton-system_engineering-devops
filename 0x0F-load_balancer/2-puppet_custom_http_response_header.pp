#automate the task of creating a custom HTTP header response
# header -> X-Served-By : hostname

page.setExtraHTTPHeaders([['X-Served-By', '@hostname'],]);