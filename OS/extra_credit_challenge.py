import os
import re
  

# open file and read lines
with open('nmap.txt') as fh:
   flines = fh.readlines()
  

# regex
ipptrn = re.compile(r'(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})')
svcptrn = re.compile('open\s\s[a-zA-Z0-9_.-]*')
  

# init vars
scans = []
svclist = []
ipsvc = []
finlist = []
finstr = ""


# find set of all services
for index, line in enumerate(flines):
    mtchsvc = re.search(svcptrn, line)
    if mtchsvc:
            svclist.append((mtchsvc.group()).split("  ")[1])
svclist = list(set(svclist))


# find set of ips
for index, line in enumerate(flines):
    mtch = re.search(ipptrn, line)
    if mtch:
        scans.append([mtch.group(), index])


# iterate through the set of all services, making sublists containing a service and an ip that is running it
for s in svclist:
    for index, ip in enumerate(scans):
        if index != len(scans)-1:
            for line in flines[(ip[1]):(scans[index+1][1])]:
                mtchsvc = re.search(svcptrn, line)
                if mtchsvc:
                    ipsvc.append([ip[0], (mtchsvc.group()).split("  ")[1]])


# iterate through the set of all services, sublooping through the above set of ip/svc pairs. if ip/svc pair contains the correct svc,
# add the ip to a list containing a svc and a list of ips running that svc
for index, s in enumerate(svclist):
    finlist.append([s])
    for pair in ipsvc:
        if pair[1] == s:
            finlist[index].append(pair[0])


# for the above list, remove duplicates created by spaghetti code using list comprehension magic
for index, pair in enumerate(finlist):
    def dup(seq):
        seen = set()
        seen_add = seen.add
        return [x for x in seq if not (x in seen or seen_add(x))]
    finlist[index] = dup(pair)


# create the proper string that the question was asking for
for lst in finlist:
    finstr += f"\nService: {lst[0]} Count: {len(lst)-1}\n==============================\n"
    for ip in lst[1:]:

        finstr += f"{str(ip)}\n"

# print
print(finstr)
         
         
