# Julie George, Emily Herrett, Liam Smeeth, Harry Hemingway, Anoop Shah, Spiros Denaxas, 2023.

import sys, csv, re

codes = [{"code":"584G.00","system":"readv2"},{"code":"6252","system":"readv2"},{"code":"6281","system":"readv2"},{"code":"62A1.00","system":"readv2"},{"code":"62E..11","system":"readv2"},{"code":"62U..11","system":"readv2"},{"code":"6353","system":"readv2"},{"code":"6363","system":"readv2"},{"code":"6364","system":"readv2"},{"code":"6365","system":"readv2"},{"code":"6366","system":"readv2"},{"code":"6367","system":"readv2"},{"code":"6368","system":"readv2"},{"code":"6369","system":"readv2"},{"code":"636A.00","system":"readv2"},{"code":"636C.00","system":"readv2"},{"code":"636D.00","system":"readv2"},{"code":"636E.00","system":"readv2"},{"code":"636F.00","system":"readv2"},{"code":"L00..12","system":"readv2"},{"code":"L010.00","system":"readv2"},{"code":"L011.00","system":"readv2"},{"code":"L011.11","system":"readv2"},{"code":"L130.11","system":"readv2"},{"code":"L332.00","system":"readv2"},{"code":"L332.11","system":"readv2"},{"code":"L336.11","system":"readv2"},{"code":"Z22AE00","system":"readv2"},{"code":"Z255B00","system":"readv2"},{"code":"Z271411","system":"readv2"},{"code":"Z271500","system":"readv2"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('pregnancy-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["pregnancy---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["pregnancy---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["pregnancy---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
