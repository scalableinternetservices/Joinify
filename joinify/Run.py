

from Plotter import Plotter
from Controller import Controller

plotter = Plotter()
controller = Controller()

upper_left = 'upper left'
upper_right = 'upper right'
lower_left = 'lower left'
lower_right = 'lower right'


filename_list = ["200.txt", "302.txt", "connected.txt"]

plot_name_one = ["200", "302", "connected"]
plot_label_one = ["My Graph", "time (s)", "request count pr s"]

plot_name_two = ["200", "302", "connected"]
plot_label_two = ["Title", "time", "request count pr s"]

box_position_one = upper_left
box_position_two = upper_left

plot_names=[plot_name_one, plot_name_two]
plot_labels = [plot_label_one, plot_label_two]
box_positions = [box_position_one, box_position_two]



def run_plot():

	plot_info, plots = controller.make_plot(filename_list, plot_labels, plot_names, box_positions)
	print plot_info
	plotter.plot_all(plot_info, plots)

	
run_plot()
