
import matplotlib.pyplot as plt
from Plot import Plot
from Plot_Info import Plot_Info

class Plotter:
	title = 1
	x_axis = 2
	y_axis = 3
	def plot(self, plot_info, plots):
		plt.title(plot_info.get_label(self.title))
		plt.xlabel(plot_info.get_label(self.x_axis))
		plt.ylabel(plot_info.get_label(self.y_axis))
		plt.grid(True)
		legend_list = []
		for plot in plots:
			plt.plot(plot.x_coordinates, plot.y_coordinates, plot.color)
			legend_list.append(plot.name)
		plt.legend(legend_list, loc= plot_info.box_position)
		plt.axis(plot_info.get_axes())
		plt.show()

	def plot_all(self, plot_info_list, plots_list):
		for i in range(len(plot_info_list)):
			self.plot(plot_info_list[i], plots_list[i])


	# def plot_all(self, )