# Julie George, Emily Herrett, Liam Smeeth, Harry Hemingway, Anoop Shah, Spiros Denaxas, 2023.

import sys, csv, re

codes = [{"code":"6321","system":"readv2"},{"code":"6322","system":"readv2"},{"code":"6323","system":"readv2"},{"code":"L320.00","system":"readv2"},{"code":"L320100","system":"readv2"},{"code":"L322.00","system":"readv2"},{"code":"L322000","system":"readv2"},{"code":"L322100","system":"readv2"},{"code":"L360.00","system":"readv2"},{"code":"L360000","system":"readv2"},{"code":"Z22A400","system":"readv2"},{"code":"Z246200","system":"readv2"},{"code":"Z246700","system":"readv2"},{"code":"Z246900","system":"readv2"},{"code":"Z255.00","system":"readv2"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('pregnancy-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["pregnancy-thirdstage---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["pregnancy-thirdstage---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["pregnancy-thirdstage---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
