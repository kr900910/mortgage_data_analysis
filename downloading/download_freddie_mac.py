import cookielib
import urllib
import urllib2
import os

username = raw_input("Enter Freddie Mac username: ")
password = raw_input("Enter Freddie Mac password: ")
beg_data = raw_input("Enter beginning quarter (i.e. 2014Q1): ")
end_data = raw_input("Enter ending quarter (i.e. 2015Q2): ")

beg_year = int(beg_data[0:4])
beg_quarter = int(beg_data[-1])
end_year = int(end_data[0:4])
end_quarter = int(end_data[-1])

if beg_year < end_year or (beg_year == end_year and beg_quarter <= end_quarter):

    # Store the cookies and create an opener that will hold them
    cj = cookielib.CookieJar()
    opener = urllib2.build_opener(urllib2.HTTPCookieProcessor(cj))

    # Add our headers
    opener.addheaders = [('User-agent', 'cas-testing')]

    # Install our opener (note that this changes the global opener to the one # we just made, but you can also just call opener.open() if you want)
    urllib2.install_opener(opener)

    # The action/ target from the form
    authentication_url = 'https://freddiemac.embs.com/FLoan/secure/login.php?pagename=download2'

    # Input parameters we are going to send, keys in dictionary should match the 'name' fields found from source code
    payload = {
    'username': username,
    'password': password
    }

    # Use urllib to encode the payload
    data = urllib.urlencode(payload)

    # Build our Request object (supplying 'data' makes it a POST)
    req = urllib2.Request(authentication_url, data)
    resp = urllib2.urlopen(req)

    for year in range(beg_year, end_year+1):
        if year == beg_year:
            start = beg_quarter
            if year == end_year:
                end = end_quarter
            else:
                end = 4
        elif year == end_year:
            start = 1
            end = end_quarter
        else:
            start = 1
            end = 4

        for quarter in range(start, end+1):
            file_name = 'Q' + str(quarter) + str(year) + '.zip'
            file_url = 'https://freddiemac.embs.com/FLoan/Data/historical_data1_' + file_name

            # Make the request and read the response
            print "Downloading", file_name
            with open(file_name,'wb') as f:
                f.write(urllib2.urlopen(file_url).read())
                f.close()
else:
    print "Beginning quarter given comes after ending quarter given."
