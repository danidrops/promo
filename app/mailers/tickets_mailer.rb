class TicketsMailer < ActionMailer::Base
  default from: 'tryst@gmail.com'
  layout 'email'

  def ticket_sender(ticket)
    @ticket = ticket
    backgroundpath = "public/templates/BlankTicket.pdf"

    incr = 1
    for incr <= @ticket.number do
      stub_code = @ticket.id.to_s + "-" + incr.to_s
      Prawn::Document.generate("public/pdfs/TrystTicketNo#{stub_code}.pdf") do
        image backgroundpath, :width => 500, :height => 300
        draw_text stub_code, :at => [170,480], :size => 20
      end
      attachments['TrystTicketNo#{stub_code}.pdf'] = File.read('public/pdfs/TrystTicketNo#{stub_code}.pdf')
      Stub.create({code: stub_code, ticket_id: @ticket.id})
    end

    mail(
      to: @ticket.email
      subject: "Your TRYST tickets"
      )
  end
end