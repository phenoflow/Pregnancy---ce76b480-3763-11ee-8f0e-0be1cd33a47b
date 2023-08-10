# Julie George, Emily Herrett, Liam Smeeth, Harry Hemingway, Anoop Shah, Spiros Denaxas, 2023.

import sys, csv, re

codes = [{"code":"14Y1.00","system":"readv2"},{"code":"7F14100","system":"readv2"},{"code":"7F16.00","system":"readv2"},{"code":"7F16000","system":"readv2"},{"code":"7F16100","system":"readv2"},{"code":"7F16200","system":"readv2"},{"code":"7F16300","system":"readv2"},{"code":"7F16400","system":"readv2"},{"code":"7F16500","system":"readv2"},{"code":"7F16600","system":"readv2"},{"code":"7F16700","system":"readv2"},{"code":"7F16900","system":"readv2"},{"code":"7F16y00","system":"readv2"},{"code":"7F16z00","system":"readv2"},{"code":"L213100","system":"readv2"},{"code":"L308.00","system":"readv2"},{"code":"L308100","system":"readv2"},{"code":"L308z00","system":"readv2"},{"code":"L31..00","system":"readv2"},{"code":"L31z.00","system":"readv2"},{"code":"L395.00","system":"readv2"},{"code":"L395.11","system":"readv2"},{"code":"L395.12","system":"readv2"},{"code":"L395.13","system":"readv2"},{"code":"L395000","system":"readv2"},{"code":"L395100","system":"readv2"},{"code":"L395200","system":"readv2"},{"code":"L395300","system":"readv2"},{"code":"L395400","system":"readv2"},{"code":"L395500","system":"readv2"},{"code":"L395z00","system":"readv2"},{"code":"Lyu5100","system":"readv2"},{"code":"Z254100","system":"readv2"},{"code":"Z254200","system":"readv2"},{"code":"Z254300","system":"readv2"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('pregnancy-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["pregnancy-forces---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["pregnancy-forces---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["pregnancy-forces---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
