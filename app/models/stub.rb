class Stub < ActiveRecord::Base
  belongs_to :ticket

  def render
    backgroundpath = "public/templates/BlankTicket.jpg"

    s = Prawn::Document.new
    s.image backgroundpath
    s.draw_text self.code, :at => [250,265], :size => 20
    s.render
  end

end
