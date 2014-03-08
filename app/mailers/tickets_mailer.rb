class TicketsMailer < ActionMailer::Base
  default from: 'trystmtl@gmail.com'

  def ticket_sender(ticket)
    @ticket = ticket

    incr = 1
    @ticket.number.times do
      stub_code = @ticket.id.to_s + "-" + incr.to_s
      stub = Stub.create({code: stub_code, ticket_id: @ticket.id})
      attachments["TrystTicketNo#{stub_code}.pdf"] = {
        mime_type: 'application/pdf',
        content: stub.render()
        }
      incr+=1
    end

    mail(
      to: @ticket.email,
      subject: "Your TRYST tickets"
      )
  end
end
