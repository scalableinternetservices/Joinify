
from Plot import Plot
from Axis_Scale import Axis_Scale
from Parser import Parser
from Plot_Label import Plot_Label
from Plot_Info import Plot_Info

class Controller:

	parser = Parser()
	colors = ['r','b', 'g', 'c', 'm','y','k']
	def __init__(self):
		pass


	def make_plot(self, filename, plot_labels, plot_names, box_position):
		#Get Data
		clean_data = self.parser.get_plot_data(filename)
		x_coordinates, y_coordinate_list = self.arrange_data(clean_data)
		#Create Plot Info
		plot_info = self.make_plot_info(plot_labels, x_coordinates, y_coordinate_list, box_position)
		#Create Plots
		plots = self.create_plot_list(plot_names, x_coordinates, y_coordinate_list)
		return plot_info, plots

#Help Methods for Plot
	def create_plot_list(self, plot_names, x_coordinates, y_coordinate_list):
		plot_list = []
		for i in range(len(y_coordinate_list)):
			plot_list.append(Plot(plot_names[i], x_coordinates, y_coordinate_list[i], self.colors[i]))
		return plot_list

	def arrange_data(self, data):
		x_axis = data[0]
		y_axes = []
		for i in range(1,len(data)):
			y_axes.append(data[i])
		return x_axis, y_axes



#Help methods for Plot_Info
	def make_axis_scale(self,x_coordinates, y_coordinate_list):
		x_start = min(x_coordinates)
		x_end = max(x_coordinates)+1
		y_start, y_end = self.find_extremes_double_list(y_coordinate_list)
		return Axis_Scale(x_start, x_end, y_start, y_end)
	
	def find_extremes_double_list(self, y_coordinate_list):
		min_value = float("inf")
		max_value = float("-inf")
		for elem in y_coordinate_list:
			if max(elem) > max_value:
				max_value = max(elem)
			if min(elem) < min_value:
				min_value = min(elem)
		return min_value, max_value

	def make_plot_label(self, plot_labels):
		return Plot_Label(plot_labels[0], plot_labels[1], plot_labels[2])

	def make_plot_info(self, plot_labels, x_coordinates, y_coordinate_list, box_position):
		axis_scale = self.make_axis_scale(x_coordinates, y_coordinate_list)
		plot_label = self.make_plot_label(plot_labels)
		return Plot_Info(plot_label, axis_scale, box_position)





