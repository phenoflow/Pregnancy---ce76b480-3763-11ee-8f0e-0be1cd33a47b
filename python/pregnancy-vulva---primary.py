# Julie George, Emily Herrett, Liam Smeeth, Harry Hemingway, Anoop Shah, Spiros Denaxas, 2023.

import sys, csv, re

codes = [{"code":"L248300","system":"readv2"},{"code":"L34..00","system":"readv2"},{"code":"L34..12","system":"readv2"},{"code":"L340500","system":"readv2"},{"code":"L345.00","system":"readv2"},{"code":"L345.12","system":"readv2"},{"code":"L345000","system":"readv2"},{"code":"L345100","system":"readv2"},{"code":"L345z00","system":"readv2"},{"code":"L34y.00","system":"readv2"},{"code":"L34y000","system":"readv2"},{"code":"L34y100","system":"readv2"},{"code":"L34yz00","system":"readv2"},{"code":"L34z.00","system":"readv2"},{"code":"L34z100","system":"readv2"},{"code":"L34zz00","system":"readv2"},{"code":"L411300","system":"readv2"},{"code":"L411513","system":"readv2"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('pregnancy-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["pregnancy-vulva---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["pregnancy-vulva---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["pregnancy-vulva---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
