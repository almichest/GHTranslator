import json

files = []

class Source :
    def __init__(self, file_name, count) :
        self.file = open(file_name, 'r')
        self.count = count

    def _del__(self) :
        if self.file != None :
            self.file.close()

    def output_to_json(self) :
        sequences = []
        for line in self.file :
            line = line.replace('\n', '')
            values = line.split(',')
            sequences.append(values)

        output = open('sequence_0' + str(self.count) + '.json', 'w')
        json.dump(sequences, output, indent=2, sort_keys=True)
        output.close()

for x in range (1, 6) :
    source = Source('sequence_0' + str(x) + '.txt', x)
    source.output_to_json()
