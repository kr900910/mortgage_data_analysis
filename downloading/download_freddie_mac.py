import requests

username = raw_input("Enter Freddie Mac username: ")
password = raw_input("Enter Freddie Mac password: ")
beg_data = raw_input("Enter beginning quarter (i.e. 2014Q1): ")
end_data = raw_input("Enter ending quarter (i.e. 2015Q2): ")

beg_year = int(beg_data[0:4])
beg_quarter = int(beg_data[-1])
end_year = int(end_data[0:4])
end_quarter = int(end_data[-1])

if beg_year < end_year or (beg_year == end_year and beg_quarter <= end_quarter):

    payload = {
        'username': username,
        'password': password
    }
    
    s = requests.Session()

    s.post('https://freddiemac.embs.com/FLoan/secure/login.php?pagename=download2', data = payload)

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
                f.write(s.get(file_url).content)
                f.close()
else:
    print "Beginning quarter given comes after ending quarter given."
