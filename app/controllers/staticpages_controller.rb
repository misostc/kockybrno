class StaticpagesController < ApplicationController
  def exhibitions
    @region_main_text = Region.get('vystavy-uvodni-text')
    @region_left_col =  Region.get('vystavy-levy-sloupec')
    @region_right_col = Region.get('vystavy-pravy-sloupec')
  end
end
