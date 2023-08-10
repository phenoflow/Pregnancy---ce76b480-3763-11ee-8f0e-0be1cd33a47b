# Julie George, Emily Herrett, Liam Smeeth, Harry Hemingway, Anoop Shah, Spiros Denaxas, 2023.

import sys, csv, re

codes = [{"code":"7F11y00","system":"readv2"},{"code":"7F24y00","system":"readv2"},{"code":"7F2y.00","system":"readv2"},{"code":"7Fy..00","system":"readv2"},{"code":"L040.00","system":"readv2"},{"code":"L043.00","system":"readv2"},{"code":"L043.11","system":"readv2"},{"code":"L050.00","system":"readv2"},{"code":"L060.00","system":"readv2"},{"code":"L07..00","system":"readv2"},{"code":"L070.00","system":"readv2"},{"code":"L071.00","system":"readv2"},{"code":"L072.00","system":"readv2"},{"code":"L0y..00","system":"readv2"},{"code":"L100000","system":"readv2"},{"code":"L10y000","system":"readv2"},{"code":"L11y000","system":"readv2"},{"code":"L123000","system":"readv2"},{"code":"L124.00","system":"readv2"},{"code":"L124000","system":"readv2"},{"code":"L124100","system":"readv2"},{"code":"L124300","system":"readv2"},{"code":"L124600","system":"readv2"},{"code":"L125000","system":"readv2"},{"code":"L126000","system":"readv2"},{"code":"L127000","system":"readv2"},{"code":"L130000","system":"readv2"},{"code":"L132000","system":"readv2"},{"code":"L13y000","system":"readv2"},{"code":"L13z.00","system":"readv2"},{"code":"L13z000","system":"readv2"},{"code":"L13z100","system":"readv2"},{"code":"L13z200","system":"readv2"},{"code":"L140000","system":"readv2"},{"code":"L141000","system":"readv2"},{"code":"L150000","system":"readv2"},{"code":"L162.00","system":"readv2"},{"code":"L162000","system":"readv2"},{"code":"L162100","system":"readv2"},{"code":"L224000","system":"readv2"},{"code":"L25y000","system":"readv2"},{"code":"L264000","system":"readv2"},{"code":"L265000","system":"readv2"},{"code":"L266000","system":"readv2"},{"code":"L291.00","system":"readv2"},{"code":"L305000","system":"readv2"},{"code":"L307.00","system":"readv2"},{"code":"L309.00","system":"readv2"},{"code":"L309000","system":"readv2"},{"code":"L321.00","system":"readv2"},{"code":"L321100","system":"readv2"},{"code":"L353000","system":"readv2"},{"code":"L362000","system":"readv2"},{"code":"L397000","system":"readv2"},{"code":"L413000","system":"readv2"},{"code":"Lyu2500","system":"readv2"},{"code":"ZV28y00","system":"readv2"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('pregnancy-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["pregnancy-vunspecified---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["pregnancy-vunspecified---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["pregnancy-vunspecified---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
