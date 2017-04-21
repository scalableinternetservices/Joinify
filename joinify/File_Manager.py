
class File_Manager:


	def __init__(self):
		pass

	def read_file(self, file_path): 
		with open(file_path) as f:
			content = f.readlines()
		return content

	def get_column_count(self, filename):
		path = 'resources/'
		file_path = path + filename
		with open(file_path) as f:
			first_line = f.readline()
		return len(first_line.split(" "))