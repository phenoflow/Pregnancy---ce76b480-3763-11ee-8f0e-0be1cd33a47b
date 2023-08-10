# Julie George, Emily Herrett, Liam Smeeth, Harry Hemingway, Anoop Shah, Spiros Denaxas, 2023.

import sys, csv, re

codes = [{"code":"13H8.00","system":"readv2"},{"code":"13S..00","system":"readv2"},{"code":"62...13","system":"readv2"},{"code":"6222","system":"readv2"},{"code":"6223","system":"readv2"},{"code":"7F...12","system":"readv2"},{"code":"L010.11","system":"readv2"},{"code":"L162.11","system":"readv2"},{"code":"L164.00","system":"readv2"},{"code":"L166.11","system":"readv2"},{"code":"L166500","system":"readv2"},{"code":"L16E.00","system":"readv2"},{"code":"L18A000","system":"readv2"},{"code":"L265.00","system":"readv2"},{"code":"L266.00","system":"readv2"},{"code":"L416600","system":"readv2"},{"code":"M240500","system":"readv2"},{"code":"Y60 AN","system":"readv2"},{"code":"Z212.11","system":"readv2"},{"code":"Z22..00","system":"readv2"},{"code":"Z227.00","system":"readv2"},{"code":"Z22A300","system":"readv2"},{"code":"Z22A700","system":"readv2"},{"code":"Z22AB11","system":"readv2"},{"code":"Z22B500","system":"readv2"},{"code":"Z22C.00","system":"readv2"},{"code":"Z22C314","system":"readv2"},{"code":"ZV22.00","system":"readv2"},{"code":"ZV61800","system":"readv2"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('pregnancy-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["pregnant-pregnancy---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["pregnant-pregnancy---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["pregnant-pregnancy---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
