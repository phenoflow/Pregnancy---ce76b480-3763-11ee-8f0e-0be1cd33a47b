# Julie George, Emily Herrett, Liam Smeeth, Harry Hemingway, Anoop Shah, Spiros Denaxas, 2023.

import sys, csv, re

codes = [{"code":"7F23200","system":"readv2"},{"code":"8H7W.00","system":"readv2"},{"code":"L041000","system":"readv2"},{"code":"L044000","system":"readv2"},{"code":"L050000","system":"readv2"},{"code":"L052000","system":"readv2"},{"code":"L090.00","system":"readv2"},{"code":"L090200","system":"readv2"},{"code":"L0A1.00","system":"readv2"},{"code":"L230.00","system":"readv2"},{"code":"L230100","system":"readv2"},{"code":"L231.00","system":"readv2"},{"code":"L231100","system":"readv2"},{"code":"L231z00","system":"readv2"},{"code":"L232.00","system":"readv2"},{"code":"L233.00","system":"readv2"},{"code":"L233z00","system":"readv2"},{"code":"L234.00","system":"readv2"},{"code":"L234100","system":"readv2"},{"code":"L244100","system":"readv2"},{"code":"L244300","system":"readv2"},{"code":"L301.00","system":"readv2"},{"code":"L301400","system":"readv2"},{"code":"L301500","system":"readv2"},{"code":"L302.00","system":"readv2"},{"code":"L341.11","system":"readv2"},{"code":"L356.00","system":"readv2"},{"code":"L356.11","system":"readv2"},{"code":"L356.12","system":"readv2"},{"code":"L356000","system":"readv2"},{"code":"L356z00","system":"readv2"},{"code":"L357.00","system":"readv2"},{"code":"L357000","system":"readv2"},{"code":"L357100","system":"readv2"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('pregnancy-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["fetopelvic-pregnancy---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["fetopelvic-pregnancy---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["fetopelvic-pregnancy---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
