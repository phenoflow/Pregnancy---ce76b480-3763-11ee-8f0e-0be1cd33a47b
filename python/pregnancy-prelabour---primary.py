# Julie George, Emily Herrett, Liam Smeeth, Harry Hemingway, Anoop Shah, Spiros Denaxas, 2023.

import sys, csv, re

codes = [{"code":"632..00","system":"readv2"},{"code":"63E1.00","system":"readv2"},{"code":"63E3.00","system":"readv2"},{"code":"7F1..11","system":"readv2"},{"code":"7F11.00","system":"readv2"},{"code":"7F11000","system":"readv2"},{"code":"7F11100","system":"readv2"},{"code":"7F11200","system":"readv2"},{"code":"7F1A400","system":"readv2"},{"code":"7F25.13","system":"readv2"},{"code":"L126600","system":"readv2"},{"code":"L14..00","system":"readv2"},{"code":"L14..11","system":"readv2"},{"code":"L140.00","system":"readv2"},{"code":"L140100","system":"readv2"},{"code":"L141.00","system":"readv2"},{"code":"L141100","system":"readv2"},{"code":"L291.11","system":"readv2"},{"code":"L30..00","system":"readv2"},{"code":"L32..00","system":"readv2"},{"code":"Lyu4000","system":"readv2"},{"code":"Q212100","system":"readv2"},{"code":"Q212200","system":"readv2"},{"code":"Q213100","system":"readv2"},{"code":"Z23G.00","system":"readv2"},{"code":"Z24..00","system":"readv2"},{"code":"Z241100","system":"readv2"},{"code":"Z244400","system":"readv2"},{"code":"Z244500","system":"readv2"},{"code":"Z246211","system":"readv2"},{"code":"Z246311","system":"readv2"},{"code":"Z248.00","system":"readv2"},{"code":"Z255F00","system":"readv2"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('pregnancy-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["pregnancy-prelabour---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["pregnancy-prelabour---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["pregnancy-prelabour---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
