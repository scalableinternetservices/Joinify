
from Plot import Plot
from Axis_Scale import Axis_Scale
from Parser import Parser
from Plot_Label import Plot_Label
from Plot_Info import Plot_Info
from File_Manager import File_Manager


class Controller:
	file_manager = File_Manager()
	parser = Parser()
	colors = ['r','b', 'g', 'c', 'm','y','k']
	def __init__(self):
		pass

	def make_plot(self, filename_list, plot_labels, plot_names, box_position):
		column_count = self.file_manager.get_column_count(filename_list[0])
		nr_of_plots = len(plot_names)
		x_coordinates_2d, y_coordinate_3d = self.make_dimensional_lists(filename_list, column_count)
		plot_list_2d = self.create_empty_plot_list(nr_of_plots)
		plot_info_2d, plots_list_2d = self.create_2d_plot_lists(plot_labels, plot_names, x_coordinates_2d, y_coordinate_3d, box_position)
		return plots_list_2d, plot_info_2d
			

	def create_empty_dimensional_lists(self, column_count):
		x_coordinates_2d = []
		y_coordinate_3d = []
		for i in range(column_count-1):
			y_coordinate_3d.append([])
		return x_coordinates_2d, y_coordinate_3d

	def create_empty_plot_list(self, nr_of_plots):
		plot_list = []
		for i in range(nr_of_plots):
			plot_list.append([])

		
	def make_dimensional_lists(self,filename_list, column_count):
		x_coordinates_2d, y_coordinate_3d = self.create_empty_dimensional_lists(column_count)
		for filename in filename_list:
			clean_data = self.parser.get_plot_data(filename)
			x_coordinates, y_coordinate_list = self.arrange_data(clean_data)
			x_coordinates_2d.append(x_coordinates)
			for i in range(len(y_coordinate_list)):
			 	y_coordinate_3d[i].append(y_coordinate_list[i])
		return x_coordinates_2d, y_coordinate_3d


	def create_2d_plot_lists(self, plot_labels, plot_names, x_coordinates_2d, y_coordinate_3d, box_position):
		plots_list_2d = []
		plot_info_2d = []
		for i in range(len(plot_labels)):
			temp_plot_list = []
			for k in range(len(x_coordinates_2d)):
				temp_plot = Plot(plot_names[i][k], x_coordinates_2d[k], y_coordinate_3d[i][k], self.colors[k])
				temp_plot_list.append(temp_plot)
			plots_list_2d.append(temp_plot_list)
			temp_plot_info = self.make_plot_info(plot_labels[i],x_coordinates_2d, y_coordinate_3d[i], box_position[i])
			plot_info_2d.append(temp_plot_info)
		return plots_list_2d, plot_info_2d

	def arrange_data(self, data):
		x_axis = data[0]
		y_axes = []
		for i in range(1,len(data)):
			y_axes.append(data[i])
		return x_axis, y_axes



#Help methods for Plot_Info
	def make_axis_scale(self,x_coordinates, y_coordinate_list):
		x_start, x_end = self.find_extremes_double_list(x_coordinates)
		y_start, y_end = self.find_extremes_double_list(y_coordinate_list)
		return Axis_Scale(x_start, x_end, y_start, y_end)
	
	def find_extremes_double_list(self, coordinate_list):
		min_value = float("inf")
		max_value = float("-inf")
		for elem in coordinate_list:
			if max(elem) > max_value:
				max_value = max(elem)
			if min(elem) < min_value:
				min_value = min(elem)
		return min_value, max_value

	def make_plot_label(self, plot_labels):
		return Plot_Label(plot_labels[0], plot_labels[1], plot_labels[2])

	def make_plot_info(self, plot_labels, x_coordinates_list, y_coordinate_list, box_position):
		axis_scale = self.make_axis_scale(x_coordinates_list, y_coordinate_list)
		plot_label = self.make_plot_label(plot_labels)
		return Plot_Info(plot_label, axis_scale, box_position)





