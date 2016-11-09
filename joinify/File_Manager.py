
class File_Manager:


	def __init__(self):
		pass

	def read_file(self, file_path): 
		with open(file_path) as f:
			content = f.readlines()
		return content
