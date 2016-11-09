

from Plotter import Plotter
from Controller import Controller

plotter = Plotter()
controller = Controller()

upper_left = 'upper left'
upper_right = 'upper right'
lower_left = 'lower left'
lower_right = 'lower right'


filename = "200.txt"
plot_names = ["TCP", "UDP"]
plot_labels = ["My Graph", "x-axis", "y-axis"]
box_position = upper_left


def run_plot():

	plot_info, plots = controller.make_plot(filename, plot_labels, plot_names, box_position)
	plotter.plot(plot_info,plots)
	
run_plot()
