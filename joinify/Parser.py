from File_Manager import File_Manager

class Parser:
    
    path = 'resources/'
    file_manager = File_Manager()
 
    def parse(self, filename):
        clean_data = []
        file_path = self.path + filename
        data = self.file_manager.read_file(file_path)

        for elem in data:
            split_data = elem.split(" ")
            split_data[-1] = split_data[-1].strip()
            clean_data.append(self.convert_data(split_data))
        return clean_data
   
    def convert_data(self, data_list):
        for i in range(len(data_list)):
            data_list[i] = self.cast_string(data_list[i]) 
        return data_list

    def cast_string(self,s):
        try:
            return int(s)
        except ValueError:
            return float(s)

    def combine_axes(self, data):
        nr_of_axes = len(data[0])
        combined_list = []
        for i in range(nr_of_axes):
            combined_list.append([])
        for elem in data:
            for i in range(nr_of_axes):
                combined_list[i].append(elem[i])
        return combined_list

    def get_plot_data(self, filename):
        parsed_data = self.parse(filename)
        return self.combine_axes(parsed_data)