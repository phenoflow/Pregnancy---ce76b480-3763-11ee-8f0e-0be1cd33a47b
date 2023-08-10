# Julie George, Emily Herrett, Liam Smeeth, Harry Hemingway, Anoop Shah, Spiros Denaxas, 2023.

import sys, csv, re

codes = [{"code":"L044x11","system":"readv2"},{"code":"L044y11","system":"readv2"},{"code":"L0A2.00","system":"readv2"},{"code":"L120400","system":"readv2"},{"code":"L123200","system":"readv2"},{"code":"L124200","system":"readv2"},{"code":"L127200","system":"readv2"},{"code":"L12z200","system":"readv2"},{"code":"L165200","system":"readv2"},{"code":"L16y200","system":"readv2"},{"code":"L22y.11","system":"readv2"},{"code":"L300700","system":"readv2"},{"code":"L388.00","system":"readv2"},{"code":"L389.00","system":"readv2"},{"code":"L463300","system":"readv2"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('pregnancy-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["pregnancy-compound---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["pregnancy-compound---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["pregnancy-compound---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
