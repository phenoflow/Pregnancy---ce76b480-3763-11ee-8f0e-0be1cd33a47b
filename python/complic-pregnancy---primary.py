# Julie George, Emily Herrett, Liam Smeeth, Harry Hemingway, Anoop Shah, Spiros Denaxas, 2023.

import sys, csv, re

codes = [{"code":"L042w00","system":"readv2"},{"code":"L042y00","system":"readv2"},{"code":"L043y00","system":"readv2"},{"code":"L043z00","system":"readv2"},{"code":"L044x00","system":"readv2"},{"code":"L044y00","system":"readv2"},{"code":"L044z00","system":"readv2"},{"code":"L044z11","system":"readv2"},{"code":"L045x00","system":"readv2"},{"code":"L045y00","system":"readv2"},{"code":"L045y11","system":"readv2"},{"code":"L045z00","system":"readv2"},{"code":"L045z11","system":"readv2"},{"code":"L050w00","system":"readv2"},{"code":"L050y00","system":"readv2"},{"code":"L051w00","system":"readv2"},{"code":"L051y00","system":"readv2"},{"code":"L052y00","system":"readv2"},{"code":"L062w00","system":"readv2"},{"code":"L071y00","system":"readv2"},{"code":"L09..00","system":"readv2"},{"code":"L09..11","system":"readv2"},{"code":"L0A4.00","system":"readv2"},{"code":"L1...00","system":"readv2"},{"code":"L123400","system":"readv2"},{"code":"L124400","system":"readv2"},{"code":"L125200","system":"readv2"},{"code":"L125400","system":"readv2"},{"code":"L126200","system":"readv2"},{"code":"L126400","system":"readv2"},{"code":"L16..00","system":"readv2"},{"code":"L16y.00","system":"readv2"},{"code":"L16y000","system":"readv2"},{"code":"L16y100","system":"readv2"},{"code":"L16y300","system":"readv2"},{"code":"L33..00","system":"readv2"},{"code":"L33y.00","system":"readv2"},{"code":"L382000","system":"readv2"},{"code":"Lyu2100","system":"readv2"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('pregnancy-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["complic-pregnancy---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["complic-pregnancy---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["complic-pregnancy---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
