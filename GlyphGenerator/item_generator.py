import json
import sys

class Glyph :
    def __init__(self, name) :
        self.name = name
        self.__paths = []

    def get_paths(self) :
        return self.__paths

    def set_paths(self, paths) :
        self.__paths = paths

    # array of GlyphPath
    paths = property(get_paths, set_paths)

    def to_json_map(self) :
        paths = []
        for path in self.__paths :
            paths.append([path.start, path.goal])

        item = {'name' : self.name,
                'paths' : paths}

        return item

    def __str__(self) :
        description = self.name + ' : '
        for path in self.__paths :
            description += str(path.start) + '-' + str(path.goal) + ' '

        return description

class GlyphPath :
    def __init__(self, start, goal) :
        if goal <= start :
            print('start = ' + str(start) + ' goal = ' + str(goal))
            sys.exit('goal must be larger than start')

        if not (0 <= start <= 10) :
            print('start = ' + str(start) + ' goal = ' + str(goal))
            sys.exit('start is illegal value')

        if not (0 <= goal <= 10) :
            print('start = ' + str(start) + ' goal = ' + str(goal))
            sys.exit('goal is illegal value')

        self.start = start
        self.goal = goal

def glyph_from_csv(csv) :
    print(csv)
    values = csv.split(',')
    glyph = Glyph(values[0])

    paths = []

    for x in range(1, len(values)) :
        path_string = values[x]
        start_and_goal = path_string.split('-')
        start = start_and_goal[0]
        goal = start_and_goal[1]
        path = GlyphPath(int(start), int(goal))
        paths.append(path)

    glyph.paths = paths

    return glyph

item_file = open('items.txt', 'r')

glyph_list = []

for line in item_file :
    glyph_list.append(glyph_from_csv(line).to_json_map())

s = json.dumps(glyph_list)

item_file.close()

item_json = open('items.json', 'w')

item_json.write(s)

item_json.close()

print(s)


