###############################################################################
#
# Area - A writer class for Excel Area charts.
#
# Used in conjunction with Chart.
#
# See formatting note in Chart.
#
# Copyright 2000-2009, John McNamara, jmcnamara@cpan.org
#
# original written in Perl by John McNamara
# converted to Ruby by Hideo Nakamura, cxn03651@msj.biglobe.ne.jp
#

require 'writeexcel'

#
# To create a simple Excel file with a Area chart using WriteExcel:
#
#     #!/usr/bin/ruby -w
#
#     require 'writeexcel'
#
#     workbook  = WriteExcel.new('chart.xls')
#     worksheet = workbook.add_worksheet
#
#     chart     = workbook.add_chart(:type => Chart::Area)
#
#     # Configure the chart.
#     chart.add_series(
#       :categories => '=Sheet1!$A$2:$A$7',
#       :values     => '=Sheet1!$B$2:$B$7'
#     )
#
#     # Add the data to the worksheet the chart refers to.
#     data = [
#         [ 'Category', 2, 3, 4, 5, 6, 7 ],
#         [ 'Value',    1, 4, 5, 2, 1, 5 ]
#     ]
#
#     worksheet.write('A1', data)
#
#     workbook.close
#
# DESCRIPTION ^
#
# This module implements Area charts for Spreadsheet::WriteExcel. The chart
# object is created via the Workbook add_chart() method:
#
#     chart = workbook.add_chart(:type => Chart::Area)
#
# Once the object is created it can be configured via the following methods
# that are common to all chart classes:
#
#     chart.add_series
#     chart.set_x_axis
#     chart.set_y_axis
#     chart.set_title
#
# These methods are explained in detail in Chart. Class specific methods or
# settings, if any, are explained below.
#
# == Area Chart Methods ^
#
# There aren't currently any area chart specific methods. See the TODO section
# of Chart.
#
class Chart
  class Area < Chart
    ###############################################################################
    #
    # new()
    #
    #
    def initialize(*args)
      super
    end

    ###############################################################################
    #
    # _store_chart_type()
    #
    # Implementation of the abstract method from the specific chart class.
    #
    # Write the AREA chart BIFF record. Defines a area chart type.
    #
    def store_chart_type  # :nodoc:
      record = 0x101A     # Record identifier.
      length = 0x0002     # Number of bytes to follow.
      grbit  = 0x0001     # Option flags.

      header = [record, length].pack('vv')
      data = [grbit].pack('v')

      append(header, data)
    end
  end
end
