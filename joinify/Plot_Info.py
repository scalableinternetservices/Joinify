

from Axis_Scale import Axis_Scale
from Plot_Label import Plot_Label

class Plot_Info:


	def __init__(self, plot_label,axis_scale, box_position):
		self.plot_label = plot_label
		self.axis_scale = axis_scale
		self.box_position = box_position

	def get_label(self,label):
		if label == 1:
			return self.plot_label.title
		elif label == 2:
			return self.plot_label.x_axis_label
		elif label == 3:
			return self.plot_label.y_axis_label

	def get_axes(self):
		return [self.axis_scale.x_start, self.axis_scale.x_end, self.axis_scale.y_start, self.axis_scale.y_end]